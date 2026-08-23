#!/bin/bash

# argcheck
if [ "$#" -ne 4 ]; then
    echo "Erro: Faltam argumentos."
    echo "Uso: $0 <chave_privada> <url_ssh_do_repositorio> <nome_do_autor> <email_do_autor>"
    echo "Exemplo: $0 ~/.ssh/id_ed25519_[maquina]_[user]_[repo] [reposshurl].git ninrod seu@email.com"
    exit 1
fi

CHAVE_PRIVADA=$(realpath "$1")
REPO_URL="$2"
AUTOR="$3"
EMAIL="$4"

# Extrai o nome da pasta destino a partir da URL do reposit¢rio
NOME_PASTA=$(basename "$REPO_URL" .git)

echo "Clonando $REPO_URL usando a chave $CHAVE_PRIVADA..."

# Executa o git clone
GIT_SSH_COMMAND="ssh -i $CHAVE_PRIVADA -o IdentitiesOnly=yes" git clone "$REPO_URL"

# Verifica se a pasta foi criada com sucesso pelo git clone
if [ -d "$NOME_PASTA" ]; then
    echo "Entrando no dir $NOME_PASTA e aplicando as configs sacanas..."
    cd "$NOME_PASTA" || exit

    # override local configs
    git config user.name "$AUTOR"
    git config user.email "$EMAIL"
    git config core.sshCommand "ssh -i $CHAVE_PRIVADA -o IdentitiesOnly=yes"

    echo "yay! O repo is ready."
    echo "Autor local: $(git config user.name) <$(git config user.email)>"
    echo "Chave local: $(git config core.sshCommand)"
else
    echo "Erro: O dir $NOME_PASTA nao foi encontrado. A clonagem falhou?"
    exit 1
fi
