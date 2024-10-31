package sqlx

import (
	"database/sql"
	"fmt"
	"log"
	"main/internal/pkg/models"
	"time"

	_ "github.com/jackc/pgx/v5/stdlib"
	"github.com/jmoiron/sqlx"
	"golang.org/x/crypto/bcrypt"
)

// Config конфигурационные настройки БД
type Config struct {
	ConnectString   string        `yaml:"-" json:"-"`                                 // строка подключения к БД
	Host            string        `yaml:"host" json:"host"`                           // host БД
	Port            string        `yaml:"port" json:"port"`                           // порт БД
	Dbname          string        `yaml:"dbname" json:"dbname"`                       // имя БД
	SslMode         string        `yaml:"ssl_mode" json:"ssl_mode"`                   // режим SSL
	User            string        `yaml:"user" json:"user"`                           // пользователь БД
	Pass            string        `yaml:"pass" json:"pass"`                           // пароль пользователя БД
	ConnMaxLifetime time.Duration `yaml:"conn_max_lifetime" json:"conn_max_lifetime"` // время жизни подключения в миллисекундах
	MaxOpenConns    int           `yaml:"max_open_conns" json:"max_open_conns"`       // максимальное количество открытых подключений
	MaxIdleConns    int           `yaml:"max_idle_conns" json:"max_idle_conns"`       // максимальное количество простаивающих подключений
	DriverName      string        `yaml:"driver_name" json:"driver_name"`             // имя драйвера "postgres" | "pgx" | "godror"
}

func LoadConfig() *Config {

	var config Config

	config.Host = "postgres"
	config.Port = "5432"
	config.Dbname = "test_backend"
	config.SslMode = "disable"
	config.User = "admindb"
	config.Pass = "1234"
	config.ConnMaxLifetime = 5 * time.Second
	config.MaxOpenConns = 10
	config.MaxIdleConns = 5
	config.DriverName = "pgx"

	return &config
}

// DBrepo is a wrapper around sqlx.DBrepo
type DBrepo struct {
	*sqlx.DB

	cfg *Config
}

// New - create new connect to DB
func New(cfg *Config) (db *DBrepo, myerr error) {

	// Сформировать строку подключения
	cfg.ConnectString = fmt.Sprintf("host=%s port=%s dbname=%s sslmode=%s user=%s password=%s ", cfg.Host, cfg.Port, cfg.Dbname, cfg.SslMode, cfg.User, cfg.Pass)

	// Создаем новый сервис
	db = &DBrepo{
		cfg: cfg,
	}
	sqlxDb, err := sqlx.Connect(cfg.DriverName, cfg.ConnectString)

	db.DB = sqlxDb

	if err != nil {
		return nil, err
	}
	return db, nil
}

func (db *DBrepo) SignIn(user models.User) error {
	existingUser, err := db.GetUserByEmail(user.Email)
	if err != nil {

		return err
	}
	if existingUser != nil {
		return fmt.Errorf("user with email %s already exists", user.Email)
	}
	hashPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.MinCost)
	if err != nil {
		log.Println(err)
	}
	fmt.Printf("passwordHash: %v", hashPassword)
	query := `INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`

	_, err = db.Exec(query, user.Name, user.Email, hashPassword)
	if err != nil {
		fmt.Printf("failed to insert User Data: %v", err)
		return err
	}

	return nil

}

func (db *DBrepo) GetUserByEmail(email string) (*models.User, error) {
	query := `SELECT name, email, password FROM users WHERE email = $1`
	row := db.QueryRow(query, email)

	var user models.User
	err := row.Scan(&user.Email)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}

	return &user, nil
}
