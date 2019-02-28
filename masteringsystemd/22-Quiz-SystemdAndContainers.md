Question 1 of 6
Single-answer
Which command is used as a simple systemd container manager?

A: systemctl container
* B: systemd-nspawn
C: systemd-container
D: systemctl nspawn


Question 2 of 6
Single-answer
Which command can be used to boot a systemd container without private networking?

* A: systemd-nspawn -b -M container name
B: systemd-nspawn --no-net -M container name
C: systemctl-nspawn -b -M container name
D: .systemctl-nspawn --no-priv-net -M container name


Question 3 of 6
Single-answer
How does one log in to a systemd container?

A: systemd login container
B: machinectl init container
* C: machinectl login container
D: machinectl-login


Question 4 of 6
Single-answer
What command is used to list all running nspawn containers?

* A: machinectl list
B: nspawn list
C: systemctl containers list
D: mahinectl show


Question 5 of 6
Single-answer
Which command is used to remove a systemd container from a host?

A: machinectl delete
B: systemd-nspawn remove
* C: machinectl remove
D: machinectl poweroff


Question 6 of 6
Multi-answer: Select 2
What command(s) can be used to start a systemd container? (Choose all that apply)

A: systemd start systemd-nspawn@.service
* B: systemctl start systemd-nspawn@.service
C: machined start
* D: machinectl start