# Contexto

Temos que corrigir um bug de paste a partir do clipboard, vindo do plugin de multicursors. o multicursors não respeita o conteúdo que está no clipboard vindo do windows. parece que não usa nossa redefinição de `p`, em que usamos o win32yank.



# reprodução

suponha que eu tenha o seguinte buffer e que o cursor está em [cursor]

----- buffer de teste ----

-> texto que quero copiar


snake-case-variable-1: "texto que quero copiar"
snake-case-variable-2: "texto que quero copiar"
snake-case-variable-3: "texto que quero copiar"
snake-case-variable-4: "texto que quero copiar"

----- fim do buffer de teste ------

depois de `yg_3jgmip$P<ESc>`, temos: 

----- buffer de teste ----

-> texto que quero copiar


snake-case-variable-1: "texto que quero copiar"
snake-case-variable-2: "texto que quero copiar"
snake-case-variable-3: "texto que quero copiar"
snake-case-variable-4: "texto que quero copiar"

----- fim do buffer de teste ------

o que é um funcionamento perfeito da funcionalidade.

## Bug

agora suponha que o texto que eu copiei, eu não copiei no nvim, e sim a partir do windows. imagine que eu fui lá no chrome, selecionei uma string e apertei ctrl+c.

aí eu abri meu nvim, bem nesse buffer aqui:


----- buffer de teste ----

[s]nake-case-variable-1: ""
snake-case-variable-2: ""
snake-case-variable-3: ""
snake-case-variable-4: ""

----- fim do buffer de teste ------

depois de `gmip$P`, o multicursors simplesmente ignora o meu copy feito a partir do windows. 

investigue o problema pra mim, com base no que eu te falei, e proponha um patch que ficará em ~/.dotfiles/nvim/patch/

