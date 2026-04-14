#!/bin/bash/

# set your enviroment
MAP_PATH="/"
VEHICLE_MODEL="sample_vehicle"
SENSOR_MODEL="sample_sensor_kit"

cleanup() {
    kill 0
}
trap cleanup SIGINT SIGTERM
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATE=$(date +"%Y_%m_%d-%H_%M_%S")
source "$SCRIPT_DIR/install/setup.bash"
ros2 bag record -a -o "$SCRIPT_DIR/rosbag/rosbag2_${DATE}" &
ros2 launch autoware_launch planning_simulator.launch.xml map_path:=$MAP_PATH  vehicle_model:=$VEHICLE_MODEL sensor_model:=$SENSOR_MODEL &
wait