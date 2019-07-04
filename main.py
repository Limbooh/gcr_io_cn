#!/usr/bin/python
# -*- coding:utf-8 -*-


import json
import os
import re

def getDockerfileConotent(image):

    return "FROM {image}\nMAINTAINER Limbooh <limbooh@sina.com>".format(image=image);

def load():


    config_path = os.path.join(os.getcwd(),"require_images.json")
    fp = open(config_path, 'r')
    require_images = json.load(fp=fp)

    converted_images_path  = os.path.join(os.getcwd(),"converted_images.txt")
    fp2 = open(converted_images_path, 'w+')
    for e in require_images:
        obj = e['value']

        if 'repo' in obj and ( 'gcr'in obj['repo'] or 'quay'in obj['repo']  ) :
            repo = obj['repo']
            tag = obj['tag']
            image = repo+":"+str(tag)

            new_image_name_parts = re.split(r'[\/]+', image)
            new_image = new_image_name_parts[-1]
            print(image,'-->',new_image)
            maping = "%s-->%s\n"%(image,new_image)
            dir_name = re.split(r'[:]+', new_image)[0]
            print("dir_name",dir_name)
            dir_path =  os.path.join(os.getcwd(),dir_name)
            if not os.path.exists(dir_path):
                os.makedirs(dir_path)
                dockerfile_path = os.path.join(dir_path,"Dockerfile")
                with open(dockerfile_path, 'w') as f3:
                    f3.write(getDockerfileConotent(image))

            fp2.write(maping)

    fp2.close()

    print(require_images)



    pass

if __name__ == '__main__':

    load()