package main

import (
	"net/http"

	"github.com/go-martini/martini"
)

func init() {
	m := martini.Classic()
	m.Get("/api/hello", Hello)
	http.Handle("/", m)
}

func main() {
	http.ListenAndServe(":8080", nil)
}

func Hello() string {
	return "Hello, world!"
}
