bath-bar-times
==============

Converts the bath bar times provided by NightCapp into the socrata format for the [BathHacked datastore](https://data.bathhacked.org/)

**Usage**

Put the input files in datain directory and run convert.sh.
output.csv will be created which can then be imported to Socrata.

If you're on Windows or don't have the dependencies installed, install vagrant, then run:

    vagrant up
    
Vagrant will boot a VM, install the dependencies, and run convert.sh.

Data provided by [NightCapp](http://nightcapp.co) under the [Creative Commons BY-SA-4](http://creativecommons.org/licenses/by-sa/4.0/) license.

Source code (excluding data) is licensed under the [MIT License](http://opensource.org/licenses/MIT)