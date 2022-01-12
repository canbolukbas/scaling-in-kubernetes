FROM golang:1.16-alpine3.15 as builder

# Set the Current Working Directory inside the container
WORKDIR /opt/sample-app

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Download all the dependencies
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

RUN go build main.go


FROM alpine:3.15

COPY --from=builder /opt/sample-app/main .

# executable
CMD [ "./main" ]
# arguments that can be overridden