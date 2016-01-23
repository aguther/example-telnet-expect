# telnet-expect-example

Usage:
telnet.sh <Host> <User> <Password> <Command-File>

Details:
<Host>		= Hostname or IP-Address
<User>		= Username for connection
<Password>	= Password for connection
<Command-File>	= File to read commands to execute from

Steps to use this example:
- Install packets 'telnet' and 'expect' by invoking 'sudo yum install -y telnet expect' on RHEL/CentOS
- Enter the commands you wish to use line by line into the file 'commands.txt'
- Call the file 'telnet.sh' with the arguments needed
