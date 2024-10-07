
# Setup

```bash
sudo nano /etc/systemd/system/ob.service
```

  ```bash
[Unit]
Description=OpenBench service
Wants=network.target
After=network.target
StartLimitIntervalSec=0

[Service]
Type=exec
Restart=always
RestartSec=10
User=azureuser
WorkingDirectory=/home/azureuser
ExecStart=/home/azureuser/connect.sh

[Install]
WantedBy=multi-user.target
  ```

```bash
sudo systemctl start ob
sudo systemctl enable ob
```


# Checks

Checks:
```
systemctl status ob.service
journalctl -xeu ob.service -f
```

# Manually using screen
```bash
screen -S ob
./connect.sh
ctrl + a + d

screen -r
```