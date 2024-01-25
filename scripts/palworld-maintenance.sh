#!/bin/bash

/usr/games/steamcmd +login anonymous +app_update 2394010 validate +quit && sudo tar -czvf /home/admin/Palworld_backups/"Palworld_$(date '+%Y-%m-%d_%H-%M-%S').tar.gz" /home/admin/.steam/Steam/steamapps/common/PalServer/Pal/Saved && sudo find /home/admin/Palworld_backups/ -mtime +10 -type f -delete
