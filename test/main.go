package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
)

func main() {
	fmt.Fprintln(os.Stdout, "Starting server on port 80")
	http.ListenAndServe(":80", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(io.MultiWriter(os.Stdout, w), "Hello, %s or %s!\n", r.RemoteAddr, r.Header.Get("X-Forwarded-For"))
	}))
}

