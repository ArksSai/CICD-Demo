package main

import (
	"go-server/login"
	"net/http"

	"github.com/gin-gonic/gin"
)

type User struct {
	Name string `json:"name" binding:"required"`
}

func router() *gin.Engine {
	server := gin.Default()
	server.LoadHTMLFiles("template/html/login.html")
	server.Static("/assets", "template/assets")

	// GET test
	server.GET("pingtest", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"msg": "pong"})
	})

	//POST test
	server.POST("/posttest", func(c *gin.Context) {
		var user User
		if err := c.BindJSON(&user); err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"msg": "error"})
			return
		}
		c.JSON(http.StatusOK, gin.H{"msg": user})
	})

	//Login page
	server.GET("/loging", login.LoginPage)

	return server
}

func main() {
	router().Run(":8000")
}
