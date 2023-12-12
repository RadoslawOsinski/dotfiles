Average client request duration by path
---
```text
sum by(uri) (rate(http_client_requests_active_seconds_duration_sum{application="app"}[$__rate_interval]))
/
sum by(uri) (rate(http_client_requests_active_seconds_count{application="app"}[$__rate_interval]))
```

Average server request duration by path
---
```text
sum by(uri) (rate(http_server_requests_seconds_sum{application="app"}[$__interval]))
/
sum by(uri) (rate(http_server_requests_seconds_count{application="app"}[$__rate_interval]))
```

Task scheduled execution duration by task code
---
```text
sum by(code_function) (rate(tasks_scheduled_execution_seconds_sum{application="app"}[$__interval])) 
/
sum by(code_function) (rate(tasks_scheduled_execution_seconds_count{application="app"}[$__rate_interval]))
```
