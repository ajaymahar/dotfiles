bind \cd 'exit'                                   # ctrl+d to exit from shell

bind -M insert \ce forward-char                   # ctrl+e to complete autosuggestion
bind -M insert \cb beginning-of-line              # go to starting of line with ctrl+b
bind -M insert \ce end-of-line                    # go to end of line with ctrl+e

# vim like copy and past
bind \cy fish_clipboard_copy
# bind Y fish_clipboard_copy
# bind P fish_clipboard_paste
