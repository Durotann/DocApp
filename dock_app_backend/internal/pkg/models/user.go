package models

import (
	"errors"
	"regexp"

	"github.com/go-playground/validator"
)

type User struct {
	Name     string `db:"name" json:"name" validate:"required"`
	Email    string `db:"email" json:"email" validate:"required"`
	Password string `db:"password" json:"password" validate:"required"`
}

func (u *User) Validate() error {
	validate := validator.New()
	if err := validate.Struct(u); err != nil {
		return errors.New("поле не должно быть пустым")
	}

	if len(u.Password) <= 8 {
		return errors.New("длина пароля должна быть не меньше 8")
	}

	re := regexp.MustCompile(`^[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$`)
	if !re.MatchString(u.Email) {
		return errors.New("неверный формат почты")
	}

	return nil
}
