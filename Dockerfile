FROM golang:1.19 AS builder

WORKDIR /app
COPY . /app

RUN go build -o api main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app/api ./

EXPOSE 8000

CMD ["./api"]
