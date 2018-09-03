# install kibana
sudo yum install kibana -y

# enable kibana service
sudo systemctl enable kibana

# start kibana service
sudo systemctl start kibana

# view log
sudo less /var/log/messages

# view kibana config
sudo less /etc/kibana/kibana.yml


