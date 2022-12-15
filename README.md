# FiveM Taxi Job
This is a simple taxi job for FiveM standalone sandbox servers. It allows players to become taxi drivers and earn money by picking up and dropping off passengers at various checkpoints around the map.

# Requirements
FiveM

A standalone sandbox server

# Installation
Copy the taxijob folder to your resources directory on your server.

Add start taxi to your server.cfg file.

Start the server.

# Usage
Start the taxi job using the /job command in the chat, followed by the name of the job (e.g. /job taxi).

Drive to the checkpoints and pick up passengers.

Drop off the passengers at their destination to earn money.

Use the /quitjob command in the chat to end the job.

# Configuration
The taxiJob table in taxiJob.lua contains the configuration for the taxi job. You can modify the following parameters to customize the job:

name: The name of the job. This is used in the /job command to start the job.

display_name: The display name of the job. This is shown in the chat and UI when the job is started.

checkpoints: The locations of the checkpoints where passengers can be picked up and dropped off.

min_passengers: The minimum number of passengers for each taxi ride.

max_passengers: The maximum number of passengers for each taxi ride.

min_distance: The minimum distance for each taxi ride.

max_distance: The maximum distance for each taxi ride.

vehicle_model: The model of the vehicle used for the taxi job.

vehicle_spawn: The location where the taxi vehicle will be spawned.

# License
This project is licensed under the MIT License - see the LICENSE file for details.
