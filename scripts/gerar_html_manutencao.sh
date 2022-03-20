#! /bin/bash

DIRNAME=/var/www/scripts
cd ${DIRNAME}

tela_manutencao () {
echo "<!DOCTYPE html>
<html lang="en">
<head>
<title>Manutenção ocorrendo</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@500&display=swap');

/* estilo do corpo */
body {
  font-family: 'Fredoka', sans-serif;
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

/* imagem de manutenção */
img {
  background: #eaeaed;
  border: 4px solid #9799a7;
  float: middle;
  margin: 8px 0 0 20px;
  padding: 2px;
}

/* conteúdo da página */
.content {padding: 50px;
}

</style>
</head>
<body>

<div class="header">
  <h1>!!!ATENÇÃO!!!</h1>
  <h2>Horário de manutenção: 00:00 até 06:59</h2>
  
</div>

<div class="img">
<center><img src="img/manutencao.jpg"
    alt="manutenção" /></center>
</div>

<div class="content">
<center><b>O site retornará ao ar a partir das 7hrs</b></center>
</div>

</body>
</html>
"
}

tela_manutencao > index.html

sudo mv index.html /var/www/atividade.info/html
