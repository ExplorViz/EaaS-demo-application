#!/bin/sh
set -eu

# Let analysis-service start
sleep 30

java-with-kieker -cp ".:BOOT-INF/classes/:BOOT-INF/lib/*" org.springframework.samples.petclinic.PetClinicApplication &

# Allow server some time to start to avoid premature errors
sleep 15

# Now create some load on the server so we will have an interesting visualization
./create-load.sh
