# Atividade_Aws-Linux
## Execução da atividade
### Requisitos no AWS:
AWS: Geração de chave pública para acesso ao ambiente:

1.No console AWS, vá para o Painel EC2:

2.No menu posicionado ao lado esquerdo da tela, vá até a seção Rede e Segurança e clique em Pares de Chaves;

3.Na próxima tela, no lado superior direito, clique em Criar par de chaves;

4.A tela de criação será aberta e nela você poderá escolher um nome para o par de chaves. No meu caso, criei a chave "HectorSSH"

5.Mantenha as configurações restantes e na opção Formato de arquivo de chave privada, selecione o formato. pem, necessário para acessar a instância via Linux, como iremos fazer;

6.Feito isso, basta clicar em Criar Par de Chaves;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/63403cdc-c4cc-4f8b-bc0a-ed96752644bd)

7.Salve em lugar seguro (no meu caso salvei em na pasta Downloads) e pronto, o par de chave estará disponível e listado no menu.

## AWS: Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Famíliat3.small, 16 GB SSD):

1.No Painel EC2 no console AWS, clique em Instâncias no menu ao lado esquerdo da tela;

2.Na próxima tela, no lado superior direito, clique em Executar instância;

3.Agora é possível criar um nome para a instância e criar tags. Nome, CostCenter e Project, de acordo com as recomendações dos instrutores.

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

## AWS: Gerar 1 Elastic IP e anexar à instância EC2

1.	Na página do serviço EC2, no menu lateral esquerdo, em Rede e Segurança, clique em IPs elásticos;
2.	Clique em Alocar endereço IP elástico;
3.	Por padrão, o Grupo de borda de Rede já vem selecionado, assim como o Conjunto de endereços IPv4 públicos da Amazon;
4.	Clique em Alocar;
5.	Depois da criação, selecione o IP na lista, clique em Ações no menu superior e depois em Associar endereço IP elástico;
6.	Selecione a instância EC2 criada anteriormente;
7.	Depois de selecionar a instância será preciso selecionar o endereço IP privado, que será sugerido pela própria plataforma, bastando confirmar;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/72a417f3-00a8-4efd-8d43-aaeb9983804f)

## AWS : Liberar as portas de comunicação para acesso público
1.	Na página do serviço EC2, no menu lateral esquerdo, em Rede e Segurança, clique em Security groups;
2.	Selecione o grupo de segurança que foi criado com a instância EC2;
3.	Clique em Regras de entrada, na parte inferior, e depois, do lado direito da tela, em Editar regras de entrada;
4.	Por padrão, já temos uma regra de entrada, do Tipo SSH, no Intervalo de portas 22, Protocolo TCP. Essa regra será mantida;
5.	Clique em Adicionar regras. Agora iremos acrescentar a liberação de outras portas, além da 22 que já consta, conforme indicado na tabela abaixo:

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/e7214457-f7f4-4515-abae-a58acab6f203)

6.	Clique em Salvar regras.

# Requisitos no linux:

## AWS : Servidor NFS a partir do Elastic File System (EFS) - Security Group

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

   
## AWS :Criando o serviço de Elastic File System (EFS)

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
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 [DNS do EFS]:/ /mnt/efs.















