package enum

import (
	"fmt"
	"log"
	"os/exec"
)

func EnumWaf(targets []string) {
	for _, target := range targets {
		scanWaf(target)
	}
}

func scanWaf(target string) {
	out, err := exec.Command("wafw00f " + target).Output()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s\n", out)
}
