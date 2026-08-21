#!/usr/bin/env bash

# Executa o Google Chrome com todos os argumentos passados ($@)
# >/dev/null 2>&1  -> Descarta stdout e stderr
# &                -> Executa em segundo plano
# disown           -> Remove o processo da tabela de jobs do shell
nohup google-chrome "$@" >/dev/null 2>&1 &
disown
