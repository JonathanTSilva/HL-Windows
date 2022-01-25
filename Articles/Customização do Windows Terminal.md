<!-- Simple logo -->
<a href="#customização-do-windows-terminal"><img width="200px" src="https://res.cloudinary.com/practicaldev/image/fetch/s--oU6tDKnH--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/x9t7lxm2kvwliuy4yh73.png" align="right" /></a>

# Customização do Windows Terminal

 Um guia de como customizar o Windows Terminal.

<!-- Table of Contents -->
- [Customização do Windows Terminal](#customização-do-windows-terminal)
  - [Instalar o WSL (Windows Subsystem for Linux)](#instalar-o-wsl-windows-subsystem-for-linux)


O Windows Terminal oferece uma experiência de linha de comando muito aprimorada no Windows 10 (superior). Está repleto de características úteis como uma aceleração de GPU, tabs, painéis, temas e atalhos, além de um suporte completo para diferentes ambientes, tal como o PowerShell, Prompt de Comando e WSL. Neste artigo, será descrito algumas maneiras de adaptar as experiências com o terminal de acordo com suas necessidades, alé, de dicas e truques para tornar sua experiência muito melhor.

O aplicativo do Windows Terminal está disponível na Microsoft Store, mas também na sua [página de lançamentos do GitHub][1]. Entretanto, caso faça download por lá, perderá as atualizações automáticas. Há uma outra opção também para quem quer estar na frente dos próprios lançamentos, que é o Windows Terminal Preview, que contém os recursos mais recentes à medida que são desenvolvidos.

Uma vez instalado, ao inciar o Windows Terminal será criado um perfil padrão que mostrará os seus shells na ordem: PowerShell, Prompt de Comando, todas as distribuições WSL instaladas e o Azure Cloud Shell. Ao final deste artigo, você conseguirá atualizá-lo de acordo com sua preferência.

O primeiro passo a ser realizado é instalar todas os shells que você precisa, incluindo as distribuições WSL e o novo PowerShell. Todas elas podem ser baixadas pela Microsoft Store. Entretanto, antes de baixar suas distribuições, o WSL deve estar instalado e configurado em sua estação de trabalho.

## Instalar o WSL (Windows Subsystem for Linux)

A princípio, é necessário configurar sua estação para receber a virtualização por WSL, habilitando o recurso opcional Plataforma de Máquina Virtual. O computador exigirá funcionalidades de virtualização para usar esse recurso.
Sendo assim, há duas maneiras de realizar ativação, por linha de comando:

```zsh
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

ou abrindo o **Recursos do Windows** e ativar o 

Pode-se instalar tudo o que precisa para executar o WSL (Subsistema do Windows para Linux) inserindo este comando no PowerShell administrador ou no prompt de comando do Windows e reiniciando o computador:

```zsh
wsl --install
```

Esse comando habilitará os componentes opcionais necessários, baixará o kernel mais recente do Linux, definirá o WSL 2 como padrão e instalará uma distribuição do Linux para você (Ubuntu, por padrão, veja abaixo como alterar isso).

Na primeira vez que você iniciar uma distribuição do Linux recém-instalada, uma janela de console será aberta e será solicitado que você aguarde para que os arquivos sejam descompactados e armazenados em seu computador. Todas as futuras inicializações deverão levar menos de um segundo.

Para instalar outras distribuições Linux, assim como já dito, fazê-lo pela Microsoft Store. Caso queira listar os sistemas disponíveis no WSL ou aqueles que estão rodando do subsistema Windows, executar os comandos:

```zsh
wsl --list --all
wsl --list --running
```

O comando `wsl --shutdown` é um caminho rápido para reiniciar as distribuições do WSL 2, mas ele desligará todas as distribuições em execução e, portanto, será usado com sabedoria.


<!-- Markdown Links -->
<!-- SITES -->
[1]: https://github.com/microsoft/terminal/releases

<!-- IMAGES -->