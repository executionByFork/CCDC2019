# Ubuntu

#### Close `netcat` backdoor
- `sudo netstat -lpt | less` to see all tcp listening ports
  - `netcat` should be listening on port `54`, process ID was `996`
- `sudo kill -9 996` to kill the netcat listener

#### Credit Card Data readable to the world
- `ls -l` in home folder to show cc_data.txt permissions
- `sudo chmod o-r cc_data.txt` to remove read permissions for other accounts
