package controllers

import (
	"net/http"
	"strconv"

	"github.com/MISHRA-TUSHAR/twitter/tree/main/backend/config"
	"github.com/MISHRA-TUSHAR/twitter/tree/main/backend/models"
	"github.com/gin-gonic/gin"
)

func AddPost(c *gin.Context) {
	var post models.Post
	if c.Bind(&post) != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Failed to read body"})
		return
	}

	result := config.DB.Create(&post)
	if result.Error != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Failed to create post"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Post Uploaded Successfully",
		"post":    &post,
	})
}

func AddLike(c *gin.Context) {
	var body struct {
		PostID int64
		UserID int64
	}
	if err := c.BindJSON(&body); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to read the body",
		})
		return
	}
	like := models.Like{
		PostID: body.PostID,
		UserID: body.UserID,
	}
	result := config.DB.Create(&like)

	if result.Error != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to add the Like",
		})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Like Uploaded Successfully",
		"like":    like,
	})
}

func GetAllPosts(c *gin.Context) {
	limitParam := c.DefaultQuery("limit", "10")
	limit, err := strconv.Atoi(limitParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": "Invalid limit parameter",
		})
		return
	}

	var posts []models.Post
	result := config.DB.Limit(limit).Find(&posts)
	if result.Error != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"error": "Failed to fetch posts",
		})
		return
	}
	for i, j := 0, len(posts)-1; i < j; i, j = i+1, j-1 {
		posts[i], posts[j] = posts[j], posts[i]
	}

	c.JSON(http.StatusOK, gin.H{
		"posts": posts,
	})
}
