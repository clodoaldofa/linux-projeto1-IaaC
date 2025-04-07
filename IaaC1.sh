#!/bin/bash

echo "Criando os diretórios ou pastas..."
mkdir /Empresa
mkdir /Empresa/Publica
mkdir /Empresa/Administrativo
mkdir /Empresa/Vendas
mkdir /Empresa/Secretaria
echo "Diretórios ou pastas Criadas!"

echo "Criando Grupos de Usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "Grupos de Usuários Criados!"

echo "Criando Usuários..."
senha_criptografada=$(openssl passwd -6 Mudar$123$)
useradd carlos -m -p "$senha_criptografada" -s /bin/bash  -c "Carlos da Silva" -G GRP_ADM
useradd maria -m -p "$senha_criptografada" -s /bin/bash -c "Maria de Souza" -G GRP_ADM
useradd joao -m -p "$senha_criptografada" -s /bin/bash -c "João Assis" -G GRP_ADM

useradd debora -m -p "$senha_criptografada" -s /bin/bash -c "Debora Souza" -G GRP_VEN
useradd sebastiao -p "$senha_criptografada" -m -s /bin/bash -c "Sebastião Santos" -G GRP_VEN
useradd roberto -m -p "$senha_criptografada" -s /bin/bash -c "Roberto Carlos Junior" -G GRP_VEN

useradd josefina -m -p "$senha_criptografada" -s /bin/bash -c "Josefina Pinto" -G GRP_SEC
useradd amanda -m -p "$senha_criptografada" -s /bin/bash -c "Amanda Pedroso" -G GRP_SEC
useradd rogerio -m -p "$senha_criptografada" -s /bin/bash -c "Rogerio Silva" -G GRP_SEC
echo "Usuários Criados!"

echo "Atribuindo as permissões aos diretórios..."
chown root:GRP_ADM /Empresa/Administrativo
chown root:GRP_VEN /Empresa/Vendas
chown root:GRP_SEC /Empresa/Secretaria

chmod 770 /Empresa/Administrativo
chmod 770 /Empresa/Vendas
chmod 770 /Empresa/Secretaria
chmod 777 /Empresa/Publica
echo "Permissões aos diretórios Atribuídas!"

echo "Fim do Script!"
