#!/bin/bash

lipo -archs /Applications/WhatsApp.app/Contents/MacOS/WhatsApp
# Result will look like
# x86_64
# or
# arm64
# or
# x86_64 arm64

file /Applications/WhatsApp.app/Contents/MacOS/WhatsApp
# Results will look like
# /Applications/Keka.app/Contents/MacOS/Keka: Mach-O universal binary with 2 architectures: [x86_64:Mach-O 64-bit executable x86_64] [arm64:Mach-O 64-bit executable arm64]
# /Applications/Keka.app/Contents/MacOS/Keka (for architecture x86_64):	Mach-O 64-bit executable x86_64
# /Applications/Keka.app/Contents/MacOS/Keka (for architecture arm64):	Mach-O 64-bit executable arm64