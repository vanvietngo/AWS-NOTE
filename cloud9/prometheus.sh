# Download, 
# install and run Prometheus. 
# On AWS Cloud9 you would install the latest release that has *.
# linux-amd64.tar.gz in the name. 
# This would like something like wget <some release>.linux-amd64.tar.gz.
wget https://github.com/prometheus/prometheus/releases/download/v2.45.0/prometheus-2.45.0.linux-amd64.tar.gz
tar xvfz prometheus-*.tar.gz
cd prometheus-*
    ```
    
    
    * Configure Prometheus by creating a `prometheus.yml` file
    
    ```yaml
global:
  scrape_interval:     15s
  evaluation_interval: 15s

rule_files:
  # - "first.rules"
  # - "second.rules"

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ['localhost:9090']


# Start Prometheus
# Wait about 30 seconds for Prometheus to collect data.

./prometheus --config.file=prometheus.yml      


# Go to http://localhost:9090/graph. 
# Choose the "console" within the graph. 
# One metric that Prometheus collects is how many times http://localhost:9090/metrics has been called. 
# If you refresh a few times then type the following in the expression console you can see a time series result.

promhttp_metric_handler_requests_total