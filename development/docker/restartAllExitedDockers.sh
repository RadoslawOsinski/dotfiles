#!/bin/bash
for hash in $(docker ps -a | grep Exited | cut -d " " -f1 | grep -v CONTAINER); do docker restart $hash; done
