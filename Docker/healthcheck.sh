#!/bin/bash
# by liuruijin
# 2023-06-27 12:55:42
################################
systemctl status pdns | grep running | grep active 2>&1 >/dev/null
if [ $? -eq 0 ];then
        exit 0
else
        exit 1
fi
