package service

import (
	"main/internal/app/repository"
	"main/internal/pkg/models"
)

type Service struct {
	db repository.Repository
}

func New(db repository.Repository) *Service {
	return &Service{
		db: db,
	}
}

func (s *Service) SignIn(user models.User) error {
	err := s.db.SignIn(user)
	if err != nil {
		return err
	}
	return nil
}
