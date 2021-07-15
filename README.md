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
## Instruções para gerar os posts no blog

Os posts no blog são gerados a partir de um arquivo *markdown* na pasta *src*.
Depois de gerar este arquivo eu rodo um pequeno *script* que executa o *pandoc*
para transformar o *markdown* em *html*. Após a conversão, o novo arquivo
*html* é copiado para a pasta *blog*.

Depois disso é só colocar o *link* na página principal. Sim, é um sistema bem
preguiçoso. Ainda assim é melhor que editar *html* **"na mão"**.
