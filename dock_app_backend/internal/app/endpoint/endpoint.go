package endpoint

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo"
)

type Service interface {
	SignIn() error
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
	err := e.service.SignIn()
	if err != nil {
		fmt.Println("error")
	}

	err1 := ctx.String(http.StatusOK, "Authorizated")
	if err1 != nil {
		fmt.Println("error")
	}
	return nil
}
