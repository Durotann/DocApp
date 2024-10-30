package app

import (
	"fmt"
	"log"
	"main/internal/app/endpoint"
	"main/internal/app/repository/sqlx"
	"main/internal/app/service"

	"github.com/labstack/echo"
)

type App struct {
	e    *endpoint.Endpoint
	s    *service.Service
	echo *echo.Echo
}

func New() (*App, error) {
	a := &App{
		echo: echo.New(),
	}
	db, err := sqlx.New(sqlx.LoadConfig())
	if err != nil {
		return nil, err
	}
	a.s = service.New(db)

	a.e = endpoint.New(a.s)

	a.echo.POST("/auth", a.e.Authorization)

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
