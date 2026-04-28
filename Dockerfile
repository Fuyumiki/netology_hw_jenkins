FROM golang:1.22

WORKDIR /app
COPY . .

RUN go test .
RUN go build -o app .

CMD ["./app"]
