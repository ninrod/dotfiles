# My dotfile repo for __tmux, zsh, vim, git__

### Screenshot
![screenshot-vi-tmux](https://raw.githubusercontent.com/ninrod/unix-shell-config/misc/images/screenshot.png)

## TMUX: terminal multiplexer

Você interage com o tmux no shell escapando os comandos por meio de uma sequência de teclas chamada `prefix`. Na configuração atual, essa sequência é `<Control> + <spacebar>`.
Isso signfica que `<prefix> + c` é você clicar ao mesmo em `<ctrl>+<spacebar>` e depois disso apertar a tecla `c`.

#### Manipulação de janelas

 * `<prefix> + c` - cria uma nova janela. 
 * `<prefix> + 1` - navega para a janela 1 (ou 2 para navegar para a janela 2).
 * `<prefix> + n` - 'next' navega para a próxima janela.
 * `<prefix> + p` - navega para a 'última' janela. Apertando várias vezes faz o cycle entre as duas últimas.
 * `<prefix> + ,` - renomeia uma janela

#### Manipulação de painéis

 * `<prefix> + v` - divide a janela verticalmente
 * `<prefix> + x` - divide a janela horizontalmente
 * `<prefix> + <space>` - itera entre diferentes layouts pré-definidos (muito útil).
 * `<prefix> + <setadirecional>` - navega para o painel de cima, de baixo, da esquerda ou da direita.
 * `<prefix> + s` - abre um prompt em que vc pode escrever o nome da janela para onde vc quer enviar o painel atual.

#### Fechando janelas ou paineis

 * `exit` - fecha um painel. Quando o último painel de uma janela é fechado, a janela é fechada

