#!/bin/sh

converted_images_path=$1
echo 'begin'
function pull_image() {
    img_mapping=$1
    arr=(${img_mapping/\-\-\>/ })
    origin_img=${arr[0]}
    img=${arr[1]}

    echo "docker pull   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img"
    docker pull   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img
    echo "docker tag   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img  $origin_img"
    docker tag   registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img  $origin_img
    echo "docker rmi  -f  registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img"
    docker rmi  -f  registry.cn-beijing.aliyuncs.com/gcr_io_cn/$img
}

if  [ -n converted_images_path ] ; then
    converted_images_path='./converted_images.txt'
fi
echo $converted_images_path

for line in `cat $converted_images_path`
do
     pull_image $line
done
echo 'end'
