FROM golang

ENV CGO_ENABLED=0
ENV GO111MODULE=on

WORKDIR /go/src/flog

COPY go.mod go.sum ./
RUN go mod download

COPY . ./
RUN go build -o /bin/calyptia-flog

FROM scratch
COPY --from=0 /bin/calyptia-flog /bin/calyptia-flog
ENTRYPOINT ["calyptia-flog"]
