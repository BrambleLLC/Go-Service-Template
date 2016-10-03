# Use base Docker Image for go on Google App Engine
FROM gcr.io/google_appengine/golang

# Grab the source code and add it to the workspace
ADD . /go/src/github.com/BrambleLLC/SERVICE_NAME

RUN go get github.com/go-martini/martini
RUN go get github.com/martini-contrib/binding

# Run our service, which in this case is called service.go
ENTRYPOINT go run /go/src/github.com/BrambleLLC/SERVICE_NAME/service.go

# Expose port 8080 for our application
EXPOSE 8080