package endpoint

import (
	"fmt"
	"main/internal/pkg/models"
	"net/http"

	"github.com/labstack/echo"
)

type Service interface {
	SignIn(user models.User) error
}

type Endpoint struct {
	service Service
}

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
		return ctx.String(http.StatusInternalServerError, "Internal Server Error")
	}

	err1 := ctx.String(http.StatusOK, "Authorizated")
	if err1 != nil {
		fmt.Println("error")
	}
	return nil
}
