#!/bin/bash

# Run kew from the toolbox container called 'music'
toolbox run -c music kew
#toolbox run -c music env \
#  XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
#  DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
#  kew
