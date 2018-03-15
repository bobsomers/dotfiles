#!/usr/bin/bash
printf "%'.2f" $(curl -sf https://api.gdax.com/products/BTC-USD/ticker | jq -r ".price")
