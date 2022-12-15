-- Define the taxi job
TAXI_JOB = {
    -- Set the job name and display name
    name = "taxi",
    display_name = "Taxi Driver",   
}
    
    -- Define the job checkpoints
    checkpoints = {
      {x = -215.15, y = -1324.82, z = 30.89},
      {x = -281.61, y = -1212.96, z = 31.24},
      {x = -214.61, y = -1118.86, z = 22.43},
      {x = -109.59, y = -943.35, z = 29.68},
      {x = -120.62, y = -908.62, z = 29.74},
      {x = -164.57, y = -873.34, z = 30.24},
      {x = -202.44, y = -840.8, z = 29.2},
      {x = -275.99, y = -818.25, z = 29.57},
      {x = -290.61, y = -775.71, z = 29.44},
      {x = -276.43, y = -742.68, z = 27.19},
      {x = -248.37, y = -696.37, z = 28.69},
      {x = -254.85, y = -634.06, z = 33.02},
      {x = -227.94, y = -584.68, z = 34.07},
      {x = -226.58, y = -547.91, z = 34.29},
      {x = -226.92, y = -509.75, z = 34.29},
      {x = -254.24, y = -460.94, z = 34.62},
      {x = -285.34, y = -401.43, z = 38.23},
      {x = -302.64, y = -366.46, z = 37.86},
      {x = -306.51, y = -321.94, z = 37.35},
      {x = -324.91, y = -290.01, z = 37.34},
      {x = -318.23, y = -246.34, z = 37.88},
      {x = -345.99, y = -197.61, z = 37.87},
      {x = -410.53, y = -185.82, z = 37.67},
      {x = -437.15, y = -146.91, z = 37.62},
      {x = -444.67, y = -111.92, z = 37.58},
      {x = -462.78, y = -86.35, z = 37.58},
      {x = -491.73, y = -77.33, z = 37.58},
      {x = -521.06, y = -73.19, z = 37.58},
-- Set the minimum and maximum number of passengers for each taxi ride
min_passengers = 1,
max_passengers = 2,

-- Set the minimum and maximum distance for each taxi ride
min_distance = 100,
max_distance = 1000,

-- Set the taxi vehicle model and spawn location
vehicle_model = "taxi",
vehicle_spawn = {x = 920.94, y = -175.309, z = 8}, -- This is the taxi Depot

-- Define the job actions
actions = {
-- Start a taxi ride
start_ride = {
-- Set the action name and display name
name = "start_ride",
display_name = "Start taxi ride",

  -- Define the action function
  -- This function should return the distance of the taxi ride
  action = function(player_ped, player_id)
    -- Calculate the distance to the next checkpoint
    local next_checkpoint = TAXI_JOB.checkpoints[player_data[player_id].current_checkpoint + 1]
    local distance_to_checkpoint = #(player_ped.position - next_checkpoint)
    
    -- Calculate the distance of the taxi ride
    local distance = math.random(TAXI_JOB.min_distance, TAXI_JOB.max_distance)
    
    -- Return the distance of the taxi ride
    return distance
  end,
},

-- End a taxi ride
end_ride = {
  -- Set the action name and display name
  name = "end_ride",
  display_name = "End taxi ride",

    
    -- Increment the player's current checkpoint
    player_data[player_id].current_checkpoint = player_data[player_id].current_checkpoint + 1
    
    -- If the player has reached the final checkpoint, reset their current checkpoint to the first checkpoint
    if player_data[player_id].current_checkpoint > #TAXI_JOB.checkpoints then
      player_data[player_id].current_checkpoint = 1
    end
  end,
},
},
}
-- Register the taxi job with the job manager
job_manager.RegisterJob(TAXI_JOB.name, TAXI_JOB.display_name, TAXI_JOB.actions, TAXI_JOB.checkpoints, TAXI_JOB.min_passengers, TAXI_JOB.max_passengers, TAXI_JOB.min_distance, TAXI_JOB.max_distance, TAXI_JOB.vehicle_model, TAXI_JOB.vehicle_spawn)
