# untiymetrics


# The project has developed for unity collector 


docker run -d \
-e UNITYUSR=admin \
-e UNITYPASS="P@ssw0rd" \
-e UNITYADDR=10.4.160.201 \
-e INFLUX_TOKEN="NutLL4DIcTXp_ckwzJDlJs2YpDR8ZlVw_c9WLkZnCKX8799tEYWH8HSt0zCeuymcjUS7ZlLVbwHVOdVjpy0T-g==" \
--name unitymetrics unitymetrics-telegraf:v4
