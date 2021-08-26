FROM golang

COPY . /opt/Appserver

WORKDIR /opt/Appserver/go-server

RUN go build -o main .

EXPOSE 8000

CMD ["./main"]