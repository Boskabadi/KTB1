KTB1- A Dynamic Simulation Model for Continuous Biologics Manufacturing

# Overview
Welcome to the KT-Biologics I Continuous Biopharmaceutical Process Simulation repository. This repository contains Simulink files and scripts related to the simulation of a continuous biopharmaceutical process. 

# Files
1. **Simulink Files:**
   - *KTB1_CL* - KT-Biologics I Closed Loop Simulink File: This Simulink file contains the simulation model for the continuous biopharmaceutical process with closed-loop control.
   - *KTB1_F* - KT-Biologics I Fault: This Simulink file contains the simulation model for introducing faults into the biopharmaceutical process.
   - *KTB1_SMAH* - KT-Biologics I Sensor Model and Actuator Handle: This Simulink file contains the simulation model sensor model and actuator handel to simulate more close to reality. 

2. **Scripts:**
   - *CSTR* - Fermentation Reactor: Script for simulating the fermentation reactor.
   - *KTB1_F* - Fault Parameter: Script for setting fault parameters in the simulation.
   - *SAP* - Sensor Model and Actuator Model Parameter: Script for setting parameters for the sensor model and actuator handle.
   - *Tank_A* - T-101: Script for simulating Tank A (T-101) in the process.
   - *Tank_B* - T-102: Script for simulating Tank B (T-102) in the process.

# Instructions
To effectively use this repository, follow these steps:
1. Run the necessary scripts before running the Simulink files:

   - *CSTR*: Run this script to simulate the fermentation reactor.
   - *Tank_A* and *Tank_B*: Run these scripts for simulating Tanks A (T-101) and B (T-102) respectively.
   - *KTB1_F*: Run this script to set fault parameters in the simulation (if desired).
   - *SAP*: Run this script to set the parameters for the sensor model and actuator handle (if desired).

2. Once the scripts are run, you can proceed to run the following Simulink files:
   - *KTB1_CL*: This is the main Simulink file for the continuous biopharmaceutical process with closed-loop control.
   - *KTB1_F*: If you have set fault parameters, you can run this Simulink file to simulate faults in the process.
   - *KTB1_SMAH*: If you wan to consider the sensor and actuator delay time and noise, run this simulation file. 

# Additional Information
- For more details on the simulation setup and parameters, refer to the KTB1 article.
- For any questions or issues, please contact seso@kt.dtu.dk or morebo@kt.dtu.dk.

Thank you for using the KT-Biologics I Continuous Biopharmaceutical Process Simulation repository.
