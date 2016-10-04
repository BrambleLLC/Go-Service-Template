# Use base Docker Image for go on Google App Engine
FROM golang:1.6

# Grab the source code and add it to the workspace
COPY . /go/src/app

#RUN go-wrapper download github.com/go-martini/martini
#RUN go-wrapper download github.com/martini-contrib/binding
WORKDIR /go/src/app

RUN go install -v

# Expose port 8080 for our application
EXPOSE 8080

ENTRYPOINT app