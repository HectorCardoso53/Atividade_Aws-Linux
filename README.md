# Atividade_Aws-Linux
# Execução da atividade
# Requisitos no AWS:
AWS: Geração de chave pública para acesso ao ambiente:

1.No console AWS, vá para o Painel EC2:

2.No menu posicionado ao lado esquerdo da tela, vá até a seção Rede e Segurança e clique em Pares de Chaves;

3.Na próxima tela, no lado superior direito, clique em Criar par de chaves;

4.A tela de criação será aberta e nela você poderá escolher um nome para o par de chaves. No meu caso, criei a chave "HectorSSH"

5.Mantenha as configurações restantes e na opção Formato de arquivo de chave privada, selecione o formato. pem, necessário para acessar a instância via Linux, como iremos fazer;

6.Feito isso, basta clicar em Criar Par de Chaves;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/63403cdc-c4cc-4f8b-bc0a-ed96752644bd)

7.Salve em lugar seguro (no meu caso salvei em na pasta Downloads) e pronto, o par de chave estará disponível e listado no menu.

# AWS: Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Famíliat3.small, 16 GB SSD):

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

# AWS: Gerar 1 Elastic IP e anexar à instância EC2

1.	Na página do serviço EC2, no menu lateral esquerdo, em Rede e Segurança, clique em IPs elásticos;
2.	Clique em Alocar endereço IP elástico;
3.	Por padrão, o Grupo de borda de Rede já vem selecionado, assim como o Conjunto de endereços IPv4 públicos da Amazon;
4.	Clique em Alocar;
5.	Depois da criação, selecione o IP na lista, clique em Ações no menu superior e depois em Associar endereço IP elástico;
6.	Selecione a instância EC2 criada anteriormente;
7.	Depois de selecionar a instância será preciso selecionar o endereço IP privado, que será sugerido pela própria plataforma, bastando confirmar;

![image](https://github.com/HectorCardoso53/Atividade_Aws-Linux/assets/118605794/72a417f3-00a8-4efd-8d43-aaeb9983804f)









