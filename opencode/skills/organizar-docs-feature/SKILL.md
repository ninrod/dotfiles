---
name: organizar-docs-feature
description: Cria, organiza e retoma a documentação de uma feature em docs/features/<nome-da-feature>, separando requisitos, plano de implementação, status, questões de decisão, investigação e bugs. Usar quando o usuário pedir esse scaffold, pedir para organizar a memória de uma feature ou indicar uma feature documentada que quer retomar. Não usar em tarefas de código não relacionadas.
---

# Organizar a documentação de uma feature

## Escopo e destino

1. Identifique a raiz do projeto indicado pelo usuário. Em Git, use a raiz do checkout/worktree ativo, não a raiz de outro repositório, e respeite as instruções locais. Sem Git, use a raiz do projeto indicada ou identificada com segurança; pergunte se houver ambiguidade.
2. Use o nome de diretório escolhido pelo usuário. Se ele não o informou, pergunte; se forneceu só um título que precisa de normalização, proponha um nome curto em kebab-case e confirme. O nome é um segmento de caminho, não um caminho absoluto ou aninhado: rejeite separadores e componentes como `.` e `..`. Confirme que o destino permanece dentro da raiz e não sai dela por links simbólicos.
3. Crie ou atualize somente `<raiz-do-projeto>/docs/features/<nome-da-feature>/`. Se a pasta existir, leia o que há antes de editar. Preserve trabalho do usuário, decisões e links; não duplique o scaffold nem sobrescreva documentos existentes com templates. Em migrações solicitadas, atualize referências relativas de entrada e saída.
4. A skill organiza documentação. Não implemente a feature, não altere instruções globais do projeto e não faça commit sem um pedido separado.

## Estrutura

```text
docs/features/<nome-da-feature>/
├── README.md
├── feature.md
├── status.md
├── problems.md
├── plan.md
├── q1.md, q2.md, ...  # somente quando houver questões reais
├── bugs/
└── research/
```

Use os arquivos em `templates/`, relativos a este `SKILL.md`, como ponto de partida. Substitua `{{TITULO}}` pelo título da feature e preencha com o que já tiver sido confirmado na conversa ou documentado no projeto. Sem uma informação, registre que ela não foi definida ou remova a seção inútil; não invente requisitos, respostas, testes executados ou progresso. Crie `bugs/` e `research/`; se ficarem vazios em Git, use `.gitkeep` para que a estrutura possa ser versionada. Reconheça `readme.md` existente como entrada, sem criar um segundo README.

## Uma responsabilidade por arquivo

- **`README.md` — por onde retomar?** Mapa curto. Quando o usuário pedir para retomar esta feature, ler primeiro `status.md` e seguir apenas os links necessários. Não copiar status ou decisões para cá.
- **`feature.md` — o que deve ser entregue?** Objetivo, requisitos, comportamento esperado, limites e invariantes de produto. Evitar histórico de discussão e detalhes transitórios do checkout.
- **`status.md` — onde paramos?** Último avanço verificado, próxima ação e bloqueios específicos da próxima fatia. Referenciar as questões pertinentes sem repetir o índice. Se houve implementação, indicar teste/comando e resultado observado. Não declarar uma fatia concluída sem evidência.
- **`problems.md` — o que ainda precisa de decisão?** Índice das questões por ID estável (`Q1`, `Q2`, …). Use um título `## Q1` para gerar a âncora `#q1`, seguido de status, resumo breve, decisão final somente se confirmada e link para o `qN.md` correspondente quando existir. Distinguir `Em aberto`, `Bloqueadora`, `Lacuna de evidência` e `Resolvida`. Não criar perguntas de preenchimento nem converter uma recomendação em aprovação.
- **`plan.md` — como implementar e verificar?** Fatias executáveis com pré-requisitos, regras a preservar, integrações afetadas e resultados observáveis. Expresse decisões vigentes como regras operacionais; para dependências abertas, aponte para `problems.md`. Não mantenha uma segunda lista de questões, um diário de status ou a investigação do legado no plano.
- **`qN.md` — por que esta questão existe e como foi decidida?** Discussão, alternativas, evidências, justificativa e decisão confirmada, se houver. Use `templates/questao.md` quando uma questão real exigir registro detalhado (por exemplo, uma rodada com `grill-me`); substitua `{{NUMERO}}` e `{{PERGUNTA}}` e grave como `q1.md`, `q2.md` etc. Use o número seguinte ao maior ID já usado, buscando no índice e nos arquivos. Se for apenas um resumo no índice, não crie um arquivo vazio.
- **`research/` — o que sabemos e como apuramos?** Consultas, catálogos, desenhos, rastreamento do legado e evidências reutilizáveis. Identifique limites da evidência, ambiente e versão quando fizerem diferença. Uma hipótese em pesquisa não é uma regra aprovada.
- **`bugs/` — que defeitos foram observados?** Reprodução, ambiente, observado versus esperado e evidências. Um defeito documentado não passa automaticamente a fazer parte do escopo de implementação.

## Criar, consolidar ou retomar

- **Criar:** prepare o esqueleto e anote somente os fatos e decisões disponíveis. `problems.md` pode começar sem questões; `plan.md` pode dizer que as fatias ainda não foram definidas.
- **Consolidar:** quando uma decisão for confirmada, atualize o resumo em `problems.md` e o histórico no `qN.md`, se houver. Se a decisão afetar a entrega, reflita-a em `feature.md` ou `plan.md` conforme a responsabilidade, e atualize `status.md` se ela mudar a próxima ação ou o bloqueio. Faça essas atualizações juntas para evitar contradições.
- **Retomar:** só faça a leitura de retomada para a feature pedida pelo usuário. Leia README → status; consulte as fatias do plano e as questões referenciadas apenas conforme a tarefa. Se pedirem somente um diagnóstico da retomada, responda onde parou, o que vem a seguir e por quê, sem começar a implementar.
- **Verificar:** confira caminhos e âncoras de links locais, correspondência entre IDs e arquivos `qN.md`, ausência de placeholders não resolvidos, e coerência entre estado atual, questões e plano. Em Git, rode `git diff --check` e preserve o staging. Informe o destino e o que foi criado ou ajustado.
