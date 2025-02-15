#!/bin/sh

front_app=(
  label.font="$FONT:Black:12.0"
  icon.background.drawing=on
  display=active
  script="$PLUGIN_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
)
sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
# #!/bin/bash
#
# sketchybar --add item front_app left \
#            --set front_app       background.color=$ACCENT_COLOR \
#                                  icon.color=$BAR_COLOR \
#                                  label.padding_right=20                     \
#                                  label.y_offset=-1                          \
#                                  icon.padding_left=10 \
#                                  icon.padding_right=10 \
#                                  padding_left=2\
#                                  padding_right=2\
#                                  icon.font="sketchybar-app-font:Regular:16.0" \
#                                  label.color=$BAR_COLOR \
#                                  script="$PLUGIN_DIR/front_app.sh"            \
#            --subscribe front_app front_app_switched
