#!/bin/bash

# set -ex

if [ $# -lt 1 ]
then
        echo "Usage : $0 [gnb|srscu|srsdu]"
        exit
fi

ip_check="^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$"

if [[ ! -z "$AMF_HOST" ]] ; then 
    if [[ ${AMF_HOST} =~ ${ip_check} ]] ; then
        export AMF_ADDR=${AMF_HOST} ## is a IP format
    else
        export AMF_ADDR="$(host -4 $AMF_HOST | awk '/has.*address/{print $NF; exit}')" ## is a hostname format -> convert to ipv4
    fi
fi

if [[ -z "$AMF_BIND_ADDR" ]] ; then
    export AMF_BIND_ADDR="$(ifconfig $AMF_BIND_INTERFACE | grep -Po 'inet \K[\d.]+')"
fi


if [[ ! -z "$RIC_HOST" ]] ; then
    if [[ ${RIC_HOST} =~ ${ip_check} ]] ; then
        export RIC_ADDR=${RIC_HOST} ## is a IP format
    else
        export RIC_ADDR="$(host -4 $RIC_HOST | awk '/has.*address/{print $NF; exit}')" ## is a hostname format -> convert to ipv4
    fi
fi

if [[ -z "$RIC_BIND_ADDR" ]] ; then
    export RIC_BIND_ADDR="$(ifconfig $RIC_BIND_INTERFACE | grep -Po 'inet \K[\d.]+')"
fi

envsubst < /etc/config/gnb-template.yml > /etc/config/gnb.yml

stdbuf -o0 gnb -c /etc/config/gnb.yml