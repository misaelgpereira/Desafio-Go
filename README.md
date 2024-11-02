# Desafio-Go
Esse desafio é muito empolgante principalmente se você nunca trabalhou com a linguagem Go!
Você terá que publicar uma imagem no docker hub. Quando executarmos:

docker run <seu-user>/fullcycle

Temos que ter o seguinte resultado: Full Cycle Rocks!!
Se você perceber, essa imagem apenas realiza um print da mensagem como resultado final, logo, vale a pena dar uma conferida no próprio site da Go Lang para aprender como fazer um "olá mundo".
Lembrando que a Go Lang possui imagens oficiais prontas, vale a pena consultar o Docker Hub.

A imagem de nosso projeto Go precisa ter menos de 2MB =)

Dica: No vídeo de introdução sobre o Docker quando falamos sobre o sistema de arquivos em camadas, apresento uma imagem "raiz", talvez seja uma boa utilizá-la.
Suba o projeto em um repositório Git remoto e coloque o link da imagem que subiu no Docker Hub.

Compartilhe o link do repositório do Git remoto para corrigirmos seu projeto.

Divirta-se!

# Dockerfile
```Dockerfile
  FROM golang:1.19 AS builder
  
  WORKDIR /app
  COPY . /app
  
  RUN go build -o api main.go
  
  FROM scratch
  
  WORKDIR /app
  COPY --from=builder /app/api ./
  
  EXPOSE 8000
  
  CMD ["./api"]
```

# Build
```Shell
docker build -t misaelgpereira/fullcycle .
```
# Imagem
```Shell
docker images
```

# Run
```Shell
docker run --rm -it misaelgpereira/fullcycle
```

# Hub Push
```Shell
docker push misaelgpereira/fullcycle
```
# Hub Pull
docker pull misaelgpereira/fullcycle



