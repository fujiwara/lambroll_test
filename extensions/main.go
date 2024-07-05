package main

import (
	"context"
	"fmt"
	"log/slog"
	"time"

	"github.com/fujiwara/lamblocal"
)

type Payload struct {
	Sleep string `json:"sleep"`
}

func myHandler(ctx context.Context, payload Payload) (string, error) {
	fmt.Println("start handler")
	d, err := time.ParseDuration(payload.Sleep)
	if err != nil {
		slog.Info("parse error but continue as 1s", "error", err)
		d = 1 * time.Second
	}
	tm := time.NewTimer(d)
	tk := time.NewTicker(100 * time.Millisecond)
	defer tm.Stop()
	defer tk.Stop()
	count := 0
LOOP:
	for {
		select {
		case <-tk.C:
			count++
			fmt.Println(time.Now(), "tick", count)
		case <-tm.C:
			break LOOP
		}
	}
	fmt.Println("end handler")
	return "OK", nil
}

func main() {
	lamblocal.Run(context.TODO(), myHandler)
}
