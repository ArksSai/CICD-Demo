# CICD-Demo

## go-server/
* Using golang/gin to build a app server
* html and CSS come from copy
* function: Login system
  * connect to database and check account and password

### go-server/golang_db
  * connect to database and check account and password
  * get database infomation from /etc/databse/config.yaml
  
### /main.test
* Unit test for go/gin server
  * test GET, POST

## Dcoekr
* Build Dockerfile and Dockerfile.test
  * Dockerfile.test is for testing
  * Dockerfile is for deploy

## Jenkins Pipeline
* Using jenkins pipeline for testing
* Stages:
  * start
  * build testing docker image
  * run testing docker image

## Terraform (developing)
* Set up above programs on AWS server as code.
