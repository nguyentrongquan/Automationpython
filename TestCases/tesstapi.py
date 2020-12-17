import requests

response= requests.get('https://queue-staging.citigo.dev:40001/job/current_job')
response.status_code
response.content