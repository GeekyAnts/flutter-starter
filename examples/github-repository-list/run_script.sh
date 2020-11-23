#!/bin/bash

cd api_sdk
echo "+++++API SDK pub clean+++++"
flutter clean
echo "+++++API SDK pub get+++++"
flutter pub get
echo "+++++API SDK done+++++"


cd ../shared
echo "+++++Shared pub clean+++++"
flutter clean
echo "+++++Shared pub get+++++"
flutter pub get
echo "+++++Shared done+++++"

cd ../app
echo "+++++Main app pub clean+++++"
flutter clean
echo "+++++Main app pub get+++++"
flutter pub get
echo "+++++Main app run+++++"
flutter run