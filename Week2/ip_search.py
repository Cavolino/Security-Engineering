import requests as r
import time

server_url = "http://hosting-provider.org.localhost:8080/servers"
hj_url = "http://mail.bank.ouspg.org.localhost:8080"

ip_created = ""
while(ip_created == ""):
    response = r.post(server_url)
    if response.status_code == 201:
        ip_created = response.headers.get('Server-Ip')
        print("Created: " + ip_created)
        time.sleep(4)
        response_hj = r.get(hj_url)
        content_type = response_hj.headers.get('content-type', '').lower()
        if 'application/json' in content_type:
            print("IP FOUND: ", ip_created)
        else:
            r.delete(server_url + "?ip=" + ip_created)        
            print("Delete: " + ip_created)
            ip_created = ""    