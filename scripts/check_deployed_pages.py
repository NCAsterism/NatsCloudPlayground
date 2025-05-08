import requests
import time

base_url = "https://ncasterism.github.io/NatsCloudPlayground"
paths_to_check = [
    "/", 
    "/index.html",
    "/about/",
    "/contact/",
    "/projects/landing_zone/",
    "/timeline/",
    "/sitemap.xml"
]

print(f"Checking paths at {base_url}:")
for path in paths_to_check:
    url = base_url + path
    try:
        response = requests.get(url)
        status = response.status_code
        print(f"{url} - Status: {status}")
        
        # If it's a 404, try to get some details
        if status == 404:
            print(f"  - Content length: {len(response.content)} bytes")
            print(f"  - Content type: {response.headers.get('Content-Type', 'unknown')}")
    except Exception as e:
        print(f"{url} - Error: {str(e)}")
    
    # Small delay to be nice to the server
    time.sleep(0.5)
