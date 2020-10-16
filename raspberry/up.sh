docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  -v /:/host \
  --restart always \
  -e EDGE=1 \
  -e EDGE_ID= \
  -e EDGE_KEY= \
  -e CAP_HOST_MANAGEMENT=1 \
  -v portainer_agent_data:/data \
  --name portainer_agent \
  portainer/agent

&&


docker run -d -v

docker run -d -v /:/host:ro,rslave \
  -v ./web-config.yml=/web-config.yml \
  -pid=host \
  --restart=unless-stopped \
  --name node_exporter \
  -p 9100:9100 \
  prom/node-exporter 
  
  
  docker run -d -v /:/rootfs:ro \
    -v /var/run:/var/run:ro
    -v /sys:/sys:ro
    -v /var/lib/docker/:/var/lib/docker:ro
    -p 8080:8080
    google/cadvisor
    --docker_only=true
    --disable_metrics=disk,percpu,sched,process
    
    cadvisor:
        image: google/cadvisor
        container_name: cadvisor
        restart: unless-stopped
        command:
            - --docker_only=true
            - --disable_metrics=disk,percpu,sched,process
        volumes:
            - /:/rootfs:ro
            - /var/run:/var/run:ro
            - /sys:/sys:ro
            - /var/lib/docker/:/var/lib/docker:ro
        networks:
            - cadvisor
        expose:
            - 8080
