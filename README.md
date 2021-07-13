# Meu website pessoal

Apenas meu website pessoal. Usei o antigo site do Luke Smith como base para criá-lo.

## Instruções para upload

Como sou meio cabeça de vento, vou anotar aqui as instruções para subir o site para o servidor utilizando o rsync:

```
$ rsync -avz --delete source/ user@server:/destination/
```

## Instruções para manter o site atualizado no github

Abaixo o comando para atualizar o github com as atualizações.

```
$ git push -u origin master
```
