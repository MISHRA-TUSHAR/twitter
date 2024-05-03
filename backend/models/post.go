package models

import "gorm.io/gorm"

type Post struct {
	gorm.Model

	ID            int64 `gorm:"unique"`
	Description   string
	UserID        int64
	UserName      string
	Title         string
	Views         int64
	LikesCount    int64
	CommentsCount int64
	ImageLink     string
	ProfileImg    string
}

type Comment struct {
	gorm.Model
	ID          int64 `gorm:"unique"`
	UserID      int64
	PostID      int64
	CommentText string
}

type Like struct {
	gorm.Model
	ID     int64 `gorm:"unique"`
	UserID int64
	PostID int64
}
