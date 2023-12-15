CRIADOR: 
	Ediel Romily Silva Caetano

DESCRIÇÃO: 
	É um sistema para gerenciamento de creche, que permite o cadastro de responsáveis, professores, alunos, eventos e cardápios

INSTALAÇÃO:
	PRÉ-REQUISITOS: 
		acesso à um banco de dados chamado creche;
		ter uma ide que suporte java web (nas instruções usamos o intellij)

	Passo 1: Baixar o projeto do Github

		Baixe os arquivos do projeto do Github e extraia-os em uma pasta local.

	Passo 2: Abrir o projeto no IntelliJ

		Abra o IntelliJ e vá em File > Open e selecione a pasta do projeto.

	Passo 3: Configurar o Tomcat no IntelliJ

		Acesse o menu Run e selecione Edit Configurations.
		Clique no botão + e selecione Tomcat Server > Local.
		Forneça um nome para a configuração do servidor e especifique a localização do Tomcat instalado em seu sistema.
		Clique em Apply e OK para salvar as configurações.
	
	Passo 4: Executar o projeto
		
		Clique no botão Run e selecione a configuração do servidor que você acabou de criar. Verifique se o projeto está sendo executado corretamente acessando o endereço http://localhost:8080 no navegador.

	Passo 5: Executar script SQL
		
		Execute o script SQL fornecido em seu SGBD MySQL para completar a instalação do projeto.

		CREATE DATABASE IF NOT EXISTS creche;

		Entre na classe DAO que está em demo\src\main\java\kidPlus\model\DAO.java e troque as variáveis user e password para sua senha e usuário do mysql;

VÍDEO DE APRESENTAÇÃO:
	https://youtu.be/Sw7QfOd6fos

GITHUB COMPARTILHADO:
	https://github.com/R0mi1y/KidPlus


Senha e usuário padrão: admin
