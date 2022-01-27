<!-- RIGHT LOGO -->
<a href="#customização-do-windows-terminal"><img width="100px" src="https://res.cloudinary.com/practicaldev/image/fetch/s--oU6tDKnH--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/x9t7lxm2kvwliuy4yh73.png" align="right" /></a>

# Customização do Windows Terminal

:gear: Um guia de como customizar o Windows Terminal.

<!-- TABLE OF CONTENTS -->
- [Customização do Windows Terminal](#customização-do-windows-terminal)
  - [Abrindo o Windows Terminal ...](#abrindo-o-windows-terminal-)
    - [... por atalho](#-por-atalho)
    - [... por atalho personalizado](#-por-atalho-personalizado)
    - [... pelo `Executar`](#-pelo-executar)
    - [... pelo explorador de arquivos](#-pelo-explorador-de-arquivos)
  - [Instalar o WSL (Windows Subsystem for Linux)](#instalar-o-wsl-windows-subsystem-for-linux)
  - [Oh My Posh](#oh-my-posh)
    - [Instalação](#instalação)
  - [Configurando o Windows Terminal](#configurando-o-windows-terminal)
    - [Tornar o Windows Terminal como padrão](#tornar-o-windows-terminal-como-padrão)

O Windows Terminal oferece uma experiência de linha de comando muito aprimorada no Windows 10 (superior). Está repleto de características úteis como uma aceleração de GPU, tabs, painéis, temas e atalhos, além de um suporte completo para diferentes ambientes, tal como o PowerShell, Prompt de Comando e WSL. Neste artigo, será descrito algumas maneiras de adaptar as experiências com o terminal de acordo com suas necessidades, alé, de dicas e truques para tornar sua experiência muito melhor.

O aplicativo do Windows Terminal está disponível na Microsoft Store, mas também na sua [página de lançamentos do GitHub][1]. Entretanto, caso faça download por lá, perderá as atualizações automáticas. Há uma outra opção também para quem quer estar na frente dos próprios lançamentos, que é o Windows Terminal Preview, que contém os recursos mais recentes à medida que são desenvolvidos.

Uma vez instalado, ao inciar o Windows Terminal será criado um perfil padrão que mostrará os seus shells na ordem: PowerShell, Prompt de Comando, todas as distribuições WSL instaladas e o Azure Cloud Shell. Ao final deste artigo, você conseguirá atualizá-lo de acordo com sua preferência.

O primeiro passo a ser realizado é instalar todas os shells que você precisa, incluindo as **distribuições WSL** e o novo **PowerShell**. Todas elas podem ser baixadas pela Microsoft Store. Entretanto, antes de baixar suas distribuições, o WSL deve estar instalado e configurado em sua estação de trabalho.

## Abrindo o Windows Terminal ...

Apesar desta seção parecer um tanto quanto dispensável, aqui serão expostas diversas maneiras e dicas para agilizar o processo na hora de abrir o terminal. Algumas são tão simples que vale apenas relembrar, como abrir pelo menu `Pesquisar`, pelo menu `Iniciar` ou `WinX` (no caso do Windows 11), e pelo menu de contexto, ao clicar com o botão direito em uma pasta no explorador de arquivos e selecionar `Abrir no Terminal do Windows`.

### ... por atalho

A maneira mais fácil de abrir o terminal é fixando-o na barra de tarefas e pressionando a tecla <kbd>Win</kbd> em conjunto com o seu número correspondente à posição na barra.
Exemplo: <kbd>Win</kbd>+<kbd>2</kbd>.

### ... por atalho personalizado

Caso não se adapte com o atalho padrão do Windows, há a opção de personalizá-lo com o AutoHotKey para executar ou gerar uma instância de terminal do Windows. Para personalização, instale o [AutoHotKey][2] na máquina e siga os seguintes passos:

1. Crie um novo arquivo de texto com uma extensão `.ahk`;
2. Copie e cole o código abaixo dentro do arquivo;
3. Clique duas vezes no arquivo para executá-lo.

```ahk
#NoEnv
#SingleInstance force
SendMode Input
DetectHiddenWindows, on
SetWinDelay, 0

#`::
    terminal := WinExist("ahk_exe WindowsTerminal.exe")
    if (terminal) 
    {
        active := WinActive("ahk_id " terminal)
        if (active)
            WinMinimize, ahk_id %active%
        else
            WinActivate, ahk_id %terminal%
    }
    else
        Run, wt.exe
Return
```

Feito isso, você poderá abrir o terminal do Windows com um atalho personalizado. O script vinculado utiliza <kbd>Win</kbd>+<kbd>'</kbd>, mas é possível alterá-lo para a combinação de teclas de sua preferência. O problema deste método é que para seu correto funcionamento, o script precisa ser executado manualmente todas as vezes. Para automatizar este processo, siga o tópico ["How do I put my hotkeys and hotstrings into effect automatically every time I start my PC?"][3], FAQ do AutoHotKey.

### ... pelo `Executar`

Outra maneira rápida para esta inicialização, abra o menu Executar (<kbd>Win</kbd>+<kbd>R</kbd>) e digite `wt`, e voilà! Windows Terminal aberto. Vale ressaltar que este é o mnemônico do processo do Windows Terminal. Assim, é possível abri-lo através de um outro shell com o mesmo comando (como é feito com semelhantes, e.g. `zsh`, `bash`, `cmd`).

### ... pelo explorador de arquivos

Esta dica é muito útil para aqueles que não tem a opção do Windows Terminal no menu de contexto. Estando em uma pasta de trabalho no explorador de arquivo, selecionar a barra de endereços (<kbd>Ctrl</kbd>+<kbd>L</kbd>) e digitar `wt -d .` para abrir o Windows Terminal na pasta especificada.

## Instalar o WSL (Windows Subsystem for Linux)

A princípio, em uma instalação mais antiga, era necessário configurar sua estação para receber a virtualização por WSL, habilitando os recursos opcionais **"Plataforma de Maquina Virtual"** e **"Subsistema do Windows para Linux"**. Entretanto, o WSL atual já realiza a instalação automática de todas as dependências necessárias. Todavia, abaixo está como podemos ativar estes recursos manualmente, apresentando duas maneiras de realizar tal ativação: Por linha de comando e pelo programa **Recursos do Windows**.

* Por linha de comando:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

* Pelo software **Recursos do Windows**:

Abra o **Recursos do Windows** e ative os itens **"Plataforma de Maquina Virtual"** e **"Subsistema do Windows para Linux"**.

Sem mais delongas, é possível instalar tudo o que precisa para executar o WSL (Subsistema do Windows para Linux) inserindo este comando no PowerShell administrador ou no prompt de comando do Windows e reiniciando o computador:

```powershell
wsl --install
```

Esse comando habilitará os componentes opcionais necessários, baixará o kernel mais recente do Linux, definirá o WSL 2 como padrão e instalará uma distribuição do Linux para você (Ubuntu, por padrão; vide imagem abaixo).

![wsl][wsl-installation]

Na primeira vez que você iniciar uma distribuição do Linux recém-instalada, uma janela de console será aberta e será solicitado que você aguarde para que os arquivos sejam descompactados e armazenados em seu computador. Todas as futuras inicializações deverão levar menos de um segundo.

Para instalar outras distribuições Linux, assim como já dito, fazê-la pela Microsoft Store. Caso queira listar os sistemas disponíveis no WSL ou aqueles que estão rodando do subsistema Windows, executar os comandos:

```powershell
wsl --list --all
wsl --list --running
```

O comando `wsl --shutdown` é um caminho rápido para reiniciar as distribuições do WSL 2, mas ele desligará todas as distribuições em execução e, portanto, será usado com sabedoria.

> **Nota:** lembre de instalar o novo **Powershell** na loja da Microsoft para melhorar sua experiência.

## Oh My Posh

### Instalação

O Oh My Posh é uma engine customizada de prompt para qualquer shell que apresenta a habilidade de ajustar a string do prompt como uma variável ou função.

> **Nota:** para mostrar todos os ícones, é recomendado a utilização de alguma [Nerd Font][6].

Há diversas formas de realizar a instalação do Oh My Posh, podendo ser acompanhadas pela [página principal do projeto][4], ou pela [galeria de pacotes do PowerShell][5].

Utilizando o `winget` (Windows Package Manager CLI - gerenciador de pacotes da Microsoft), apenas execute o comando abaixo em seu prompt:

```powershell
winget install JanDeDobbeleer.OhMyPosh
```

Isso instala o `oh-my-posh.exe` e os últimos [temas do Oh My Posh][7].

## Configurando o Windows Terminal

Ao abrir o Windows Terminal, percebe-se que as configurações podem ser alteradas de duas formas: pela interface de usuário ou pelo arquivo de configurações. Para fins didáticos, todas as alterações aqui realizadas serão expostas por código para serem alteradas no arquivo de configuração `settings.json`. Para quaisquer outras dúvidas não solucionadas neste tópico, verifique a [documentação do Windows Terminal][8].

### Tornar o Windows Terminal como padrão

Essa opção foi implementada apenas no Windows 11, por enquanto, e não possui um parâmetro para configuração dentro do arquivo `settings.json`, sendo assim obrigatória a modificação apenas por interface GUI.

```json
dsg
```

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://github.com/microsoft/terminal/releases
[2]: https://www.autohotkey.com/
[3]: https://www.autohotkey.com/docs/FAQ.htm#Startup
[4]: https://ohmyposh.dev/docs/windows
[5]: https://www.powershellgallery.com/packages/oh-my-posh/7.5.1
[6]: https://ohmyposh.dev/docs/config-fonts
[7]: https://ohmyposh.dev/docs/themes
[8]: https://aka.ms/terminal-documentation

<!-- IMAGES -->
[wsl-installation]: ../Images/wsl-installation.png
