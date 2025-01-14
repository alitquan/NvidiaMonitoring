from prometheus_client import start_http_server, Gauge
import subprocess
import time 

user_usage = Gauge('nvidia_user_usage', 'User Space CPU Usage') 
sys_usage = Gauge('nvidia_sys_usage', 'System Space CPU Usage')

def top_parser(): 
    try:
        # get the top 4 lines of 1 iteration of top
        # this will return overall system metrics 
        top_header = subprocess.check_output(['adb', 'shell', 'top -bn1 | head -n 4'], universal_newlines=True)

        print (top_header) 
        return top_header
    except Exception as e:
        print(f"top_parser error: {e}")
        return 0.0


if __name__ == '__main__':
    # start Prometheus HTTP server on port 8000
    # start_http_server(8000)

    while True:
        top_parser()
        time.sleep(5)
