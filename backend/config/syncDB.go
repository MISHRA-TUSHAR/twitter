package config

import (
	"github.com/MISHRA-TUSHAR/twitter/backend/models"
)

func SyncDatabase() {
	DB.AutoMigrate(&models.User{})
	DB.AutoMigrate(&models.Post{})
	DB.AutoMigrate(&models.Like{})
	DB.AutoMigrate(&models.Comment{})
}
