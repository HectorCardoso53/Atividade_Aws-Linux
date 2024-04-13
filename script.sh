#interpretador de comandos a ser utilizado é o !/bin/bash.

service_name="Apache" # contém o nome do serviço, neste caso, Apache.
current_date=$(date +"%Y-%m-%d") # Comando para obter a data atual
current_time=$(date +"%H:%M:%S") # Comando para obter a hora atual

if systemctl is-active httpd; then  #Este é um comando verifica se o serviço Apache (httpd) está ativo.
    echo "Data: $current_date Hora: $current_time - $service_name - Serviço HTTPD - Status: O serviço está online" >> "/mnt/efs/Hector/httpd-online.txt" #Se o serviço Apache estiver ativo, se não
else
    echo "Data: $current_date Hora: $current_time - $service_name - Serviço HTTPD - Status: O serviço está offline" >> "/mnt/efs/Hector/httpd-offline.txt" #Se o serviço Apache estiver inativo
fi #Esta linha fecha o bloco do comando, indicando o fim do comando a ser executado caso o serviço Apache esteja ou não esteja ativo.


