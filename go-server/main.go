package main

import (
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

	server.GET("/", func(c *gin.Context) {
		c.HTML(http.StatusOK, "login.html", nil)
	})

	server.GET("pingtest", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"msg": "pong"})
	})

	server.POST("/posttest", func(c *gin.Context) {
		var user User
		if err := c.BindJSON(&user); err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, gin.H{"msg": "error"})
			return
		}
		c.JSON(http.StatusOK, gin.H{"msg": user})
	})
	return server
}

func main() {
	router().Run(":8000")
}
