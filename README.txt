# KidPlus

**Criador:** Ediel Romily Silva Caetano

## Descrição

**KidPlus** é um sistema para o gerenciamento de creches, desenvolvido em Java Web utilizando JSP e Maven, com suporte para Tomcat. A aplicação permite o cadastro e gerenciamento de responsáveis, professores, alunos, eventos e cardápios em um ambiente de creche.

## Instalação

### Pré-requisitos

- **Banco de Dados:** Um banco de dados MySQL chamado `creche`.
- **IDE:** IntelliJ IDEA ou outra IDE que suporte desenvolvimento Java Web.
- **Servidor:** Apache Tomcat instalado em seu sistema.

### Passos para Instalação

1. **Baixar o Projeto:**
   - Clone o repositório do GitHub e extraia os arquivos em uma pasta local:
     ```sh
     git clone https://github.com/R0mi1y/KidPlus.git
     ```

2. **Abrir o Projeto no IntelliJ:**
   - Inicie o IntelliJ IDEA.
   - Vá para **File > Open** e selecione a pasta do projeto.

3. **Configurar o Tomcat no IntelliJ:**
   - Acesse o menu **Run** e selecione **Edit Configurations**.
   - Clique no botão **+** e selecione **Tomcat Server > Local**.
   - Dê um nome para a configuração do servidor e especifique o caminho do Tomcat instalado.
   - Clique em **Apply** e depois em **OK** para salvar as configurações.

4. **Executar o Projeto:**
   - Clique no botão **Run** e selecione a configuração do Tomcat que você criou.
   - Acesse a aplicação no navegador em [http://localhost:8080](http://localhost:8080).

5. **Configurar o Banco de Dados:**
   - Execute o script SQL fornecido em seu SGBD MySQL para criar o banco de dados `creche`:
     ```sql
     CREATE DATABASE IF NOT EXISTS creche;
     ```
   - Na classe DAO localizada em `demo/src/main/java/kidPlus/model/DAO.java`, substitua as variáveis `user` e `password` pelas suas credenciais do MySQL.

### Vídeo de Apresentação

Confira o vídeo de apresentação do projeto aqui: [YouTube](https://youtu.be/Sw7QfOd6fos)

### Repositório do GitHub

O código-fonte está disponível no GitHub: [KidPlus](https://github.com/R0mi1y/KidPlus)

### Credenciais Padrão

- **Usuário:** admin
- **Senha:** admin
