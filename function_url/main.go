package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/fujiwara/ridge"
)

func main() {
	var mux = http.NewServeMux()
	mux.HandleFunc("/", handleHello)
	ridge.Run(os.Getenv("RIDGE_ADDR"), "/", mux)
}

func handleHello(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	fmt.Fprintf(w, "Hello %s\n", os.Getenv("ALIAS"))
	for n, v := range r.Header {
		fmt.Fprintf(w, "%s: %s\n", n, v)
	}
}
