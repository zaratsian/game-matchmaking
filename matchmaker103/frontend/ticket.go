// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"math/rand"

	"open-match.dev/open-match/pkg/pb"
)

package main

import (
    "os"
    "math/rand"
    "math"
    "fmt"

    "open-match.dev/open-match/pkg/pb"
)

// Ticket generates a Ticket with a mode search field that has one of the
// randomly selected modes.
func makeTicket() *pb.Ticket {
	ticket := &pb.Ticket{
		SearchFields: &pb.SearchFields{
			// Tags can support multiple values but for simplicity, the demo function
			// assumes only single mode selection per Ticket.
			Tags: []string{
			    getRegion(),
			},
            StringArgs: map[string]string{
			    "game_mode": getGameMode(),
			},
			DoubleArgs: map[string]float64{
			    "rank": getPlayerRank(),
			},
		},
	}
    
	return ticket
}

func getGameMode() string {
    modes := []string{
        "capture the flag",
		"battleroyale",
		"attack and defend",
		"creative"}
    
    return modes[rand.Intn(len(modes))]
}

func getRegion() string {
    gcp_region, ok := os.LookupEnv("GCP_REGION")
    if !ok {
        return "unknown"
    } else { return gcp_region }
}

func getPlayerRank() float64 {
    player_rank := math.Floor((1500 + rand.Float64()*300 - rand.Float64()*350)*100) / 100
    return player_rank
}


/* 
// Used for Testing
func main() {
    
    for  i:=0; i<=10; i++ {
        ticket := makeTicket()
        fmt.Printf("ticket %v\n", ticket)
    }
}
*/