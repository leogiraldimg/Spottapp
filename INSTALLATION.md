# Instalação

Para que seja possível rodar o projeto, serão necessárias algumas instalações. Seu computador deve possuir memória o suficiente que suporte rodar uma máquina virtual, caso não tenha Linux como seu sistema operacional principal.

## VMware && Ubuntu

Para que rode o ambiente com a máquina virtual, é necessário primeiro possuir uma. Iremos utilizar a máquina virtual da VMware, o VMware Workstation Player, disponível através do link: <https://www.vmware.com/br/products/workstation-player/workstation-player-evaluation.html>. É um programa gratuito(nesta versão).

Após feito o download da VMWP, baixe a `.iso` da distribuição Ubuntu 18.04 para que todos tenham a maior compatibilidade possível com o projeto. Disponível em: <https://ubuntu.com/download/desktop>, o arquivo pesa cerca de 1.9 Gigabytes.

### Instalação da VMware e Ubuntu

Execute o programa de instalação da VMware, aceite os termos e passe para a próxima tela, até chegar na parte de *User Experience Settings* (Configuração da Experiência de Usuário), desabilite a segunda opção do programa de usuário da VMware, dê *next*, *next* e instale.

Após a instalação, abra o programa do VMWP. Selecione a licença para uso não comercial. E então crie uma nova máquina virtual com *Create a New Virtual Machine*. Selecione o `.iso` da distribuição Ubuntu que baixamos para utilizar em *Installer disc image file*. Dê *Next* e coloca um nome para sua máquina virtual, um nome de usuário e uma senha. Passe para a próxima etapa, agora selecione a quantidade de disco físico que você irá disponibilizar para a máquina virtual, sugiro entre 30Gb e 40Gb por garantia. Vá para a próxima etapa, e desabilite a opção de dar *boot* assim que terminar a criação para evitar problemas.

Se tudo ocorreu como planejado, sua máquina virtual com Ubuntu está pronta para ser utilizada! Agora é só iniciar a máquina.

**Observação importante: O seu processador deve suportar a funcionalidade Intel "VMX Unrestricted Guest" para executar.**

## Programas

Rodar o projeto exige instalação de programas adicionais que não estão presentes por padrão na distribuição. Para agilizar um pouco o procedimento, abra o terminal dentro do Ubuntu, para rodar os comandos, use `sudo` para ter voz de administrador. Execute então `sudo apt-get update` e aguarde ele terminar de buscar os dados. Após essa execução, rode `sudo apt-get upgrade` para atualizar os pacotes e serviços existentes do Ubuntu para as mais novas versões.

### Essenciais

`sudo apt-get install curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev`

### Git

Git é um programa de versionamento de código amplamente utilizado pelo mundo do desenvolvimento.

`sudo apt-get install git`

Para configurar o Git, use:
```bash
git config --global color.ui true
git config --global user.name "USERNAME QUE CADASTROU NO GITHUB"
git config --global user.email "EMAIL QUE CADASTROU NO GITHUB"
git config --global user.password "SENHA QUE CADASTROU NO GITHUB"
```

Depois de feita a configuração, você pode **baixar este repositório** no seu computador (VMWP no caso, ou não) se o ainda não fez.

### Node.js

O **Node.js** é uma importante ferramenta de servidores atualmente, consegue-se fazer um FullStack inteiro com este servidor e um Front-End em JavaScript, mas isso não vem ao caso, como utilizaremos Ruby, o JavaScript será suporte para nossas operações no navegador do cliente.

Para instalar, precisamos primeiro colocar o PPA do Node.js para baixarmos:

```bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```

Uma vez feito com sucesso, podemos executar o comando de instalação:

```bash
sudo apt-get install nodejs
```

E estaremos prontos para levantar um servidor com Node.js.

### Gerenciador de versões do Ruby

Para termos um ambiente padrão, vamos criar um `rbenv` que será o gerenciador de versões do Ruby e do seu framework, o Rails.

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv version
```

### Versão específica do Ruby

Para podermos rodar o projeto, devemos possuir a linguagem de programação Ruby e seu ambiente, dado isso vamos baixá-la através do nosso gerenciador de versões.

```bash
rbenv install 2.6.1
rbenv global 2.6.1
ruby -v
```

### Bundler Gem

O Bundler Gem é o gerenciador de "gemas" do Ruby, ele controla os pacotes, que são as gemas, que serão instaladas ao ambiente.

```bash
gem install bundler
rbenv rehash
```

### Ruby on Rails

O Framework necessário para o desenvolvimento Web com Ruby.

```bash
gem install rails -v 5.2.2
rails -v
```

### MySQL

Criando o banco de dados (**RODAR SOMENTE SE FOR A PRIMEIRA VEZ**)
Cuidado, esta parte da instalação pode gerar diversos problemas.

```bash
sudo apt install mysql-client-core-5.7
sudo apt-get install mysql-server
sudo apt-get install libmysqlclient-dev
sudo mysql -u root -p
```

Colocar a senha do sudo do Ubuntu.

Uma vez dentro do MySQL Console, rode estes comandos:

```sql
CREATE DATABASE app_development;
CREATE DATABASE app_test;
GRANT ALL PRIVILEGES ON app_development.* TO 'rails.user'@'localhost' IDENTIFIED BY 'Rails@123';
GRANT ALL PRIVILEGES ON app_test.* TO 'rails.user'@'localhost' IDENTIFIED BY 'Rails@123';

```

OBS: rails.user → usuário e  Rails@123 → senha

Depois de executados, digite `exit` para voltar ao terminal normal.

### Visual Studio Code

O Visual Studio Code é uma IDE/Editor da Microsoft que está sendo utilizada mundialmente e atualizada diariamente, sua performance é muito boa e possui uma vasta gama de extensões que podem ser utilizadas e ajudarem na sua produtividade.

O programa não fica disponível nativamente no repositório do sistema operacional, para obtê-lo, devemos instalar um programa que também gerencia repositórios ou programas chamado *Snapd*, para instalá-lo, basta rodar o comando no terminal:

```bash
sudo apt-get install snapd
```

Assim que o gerenciador for instalado, podemos instalar o VSCode através do comando:

```bash
sudo snap install code --classic
```

E uma vez pronto, você já pode desenvolver usando esta ferramenta maravilhosa!

### Bundles

Antes de executarmos o nosso projeto, precisamos construir as nossas bibliotecas do projeto para que ele execute e instale as adicionais faltantes. Para fazermos isso, rode o seguinte comando dentro da pasta `/app`, que se localiza em `/src`:

```bash
bundle install
```

## Executando

Execute o projeto Rails através do Terminal, estando na pasta `app`, clonada do repositório, ela se localiza dentro de `src`.

```bash
rails s 
```

Abra seu browser e vá para o endereço <http://localhost:3000>, seu projeto estará lá.

## Links úteis

<https://www.devmedia.com.br/ruby-on-rails-tutorial/31285>
<https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/>
