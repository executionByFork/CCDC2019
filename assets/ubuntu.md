# Ubuntu

#### Close `netcat` backdoor
- `sudo netstat -lpt | less` to see all tcp listening ports
  - `netcat` should be listening on port `54`, process ID was `996`
- `sudo kill -9 996` to kill the netcat listener

#### Binary privilege escalation
- **`dash`**
  - `ls -l /bin/dash` shows that `dash` has setuid bit set
  - `sudo chmod u-s /bin/dash` to remove setuid
- **`mtr`**
  - `ls -l /usr/bin/mtr` shows setuid
    - I dont think it ships like this
  - `sudo chmod u-s /usr/bin/mtr`
- **`pt_chown`**
  - `ls -l /usr/lib/pt_chown` shows setuid
    - Exploit listed [here](https://packetstormsecurity.com/files/141910/Ubuntu-PT-Chown-Privilege-Escalation.html)
  - `sudo chmod u-s /usr/lib/pt_chown`

#### Credit Card Data readable to the world
- EVERY user's home directory has a `cc_data.txt` file that anyone can read (?? wtf ??)
- `ls -l ~/cc_data.txt` to show file permissions
- `sudo find /home -name "*cc_data*" | xargs sudo chmod o-r`
  - finds every one of these files and removes read permissions for `other` accounts
