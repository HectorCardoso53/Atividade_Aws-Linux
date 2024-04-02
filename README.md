# Atividade_Aws-Linux
## Execução da atividade
### Requisitos no AWS:
### Gerar chave pública para acesso ao ambiente:

1.No console AWS, vá para o Painel EC2:

2.No menu posicionado ao lado esquerdo da tela, vá até a seção Rede e Segurança e clique em Pares de Chaves;

3.Na próxima tela, no lado superior direito, clique em Criar par de chaves;

4.A tela de criação será aberta e nela você poderá escolher um nome para o par de chaves. No meu caso, criei a chave "HectorSSH.pem"

5.Mantenha as configurações restantes e na opção Formato de arquivo de chave privada, selecione o formato. pem, necessário para acessar a instância via Linux, como iremos fazer;

6.Feito isso, basta clicar em Criar Par de Chaves;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/63403cdc-c4cc-4f8b-bc0a-ed96752644bd)

7.Salve em lugar seguro (no meu caso salvei em na pasta Downloads) e pronto, o par de chave estará disponível e listado no menu.

### AWS: Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Famíliat3.small, 16 GB SSD):

1.No Painel EC2 no console AWS, clique em Instâncias no menu ao lado esquerdo da tela;

2.Na próxima tela, no lado superior direito, clique em Executar instância;

3.Agora é possível criar um nome para a instância e criar tags. Nome: PB UFOPA, CostCenter: C092000024 e Project: PB UFOPA, de acordo com as recomendações dos professores.

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/740bd73e-62d4-45c7-9afc-416d3b1d53c3)

4.Selecione o sistema Amazon Linux AWS e, em seguida a imagem Amazon Linux 2 AMI (HVM), SSD Volume Type;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/4ff3e5d4-49bf-4471-ba64-2f4e2d2034d8)

5. Em Tipo de instância, escolha t3.small;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/9cf0c1cf-5cf1-4cd7-90ff-335198b0dd5d)

6.Em Par de Chaves, selecione a chave criada anteriormente;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/f49ce9f9-2154-4c5a-910b-7bf5c6a03e45)

7.Em configurações de Rede, selecione a opção Criar Grupo de segurança;

8.Ainda nessa seção, deixe marcada a opção Permitir tráfego SSH de Qualquer Lugar (0.0.0.0/0);

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/1b9276f4-05ae-46c2-8ca7-9cc5f565e11b)


9. Em Configurar Armazenamento, coloque 16gb de armazenamento gp2(SSD);

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/7db6c280-3925-4f3c-9dfe-38494ae24d7e)

10.Revise as configurações e clique em Executar Instância.

### AWS: Gerar 1 Elastic IP e anexar à instância EC2

1.	Na página do serviço EC2, no menu lateral esquerdo, em Rede e Segurança, clique em IPs elásticos;
2.	Clique em Alocar endereço IP elástico;
3.	Por padrão, o Grupo de borda de Rede já vem selecionado, assim como o Conjunto de endereços IPv4 públicos da Amazon;
4.	Clique em Alocar;
5.	Depois da criação, selecione o IP na lista, clique em Ações no menu superior e depois em Associar endereço IP elástico;
6.	Selecione a instância EC2 criada anteriormente;
7.	Depois de selecionar a instância será preciso selecionar o endereço IP privado, que será sugerido pela própria plataforma, bastando confirmar;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/72a417f3-00a8-4efd-8d43-aaeb9983804f)

### AWS : Liberar as portas de comunicação para acesso público
1.	Na página do serviço EC2, no menu lateral esquerdo, em Rede e Segurança, clique em Grupo de Segurança;
2.	Selecione o grupo de segurança que foi criado com a instância EC2;
3.	Clique em Regras de entrada, na parte inferior, e depois, do lado direito da tela, em Editar regras de entrada;
4.	Por padrão, já temos uma regra de entrada, do Tipo SSH, no Intervalo de portas 22, Protocolo TCP. Essa regra será mantida;
5.	Clique em Adicionar regras. Agora iremos acrescentar a liberação de outras portas, além da 22 que já consta, conforme indicado na tabela abaixo:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/e7214457-f7f4-4515-abae-a58acab6f203)

6.	Clique em Salvar regras.

# Requisitos no linux:

### AWS : Servidor NFS a partir do Elastic File System (EFS) - Security Group

Para configurarmos um servidor NFS na máquina Linux nos próximos passos, vamos utilizar o serviço EFS da própria AWS.
Antes, vamos configurar um grupo de segurança que será utilizada para a rede do EFS mais adiante.
1.	Vá até o Painel EC2 da AWS e clique em Security groups;
2.	Clique em Criar grupo de segurança;
3.	Atribua um nome;
4.	Selecione a mesma VPC em que se encontra a instância. Ela aparecerá listada para você;
5.	Em Regras de entrada adicione uma regra seguindo o modelo abaixo:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/adcf7907-7d4c-4136-93d6-f26d73297753)

6.	Quando for escolher o campo Origem, escolha a opção Personalizado e, na caixa ao lado, role a barra até encontrar o grupo de segurança que foi criado para a instância EC2 que vamos acessar. Dessa forma, os dois grupos de segurança estarão conectados, cada um com seu objetivo.
7.	Clique em Criar grupo de segurança para finalizar.

   
### AWS :Criando o serviço de Elastic File System (EFS)

1.	No console AWS, navegue até o serviço de EFS;
2.	No menu lateral esquerdo, clique em Sistemas de arquivos e, na sequência, em Criar sistema de arquivos;
3.	Adicione um nome para o sistema de arquivos e selecione a opção Personalizar;
4.	Marque a opção One zone e selecione a mesma zona de disponibilidade em que sua instância foi criada e avance;
5.	Mantenha as opções pré-definidas, altere apenas o grupo de segurança para o grupo que criamos para o serviço EFS;
6.	Revise as informações e clique em Criar para terminar;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/2bf6df64-b101-407f-8218-d2a48953b5fa)

7.	Na lista de sistemas criados, abra o sistema de arquivos recém-feito e clique no botão Anexar para visualizar as opções de montagem (IP ou DNS);

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/e7cd893e-0d4c-49a7-a954-032e38bf3b52)

8.	A AWS já nos apresenta comandos definidos de acordo com as opções escolhidas. Aqui, vamos utilizar a montagem via DNS usando o cliente do NFS. Copie-o e salve em um bloco de notas, pois irá precisar dele mais adiante. O comando segue o seguinte modelo:
``_sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 [DNS do EFS]:/ /mnt/efs._``


### SSH LINUX: Acessando a instância via SSH;

1.	Abra o terminal linux;
2.	A estrutura para acessar via ssh no linux é ``_"ssh -i ~ /Downloads/HectorSSh.pem ec2-user@54.198.108.39"_``;
3.	Se essa for a primeira vez que você se conectou a essa instância, o linux exibirá uma caixa de diálogo de alerta de segurança dizendo que qualquer pessoa pode visualizar essa chave.
4.	No próximo passo terá que ser mudado a regra para somente leitura par que somente o usuário possa vê essa chave, usando ``_o comando chmod 400 e caminho da chave_``;
5.	Em seguida, será aberta a tela do terminal da máquina linux da instância.

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/e6566c56-1b51-4ad5-b322-a19a09d6e26d)


### Linux : Montando o sistema de arquivos do EFS na máquina

A partir de agora nossas ações serão feitas no terminal Linux da instância EC2 .

Entre com o comando ``_sudo su_`` para ganhar privilégios administrativos.

1.	Execute o comande de atualização do sistema ``_sudo yum update -y_`` antes de iniciar instalações, para garantir que serão sempre as versões mais atualizadas dos arquivos Linux que rodarão;
2.	Com o comando ``_sudo yum install -y amazon-efs-utils_`` instale o pacote para suporte ao NFS. É um protocolo que permite compartilhar diretórios e arquivos entre sistemas operacionais em uma rede.;
3.	Utilize o comando ``_sudo mkdir /mnt/efs_`` para criar um diretório local que servirá como ponto de montagem;
4.	Agora vamos montar o sistema de arquivos. Para isso, é preciso utilizar o comando que foi copiado anteriormente, ``_sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-09726e305452f8b6f.efs.us-east-1.amazonaws.com:/ /mnt/efs_``


![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/40b9a9dc-58e9-4da7-8a0a-6ae74fbc109f)

### Linux : Configurando Apache

1.	Atualize os pacotes do sistema com o comando ``_sudo yum update -y_``;
2.	Instale o Apache com o comando ``_sudo yum install httpd -y_``;
3.	Inicie o Apache no sistema com o comando ``_sudo systemctl start httpd_`` ;
4.	Para o Apache iniciar automaticamente, execute o comando `` _sudo systemctl enable httpd_ ``;
5.	Verifique se o apache está em execução através do comando ``sudo systemctl status httpd``;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/5e172bde-077b-49a2-ac60-2948ed1d1ef3)

6.	O Apache já vem com uma página inicial padrão que pode ser acessada através da digitação do IP público da ec2 na barra de endereço de um navegador. Mas também é possível editar essa página HTML para que exiba o que você quiser. Isso é feito a partir de um arquivo index que pode ser criado dentro do diretório do Apache;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/0edf3448-ea26-45c3-838d-5ad19878e0c5)


7.	Para criar/editar esse arquivo, digite o comando sudo nano index.html. O arquivo HTML que você digitar nesse documento é o que será mostrado na página acessada pelo IP público. Veja a seguir um exemplo de documento HTML para o serviço:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/5ef7035c-cf0a-4815-bde4-27681980b47b)

8.	Para salvar o documento no editor nano, aperte ctrl+x, depois y e confirme apertando enter;
9.	Para acessar a página e ver se funcionou, basta colar o IP público da instância (informação disponível nos detalhes da instância na AWS) na barra de endereço de um navegador.

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/48d70d61-c3d4-48f5-8471-1af8a9f6a935)

### LINUX : Criando um script que valide se o serviço está online ou offline e envie o resultado da validação para o seu diretório no NFS

Para criar um script será necessário utilizar um editor de texto (utilizaremos o nano) e, ao final do nome do arquivo, devemos atribuir a extensão .sh.
Devemos lembrar que, para essa atividade, o script deve conter data, hora, nome do serviço, status e mensagem personalizada de ONLINE ou OFFLINE.
O script também deve gerar 2 arquivos de saída: um para o serviço online e outro para o serviço offline.
1.	Execute o comando nano service_status.sh para criar e abrir o arquivo do script. É importante criar o script dentro do diretório EFS. Aqui vamos salvá-lo no caminho /mnt/efs/Hector;
2.	Dentro do arquivo, digite o script desejado. O script criado para essa atividade pode ser observado na imagem a seguir:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/b97416c0-6e00-40a7-96c0-63c4e4f963e6)

3.	Note que, no exemplo acima, dentro do esquema "if/else", já indicamos que a operação deve criar, no caminho do diretório indicado, e enviar dois arquivos em formato .txt com os resultados da verificação. Sendo um arquivo para o resultado online e outro para o resultado offline;
4.	Salve o arquivo do script;
5.	Para tornar o arquivo do script executável digite o comando  nesse caso, sudo chmod +x service_status.sh;
6.	Estando no diretório onde o script foi criado e ativado, execute o comando ./service_status.sh para executá-lo. Caso esteja funcionando corretamente e o serviço esteja online, o script vai criar o documento .txt que guarda as informações da validação online;
   
![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/e74d5954-22da-435a-b616-1e792183fbcb)

7.	Esse documento pode ser lido com o comando cat + nome do documento: cat httpd-online.txt. É possível verificar o funcionamento do script na imagem abaixo:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/8e567e59-25c9-4cb5-a388-186e9178cab8)

8.	Note que o documento informa a data e a hora em que a verificação foi feita, assim como o nome do serviço verificado e uma mensagem indicando que o mesmo está online.

### Linux : Preparando a execução automatizada do script a cada 5 minutos

Para o agendamento da execução do script vamos utilizar o comando crontab. Normalmente o crontab abre um arquivo com o programa vi de edição de texto. Inciando  a  configuração:

1.	Digite o comando ``_EDITOR=nano crontab -e_``, para que o nano abra o arquivo crontab;
2.	Dentro do arquivo digite a linha _```/5 * * * * /mnt/efs/Hector/service_status.sh```_, no seu caso terá que colocar seu nome.
4.	Salve o arquivo e feche o editor.

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/1fcfa23a-f144-495c-a8b9-61fd886e3c30)

4.	Para verificar se a automatização está funcionando, é preciso abrir os arquivos ``_.txt_`` que foram programados para serem criados e guardar as informações da verificação do serviço _online_ e _offline_. Como a automatização faz com que a verificação programada pelo script ocorra a cada 5 minutos, dê algum tempo para que o arquivo ``_.txt_`` seja atualizado algumas vezes;
   
5.	Na imagem abaixo temos a demonstração do arquivo httpd-online.txt exibindo as informações da validação online após o crontab realizar a automatização algumas vezes:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/4eac8d15-a8df-413b-97d3-a4c65f649813)

6.	Para fazermos a confirmação de que o script realiza a verificação do serviço offline é preciso interromper o Apache com o comando ``_sudo systemctl stop httpd_``. Dessa forma, agora é só aguardar a execução do script a cada 5 minutos e poderemos ver a criação do arquivo ``_httpd-offline.txt_``, que exibe os momentos em que o status do serviço estava offline, conforme imagem abaixo:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/1e4e4aad-a898-4798-b7dd-e390908ad433)

7.	Ainda, é possível verificarmos que os arquivos _``.txt``_ foram criados dentro do diretório indicado no script:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/45a1528e-5738-4673-8fc0-c1d426d6496e)

E no final encerramento da instância.

### Referências para a realização da atividade 

Documentação oficial Amazon AWS: https://docs.aws.amazon.com/pt_br/

Guia Linux Unirio: https://guialinux.uniriotec.br/





















