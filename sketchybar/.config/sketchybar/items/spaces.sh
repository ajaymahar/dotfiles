#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon=$sid                                  \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=20                     \
                              label.y_offset=-1                          \
                              icon.padding_left=10 \
                              icon.padding_right=10 \
                              padding_left=2\
                              padding_right=2\
                              label.padding_right=20\
                              icon.highlight_color=$RED\
                              label.color=$GREY\
                              label.highlight_color=$WHITE\
                              background.color=$BACKGROUND_1 \
                              background.border_color=$BACKGROUND_2 \
                              script="$PLUGIN_DIR/space.sh"              
done

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                                \
                                 icon.color=$GREEN \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change                           
