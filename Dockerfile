FROM gcr.io/google-containers/kube-apiserver:v1.15.0
FROM gcr.io/google-containers/kube-apiserver:v1.15.0
FROM gcr.io/google-containers/kube-controller-manager:v1.15.0
FROM gcr.io/google-containers/kube-scheduler:v1.15.0
FROM gcr.io/google-containers/kube-proxy:v1.15.0
FROM gcr.io/google-containers/pause:3.1
FROM gcr.io/google-containers/coredns:1.3.1
MAINTAINER Limbooh <limbooh@sina.com>