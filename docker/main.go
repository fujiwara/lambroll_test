package main

import (
	"fmt"
	"net/http"
	"os"
	"sort"
	"strings"

	"github.com/fujiwara/ridge"
)

func main() {
	var mux = http.NewServeMux()
	mux.HandleFunc("/", handleRoot)
	mux.HandleFunc("/hello", handleHello)
	mux.HandleFunc("/printenv", handleEnv)
	mux.HandleFunc("/cwd", handleCwd)
	ridge.Run(":8080", "/", mux)
}

func handleHello(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	fmt.Fprintf(w, "Hello %s\n", r.FormValue("name"))
}

func handleRoot(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	fmt.Fprintln(w, "Hello World")
	fmt.Fprintln(w, r.URL)
}

func handleEnv(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	envs := os.Environ()
	sort.Strings(envs)
	for _, env := range envs {
		if strings.HasPrefix(env, "AWS_SECRET_ACCESS_KEY") || strings.HasPrefix(env, "AWS_ACCESS_KEY_ID") || strings.HasPrefix(env, "AWS_SESSION_TOKEN") {
			continue
		}
		fmt.Fprintln(w, env)
	}
}

func handleCwd(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	d, _ := os.Getwd()
	fmt.Fprintln(w, d)
}
