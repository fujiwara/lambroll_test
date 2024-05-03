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
	d, err := time.ParseDuration(payload.Sleep)
	if err != nil {
		slog.Info("parse error but continue as 1s", "error", err)
		d = 1 * time.Second
	}
	tm := time.NewTimer(d)
	defer tm.Stop()
	fmt.Println("start handler")
	<-tm.C
	fmt.Println("end handler")
	return "OK", nil
}

func main() {
	lamblocal.Run(context.TODO(), myHandler)
}
