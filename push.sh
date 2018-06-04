#!/usr/bin/env bash
# 部署指定tag 的api程序
# __author__ = "wenxiaoning(wenxiaoning@gochinatv.com)"
# __copyright__ = "Copyright of GoChinaTV (2017)."

MSG=$*

push(){
    echo '******************************'
    echo '********开始push api：'
    echo '******************************'
    git pull
    git add . && git commit -m ${MSG} && git push
    echo '******************************'
    echo '********部署成功'
    echo '******************************'
}

main(){
    if [ ! ${MSG} ]
    then
        echo 'UAGE: ./winn_push.sh <string:commit msg>'
    else
        push
    fi
}

main
