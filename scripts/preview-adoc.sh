#!/bin/bash
# First parameter is the name of the file (without extension).

# Convert to html
asciidoctor $1.adoc
# Render html
xdg-open $1.html
