package main

import (
	"fmt"
	"math"
	"net/http"
	"time"
)

func health(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "done\n")
}

func cpu(w http.ResponseWriter, req *http.Request) {
	for i := 1; i <= int(math.Pow(10, 4)); i++ {
	}
	fmt.Fprintf(w, "done\n")
}

func memory(w http.ResponseWriter, req *http.Request) {
	go func() {
		_ = make([]byte, 200000)
		time.Sleep(500 * time.Millisecond)
	}()

	fmt.Fprintf(w, "done\n")
}

func main() {

	http.HandleFunc("/cpu", cpu)
	http.HandleFunc("/memory", memory)
	http.HandleFunc("/health", health)

	http.ListenAndServe(":8080", nil)
}
