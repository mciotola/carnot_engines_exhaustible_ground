
REPRODUCING CARNOT ENGINES-EXHAUSTIBLE RESERVOIRS 
GROUND-UP APPROACH
v01.05 README
=============================================================

Language
--------

  Carnot Engine is written in Ruby 1.9.2 & 2.0.0


Description
-----------

  Carnot engines bridge and consume an exhaustible thermal difference to
  perform work. Such work is then utilized to build additional heat engines.
  Additional heat engines increases total consumption, but efficiency
  decreases as the thermal difference becomes exhausted.

  In this simulation, a heat engines consumes a fixed amount of heat per
  period. An engine also requires a fixed amount of work to build.  The
  thermal difference comprises a hot and cold reservoir.  The temperature
  of each reservoir is a function of its kinetic energy, volume and heat
  capacity.


Requirements
------------

  You must have Ruby 1.9.2 installed on your computer.


Running the Program
-------------------

  There may be various ways to run Ruby programs on particular machines. 
  However, these instructions assume that you have access to your computer's 
  command line interface.

  To run this file, first download it and place it in an appropriate directory.
  For example, you may wish to create a subdirectory for Ruby program in your
  top-level user directory and place the program file in there.

  In the command line, go to the directory where the program file is located.

  Then enter:

    ruby carnot_engines_exhaustible_ground_v01_05.rb
  
    You will be prompted to enter the name for the output file. The default
    name is in brackets.

  
Adjusting Parameters
--------------------

  You can adjust other parameters manually.  To do so, change the
  parameters in the "SET AND DISPLAY PARAMETERS" section of the
  source code. You will need a text editor for this.


  
Troubleshooting
---------------

  If the program does not run, make sure that at least Ruby version 1.9.2 
  is installed on your computer.
 
  Make that you are in the correct directory.
  
  If you adjusted the parameters, make sure all are positive and have decimal
  point. Also make sure that you saved the file in a pure text format and that
  the file name ends in ".rb"
  
  
Copyright and Use Notice
------------------------
  
  Copyright 2011-14 by Mark Ciotola.
  
  Available for use under GNU license.
