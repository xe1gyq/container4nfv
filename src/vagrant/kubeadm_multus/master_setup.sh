#!/bin/bash

set -ex

sudo kubeadm init --apiserver-advertise-address=192.168.1.10 --service-cidr=10.96.0.0/16 --pod-network-cidr=10.32.0.0/12 --token 8c5adc.1cec8dbf339093f0

mkdir ~/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f http://git.io/weave-kube-1.6
kubectl apply -f /src/cni/multus/kube_cni_multus.yml
