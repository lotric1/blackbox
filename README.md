## Descrição e objetivo

- Ideia principal: inserir coisas que você quer fazer. Após a inserção, é como uma caixa preta. Todo dia, três atividades são escolhidas. Você pode completá-las ou ignorá-las. Ignorando-as, elas aparecem somente após um certo número de dias. Quanto mais você ignora uma atividade, maior o intervalo até ela reaparecer.
- Atividades que não são explicitamente ignoradas continuam aparecendo no próximo dia.
- Uma das páginas mostra a tabela completa com todas as atividades.
- Para cada caixa, o número de atividades por dia pode ser configurado.
- Você pode ter mais de uma caixa preta contendo listas de atividades. Desse jeito, é possível organizar as tarefas relacionadas a trabalho, escola, etc.
- O conteúdo da caixa não precisa ser somente tarefas. Pode também ser links

```
sudo gem install bundle rake rails
rails new blackbox

# edit gemfile, then
bundle install

rake haml:replace_erbs

rails g rspec:install

# model because we are not going to display a page for the box
rails g model bbox title:string creation_date:datetime position:integer items_per_day:integer starred:boolean color:string

rails g model Notebox title:string text:string creation_date:datetime position:integer

# scaffold because we want a page with all the content
rails g scaffold bbox_Content text:string insertion_date:datetime completion_date:datetime due_date:datetime completed:boolean pinned:boolean pass_counter:integer bbox:references

rake db:migrate
rake # runs rspec to see if everything ok with db

# adjust models in ./app/models to define has_many relations

rails g controller blackbox

# change ./config/routes.rb, adding root to: "blackbox#index"
# add an index.html.haml to ./views/blackbox, type anything there, this will be your index page

rails g devise:install
PS: this is how you do step 3 in haml
    %p#notice
      = notice
    %p#alert
      = alert

rails g devise:views
rake haml:replace_erbs # yes, again

rails g devise user
rake db:migrate
``` 

## Funcionalidades que podem ser implementadas:

- A função de caixa preta pode ser desabilitada, de forma a ter uma caixa contendo listas de atividades que são prioridade no momento.
- Você pode pedir mais atividades para a caixa.
- Uma tarefa pode ser marcada com uma estrela de forma que ela sempre apareça
- Você pode colocar prazos para as tarefas de forma que elas sempre apareçam faltando 7 dias.

## Outros escopos possíveis para o projeto

- Dashboard: fora as caixas pretas, posso incluir outras caixas com outras funcionalidades. Ex: sticky notes, imagens, quotes aleatórios.
- Caixas de repetição espaçada, similar ao anki. Digite uma palavra e escolha uma definição dentre as que o app gera ou insira sua própria.


## TODO

- Nome
    - Something similar to procrasturbator, but not lewd. Maybe procrastinator.
    - Blackbox, blackblocks, but it's the name of an antifascist organization (which i respect, but don't want to name it as something that already represents something else)
    - Backburner
- 