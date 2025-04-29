package main

import (
	"fmt"
	"html"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/fujiwara/ridge"
)

func main() {
	var mux = http.NewServeMux()
	mux.HandleFunc("/", handleHello)
	mux.HandleFunc("/stream", handleStream)
	ridge.Run(os.Getenv("RIDGE_ADDR"), "/", mux)
}

func handleHello(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	fmt.Fprintf(w, "Hello %s\n", os.Getenv("ALIAS"))
	for n, v := range r.Header {
		fmt.Fprintf(w, "%s: %s\n", n, v)
	}
}

func handleStream(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	flusher, ok := w.(http.Flusher)
	log.Printf("w type=%T, is flusher=%v", w, ok)
	if !ok {
		w.WriteHeader(http.StatusInternalServerError)
		fmt.Fprintln(w, "response streaming is not supported. set RIDGE_RESPONSE_STREAMING=1")
		return
	}
	fmt.Fprintf(w, "Hello, %q\n", html.EscapeString(r.URL.Path))
	for i := 1; i <= 3; i++ {
		fmt.Fprintf(w, "Chunk #%d\n", i)
		flusher.Flush()
		time.Sleep(time.Second / 2)
	}
}
