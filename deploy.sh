#!/usr/bin/env bash
# 部署指定tag 的api程序
# __author__ = "wenxiaoning(wenxiaoning@gochinatv.com)"
# __copyright__ = "Copyright of GoChinaTV (2017)."

TAG_NAME=$1

deploy_tag(){
    echo '******************************'
    echo '********开始部署tag：' ${TAG_NAME}
    echo '******************************'
    git fetch
    git checkout ${TAG_NAME}

    echo '******************************'
    echo '********部署成功'
    echo '******************************'
}

main(){
    if [ ! ${TAG_NAME} ]
    then
        echo 'UAGE: 需要传入想要部署的tag名称'
    else
        deploy_tag
    fi
}

main
