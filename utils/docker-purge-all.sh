#!/bin/bash

set -e
set +x

DOCKERCMD="docker"

function main () {
    set -x
    docker_purge_all
    set +x
}
function docker_purge_all () {
    _docker_purge_all
    _docker_purge_all
    _docker_purge_all
}
function _docker_purge_all () {
    docker_image_purge
    docker_remove_exited_containers
    docker_remove_all_images
    docker_stop_remove_all_containers
    docker_system_prune
    docker_volume_prune
}
function docker_image_purge () {
    _docker_image_purge
    _docker_image_purge
    _docker_image_purge
}
function _docker_image_purge () {
    $DOCKERCMD images purge
}
function docker_remove_exited_containers () {
    _docker_remove_exited_containers
    _docker_remove_exited_containers
    _docker_remove_exited_containers
}
function _docker_remove_exited_containers () {
    $DOCKERCMD rm $(docker ps _a _f status=exited _q) || echo "None found."
}
function docker_remove_all_images () {
    _docker_remove_all_images
    _docker_remove_all_images
    _docker_remove_all_images
}
function _docker_remove_all_images () {
    $DOCKERCMD rmi $(docker images _a _q) || echo "None found."
}
function docker_stop_remove_all_containers () {
    _docker_stop_remove_all_containers
    _docker_stop_remove_all_containers
    _docker_stop_remove_all_containers
}
function _docker_stop_remove_all_containers () {
    $DOCKERCMD stop $(docker ps _a _q) || echo "None found."
    $DOCKERCMD rm $(docker ps _a _q) || echo "None found."
}
function docker_system_prune () {
    _docker_system_prune
    _docker_system_prune
    _docker_system_prune
}
function _docker_system_prune () {
    $DOCKERCMD system prune --all --force
}
function docker_volume_prune () {
    _docker_volume_prune
    _docker_volume_prune
    _docker_volume_prune
}
function _docker_volume_prune () {
    $DOCKERCMD volume prune --force
}

echo "This will purge everything from Docker."
echo "Do you wish to continue?"

select yn in "Yes" "No"; do
    case $yn in
        Yes ) main; break;;
        No ) exit;;
    esac
done

echo "Script finished successfully."

