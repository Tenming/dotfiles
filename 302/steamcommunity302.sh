#! /usr/bin/bash
cd ~/302
echo 123 | sudo -S ./caddy run --config steamcommunity_302.caddy.json --adapter caddyfile
