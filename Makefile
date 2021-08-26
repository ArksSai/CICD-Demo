build:
	docker-compose build -t myweb:1.0.0 .

test:
	cd go-server; go test