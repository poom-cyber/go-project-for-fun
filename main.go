package main

import (
    "fmt"
    "log"
    "math/rand"
    "net/http"
    "github.com/gorilla/mux"
)

func main() {
    router := mux.NewRouter()
    router.HandleFunc("/", Output)
    
    // Start the HTTP server
    log.Fatal(http.ListenAndServe("0.0.0.0:8070", router))
}

func Output(w http.ResponseWriter, r *http.Request) {
    w.WriteHeader(http.StatusOK)
    fmt.Fprint(w, "Random number: ", randomNumbers())
    fmt.Fprint(w, "Random number: ", randomNumbers())
}




func randomNumbers() int {
    return rand.Intn(1000)
}
