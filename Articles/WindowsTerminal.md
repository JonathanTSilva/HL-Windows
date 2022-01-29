<!-- LOGO - DIREITO -->
<a href="#customização-do-windows-terminal"><img width="100px" src="https://res.cloudinary.com/practicaldev/image/fetch/s--oU6tDKnH--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/x9t7lxm2kvwliuy4yh73.png" align="right" /></a>

# Customização do Windows Terminal

:gear: Um guia de como customizar o Windows Terminal.

<!-- SUMÁRIO -->
- [Customização do Windows Terminal](#customização-do-windows-terminal)
  - [Abrindo o Windows Terminal](#abrindo-o-windows-terminal)
    - [... por atalho](#-por-atalho)
    - [... por atalho personalizado](#-por-atalho-personalizado)
    - [... pelo `Executar`](#-pelo-executar)
    - [... pelo explorador de arquivos](#-pelo-explorador-de-arquivos)
  - [Instalar o WSL (Windows Subsystem for Linux)](#instalar-o-wsl-windows-subsystem-for-linux)
  - [Oh My Posh](#oh-my-posh)
    - [Instalação](#instalação)
  - [Configurando o Windows Terminal](#configurando-o-windows-terminal)
    - [Tornar o Windows Terminal como padrão](#tornar-o-windows-terminal-como-padrão)
    - [Personalizar as guias](#personalizar-as-guias)
    - [Personalizar os perfis](#personalizar-os-perfis)
      - [Manusear os perfis](#manusear-os-perfis)
      - [Alterar o diretório inicial](#alterar-o-diretório-inicial)
      - [Desligar a barra de rolagem](#desligar-a-barra-de-rolagem)
    - [Personalizar a aparência](#personalizar-a-aparência)
      - [Adicionar plano de fundo](#adicionar-plano-de-fundo)
      - [Alterar esquema de cores](#alterar-esquema-de-cores)

O Windows Terminal oferece uma experiência de linha de comando muito aprimorada no Windows 10 (superior). Está repleto de características úteis como uma aceleração de GPU, tabs, painéis, temas e atalhos, além de um suporte completo para diferentes ambientes, tal como o PowerShell, Prompt de Comando e WSL. Neste artigo, será descrito algumas maneiras de adaptar as experiências com o terminal de acordo com suas necessidades, alé, de dicas e truques para tornar sua experiência muito melhor.

O aplicativo do Windows Terminal está disponível na Microsoft Store, mas também na sua [página de lançamentos do GitHub][1]. Entretanto, caso faça download por lá, perderá as atualizações automáticas. Há uma outra opção também para quem quer estar na frente dos próprios lançamentos, que é o Windows Terminal Preview, que contém os recursos mais recentes à medida que são desenvolvidos.

Uma vez instalado, ao inciar o Windows Terminal será criado um perfil padrão que mostrará os seus shells na ordem: PowerShell, Prompt de Comando, todas as distribuições WSL instaladas e o Azure Cloud Shell. Ao final deste artigo, você conseguirá atualizá-lo de acordo com sua preferência.

O primeiro passo a ser realizado é instalar todas os shells que você precisa, incluindo as **distribuições WSL** e o novo **PowerShell**. Todas elas podem ser baixadas pela Microsoft Store. Entretanto, antes de baixar suas distribuições, o WSL deve estar instalado e configurado em sua estação de trabalho.

## Abrindo o Windows Terminal

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

- Por linha de comando:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

- Pelo software **Recursos do Windows**:

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

### Personalizar as guias

Uma das maiores vantagens do Windows Terminal comparado a outros terminais, são as simples guias que fornece, objetivando a troca fácil entre os shells disponíveis. Entretanto, há quem não goste deste estilo de terminal. Se você se encaixa neste grupo de pessoas, pode-se desativar a experiência do alternador de guias definindo `tabSwitcherMode` como `false` ou `"disabled"`. Quando a opção estiver  desativado, pressionar <kbd>ctrl</kbd>+<kbd>tab</kbd> ou <kbd>ctrl</kbd>+<kbd>shift</kbd>+<kbd>tab</kbd> para alternar as guias de maneira semelhante à maioria dos navegadores da web. Se deseja controlar a ordem das guias no alternador, você pode definir `tabSwitcherMode` para `mru` ou `inOrder`, que listará as guias na ordem usada mais recentemente ou na ordem de seu layout no terminal, respectivamente.

```json
// Ativar o alternador de guias
"tabSwitcherMode": "mru",
"tabSwitcherMode": "inOrder"

// Desabilitar o alternador de guias
"tabSwitcherMode": "disabled"
```

Dando um atalho para opção `tabSearch`, é possível procurar pelos terminais aberto. Ainda neste documento será abordado sobre a criação de novos shortcuts para o Windows Terminal, mas vale tomar conhecimento desde já que no arquivo `settings.json` (ou até mesmo diretamente no `defaults.json`, aberto com <kbd>Alt</kbd>+<kbd>Right click</kbd> no botão de `Abrir arquivo json` na interface GUI) é possível realizar a personalização desses atalhos.

### Personalizar os perfis

Como citado anteriormente, tem-se dois arquivos de configuração do Windows Terminal. Entretanto, além dessas duas possibilidades, dentro do arquivo `settings.json` é possível realizar configuração padrão para cada ou todos os perfis. Essas podem ser acessadas através da propriedade `profiles`. Se desejar que qualquer configuração seja aplicada a todos os perfis, adicione-a na propriedade `defaults`, do mesmo arquivo. Caso contrário, adicione-o ao objeto relevante na matriz `list`.

```json
"defaults":
{
    // SETTINGS TO APPLY TO ALL PROFILES
},
"list":
[
    // PROFILE OBJECTS
]
```

#### Manusear os perfis

Para alterar a ordem de seu layout no terminal, abra `settings.json`, localize os parâmetros de cada shell cadastrado e altere a ordem entre eles, de acordo com sua preferência. Assim como, caso não queira que apareça alguma opção, altere o parâmetro `hidden` para `true`. Abaixo está um exemplo de como estará uma configuração para o PowerShell:

```json
{
  "commandline": "powershell.exe",
  "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
  "hidden": true,
  "name": "Windows PowerShell"
}
```

#### Alterar o diretório inicial

O diretório inicial para todos os shells é o diretório de usuário do Windows ( `%UserProfile%`) por padrão, mas você provavelmente deseja o diretório inicial do Linux em seus perfis WSL. Você pode adicionar o parâmetro `startingDirectory` ao seu objeto de perfil de distribuição WSL conforme mostrado abaixo para substituir essa configuração.

```json
{
    // [...]
  "startingDirectory": "\\\\wsl.localhost\\Ubuntu\\home\\jonathan"
}
```

Vale enfatizar nesta etapa a duplicidade das barras no endereço, sendo necessária este padrão para o seu correto funcionamento.

#### Desligar a barra de rolagem

Se você usa principalmente **tmux**, talvez queira desativar a barra de rolagem do seu perfil WSL definindo o parâmetro `scrollbarState` como `hidden`.

```json
{
  // [...]
  "scrollbarState": "hidden"
}
```

Para maiores informações sobre esta seção, confira a documentação das [configurações de perfil][9].

### Personalizar a aparência

#### Adicionar plano de fundo

É possível personalizar o terminal do Windows com imagens de fundo. O parâmetro `backgroundImage` pode ser definida para um URL de imagem, um caminho de arquivo local ou a string `desktopWallpaper` (da v1.5), e a imagem em questão pode ser dos formatos JPEG, PNG ou GIF . Você também tem controle sobre as configurações relacionadas, como **opacidade**, **alinhamento** e **alongamento**. Essas configurações podem ser configuradas globalmente para todos os perfis ou por perfil, como visto anteriormente. Abaixo, está a configuração de *wallpapers* que utilizo em meu *setup*, junto com uma imagem ilustrativa dele.

```json
{
  "backgroundImageAlignment": "bottomRight",
  "backgroundImageStretchMode": "none",
  "backgroundImageOpacity": 1
}
```

Deixo a posição como `bottomRight` para apresentar apenas os logos de cada shell. A cor do *background* em si, configuro nos *schemes*, que serão abordados posteriormente.

![winT][winTerminal-full]

Percebe-se que o terminal do Powershell está com um grau de transparência. Este efeito acrílico pode ser ativado e configurado pelas seguintes opções, que podem ser definidas também para cada perfil ou todos:

```json
{
  "useAcrylic": true, 
  "acrylicOpacity": 0.87,
}
```

Além de definir o background como acrílico, há um parâmetro que habilita o acrílico na borda da janela. Assim como outros que definem qual o tema do terminal, e o comportamento dos janelas. Esses parâmetros precisam ser definidos fora de qualquer propriedade.

```json
{
  "useAcrylicInTabRow": true,
  "theme": "system",
  "showTabsInTitlebar": true,
  "windowingBehavior": "useAnyExisting"
}
```

#### Alterar esquema de cores

O terminal vem com alguns esquemas de cores que você pode escolher. Eles são acessíveis através do menu de esquemas de cores. Você pode escolher seu esquema de cores global preferido ou adicionar novos se não gostar de nenhum dos padrões. Nas configurações do perfil, ou globais de `settings.json`, adicione o parâmetro `colorScheme` com o valor do esquema de cores de sua preferência.

```json
{
  "colorScheme": "Campbell Powershell"
}
```

Para criar o seu esquema de cores personalizados, ou alterar algum existente, todos ficam disponíveis dentro do objeto `schemes`.

```json
{
  "schemes": 
  [
    {
      "background": "#2C001E",
      "black": "#4E9A06",
      "blue": "#3465A4",
      "brightBlack": "#555753",
      "brightBlue": "#729FCF",
      "brightCyan": "#34E2E2",
      "brightGreen": "#8AE234",
      "brightPurple": "#AD7FA8",
      "brightRed": "#EF2929",
      "brightWhite": "#EEEEEE",
      "brightYellow": "#FCE94F",
      "cursorColor": "#FFFFFF",
      "cyan": "#06989A",
      "foreground": "#EEEEEE",
      "green": "#300A24",
      "name": "UbuntuLegit",
      "purple": "#75507B",
      "red": "#CC0000",
      "selectionBackground": "#FFFFFF",
      "white": "#D3D7CF",
      "yellow": "#C4A000"
    }
  ]
}
```

Um ótimo lugar para obter esquemas de cores diversos é o site [Windows Terminal Themes][10]. Você pode visualizar cada tema disponível e, quando encontrar um que lhe agrade, clique no botão **Obter tema** para copiar seu objeto JSON para a área de transferência. Após isso, só abrir um novo atributo do objeto `schemes` e colar o texto. 

> Não esqueça de alterar o `colorScheme`no perfil que preferir!



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
[9]: https://docs.microsoft.com/en-us/windows/terminal/customize-settings/profile-general
[10]: https://windowsterminalthemes.dev/

<!-- IMAGENS -->
[wsl-installation]: ../Images/wsl-installation.png
[winTerminal-full]: ../Images/winTerminal.png