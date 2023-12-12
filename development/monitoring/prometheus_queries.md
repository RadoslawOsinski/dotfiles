Average client request duration by path
---
```text
sum by(uri) (rate(http_client_requests_active_seconds_duration_sum{application="ptbenergybackoffice"}[$__rate_interval]))
/
sum by(uri) (rate(http_client_requests_active_seconds_count{application="ptbenergybackoffice"}[$__rate_interval]))
```

Average server request duration by path
---
```text
sum by(uri) (rate(http_server_requests_seconds_sum{application="ptbenergybackoffice"}[$__interval]))
/
sum by(uri) (rate(http_server_requests_seconds_count{application="ptbenergybackoffice"}[$__rate_interval]))
```
