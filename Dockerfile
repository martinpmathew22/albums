FROM golang:1.23

WORKDIR /app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY . .
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o /web-service-gin
EXPOSE 8000

CMD ["/web-service-gin"]