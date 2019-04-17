#!/bin/bash

spack load routino

routino_dir="/data/$USER/routino-data"

echo Warning: this will consume approximately 20GB of disk space. You have been warned!

(
echo Creating routino data directory ~/routino-data

mkdir -p $routino_dir
cd $routino_dir

echo Fetching Openstreetmap UK data

wget http://download.geofabrik.de/europe/great-britain-latest.osm.bz2

echo "Decompressing - this will take a while, go get a coffee ;)"

bzip2 -d great-britain-latest.osm.bz2

echo "Converting to routino format with planetsplitter"

planetsplitter --prefix=gb --max-iterations=10 great-britain-latest.osm

echo "Done. Routino mapping data can be used by passing --dir=$routino_dir to the router command"
)
