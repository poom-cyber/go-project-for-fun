package main

import (
    "testing"
)


func TestHelloWorld(t *testing.T) {
    expected := "Hello, World!"
    result := "Hello, World!"

    if result != expected {
        t.Errorf("Expected %s, but got %s", expected, result)
    }
}