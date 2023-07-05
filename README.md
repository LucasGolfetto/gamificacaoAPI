# App de Registro para Empresas

Sistema de lista de tarefas para uma empresa com registro de funcionário, tarefa, departamento, projeto, cliente e empresa em Flutter usando SQFlite para a persistência e SharedPreferences para armazenar configurações do usuário.

## Classes básicas:

- Funcionário: representa os funcionários da empresa. Contém atributos como nome, sobrenome, endereço e número de telefone.

- Departamento: representa os departamentos da empresa. Contém atributos como nome e descrição.

- Projeto: representa os projetos em andamento na empresa. Contém atributos como nome, descrição, data de início e data de término.

- Cliente: representa os clientes da empresa. Contém atributos como nome, sobrenome, endereço e número de telefone.

- Tarefa: representa as tarefas a serem realizadas na empresa. Contém atributos como descrição, data de início, data de término e status (em andamento, concluída, etc.).

- Empresa: representa a empresa em si. Contém atributos como nome, endereço e número de telefone.

## Tecnologias Utilizadas

- Flutter
- SQLite
- Docker Desktop

## Instalação

1. Clone/baixe o repositório em sua máquina
2. Abra o projeto no editor de código de sua escolha
3. Execute `flutter pub get` para instalar as dependências
4. Execute `docker-compose up --bluid -d` para subir o conteiner Docker em sua máquina
```bash 
(caso queira alterar alguma configuração do Docker, apenas abra o arquivo `docker-compose.yml` em um editor de texto e salve após alterar)
```
5. Execute o aplicativo em um dispositivo físico ligado na sua máquina ou um emulador de smartphone

