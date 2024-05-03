package main

import (
	"github.com/MISHRA-TUSHAR/twitter/tree/main/backend/config"
	"github.com/MISHRA-TUSHAR/twitter/tree/main/backend/controllers"
	"github.com/MISHRA-TUSHAR/twitter/tree/main/backend/middleware"
	"github.com/gin-gonic/gin"
)

func init() {
	config.LoadEnvVariables()
	config.ConnectToDB()
	config.SyncDatabase()
}

func main() {
	r := gin.Default()
	r.POST("/login", controllers.Login)
	r.POST("/signup", controllers.SignUp)
	r.POST("/addpost", controllers.AddPost)
	r.POST("/addlike", controllers.AddLike)
	r.GET("/", controllers.DefaultApiPoint)
	r.POST("/allposts", controllers.GetAllPosts)
	r.POST("/ckeckemail", controllers.CheckUserEmail)
	r.POST("/ckeckusername", controllers.CheckUserName)

	r.GET("/validate", middleware.AuthMiddleware(), controllers.Validate)

	r.Run()
}
