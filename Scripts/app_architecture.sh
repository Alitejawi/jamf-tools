#!/bin/bash

lipo -archs /Applications/WhatsApp.app/Contents/MacOS/WhatsApp
# Result will look like
# x86_64
# or
# arm64
# or
# x86_64 arm64