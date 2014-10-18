bath-bar-times
==============

Converts the bath bar times provided by NightCapp into the socrata format for the BathHacked datastore.

*Usage*

Put the input files in datain directory and run:

    vagrant up
    
Vagrant will boot a VM, install the dependencies, and run convert.sh.
output.csv will be created which can be imported to Socrata.

To modify, edit convert.sh, then SSH into the VM like normal to run it.