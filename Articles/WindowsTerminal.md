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
  - [Instalar o WSL (*Windows Subsystem for Linux*)](#instalar-o-wsl-windows-subsystem-for-linux)
  - [Personalização do Windows Terminal](#personalização-do-windows-terminal)
    - [Tornar o Windows Terminal como padrão](#tornar-o-windows-terminal-como-padrão)
    - [Personalizar as guias](#personalizar-as-guias)
    - [Personalizar os perfis](#personalizar-os-perfis)
      - [Manusear os perfis](#manusear-os-perfis)
      - [Alterar o diretório inicial](#alterar-o-diretório-inicial)
      - [Desligar a barra de rolagem](#desligar-a-barra-de-rolagem)
    - [Personalizar a aparência](#personalizar-a-aparência)
      - [Adicionar plano de fundo](#adicionar-plano-de-fundo)
      - [Alterar esquema de cores](#alterar-esquema-de-cores)
  - [Personalização do *Prompt*](#personalização-do-prompt)
    - [Instalação e configuração das fontes](#instalação-e-configuração-das-fontes)
      - [Trocar de fonte no terminal do Windows](#trocar-de-fonte-no-terminal-do-windows)
      - [Trocar de fonte no terminal do VSCode](#trocar-de-fonte-no-terminal-do-vscode)
    - [Oh My Posh](#oh-my-posh)
      - [Instalar do Oh My Posh](#instalar-do-oh-my-posh)
      - [Definir o Oh My Posh como padrão](#definir-o-oh-my-posh-como-padrão)
      - [Alterar o tema](#alterar-o-tema)
      - [Mostrar ícones nos diretórios e arquivos](#mostrar-ícones-nos-diretórios-e-arquivos)
      - [Perfil totalmente personalizado](#perfil-totalmente-personalizado)
    - [Oh My Zsh](#oh-my-zsh)
      - [Instalar o Oh My Zsh](#instalar-o-oh-my-zsh)
      - [Alterar o tema e instalar temas externos](#alterar-o-tema-e-instalar-temas-externos)
      - [Instalar e habilitar plugins](#instalar-e-habilitar-plugins)
        - [zsh-history-substring-search](#zsh-history-substring-search)
        - [zsh-syntax-highlighting](#zsh-syntax-highlighting)
        - [zsh-autosuggestions](#zsh-autosuggestions)
    - [Starship](#starship)
      - [Instalar o Starship](#instalar-o-starship)
      - [Configurar o shell para utilizar Starship](#configurar-o-shell-para-utilizar-starship)
        - [PowerShell](#powershell)
        - [ZSH](#zsh)
      - [Configurar o Starship](#configurar-o-starship)
  - [Dicas de utilização](#dicas-de-utilização)
    - [Dividir os prompts](#dividir-os-prompts)
    - [Personalizar teclas de atalho](#personalizar-teclas-de-atalho)
    - [Configurar perfis SSH personalizados](#configurar-perfis-ssh-personalizados)
    - [Personalizar layout de inicialização](#personalizar-layout-de-inicialização)
    - [Instalar o módulo Z](#instalar-o-módulo-z)
  - [Conclusão](#conclusão)

O Windows Terminal oferece uma experiência de linha de comando muito aprimorada no Windows 10 (ou superior). Está repleto de características úteis como uma aceleração de GPU, *tabs*, painéis, temas e atalhos, além de um suporte completo para diferentes ambientes, tal como o PowerShell, Prompt de Comando e WSL. Neste artigo, serão descritas algumas maneiras de adaptar as experiências com o terminal de acordo com suas necessidades, além de dicas e truques para tornar sua experiência muito melhor.

O aplicativo do Windows Terminal está disponível para download na Microsoft Store, mas também na sua [página de lançamentos do GitHub][1]. Entretanto, caso opte pela segunda opção, perderá as atualizações automáticas. Há uma outra opção para quem quer estar na frente dos próprios lançamentos, o Windows Terminal Preview, que contém os recursos mais recentes à medida que são desenvolvidos.

Uma vez instalado, ao inciar o Windows Terminal será criado um perfil padrão que mostrará os seus shells na ordem: PowerShell, Prompt de Comando, todas as distribuições WSL instaladas e o Azure Cloud Shell. Ao final deste artigo, você conseguirá atualizá-lo de acordo com sua preferência.

O primeiro passo a ser realizado é instalar todas os shells que você precisa, incluindo as **distribuições WSL** e o novo **PowerShell**. Todas elas podem ser baixadas pela Microsoft Store. Entretanto, antes de baixar suas distribuições, o WSL deve estar instalado e configurado em sua estação de trabalho.

## Abrindo o Windows Terminal

Apesar desta seção parecer um tanto quanto dispensável, aqui serão expostas diversas maneiras e dicas para agilizar o processo na hora de abrir o terminal. Algumas são tão simples que vale apenas relembrar, como: abrir pelo menu `Pesquisar`, pelo menu `Iniciar` ou `WinX` (no caso do Windows 11), e pelo menu de contexto, ao clicar com o botão direito em uma pasta no explorador de arquivos e selecionar `Abrir no Terminal do Windows`.

### ... por atalho

A maneira mais fácil de abrir o terminal é fixando-o na barra de tarefas e pressionando a tecla <kbd>Win</kbd> em conjunto com o seu número correspondente à posição na barra.
Exemplo: <kbd>Win</kbd>+<kbd>2</kbd>.

### ... por atalho personalizado

Caso não se adapte com o atalho padrão do Windows, há a opção de personalizá-lo com o [AutoHotKey][2] para executar ou gerar uma instância de terminal do Windows. Para personalização, instale-o na máquina e siga os seguintes passos:

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

Feito isso, você poderá abrir o terminal do Windows com um atalho personalizado. O script vinculado utiliza <kbd>Win</kbd>+<kbd>'</kbd>, mas é possível alterá-lo para a combinação de teclas de sua preferência. O problema deste método é que, para seu correto funcionamento, o script precisa ser executado manualmente todas as vezes. Para automatizar este processo, siga o tópico ["How do I put my hotkeys and hotstrings into effect automatically every time I start my PC?"][3], FAQ do AutoHotKey.

### ... pelo `Executar`

Outra maneira rápida para esta inicialização: abra o menu Executar (<kbd>Win</kbd>+<kbd>R</kbd>) e digite `wt`, e *voilà*! Windows Terminal aberto. Vale ressaltar que este é o mnemônico do processo do Windows Terminal. Assim, é possível abri-lo através de um outro shell com o mesmo comando (como é feito com semelhantes, e.g. `zsh`, `bash`, `cmd`).

### ... pelo explorador de arquivos

Esta dica é muito útil para aqueles que não tem a opção do Windows Terminal no menu de contexto. Estando em uma pasta de trabalho no explorador de arquivo, selecionar a barra de endereços (<kbd>Ctrl</kbd>+<kbd>L</kbd>) e digitar `wt -d .` para abrir o Windows Terminal na pasta especificada.

## Instalar o WSL (*Windows Subsystem for Linux*)

A princípio, em uma instalação mais antiga, era necessário configurar sua estação para receber a virtualização por WSL habilitando os recursos opcionais **"Plataforma de Maquina Virtual"** e **"Subsistema do Windows para Linux"**. Entretanto, o WSL atual já realiza a instalação automática de todas as dependências necessárias. Mesmo assim, abaixo está um breve tutorial sobre como podemos ativar estes recursos manualmente, apresentando duas maneiras de realizar tal ativação: por linha de comando e pelo programa **Recursos do Windows**.

- Por linha de comando:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

- Pelo software **Recursos do Windows**:

Abra o **Recursos do Windows** e ative os itens **"Plataforma de Maquina Virtual"** e **"Subsistema do Windows para Linux"**.

Sem mais delongas, é possível instalar tudo o que precisa para executar o WSL (Subsistema do Windows para Linux) inserindo este comando no PowerShell administrador ou no prompt de comando do Windows e, ao seu término, reiniciar o computador:

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

O comando `wsl --shutdown` é um caminho rápido para reiniciar as distribuições do WSL 2, mas ele desligará todas as distribuições em execução e, portanto, deve ser usufruído com sabedoria.

> **Nota:** lembre de instalar o novo **Powershell** na loja da Microsoft para melhorar sua experiência.

## Personalização do Windows Terminal

Ao abrir o Windows Terminal, percebe-se que as configurações podem ser alteradas de duas formas: pela interface de usuário ou pelo arquivo de configurações. Para fins didáticos, todas as alterações aqui realizadas serão expostas por código para serem alteradas no arquivo de configuração `settings.json`. Para quaisquer outras dúvidas não solucionadas neste tópico, verifique a [documentação do Windows Terminal][8].

### Tornar o Windows Terminal como padrão

Essa opção foi implementada apenas no Windows 11, por enquanto, e não possui um parâmetro para configuração dentro do arquivo `settings.json`, sendo assim obrigatória a modificação apenas por interface GUI.

### Personalizar as guias

Uma das maiores vantagens do Windows Terminal comparado a outros terminais, são as simples guias que fornece, objetivando a troca fácil entre os shells disponíveis. Entretanto, há quem não goste deste estilo de terminal. Se você se encaixa neste grupo de pessoas, pode-se desativar a experiência do alternador de guias definindo `tabSwitcherMode` como `false` ou `"disabled"`. Quando a opção estiver  desativado, pressionar <kbd>Ctrl</kbd>+<kbd>tab</kbd> ou <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>tab</kbd> para alternar as guias de maneira semelhante à maioria dos navegadores da web. Se deseja controlar a ordem das guias no alternador, você pode definir `tabSwitcherMode` para `mru` ou `inOrder`, que listará as guias na ordem usada mais recentemente ou na ordem de seu layout no terminal, respectivamente.

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
    // Configurações aplicadas para todos os perfis
},
"list":
[
    // Objetos do perfil
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

O diretório inicial para todos os shells é o diretório de usuário do Windows (`%UserProfile%`) por padrão, mas você provavelmente deseja o diretório inicial do Linux em seus perfis WSL. Você pode adicionar o parâmetro `startingDirectory` ao seu objeto de perfil de distribuição WSL conforme mostrado abaixo para substituir essa configuração.

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

## Personalização do *Prompt*

Caso você não se sinta confortável com as aparências e disposições dos diversos prompts, ou apenas queira personalizar os shells com sua cara, existem algumas ferramentas que facilitam essas customizações. Neste artigo, serão apresentadas as três engines mais famosas entre os desenvolvedores: **Oh my Posh**, **Oh my Zsh** e **Starship**. Os três compartilham um pré-requisito importante para seu correto funcionamento (mostrar todos os ícones e símbolos no *prompt*): recomenda-se instalar um pacote de fontes especial para cada um.

### Instalação e configuração das fontes

Assim sendo, abaixo dos título das seções estarão os conjuntos de fontes aceitos para cada caso. A instalação da fonte geralmente pode ser realizada (independente do sistema) executando o arquivo da fonte ou indo até o diretório em que elas estão, e colando os arquivos lá. A tabela abaixo, apresenta as fontes utilizadas por cada terminal (por *default*) para te auxiliar na hora de escolher sua fonte:

| Terminal         | Fonte         |
| :--------------- | :------------ |
| Windows Terminal | Cascadia Code |
| Ubuntu Terminal  | Ubuntu Mono   |
| Pop!_OS Terminal | FiraCode      |

Feito isso, agora é preciso alterar todos os terminais para a sua fonte premiada. Para cada terminal, há um jeito diferente de configurar, no entanto, como estamos configurando apenas o terminal do Windows, mostraremos nele e no terminal do Visual Studio Code.

#### Trocar de fonte no terminal do Windows

Da mesma forma, como qualquer outra configuração já realizada neste documento, a alteração da fonte no WT pode ser realizada para todos os perfis ou apenas para um. Basta adicionar o propriedade e setar os seguintes parâmetros:

```json
{
  "font":
    {
      "face": "CaskaydiaCove Nerd Font",
      "size": 12
    }
}
```

> **Nota:** o valor do parâmetro `face` deve ser exatamente igual à fonte instalada na estação.

#### Trocar de fonte no terminal do VSCode

No Visual Studio Code é possível também alterar de duas formas, por usuário ou por espaço de trabalho. Para que os seus ambientes de trabalho não sejam afetados, recomenda-se a modificação da fonte pelo workspace. Para isso, abra o arquivo de configuração do ambiente de trabalho pelo *command palette* (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>) e digite `Preferences: Open Workspace settings (JSON)`. Vale ressaltar que assim como todas outras aqui apresentadas, essa configuração também pode ser feita através da interface GUI, apenas selecionando a opção sem o `(JSON)`. Coloque o nome da sua fonte no parâmetro `editor.fontFamily`. Se apenas preferir alterar a do terminal, o parâmetro utilizado é `terminal.integrated.fontFamily`:

```json
{
    "editor.fontFamily": "'CaskaydiaCove Nerd Font', Consolas, 'Courier New', monospace",
    "editor.fontSize": 14,
    "terminal.integrated.fontFamily": "'CaskaydiaCove Nerd Font'",
    "terminal.integrated.env.windows": "wt.exe",
    "terminal.integrated.defaultProfile.osx": "zsh",
}
```

### Oh My Posh

> [Nerd Font][6]

O Oh My Posh é uma engine customizada de prompt para qualquer shell que apresenta a habilidade de ajustar a string do prompt como uma variável ou função. Ele suporta todos os shells populares no Linux, macOS e Windows, incluindo **Bash**, **Fish**, **Zsh**, **Powershell** e outros, tornando possível obter um prompt consistente, mesmo que você alterne frequentemente entre diferentes shells.

![omp][omp]

#### Instalar do Oh My Posh

Neste artigo, o foco será sua utilização no PowerShell. Entretanto, há diversas formas de realizar a instalação do Oh My Posh, podendo ser acompanhadas pela [página principal do projeto][4], ou pela [galeria de pacotes do PowerShell][5].

> **Nota:** Ao usar Oh My Posh dentro do WSL, certifique-se de seguir o guia de instalação do linux .

No Windows, utilizando o `winget` (Windows Package Manager CLI - gerenciador de pacotes da Microsoft), apenas execute o comando abaixo em seu prompt:

```powershell
winget install JanDeDobbeleer.OhMyPosh
```

Isso instala o `oh-my-posh.exe` e os últimos [temas do Oh My Posh][7]. Para conferir, basta copiar este comando do executável no cmd e será possível visualizar sua interface. Porém, só realizar este procedimento não o colocará como a engine padrão do PowerShell.

#### Definir o Oh My Posh como padrão

Para defini-lo como padrão do sistema, é necessário editar o script de perfil do PowerShell. Para encontrar a localização deste *profile*, basta dar o comando `echo` e para abrir, `notepad` ou o comando do seu editor de texto (`code`):

```powershell
echo $PROFILE
notepad $PROFILE
```

Caso não tenha algum perfil criado, crie-o no diretório e com o mesmo nome retornado no primeiro comando, ou apenas escreva algo com `echo 'test' > $PROFILE`. Ao abrir, adicione a seguinte linha:

```powershell
oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/jandedobbeleer.omp.json | Invoke-Expression
```

> **Nota:** se você instalou o Oh My Posh usando `Install-Module oh-my-posh`, é necessário primeiro importar o Oh My Posh no seu $PROFILE com `Import-Module oh - my - posh` antes de adicionar a linha acima

Depois de adicionado, recarregue seu perfil para que as alterações entrem em vigor.

```powershell
. $PROFILE 
```

#### Alterar o tema

O tema padrão **jandedobbeleer.omp.json** exibe os casos de uso mais comuns em seu prompt. No entanto, se você quer ir mais além para explorar funcionalidades adicionais, siga as etapas adicionais abaixo para te auxiliar neste começo.

Explore os [temas oficiais do Oh My Posh][7]. Caso encontre algum que lhe agrade, basta conferir se ele já está baixado no diretório de temas (`~\AppData\Local\Programs\oh-my-posh\themes`) e alterar no arquivo de perfil do PowerShell, como exemplo abaixo:

```powershell
oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/agnoster.omp.json | Invoke-Expression
```

Se gostou parcialmente do tema e quiser editá-lo, criando o seu próprio, leia primeiro todas as opções disponíveis, começando pelo [guia de configuração][21]. Você pode enviar o seu tema atual para o formato que desejar (`json`, `yaml` ou `toml`) que pode ser usado para ajustar e armazenar como seu tema personalizado.

```powershell
Export-PoshTheme - FilePath "~/.mytheme.omp.json" - Formato json  
```

Quando terminar de editar, ajuste o seu `$PROFILE` para usar o tema recém-criado.

```powershell
oh - meu - posh -- init -- shell pwsh -- config "~/.mytheme.omp.json" | Invocar-Expressão  
```

> **Nota:** Ao usar oh-my-posh no Windows e no WSL, saiba que você pode compartilhar seu tema com o WSL apontando para um tema na pasta pessoal do usuário do Windows. Dentro do WSL, substitua `~` pelo seguinte caminho: `/mnt/c/Users/<WINDOWSUSERNAME>`.
> **Cuidado:** Para temas baixados e colocados naquele diretório de *themes* do Oh My Posh, é necessário adicionar o caminho inteiro do diretório, como `C:\Users\jonathan\AppData\Local\Programs\oh-my-posh\themes\ohmyposhv3-v2.json` ou a pasta em que ele se encontra.

O tema que utilizo atualmente é o desenvolvido por **shanselman**, chamado **ohmyposhv3-v2.json** e está disponível na [página de gist][22] do desenvolvedor, assim como o arquivo `$PROFILE` personalizado.

#### Mostrar ícones nos diretórios e arquivos

Seu prompt não é suficiente? Isso porque sua listagem de diretórios precisa de cores e ícones!

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
```

Em seguida, adicione uma linha ao meu `$PROFILE` (edite com `code $PROFILE`):

```powershell
Import-Module -Name Terminal-Icons
```

![icons][iconsDir]

#### Perfil totalmente personalizado

Para uma última personalização, utilizo o arquivo profile, também desenvolvido por [shanselman][22], que adiciona outros módulos como o PSReadLine. Entretanto, para sua utilização, são necessárias algumas alterações e downloads, que foram realizadas e disponibilizadas na minha aba de gist: [github.com/JonathanTSilva][24].

Faça o download da versão mais recente do PSReadLine para evitar possíveis problemas. Sempre se atualize na [galeria do PowerShell][23].

```PowerShell
Install-Module -Name PSReadLine -RequiredVersion 2.1.0
```

Pronto! Seu PowerShell está totalmente personalizado. *Enjoy*!

### Oh My Zsh

> [Powerline Font][18]

[Oh My Zsh][20] é uma estrutura agradável, de código aberto e orientada para a comunidade para gerenciar sua configuração Zsh. Vem com milhares de funções úteis, auxiliares, plugins, temas e algumas coisas que fazem você gritar. Suporta o shell Linux **Zsh**. Por isso, caso não tenha o ZSH instalado e nem como seu terminal padrão, aconselho a leitura da seção **Instalando o Zsh e alterando para shell padrão** do artigo [Customização do terminal do Linux][19]. Da mesma forma, leia a seção **Powerline Fonts** para acompanhar a instalação das fontes no ambiente Linux.

![omz][omz]

#### Instalar o Oh My Zsh

Toda a documentação mais detalhada pode ser lida na [página **Oh My Zsh** do GitHub][1].

Seguindo o tutorial fornecido por eles, podemos instalá-lo utilizando `curl`, `wget` ou outra ferramenta similar.

| Method    | Command                                                                                           |
|:----------|:--------------------------------------------------------------------------------------------------|
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |

```zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Com isso, o Oh My Zsh estará instalado na sua máquina e assim que o terminal for aberto novamente, já estará ativado e o arquivo `.zshrc`, alterado.

#### Alterar o tema e instalar temas externos

Qualquer alteração a ser feita no Oh My Zsh, deve ser realizada dentro do arquivo `.zshrc`. Uma delas é a alteração de tema, na qual deve ser realizada alterando o valor do parâmetro a seguir com o nome das extensões fornecidas pelo zsh:

```zsh
ZSH_THEME="agnoster"
```

Se os temas padrão não forem do seu agrado, há a possibilidade de realizar a instalação de temas externo, desenvolvidos pela comunidade, podendo ser conferidos pela página do GitHub: [External-Links][2]. Cada um deles tem na descrição os passos para instalação e configuração. Alguns entre os mais utilizado são: zsh2000, powerlevel10k, powerlevel9k, bullet-train, classyTouch, agnosterzak, solus, blokkzh, imp.

Para instalá-los, basta fazer o download do tema pelo GitHub, mover para a pasta `~/.oh-my-zsh/themes` e alterar a variável citada acima, dentro de `.zshrc`. Como exemplo, o download e importação do **powerlevel10k**:

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

```zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

#### Instalar e habilitar plugins

Existem vários plugins que poderão ser utilizados sem nenhuma instalação adicional. Para ver a lista de plugins que por padrão estão no diretório `~/.oh-my-zsh/plugins/` execute:

```zsh
cd ~/.oh-my-zsh/plugins/
ls -a
```

Para configurar algum plugin já disponibilizado pelo Oh My Zsh, é necessário editar também o arquivo `~/.zshrc` adicionando ou removendo na matriz de variáveis os nomes dos plugins, por exemplo:

```zsh
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)
```

Abaixo, estão alguns dos plugins mais utilizados e suas respectivas formas de instalação:

##### zsh-history-substring-search

Adiciona um histórico de pesquisa, na qual, ao digitar qualquer parte de um código, é dada asa respectivas correspondências.

```zsh
git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/zsh-history-substring-search
```

Agora para definir ele como um dos plugins do seu ZSH, entre em `~/.zshrc`, procure uma parte com `plugins=()` e edite:

```zsh
plugins=( git dnf zsh-history-substring-search )
```

##### zsh-syntax-highlighting

Adiciona syntax Highlight no nosso ZSH, facilitando você saber se o comando que está sendo digitado no momento está correto.

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Assim como o plugin anterior (e todos os outros), adicione ao `~/.zshrc`:

```zsh
plugins=( git dnf zsh-history-substring-search zsh-syntax-highlighting )
```

##### zsh-autosuggestions

Adiciona uma auto-sugestão no ZSH baseada em seu histórico, tornando mais fácil a repetição de comandos já utilizados.

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

Da mesma forma:

```zsh
plugins=( git dnf zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions)
```

### Starship

> [Nerd Font][6]

O [Starship][11] fornece uma experiência de prompt de comando personalizada que exibe algumas informações úteis para fornecer contexto do que você está fazendo. Ele suporta todos os shells populares no Linux, macOS e Windows, incluindo **Bash**, **Fish**, **Zsh**, **Powershell** e outros, tornando possível obter um prompt consistente, mesmo que você alterne frequentemente entre diferentes shells.

![starship][starship]

#### Instalar o Starship

Pode ser realizada por qualquer um dos seguintes gerenciadores de pacotes. Verifique a documentação para maiores informações:

| Gerenciador     | Comando                                 |
| --------------- | --------------------------------------- |
| **[crates.io]** | `cargo install starship --locked`       |
| [Chocolatey]    | `choco install starship`                |
| [conda-forge]   | `conda install -c conda-forge starship` |
| [Scoop]         | `scoop install starship`                |

#### Configurar o shell para utilizar Starship

Configure seu shell para inicializar com o Starship. Pela documentação oficial da engine, há a opção para os shells mais utilizados, porém mostraremos apenas para o ZSH e Powershell:

##### PowerShell

Adicione o seguinte ao final da configuração do PowerShell (encontre-o executando $PROFILE):

```powershell
Invoke-Expression ( & starship init powershell)
```

##### ZSH

Adicione o seguinte ao final de `~/.zshrc`:

```zsh
eval  " $( starship init zsh ) "
```

#### Configurar o Starship

Inicie uma nova instância de shell e você deverá ver seu novo prompt. Se você está satisfeito com os padrões, divirta-se!

Se ainda deseja personalizar mais o Starship:

- [Configuração][12] – aprenda a configurar o Starship para ajustar seu prompt ao seu gosto;
- [Presets][13] – inspire-se na configuração pré-construída de outros;

Em suma, essa configuração se baseia na criação de um arquivo no diretório `~/.config`:

```zsh
mkdir -p ~/.config && touch ~/.config/starship.toml
```

Este arquivo carregará toda a personalização do Starship. Abra-o e copie este exemplo para que veja o resultado:

```toml
add_newline = false

[character]
success_symbol = "[⚡](bold green) "
error_symbol = "[❌](bold red) "

[aws]
disabled = true

[time]
disabled = true

[cmd_duration]
disabled = true

[directory]
truncation_length = 8

[hostname]
disabled = true

[nodejs]
symbol = "🤢"

[battery]
full_symbol = "🔋 "
charging_symbol = "⚡️ "
discharging_symbol = "💀 "
disabled = false

[git_status]
conflicted = "🚩"
ahead = "💨"
behind = "😰"
diverged = "😵"
untracked = "🤷"
stashed = "📦"
modified = "📝"
staged = '[++\($count\)](green)'
renamed = "👅"
deleted = "💥"

[shell]
fish_indicator = "🦈"
bash_indicator = "🌞"
disabled = false
```

Caso queira aprimorar, veja a [documentação de configuração da Starship][12] para aprender nais sobre as opções disponíveis.

## Dicas de utilização

### Dividir os prompts

O terminal do Windows suporta a divisão de uma guia em vários painéis. Isso facilita a multitarefa sem precisar alternar entre as guias. O seu funcionamento é semelhante ao `tmux` no WSL, portanto, não é algo para se confiar como WT.

Os atalhos padrão para dividir um painel horizontalmente e verticalmente são <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>-</kbd> e <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>=</kbd>, respectivamente. Também pode-se dividir um painel usando a paleta de comandos que pode ser acessada com <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>:

Se mantiver pressionada a <kbd>Alt</kbd> e em seguida clicar no botão nova guia em um dos perfis no menu suspenso do terminal, ele também dividirá automaticamente a janela ou painel ativo. Para alternar o foco entre os painéis, mantenha pressionada <kbd>Alt</kbd> e use as teclas de seta ou clique no painel desejado. O redimensionamento do painel focado é feito mantendo pressionada <kbd>Alt</kbd>+<kbd>Shift</kbd>+<kbd>Setas</kbd>. Fechar um painel pode ser feito com <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>W</kbd>.

### Personalizar teclas de atalho

Como anteriormente dito, todas as teclas de atalho para comandos do Windows Terminal podem ser personalizadas através da propriedade `actions` (anteriormente `keybindings`) no arquivo `settings.json`. Já se inspecionar o `defaults.json` do seu terminal (mantendo pressionada a tecla <kbd>Alt</kbd> enquanto clica no menu `Configurações`), verá todas as combinações de teclas padrão organizadas em várias categorias na matriz `actions` de nível raiz.

Para adicionar uma nova tecla de atalho para uma ação, basta copiar o objeto de ligação relevante de `defaults.json` para o `settings.json` e alterar o parâmetro `keys` no objeto. Se você modificar o `defaults.json` diretamente, suas alterações serão perdidas quando o programa for atualizado. Por exemplo, as ligações para dividir painéis podem ser personalizadas conforme mostrado abaixo:

```json
{
    "actions": [
        { "command": { "action": "splitPane", "split": "vertical" }, "keys": "alt+v" },
        { "command": { "action": "splitPane", "split": "horizontal" }, "keys": "alt+h" }
    ]
}
```

As linhas acima adicionam novas ligações para a ação `splitPane`, mas as ligações originais permanecerão ativas. Para remover uma ligação de tecla padrão, atribua a chave ao comando `unbound` conforme mostrado abaixo:

```json
{
    "actions": [
        { "command": { "action": "splitPane", "split": "vertical" }, "keys": "alt+v" },
        { "command": { "action": "splitPane", "split": "horizontal" }, "keys": "alt+h" },
        { "command": "unbound", "keys": "alt+shift+-" },
        { "command": "unbound", "keys": "alt+shift+=" }
    ]
}
```

O terminal do Windows também oferece a possibilidade de enviar comandos de entrada para o shell com uma combinação de teclas. Isso é útil para comandos comumente usados, como `cd ~`, `git status`, entre outros. Aqui está um exemplo que se vincula <kbd>Alt</kbd>+<kbd>G</kbd> ao envio de um comando que navega para a raiz da árvore de trabalho em um repositório git:

```json
{
    "actions": [
        { "command": {"action": "sendInput", "input": "cd (git rev-parse --show-toplevel)"}, "keys": "alt+g" }
    ]
}
```

A lista completa de comandos e suas opções pode ser encontrada na [documentação de Ações][14].

### Configurar perfis SSH personalizados

Pode ser útil fazer SSH automaticamente em máquinas remotas através do Terminal do Windows. Isso pode ser feito configurando um novo perfil personalizado por máquina.

```json
{
    "guid":  "{4b8d0cfe-e8be-4ae6-a4ad-88efd65b0880}",
    "hidden":  false,
    "name":  "Failed Experiments",
    "commandline":  "wsl ssh user@localhost",
    "icon": "🤡"
}
```

O parâmetro `guid` deve ser único entre os perfis. Você pode fazer alterações em um existente ou gerá-lo online com o [Guid Generator][15]. Em relação ao `icon`, você pode usar um caractere emoji (v1.5 ou posterior) ou digitar o caminho para um arquivo de imagem adequado (.ico). Depois de salvar o arquivo de configurações, você deverá ver sua nova entrada semelhante à captura de tela abaixo.

<p align="center">
  <img width="300px" src="https://ik.imagekit.io/freshman/windows-terminal-25_NTXSvREH3mQ_.png" />
</p>

Depois de clicar na entrada, se conectará automaticamente ao servidor remoto em sua distribuição Linux preferida.

### Personalizar layout de inicialização

O terminal do Windows é iniciado com uma única guia e um único painel usando seu perfil padrão, mas você pode personalizar esse comportamento por meio de [argumentos de linha de comando][16]. Aqui está um exemplo que inicia o terminal com um layout personalizado de três painéis divididos em uma única guia. Os painéis estão executando um perfil WSL , um perfil do PowerShell e um perfil de prompt de comando, respectivamente.

```cmd
wt; split-pane -p "Windows PowerShell"
```

- `wt` por conta própria inicia uma nova janela com uma única guia e um único painel com o perfil padrão. Cada comando posterior deve ser separado por um ponto e vírgula.
- `split-pane` divide o painel atual em dois padrão `auto` se você não especificar uma direção (`-H` ou `-V`). O sinalizador `-p` permite que você especifique o tipo de perfil que deseja abrir por nome ou guid.

Depois de definir seu layout de inicialização preferido, você pode vinculá-lo a uma tecla de atalho usando o [AutoHotkey][2] ou criar um novo atalho do Windows e fixá-lo na área de trabalho ou na barra de tarefas.

### Instalar o módulo Z

**Z** é um utilitário fantástico e simples para se mover entre os diretórios mais rápido. À medida que você se move em sua máquina na linha de comando, Z está adicionando os diretórios que você costuma visitar a um arquivo e, em seguida, usando esse arquivo para fornecer preenchimento automático instantâneo para que você possa voltar RÁPIDO.

No Windows 10/11, o Z pode ser instalado como um módulo:

```powershell
Install-Module z -AllowClobber
```

Em seguida, basta adicionar `Import-Module z` ao final do seu perfil, geralmente em `$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`.

## Conclusão

Neste post, discutimos várias maneiras de personalizar o Windows Terminal. Espero que tenha ajudado você a melhorar seu fluxo de trabalho e produtividade na linha de comando. Se tiver mais dicas, compartilhe-as pelo GitHub, e para melhorias, sinta-se a vontade para contribuir seguindo as [diretrizes de contribuição do projeto][17].

🙏🏻 Obrigado pela leitura e boa codificação!

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
[11]: https://github.com/starship/starship
[12]: https://starship.rs/config/
[13]: https://starship.rs/presets/
[14]: https://docs.microsoft.com/en-us/windows/terminal/customize-settings/actions#action-properties
[15]: https://www.guidgenerator.com/
[16]: https://docs.microsoft.com/en-us/windows/terminal/command-line-arguments
[17]: ../Docs/CONTRIBUTING.md
[18]: https://github.com/powerline/fonts
[19]: https://github.com/JonathanTSilva/HL-Linux/blob/main/Articles/terminalLinux.md
[20]: https://github.com/ohmyzsh/ohmyzsh
[21]: https://ohmyposh.dev/docs/config-overview
[22]: https://gist.github.com/shanselman/
[23]: https://www.powershellgallery.com/packages/PSReadLine/2.1.0
[24]: https://gist.github.com/JonathanTSilva

<!-- IMAGENS -->
[wsl-installation]: ../Images/wsl-installation.png
[winTerminal-full]: ../Images/winTerminal.png
[starship]: https://ik.imagekit.io/freshman/starship-fish_S9i51r-Tol.png
[sshProfile]: https://ik.imagekit.io/freshman/windows-terminal-25_NTXSvREH3mQ_.png
[iconsDir]: ../Images/iconsDir.png
[omp]: https://docs.microsoft.com/pt-br/windows/terminal/images/custom-prompt.png
[omz]: https://pythonautomationtutorial.com/static/img/python-oh-my-zsh-eg.png
