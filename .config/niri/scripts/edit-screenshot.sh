#!/bin/bash

声明一个变量， 根据wl-paste 输出的当前剪贴板的数据计算出的哈希值
CLIPNOW=$(wl-paste | sha1sum)

# niri 截图
niri msg action screenshot

# 循环，不断打印当前剪贴板数据计算哈希值，和之前声明的变量，进行比对

while [ "$(wl-paste | sha1sum)" = "$CLIPNOW" ]; do
  sleep .05
done

# 将新的剪贴板内容的数据传给satty打开
wl-paste | satty -f -

