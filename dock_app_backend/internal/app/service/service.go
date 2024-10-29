package service

type Service struct {
}

func New() *Service {
	return &Service{}
}

func (s *Service) SignIn() error {
	print("authorization")

	return nil
}
