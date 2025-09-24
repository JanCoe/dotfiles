#!/usr/bin/env bash
# nord_colors_grid_ordered.sh
# Display Nord colors in a foreground/background grid ordered by Nord number

# Ordered Nord palette
nord_colors=(
  "#2E3440"  # Nord0
  "#3B4252"  # Nord1
  "#434C5E"  # Nord2
  "#4C566A"  # Nord3
  "#D8DEE9"  # Nord4
  "#E5E9F0"  # Nord5
  "#ECEFF4"  # Nord6
  "#8FBCBB"  # Nord7
  "#88C0D0"  # Nord8
  "#81A1C1"  # Nord9
  "#5E81AC"  # Nord10
  "#BF616A"  # Nord11
  "#D08770"  # Nord12
  "#EBCB8B"  # Nord13
  "#A3BE8C"  # Nord14
  "#B48EAD"  # Nord15
)

nord_names=(
  "Nord0" "Nord1" "Nord2" "Nord3" "Nord4" "Nord5" "Nord6" "Nord7"
  "Nord8" "Nord9" "Nord10" "Nord11" "Nord12" "Nord13" "Nord14" "Nord15"
)

# Convert hex to RGB for ANSI escape codes
hex_to_rgb() {
  local hex=${1#"#"}
  echo "$((16#${hex:0:2}));$((16#${hex:2:2}));$((16#${hex:4:2}))"
}

# Print ordered grid
for fg_index in "${!nord_colors[@]}"; do
  fg_rgb=$(hex_to_rgb "${nord_colors[$fg_index]}")
  fg_name=${nord_names[$fg_index]}
  for bg_index in "${!nord_colors[@]}"; do
    bg_rgb=$(hex_to_rgb "${nord_colors[$bg_index]}")
    # Print a block with FG text over BG color
    printf "\e[38;2;%sm\e[48;2;%sm %-8s\e[0m " "$fg_rgb" "$bg_rgb" "$fg_name"
  done
  echo
done
