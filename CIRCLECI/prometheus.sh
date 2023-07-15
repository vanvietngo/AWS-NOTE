# scrape_configs:
#   - job_name: 'prometheus'
#     static_configs:
#       - targets: ['ec2-54-84-153-57.compute-1.amazonaws.com:9100’]

# run prometheus: 
    prometheus --config.file=prometheus.yml
    prometheus --config.file=/etc/prometheus/prometheus.yml

        alertmanager --config.file=alertmanager.yml
    ./alertmanager --config.file=alertmanager.yml

    #  restart
    sudo systemctl restart prometheus
    sudo systemctl status  prometheus
        sudo systemctl status  alertmanager

#  Run Node-exporter

wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar xzf node_exporter-1.0.1.linux-amd64.tar.gz
sudo cp node_exporter-1.0.1.linux-amd64/node_exporter /usr/local/bin/node_exporter
rm -rf node_exporter-1.0.1.linux-amd64.tar.gz node_exporter-1.0.1.linux-amd64

sudo cp node_exporter /usr/local/bin/node_exporter
rm -rf node_exporter-1.3.1.linux-amd64.tar.gz node_exporter-1.3.1.linux-amd64



[Unit]
Description=Prometheus Node Exporter Service
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload
sudo systemctl enable node-exporter
sudo systemctl start node-exporter
sudo systemctl status node-exporter

# curl -X POST http://localhost:9090/-/reload

# ./prometheus --version
# cat prometheus.yml



# ========= Ansible
# Youtube: 
    https://www.youtube.com/watch?v=MNGfPn0Yvs8 
# promethues :
    https://ourcodeworld.com/articles/read/1686/how-to-install-prometheus-node-exporter-on-ubuntu-2004 
    https://codewizardly.com/prometheus-on-aws-ec2-part1/ 

# Tool Name	Description
# Grafana	Recommended for Prometheus
# Kibana	Recommended for Elastic Stack
# DataDog	Built in to DataDog cloud-based service
# Expression Browser	Built in to Prometheus, okay for experiments

#  ###################### ############# ############ ############

# configure Prometheus to scrape metrics from Amazon EC2 instances
scrape_configs:
  - job_name: 'node-exporter-ec2-2'
    ec2_sd_configs:
      - region: us-east-1
        access_key: AKIA4XHQDAA2BL3ZLJDF   
        secret_key: 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   
        port: 9100   
        filters:
          - name: tag:prometheus-exporter
            values:
              - true

# rule alert
 - alert: Using tool much memory
        expr: node_memory_MemFree_bytes < 10000000
        for: 1m
        labels:
            severity: critical
        annotations:
            title: `Instance {{$labels.instance}} is almost out of memory`
            description: `{{$labels.instance}} of job {{$labels.job}} has been down`
