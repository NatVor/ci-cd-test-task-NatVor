# Node Exporter
sudo apt-get install prometheus-node-exporter
sudo systemctl start prometheus-node-exporter
sudo systemctl enable prometheus-node-exporter

# cAdvisor
docker run -d \
  --name=cadvisor \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=5001:8080 \
  google/cadvisor:latest

 

