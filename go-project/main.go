package main

import (
	"fmt"
	"math"
	"net/http"
	"time"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var (
	opsProcessed = promauto.NewCounter(prometheus.CounterOpts{
		Name: "http_requests_total",
		Help: "The total number of requests",
	})
)

func health(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "done\n")
}

func cpu(w http.ResponseWriter, req *http.Request) {
	opsProcessed.Inc()
	for i := 1; i <= int(math.Pow(10, 4)); i++ {
	}
	fmt.Fprintf(w, "done\n")
}

func memory(w http.ResponseWriter, req *http.Request) {
	opsProcessed.Inc()
	go func() {
		_ = make([]byte, 2000000)
		time.Sleep(1500 * time.Millisecond)
	}()

	fmt.Fprintf(w, "done\n")
}

func main() {

	http.HandleFunc("/cpu", cpu)
	http.HandleFunc("/memory", memory)
	http.HandleFunc("/health", health)
	http.Handle("/metrics", promhttp.Handler())
	http.ListenAndServe(":8080", nil)
}
