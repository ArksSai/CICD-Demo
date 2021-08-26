package main

import (
	"bytes"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/stretchr/testify/assert"
)

func TestGET(t *testing.T) {
	router := router()

	w := httptest.NewRecorder() // get ResponseRecorder
	req1, _ := http.NewRequest("GET", "/pingtest", nil)
	router.ServeHTTP(w, req1)

	assert.Equal(t, http.StatusOK, w.Code)
	assert.Contains(t, w.Body.String(), "pong")
}

func TestPOST(t *testing.T) {
	router := router()
	w := httptest.NewRecorder()
	req1, _ := gin.CreateTestContext(w)
	body := bytes.NewBufferString("{\"name\":\"user1\"}")
	req1.Request, _ = http.NewRequest("POST", "/posttest", body)
	router.ServeHTTP(w, req1.Request)

	assert.Equal(t, http.StatusOK, w.Code)
	assert.JSONEq(t, w.Body.String(), "{\"msg\":{\"name\":\"user1\"}}")
}
