package endpoint

import (
	"fmt"
	"main/internal/pkg/models"
	"net/http"
	"time"

	"github.com/golang-jwt/jwt"
	"github.com/labstack/echo"
)

type Service interface {
	SignIn(user models.User) error
}

type Endpoint struct {
	service Service
}

var secretKey = []byte("secret-key")

func New(service Service) *Endpoint {
	return &Endpoint{
		service: service,
	}
}

func (e *Endpoint) Authorization(ctx echo.Context) error {
	var user models.User
	if err := ctx.Bind(&user); err != nil {
		return ctx.String(http.StatusBadRequest, "Invalid input format")
	}

	err := user.Validate()
	if err != nil {
		return ctx.JSON(http.StatusBadRequest, models.CustomError{
			ErrorMessage: err.Error(),
		})
	}

	err = e.service.SignIn(user)
	if err != nil {
		fmt.Println("error")
		return ctx.JSON(http.StatusBadRequest, models.CustomError{
			ErrorMessage: "A user with this email has already been created",
		})
	}

	token, _ := createToken(user.Name)
	err1 := ctx.JSON(http.StatusOK, map[string]interface{}{
		"token": token,
	})
	if err1 != nil {
		fmt.Println("error")
	}
	return nil
}
func createToken(username string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256,
		jwt.MapClaims{
			"username": username,
			"exp":      time.Now().Add(time.Hour * 24).Unix(),
		})

	tokenString, err := token.SignedString(secretKey)
	if err != nil {
		return "", err
	}

	return tokenString, nil
}

// func verifyToken(tokenString string) error {
// 	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
// 		return secretKey, nil
// 	})

// 	if err != nil {
// 		return err
// 	}

// 	if !token.Valid {
// 		return fmt.Errorf("недопустимый токен")
// 	}

// 	return nil
// }
