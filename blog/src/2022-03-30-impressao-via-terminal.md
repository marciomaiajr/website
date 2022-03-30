# Impressão via terminal utilizando lp e enscript

## Configurando a impressora para imprimir no terminal

Assim que tiver configurado uma impressora no CUPS, verifique no terminal se ela está disponível com o comando abaixo:
```
lpstat -p -d
```
No meu computador a impressora configurada no CUPS aparece listada como HP_Smart_Tank_510_series conforme saída deste comando:
```
printer HP_Smart_Tank_510_series is idle.  enabled since Wed 30 Mar 2022 12:12:49 PM -03
system default destination: HP_Smart_Tank_510_series
```
Após fazer isso configure a impressora escolhida como padrão para o lp.
```
lpoptions -d HP_Smart_Tank_510_series # substitua aqui pelo nome da sua impressora
```
Depois disso você já pode enviar trabalhos de impressão através do comando lp:
```
lp < arquivo_para_impressao
```

## Utilizando o utilitário enscript para escolher a fonte

Por default a fonte utilizada pelo lp pode não ser do seu agrado. Para resolver isso, instale o utilitário enscript e o utilize com a opção de fonte.
```
enscript -fCourier10 < arquivo_para_impressao
```
O comando acima vai imprimir o arquivo com fonte Courier tamanho 10 pontos.

## Resolvendo o problema com acentos

Se o seu terminal estiver configurado com o encoding UTF-8 pode ser que os acentos nos seus documentos não sejam impressos corretamente utilizando o lp e enscript.

Neste caso, utilize o utilitário iconv para converter os encodings conforme o exemplo abaixo:
```
iconv -c -f UTF-8 -t ISO8859-1 arquivo_para_impressao | enscript -fCourier10
```

Referências
- <https://stackoverflow.com/questions/44412168/convert-utf8-to-iso8859-1-using-iconv-command>
- <https://www.cups.org/doc/options.html>
