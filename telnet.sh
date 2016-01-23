#!/usr/bin/env expect

# -----------------------------------------------------------------------------
# if it all goes pear shaped the script will timeout after 20 seconds.
set timeout 20
# first argument is assigned to the variable name
set name [lindex $argv 0]
# second argument is assigned to the variable user
set user [lindex $argv 1]
# third argument is assigned to the variable password
set password [lindex $argv 2]
# fourth argument is file with commands to execute
set file_commands [lindex $argv 3]

# -----------------------------------------------------------------------------
# load commands from commands-file
set f [open "$file_commands"]
set commands [split [read $f] "\n"]
close $f

# -----------------------------------------------------------------------------
# this spawns the telnet program and connects it to the variable name
spawn telnet $name 
# the script expects login
expect "login:" 
# the script sends the user variable
send "$user\r"
# the script expects Password
expect "password:"
# the script sends the password variable
send "$password\r"
# wait for the prompt
expect ".*>"

# -----------------------------------------------------------------------------
# iterate over the commands
foreach cmd $commands {
	send "$cmd\r"
	expect ".*>"
}

# -----------------------------------------------------------------------------
# close the connection
send "exit\r"
close

# -----------------------------------------------------------------------------
# instead of closing the connection, it would also be possible to hand the
# control over to the user by calling the following command:
#interact
