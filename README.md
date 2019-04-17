# routino_R_demo

Demonstration for using the [Routino routing engine](https://www.routino.org/) via an Rscript.  This is designed for use assuming that Routino has been installed using the spack.io package manager, but provided Routino is on your path, everything should work fine.

## Setup:

Ensure Routino is installed and available via the PATH and then run the setup_gb_mapping.sh to download and set up the openstreetmap mapping data for the UK.  To use different mapping data find the correct link on http://download.geofabrik.de/ and adjust the urls and prefix accordingly.

By default the data is installed to /data/$USER/routino-data, but this can be altered within the script.

## Running:

An example of using Routino and capturing the total journey time is provided in routino_demo.R.  Routino is interfaced to using the system2() call, capturing the output from stdout and parsing it to get the necessary data.

For more information on Routino options and output formats see the [Routino documentation](https://www.routino.org/documentation/)
