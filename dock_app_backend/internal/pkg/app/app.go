package app

import (
	"fmt"
	"log"
	"main/internal/app/endpoint"
	"main/internal/app/service"

	"github.com/labstack/echo"
)

type App struct {
	e    *endpoint.Endpoint
	s    *service.Service
	echo *echo.Echo
}

func New() (*App, error) {
	a := &App{}

	a.s = service.New()

	a.e = endpoint.New(a.s)

	a.echo.Use()

	a.echo.GET("/auth", a.e.Authorization)

	return a, nil
}

func (a *App) Run() error {
	fmt.Println("server runnning")

	err := a.echo.Start(":8080")

	if err != nil {
		log.Fatal(err)
	}

	return nil
}
