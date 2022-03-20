#! /bin/bash

DIRNAME=/var/www/scripts
cd ${DIRNAME}

analise_sistema () {
data=`date --iso-8601=seconds`
echo "<b>Data e hora da coleta dos dados: $data</b>"
echo "Nome da máquina analisada: "`hostname`
echo
echo "Dados de memória:"

memoria_usada=`free -m | grep "Mem" | awk '{print $3}'`
  echo "<li>Memória usada: $memoria_usada MB</li>"

memoria_disponivel=`free -m | grep "Mem" |awk '{print $7}'`
  echo "<li>Memória disponivel: $memoria_disponivel MB</li>"

pid_processo=`top -b -o +%MEM | head -n 8 | tail -2 | grep ":" | awk '{print $1}'`
memoria_processo=`top -E m -b -o +%MEM | head -n 8 | tail -2 | grep ":" | awk '{print $6}'`
nome_processo=`ps -p $pid_processo -o comm=`
  echo "Processo consumindo mais memória:"
  echo "<li>PID = $pid_processo</li>"
  echo "<li>Uso de memoria = $memoria_processo</li>"
  echo "<li>Nome do processo = $nome_processo</li>"

echo "Partições:"
listar_particoes=`df -h --output=source,fstype,size,pcent,used,target -x tmpfs -x devtmpfs | sed 's/  */ /g'`
  echo "$listar_particoes"

echo

echo "Interfaces de rede"
instancia_interface=1
num_interfaces_rede=`cat /proc/net/dev | grep -c ":"`

while [ $instancia_interface -le $num_interfaces_rede ]
do
  nome_interfaces_rede=`cat /proc/net/dev | grep ":" | head -n $instancia_interface | tail -1  | awk '{print "Interface de rede: " $1,"| Bytes recebidos: " $2,"| Pacotes recebidos: " $3,"| Bytes transmitidos: " $10, "| Pacotes transmitidos: " $11}'`
  echo "<li>$nome_interfaces_rede</li>"
  instancia_interface=$(( $instancia_interface + 1))
done

echo "
  <div class="individual_footer">
    <br>Fim do log do horário: $data</br>
  </div>
"
}
 
criar_html () {
echo "
<!DOCTYPE html>
<html lang="en">
<head>
<title>Log do sistema</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@500&display=swap');

/* estilo do corpo */
body {
  font-family: 'Fredoka', sans-serif;
  background: #F8F8FF;
  margin: 0;
}

/* cabeçalho e titulo */
.header {
  padding: 10px;
  text-align: center;
  background: #FF4500;
  color: white;
  font-size: 20px;
}

/* conteúdo da página */
.content {
    padding:15px;
}


/* rodapé individual de cada log */
.individual_footer{
  padding: 15px;
  text-align: left;
  background: #B22222;
  color: white;
  font-size: 15px;
}

</style>
</head>
<body>

<div class="header">
  <h1>Log da coleta dos dados</h1>
  <h2>Esta página será atualizada a cada 2 minutos</h2>
</div>

<div class="content">
"
while read line
do
    echo "<br />$line"
done < saida.txt

echo "</div>

</body>
</html>"
}

analise_sistema >> saida.txt
criar_html > index.html

sudo mv index.html /var/www/atividade.info/html
