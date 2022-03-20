# Sistema de armazenamento de estado
Atividade avaliativa da 1a unidade de Servidores de Redes.

## Requisitos:
1. Ter o servidor web apache2 instalado em sua máquina
2. Muita coragem

## Funcionalidades:
Este sistema irá coletar dados sobre a máquina e configura uma página HTML que irá conter as seguintes informações:
- Das 07h às 23:59 estará disponível uma página que será atualizada a cada 2 minutos com o seguinte:
  - Hora com minutos da coleta de dados
  - Nome da máquina
  - Total de memória RAM usada
  - Total de memória RAM disponível
  - O nome do processo que utiliza mais memória e o total de memória RAM utilizada
  - A listagem das partições contendo ponto de ponto de montagem, tamanho e percentagem de utilização
  - O total de bytes e pacotes enviados e recebidos em cada interface de rede
- Das 00h às 6:59 o site irá exibir uma página informando que o site está em manutenção

## Instalação:
- Extraia os arquivos em qualquer pasta
- Conceda permissões root de execução para o ***main.sh*** e todos os outros scripts que estão na pasta ***scripts***:
```
$ sudo chmod a+x <nome_script>
```
- Feito isso, execute o ***main.sh***
```
sudo ./main.sh
```
- Se tudo tiver dado certo, a página estará pronta e executando
- Para acessar a página, digite o seguinte no navegador:
```
atividade.info
```
- Se não funcionar, digite o seguinte:
```
http://127.0.0.5
```
- Caso algo tenha dado errado, será necessário excluir todas os arquivos criados/movidos durante a execução do ***main.sh*** e remover as entradas estabelecidas no cron

## Sobre os scripts:
- main.sh
  - Responsável por configurar o apache2 e mover as pastas para os diretórios necessários
- gerar_log.sh
  - Responsável por criar um arquivo de log e criar uma página HTML contendo todas as informações do log
- gerar_html_manutencao.sh
  - Responsável por gerar a página de manutenção
- cron_job.sh
  - Seta os horários de execução dos scripts de gerar as páginas de log e de manutenção

## Imagens de exemplo:
- Página de manutenção:
![Alt text](/manutencao.png "Manutenção")
- Página de log do sistema:
![Alt text](/demonstracao_log.gif)

## Erros conhecidos:
- Se a página não carregar após 1 ou 2 minutos, vá até a pasta ***var/www/scripts***, execute o script ***gerar_log.sh*** e tente carregar a página novamente
