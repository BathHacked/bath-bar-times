bath-bar-times
==============

Converts the bath bar times provided by NightCapp into the socrata format for the BathHacked datastore.

**Usage**

Put the input files in datain directory and run convert.sh.
output.csv will be created which can then be imported to Socrata.

If you're on Windows or don't have the dependencies installed, install vagrant, then run:

    vagrant up
    
Vagrant will boot a VM, install the dependencies, and run convert.sh.