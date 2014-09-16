tmux ls
tmux new
tmux attach -t 0
^s $ : name the tmux session (e.g. ^s $, then type "work")
tmux attach -t work

^s ? : help (q to quit help)
^s c : create new window
^s , : rename window
^s l : jump to last window
^s 0 : jump to window 0

^s v : create vertical pane
^s s : create horizontal pane
Ctrl-d or exit: close pane
^s ; : move to last pane
^s (arrow key) : move to other pane
^s alt+(arrow key) : resize pane
^s z : zoom on pane

^s [ : change into scrollback mode (use arrow keys to move, Ctrl-C to exit)
^s [ ? (type a word) : search backwards

