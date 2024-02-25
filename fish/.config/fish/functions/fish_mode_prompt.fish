# function fish_mode_prompt
#     if test "$fish_key_bindings" != fish_default_key_bindings
#         set --local vi_mode_color
#         set --local vi_mode_symbol
#         switch $fish_bind_mode
#             case default
#                 set vi_mode_color (set_color $fish_color_selection)
#                 set vi_mode_symbol "➜"
#             case insert
#                 set vi_mode_color (set_color $fish_color_selection)
#                 set vi_mode_symbol "➜"
#
#             case replace replace_one
#                 set vi_mode_color (set_color $fish_color_match)
#                 set vi_mode_symbol "➜"
#             case visual
#                 set vi_mode_color (set_color $fish_color_match)
#                 set vi_mode_symbol "➜"
#         end
#         # echo -e "$vi_mode_color $vi_mode_symbol \x1b[0m "
#         echo -e "$vi_mode_symbol \x1b[0m "
#     end
# end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  set -l show_untracked (git config --bool bash.showUntrackedFiles)
  set -l untracked
  if [ "$theme_display_git_untracked" = 'no' -o "$show_untracked" = 'false' ]
    set untracked '--untracked-files=no'
  end
  echo (command git status -s --ignore-submodules=dirty $untracked 2> /dev/null)
end

function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  switch $fish_bind_mode
     case default
        set mode "$blue "
     case insert
        set mode "$green "
     case replace replace_one
        set mode "$red "
     case visual
        set mode "$yellow "
  end
  if test $last_status = 0
      set arrow "$green  "
  else
      set arrow "$red  "
  end
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end
# echo -n -s $arrow ' ' $cwd $git_info $normal ' '
    echo -e "$arrow $cwd$git_info $hydro_color_normal$_hydro_color_duration$_hydro_cmd_duration$hydro_color_normal$_hydro_status$hydro_color_normal$mode"
end
