#!/bin/bash

cd api_sdk
echo "+++++API SDK pub clean+++++"
flutter clean
echo "+++++API SDK done+++++"


cd ../shared
echo "+++++Shared pub clean+++++"
flutter clean
echo "+++++Shared done+++++"

cd ../app
echo "+++++Main app pub clean+++++"
flutter clean
echo "+++++Cleaning done+++++"