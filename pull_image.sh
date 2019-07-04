#!/bin/sh



origin_imgs=(
"k8s.gcr.io/cluster-proportional-autoscaler-amd64:1.6.0"
"gcr.io/google-containers/coredns:1.3.1"
"gcr.io/google-containers/kube-apiserver:v1.15.0"
"gcr.io/google-containers/kube-controller-manager:v1.15.0"
"gcr.io/google-containers/kube-proxy:v1.15.0"
"gcr.io/google-containers/kube-scheduler:v1.15.0"
"gcr.io/google-containers/pause:3.1"
"gcr.io/google_containers/pause-amd64:3.1"
)
imgs=(
"cluster-proportional-autoscaler-amd64:1.6.0"
"coredns:1.3.1"
"kube-apiserver:v1.15.0"
"kube-controller-manager:v1.15.0"
"kube-proxy:v1.15.0"
"kube-scheduler:v1.15.0"
"pause:3.1"
"pause-amd64:3.1"
)




for key in $(echo ${!imgs[*]})
do
    img=${imgs[$key]}
    origin_img=${origin_imgs[$key]}
    echo "docker pull   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img"
    docker pull   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img


    echo "docker tag   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img  $origin_img"
    docker tag   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img  $origin_img

    echo "docker rmi  -f  registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img"
    docker rmi  -f  registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img
done
