# Debugando binários arm em um sistema x86_64

## Introdução

Estou acompanhando alguns tutoriais e livros sobre linguagem *assembly*
para processadores *arm* e me deparei com o seguinte problema: **como depurar
os binários em uma máquina x86?**

Felizmente, graças ao *qemu* e às ferramentas GNU podemos facilmente resolver
este problema sem precisar utilizar uma máquina real com processador *arm*.

## Descrição do processo

Para debugar binários *arm* em uma máquina de arquitetura *x86_64*, é
necessário instalar o **gdb** (*GNU Debugger*) específico para a arquitetura
alvo (*no nosso caso, a arquitetura arm*). No caso do *Arch*, o pacote em questão é o **arm-none-eabi-gdb**.

```
$ sudo pacman -S arm-none-eabi-gdb
```

Também é necessário instalar o **qemu** *user space emulator*, que contém o
emulador para a arquitetura *arm*. Para o Arch, eu instalei os pacotes **qemu**
e **qemu-arch-extra**.

```
$ sudo pacman -S qemu qemu-arch-extra
```

Após isso, é só *compilar* e *linkar* o arquivo *assembly* utilizando o seu
*cross assembler/compiler* para *arm*. No meu caso estou utilizando o
**arm-none-eabi-as** e **arm-none-eabi-ld**, respectivamente.

```
$ arm-none-eabi-as -g file.s -o file.o
$ arm-none-eabi-ld file.o -o file
```

Finalmente podemos executar o binário utilizando o **qemu** com o comando abaixo:

```
$ qemu-arm -g 1234 ./file
```

A opção `-g` abre uma conexão TCP a partir da porta 1234 para o debug remoto.

Agora só falta configurar o **gdb** para se comunicar com o processo remoto e
iniciar a depuração.

```
$ arm-none-eabi-gdb -q -nh
```

Depois que estiver dentro do **gdb** executar os seguintes comandos:

```
set architecture arm
file ./file
target remote localhost:1234
```

E pronto. Você está pronto para depurar um binário *arm* utilizando uma máquina
x86_64.

## Referências

- https://azeria-labs.com/arm-on-x86-qemu-user/
- http://www.davespace.co.uk/arm/"
- https://www.ic.unicamp.br/~celio/mc404-2014/docs/gnu-arm-directives.pdf
- https://qemu-project.gitlab.io/qemu/user/main.html#command-line-options
