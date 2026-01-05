status is-interactive || exit

# 130 is when the command is stopped with ctrl-c
set sponge_successful_exit_codes 0 130

set sponge_allow_previously_successful false

# default is 2
set sponge_delay 10

# to disable delay
# set sponge_purge_only_on_exit true
