# set session helix
# set tab Helix
# set window_name zellix
# # Get the existing window of our session
# set window (i3-msg -t get_tree | jq 'recurse(.nodes[]) | select(.window != null and .window_properties.title == "$window_name")')

# function new_term_session -d "Creates a new terminal instance running zellij"
#     xfce4-terminal -T "$window_name" -x zellij -s "$session"
# end

# function get_helix_info -d "Checks if a zellij session is running helix"
#     echo (for p in (pgrep -x helix); pstree -s $p | grep zellij; end)
# end

# if test -z "$argv[1]"
#     echo "No file provided"
#     exit 1
# end

# # Move into our target directory
# if not test -z "$argv[2]"
#     echo "Switching to $argv[2]"
#     cd "$argv[2]"
#     # zellij -s "$session" run -- cd "$argv[2]"
# end


# # Open Zellij in a new terminal session
# if test -z (zellij ls | grep "$session")
#     echo "Starting session $session"
#     new_term_session
# else if not test -z (zellij ls | grep "$session" | grep "DEAD")
#     echo "Attaching to existing (dead) session"
#     new_term_session
# else if not test -z (zellij ls | grep "$session" | grep "EXITED")
#     echo "Killing and starting new session"
#     zellij d "$session"
#     sleep 0.5
#     new_term_session
# else if test -z "$window"
#     echo "Attaching to existing (windowless) session"
#     new_term_session
# else
#     echo "Session exists, opening file $argv[1]"
# end

# # Go to the helix tab, creating it if needed.
# zellij -s "$session" action go-to-tab-name "$tab" --create
# sleep 0.5

# # Open helix if not already running
# if test -z (for p in (pgrep -x helix); pstree -s $p | grep zellij; end)
#     echo "Opening helix"
#     zellij -s "$session" action write-chars "helix $argv[1]" # Do this instead of 'zellij run' so we stay in the helix pane
#     zellij -s "$session" action write 13 # ENTER
# else # Otherwise open the file
    # echo "Using existing helix"
    # zellij -s "$session" action write 27 # ESC
    # zellij -s "$session" action write-chars ":open $argv[1]"
    # zellij -s "$session" action write 13 # ENTER
# end

zellij action write 27 # ESC
zellij action write-chars ":open $1"
zellij action write 13 # ENTER
zellij action write-chars "$2gg"
