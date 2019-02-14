# Ubuntu

#### Close `netcat` backdoor
- `sudo netstat -lpt | less` to see all tcp listening ports
  - `netcat` should be listening on port `54`, process ID was `996`
- `sudo kill -9 996` to kill the netcat listener

#### Binary privilege escalation
- `ls -l /bin/dash` shows that `dash` has setuid bit set
- `sudo chmod u-s /bin/dash` to remove setuid
- `ls -l /usr/bin/mtr` shows `mtr` has setuid set, I dont think it ships like this
- `sudo chmod u-s /usr/bin/mtr`
- `ls -l /usr/lib/pt_chown` shows setuid
  - Exploit listed [here](https://packetstormsecurity.com/files/141910/Ubuntu-PT-Chown-Privilege-Escalation.html)
- `sudo chmod u-s /usr/lib/pt_chown`

#### Credit Card Data readable to the world
- `ls -l` in home folder to show cc_data.txt permissions
- `sudo chmod o-r cc_data.txt` to remove read permissions for other accounts
