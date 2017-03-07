#!/bin/bash
set -e

testAlias+=(
	[polinux/openvpn]='openvpn'
)

imageTests+=(
	[openvpn]='
		paranoid
        conf_options
        basic
        dual-proto
        otp
	'
)
