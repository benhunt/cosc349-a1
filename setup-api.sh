#!/bin/bash

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

mkdir -p /home/vagrant/api
cd /home/vagrant/api

cat <<EOF > index.js
const express = require('express');
const app = express();
const port = 5000;

app.use(express.urlencoded({ extended: true }));

app.post('/submit', (req, res) => {
  console.log('Form data received:', req.body);
  res.send('Data received!');
});

app.listen(port, () => {
  console.log("API server listening on port " + port);
});
EOF

npm init -y
npm install express

sudo tee /etc/systemd/system/api-server.service > /dev/null <<EOF
[Unit]
Description=API Server
After=network.target

[Service]
ExecStart=/usr/bin/node /home/vagrant/api/index.js
Restart=always
User=vagrant
Environment=PORT=5000
WorkingDirectory=/home/vagrant/api

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable api-server
sudo systemctl start api-server
