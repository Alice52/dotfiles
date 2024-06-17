#!/bin/sh

pgrep -f 'cloudflared access' | xargs -r kill
