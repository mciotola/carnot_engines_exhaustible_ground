# SIMULATION BANNER

puts ""
puts "###############################################################################"
puts "#                                                                             #"
puts "# GROUND-UP REPRODUCING CARNOT ENGINES - WITH EXHAUSTIBLE RESERVOIRS v 01.05  #"
puts "# Copyright 2011-2014 by Mark Ciotola  GNU license   www.historydynamics.com  #"
puts "#                                                                             #"
puts "###############################################################################"
puts ""

      ###############################################################################
      #                                                                             #
      # GROUND-UP CARNOT ENGINES - WITH EXHAUSTIBLE RESERVOIRS version 01.04        #
      #_____________________________________________________________________________#
      #                                                                             #
      # Copyright 2011-2014 by Mark Ciotola; available for use under GNU license    #
      # Created on 14 June 2014. Last revised on 17 December 2014                   #
      #_____________________________________________________________________________#
      #                                                                             #
      # Developed with Ruby 1.8.7; updated to Ruby 1.9.2 & 2.0.0                    #
      #                                                                             #
      ###############################################################################


# INTTRODUCTION

  puts " Carnot engines bridge and consume an exhaustible thermal difference to "
  puts " perform work. Such work is then utilized to build additional heat engines."
  puts " Additional heat engines increases total consumption, but efficiency "
  puts " decreases as the thermal difference becomes exhausted."
  puts " \n"
  puts " In this simulation, a heat engines consumes a fixed amount of heat per "
  puts " period. An engine also requires a fixed amount of work to build.  The "
  puts " thermal difference comprises a hot and cold reservoir.  The temperature"
  puts " of each reservoir is a function of its kinetic energy, volume and heat"
  puts " capacity."
  puts " \n"


# INCLUDE LIBRARIES AND SET-UP

  include Math
  require "csv"

  prompt = " > "


# CREATE OUTPUT FILE

  puts " What is the desired name for your output file? [edeg_ground_up_output.txt]:"
  print prompt
  output_file_name = STDIN.gets.chomp()

  if output_file_name > ""
      output_file_name = output_file_name
      else
      output_file_name = "edeg_ground_up_output.csv"
  end

  target = File.open(output_file_name, 'w')


# SET AND DISPLAY PARAMETERS

  # Intitialize reservoirs

    hotspecificheat = 1.0  # Specific heat of hot reservoir substance
    coldspecificheat = 1.0  # Specific heat of cold reservoir substance
    hotvolume = 1000.0  # Volume of hot reservoir in m^2
    coldvolume = 1000.0  #Volume of cold reservoir in m^2
    hotenergyinit =  500000.0  # Kinetic energy of hot reservoir in J
    coldenergyinit =  300000.0 #Kinetic energy of cold reservoir in J

 # Initialize engine characteristics

    engineconsumption = 1000.0  # Consumption rate by engine in J/s
    engineqty = 1.0             # Initial engine quantity
    enginecost = 1000.0         # in J

  # Write to output file

    # paramstring1 = "engineconsumption: \t" + engineconsumption.to_s + "\n"
    # target.write(paramstring1)
    # paramstring2 = "enginecost: \t" + enginecost.to_s + "\n"
    # target.write(paramstring2)
    # target.write("\n")


# INITIALIZE LOOP VARIABLES

  time = 0  # in s
  engbuilt = 0.0
  culprod = 0.0
  hotenergy = hotenergyinit  # in J
  coldenergy = coldenergyinit  # in J
  hottemp = hotenergy/(hotvolume * hotspecificheat)  # in K
  coldtemp = coldenergy/(coldvolume * coldspecificheat)  # in K
  consumption = engineqty * engineconsumption  # in J


# DISPLAY INITIAL VALUES

  puts "\n"
  puts "INITIAL PARAMETERS\n\n"

  puts sprintf "  Initial Hot Temp: \t\t %9.3f K", hottemp.to_s, "\n"
  puts sprintf "  Initial Cold Temp: \t\t %9.3f K", coldtemp.to_s, "\n"
  puts sprintf "  Engine Cost: \t\t\t %9.3f J", enginecost.to_s, "\n"
  puts "\n"


# DISPLAY RESULTS BANNER

  puts "\n"
  puts "RESULTS: \n\n"

  puts " Time \tT hot \tT cold \tEng Qty \tConsmp\tE hot \tE cold\tEFFIC\tPRODTN\t CumlProd\tHot S c\tCold S c"
  puts "------\t-------\t-------\t--------\t------\t------\t------\t-----\t------\t --------\t-------\t--------\n"


# CALCULATE & DISPLAY RESULTS

  while coldtemp < hottemp
    
    # Calculations
    
      efficiency = 1 - (coldtemp/hottemp)
  
      engineproduction = consumption * efficiency
  
      hotenergy = hotenergy - consumption
      coldenergy = coldenergy + consumption
  
      culprod = culprod + engineproduction
  
      hotentropychange = - consumption / hottemp
      coldentropychange = (consumption - engineproduction) / coldtemp

    # Set variable short names for display

      t = time
      ht = hottemp
      ct = coldtemp
      he = hotenergy
      ce = coldenergy
      cn = consumption
      eff = efficiency
      ep = engineproduction
      cp = culprod
      hs = hotentropychange
      cs = coldentropychange
      eb = engbuilt
      eq = engineqty

    # Display results and write to file

      mystring = ("%4d\t%7.2f\t%7.2f\t%8.2f\t%6.0f\t%5.0f\t%5.0f\t%5.3f\t%6.2f\t%9.2f\t%6.2f\t%6.2f")
      puts sprintf mystring, t.to_s, ht.to_s, ct.to_s, eq.to_s, cn.to_s, he.to_s, ce.to_s, eff.to_s, ep.to_s, cp.to_s, hs.to_s, cs.to_s

    # Write to Output File

      periodstring = t.to_s+"\t"+eq.to_s+"\t"+cn.to_s+"\t"+eff.to_s+"\t"+ep.to_s+"\t"+cp.to_s
      
      CSV.open(output_file_name, "a+") do |csv|
          csv << [t.to_s, eq.to_s, cn.to_s, eff.to_s, ep.to_s, cp.to_s]
      end
      
      # target.write(periodstring)
      # target.write("\n")

    # Update variables
    
      hottemp = hotenergy/(hotvolume * hotspecificheat) #K
      coldtemp = coldenergy/(coldvolume * coldspecificheat) #K

      consumption = engineqty * engineconsumption

      engbuilt = engineproduction/enginecost
      engineqty = engineqty + engbuilt

      time = time + 1
    
   end


# CLOSE OUTPUT FILE

  target.close()
  puts "\nSimulation is completed. \n\n"


# KEY AND REFERENCE

  puts "\n\n"

  puts "================================== Units Key ==================================\n\n"
  puts "  Abbreviation: \t\t Unit:"
  puts "\n"
  puts "       J \t\t\t Joules, a unit of energy"
  puts "       K \t\t\t Kelvin, a unit of temperature"
  puts "       m \t\t\t meters, a unit of length"
  puts "       s \t\t\t seconds, a unit of time"
  puts "\n\n"

  puts "================================== References =================================\n\n"
  puts "Daniel V. Schroeder, 2000, \"An Introduction to Thermal Physics.\""
  puts "\n\n"

