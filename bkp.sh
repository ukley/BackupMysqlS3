#!/bin/bash
 
# DATA vai imprimir a data no estio dia-mes-ano
DATA=`/bin/date +%d-%m-%Y`

# NOME armazena o nome do arquivo de backup e
# o diretorio onde o arquivo será salvo no meu caso
# /www/virtual/backup é uma pasta publica do apache,
# coloque o diretório onde quer guardar o backup.

NOME="/var/backups/nomebkp-$DATA.sql"


# variaveis do MySQL
HOST="localhost"
USER="user"
PASSWORD="password"
DATABASE="name_database"

mysqldump -h $HOST -u $USER -p$PASSWORD $DATABASE > $NOME

#Envia para aws s3
aws s3 cp $NOME s3://name-bucket-s3

logger -s -f /var/log/bkplogs

echo "Backup realizado com sucesso"

exit


