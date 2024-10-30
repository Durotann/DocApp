package repository

import "main/internal/pkg/models"

type Repository interface {
	SignIn(user models.User) error
}
