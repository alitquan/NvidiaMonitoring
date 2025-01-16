# Overview 
To harvest metrics from Nvidia Shield, I:
- leveraged developer settings on the Nvidia Shield to expose adb
- created a shell script to faciliate adb set up (you need to know the IP address and Port Number) 
- created a python script to run on from localhost to collect metrics from the Nvidia shield
- created a docker-compose file and prometheus config file to set up my Prometheus-Grafana monitoring stack

## Instructions:
These will be automated over time when applicable. 
1. Activate developer settings on your Android Device.
2. Enable ADB exposure. Note the IP address and Port. 
3. Use config/manual.sh and bind to Nvidia Shield. 
4. Nvidia Shield will be prompted to remember remote footprint. Hit Accept. 
5. On the localhost:
    - python -m venv myenv
    - source myenv/bin/activate 
    - pip install prometheus_client
    - python app/GetMetrics.py 
6. docker-compose up -d
7. localhost:9823 and localhost:8000 to see if they are working 
8. localhost:9822 (u:admin, p:admin)
9. Use http://localhost:9090 for the URL in Grafana 
10. Set up visualizations 
