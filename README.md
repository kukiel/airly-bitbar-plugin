BitBar plugin displaying air pollution based on airly CAQI value. 

Dot colors and level threshold are taken from airly docs.

How to run it: 

1. You need [airly api token](https://developer.airly.eu/login).
2. Replace `apikey` variable with token taken in step 1. Put lat/lng values accordingly to location you want to track.

```
apikey="airly_apikey"
lat=54.507419
lng=18.540195
```

3. Put airly.10m.sh file in your BitBar folder. 
4. Refresh BitBar.

From now on it will refresh bar every 10m. 

Optionally you can set refresh period by renaming the filename accordingly.