# ESI-PROJETO-RUBY

## Diretórios:

* src -> conterá todo o código fonte
* utils -> conterá links úteis + documentação necessária

## Introdução

## Instalação

Para que seja possível rodar o projeto, serão necessárias algumas instalações. Seu computador deve possuir memória o suficiente que suporte rodar uma máquina virtual, caso não tenha Linux como seu sistema operacional principal.

### VMware && Ubuntu

Para que rode o ambiente com a máquina virtual, é necessário primeiro possuir uma. Iremos utilizar a máquina virtual da VMware, o VMware Workstation Player, disponível através do link: <https://www.vmware.com/br/products/workstation-player/workstation-player-evaluation.html>. É um programa gratuito(nesta versão).

Após feito o download e instalação da VMWP, baixe a `.iso` da distribuição Ubuntu 18.04.2 para que todos tenham a maior compatibilidade possível com o projeto. Disponível em: <https://ubuntu.com/download/desktop>, o arquivo pesa cerca de 1.9 Gigabytes.

(A complementar sobre como colocar e iniciar uma VM com a .iso ...)

### Programas

Rodar o projeto exige instalação de programas adicionais que não estão presentes por padrão na distribuição. Para agilizar um pouco o procedimento, abra o terminal dentro do Ubuntu, para rodar os comandos, use `sudo` para ter voz de administrador. Execute então `sudo apt-get update` e aguarde ele terminar de buscar os dados. Após essa execução, rode `sudo apt-get upgrade` para atualizar os pacotes e serviços existentes do Ubuntu para as mais novas versões.

#### Essenciais

`sudo apt-get install curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev`

#### Git

Git é um programa de versionamento de código amplamente utilizado pelo mundo do desenvolvimento.

`sudo apt-get install git`

Para configurar o Git, use:
```bash
git config --global color.ui true
git config --global user.name "USERNAME QUE CADASTROU NO GITHUB"
git config --global user.email "EMAIL QUE CADASTROU NO GITHUB"
git config --global user.password "SENHA QUE CADASTROU NO GITHUB"
```

Depois de feita a configuração, você pode baixar este repositório no seu computador (VMWP no caso, ou não) se o ainda não fez.

#### Node.js

O **Node.js** é uma importante ferramenta de servidores atualmente, consegue-se fazer um FullStack inteiro com este servidor e um Front-End em JavaScript, mas isso não vem ao caso, como utilizaremos Ruby, o JavaScript será suporte para nossas operações no navegador do cliente.

Para instalar, precisamos primeiro colocar o PPA do Node.js para baixarmos:

```bash
sudo apt-get install curl python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```

Uma vez feito com sucesso, podemos executar o comando de instalação:

```bash
sudo apt-get install nodejs
```

E estaremos prontos para levantar um servidor com Node.js.

#### Gerenciador de versões do Ruby

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

#### Versão específica do Ruby

```bash
rbenv install 2.6.1
rbenv global 2.6.1
ruby -v
```

#### Bundler Gem

```bash
gem install bundler
rbenv rehash
```

#### Ruby on Rails

```bash
gem install rails -v 5.2.2
rails -v
```

#### MySQL

Criando o banco de dados (**RODAR SOMENTE SE FOR A PRIMEIRA VEZ**)
Cuidado, esta parte da instalação pode gerar diversos problemas.

```bash
sudo apt install mysql-client-core-5.7
sudo apt-get install mysql-server
mysql -u root -p
```

Colocar a senha do sudo do Ubuntu.

```sql
CREATE DATABASE app_development;
CREATE DATABASE app_test;
GRANT ALL PRIVILEGES ON app_development.* TO 'rails.user'@'localhost' IDENTIFIED BY 'Rails@123';
GRANT ALL PRIVILEGES ON nome_da_aplicacao_test.* TO 'rails.user'@'localhost' IDENTIFIED BY 'Rails@123';

```

OBS: rails.user → usuário e  Rails@123 → senha

## Executando

Execute o projeto Rails através do Terminal, estando na pasta `app`, clonada do repositório, ela se localiza dentro de `src`.

```bash
rails s 
```

Abra seu browser e vá para o endereço <http://localhost:3000>, seu projeto estará lá.

## Links úteis

<https://www.devmedia.com.br/ruby-on-rails-tutorial/31285>
<https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/>
