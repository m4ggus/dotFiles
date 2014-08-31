#!/usr/bin/env bash

URL='http://www.accuweather.com/en/de/luneburg/21335/weather-forecast/174018'

wget -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $2": "$16", "$12"°" }'| head -1
