# Blackbox

## Descrição e objetivo

- Ideia principal: inserir coisas que você quer fazer. Após a inserção, é como uma caixa preta. Todo dia, três atividades são escolhidas. Você pode completá-las ou ignorá-las. Ignorando-as, elas aparecem somente após um certo número de dias. Quanto mais você ignora uma atividade, maior o intervalo até ela reaparecer.
- Atividades que não são explicitamente ignoradas continuam aparecendo no próximo dia.
- Uma das páginas mostra a tabela completa com todas as atividades, incluindo as completadas e as que estão pro vir.
- Para cada caixa, o número de atividades por dia pode ser configurado.
- Você pode ter mais de uma caixa preta contendo listas de atividades. Desse jeito, é possível organizar as tarefas relacionadas a trabalho, escola, etc. A ideia é ter uma espécie de dashboard onde tudo é visualmente fácil de encontrar.
- O conteúdo da caixa não precisa ser somente tarefas. Pode também ser links ou anotações para lembrar depois.
- Starred: desabilita a função de caixa preta, de forma a ter uma caixa contendo listas de atividades que são prioridade no momento.
- Pinned: faz com que uma atividade sempre apareça. Isso conta no número de tarefas diárias.
- Tarefas que nunca foram passadas sempre aparecem na caixa e são marcadas como "new".

## Observações

- Para motivo de testes, cada caixa mostra as próximas n atividades ao invés de mostrar somente as atividades marcadas para hoje.

## Utilização

- Acessar o projeto: execute `bin/rails server`, acesse `localhost:3000` no navegador.
- Logins já existentes:
  - admin@admin.com admin1
  - admin2@admin.com admin2