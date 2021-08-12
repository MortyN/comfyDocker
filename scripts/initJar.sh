#!/bin/bash

pwd

cat eula.txt

echo "eula=true" > eula.txt

java -jar forge-1.12.2-installer.jar --installServer

java -jar forge-1.12.2-14.23.5.2855.jar

java -Xmx2G -jar forge-1.12.2-14.23.5.2855.jar nogui