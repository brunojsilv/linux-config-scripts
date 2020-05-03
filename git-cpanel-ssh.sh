#!/bin/bash

echo -e "\n- Gerador de chaves para repositórios privados BitBucket -\n"

echo "Informe o nome do host deste computador"
read host

ssh-keygen -q -t rsa -b 4096 -C "$USER@$host" -f ~/.ssh/id_rsa -N ''

echo -e "\nCopie a chave abaixo e instale no seu reposítorio privado:\n"

cat ~/.ssh/id_rsa.pub

echo -e "\nApós a instalação da chave pressione ENTER para continuar"
read

repoaux=$(ssh -To "StrictHostKeyChecking = no" git@bitbucket.org | grep $host)

git clone git@bitbucket.org:$repoaux

rm -rf $host