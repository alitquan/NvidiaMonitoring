from prometheus_client import start_http_server, Gauge
import subprocess
import time 
import re

user_usage = Gauge('nvidia_user_usage', 'User Space CPU Usage') 
sys_usage = Gauge('nvidia_sys_usage', 'System Space CPU Usage')


# get overall system metrics 
def get_top_header(): 
    try:
        # get the top 4 lines of 1 iteration of top
        # this will return overall system metrics 
        top_header = subprocess.check_output(['adb', 'shell', 'top -bn1 | head -n 4'], universal_newlines=True)

        print (top_header) 
        return top_header
    except Exception as e:
        print(f"get_top_header error: {e}")
        return 0.0

def parse_top_header(): 
    top_header = get_top_header()

    # using regular expressions to extract percentages
    usr_use= re.search(r'(\d+)%user',top_header) 
    sys_use= re.search(r'(\d+)%sys', top_header)
    idle_percentage = re.search(r'(\d+)%idle', top_header) 

    # proof of concept 
    print(top_header)
    print("System Percentage: ", str(sys_use.group(1))) 
    print("User Percentage: ", str(usr_use.group(1))) 
    print("Idle Percentage: ", str(idle_percentage.group(1)))





if __name__ == '__main__':
    # start Prometheus HTTP server on port 8000
    # start_http_server(8000)

    while True:
        # get_top_header()
        parse_top_header() 
        time.sleep(5)
