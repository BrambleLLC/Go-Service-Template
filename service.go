package main

import (
	"net/http"

	"golang.org/x/net/context"

	"github.com/go-martini/martini"
	"google.golang.org/appengine"
)

func AppEngineMiddleware(c martini.Context, r *http.Request) {
	c.Map(appengine.NewContext(r))
}

func init() {
	m := martini.Classic()
	m.Use(AppEngineMiddleware)
	m.Get("/api/hello", Hello)
	http.Handle("/", m)
}

func main() {
	appengine.Main()
}

func Hello(c context.Context) string {
	return "Hello, world!"
}
