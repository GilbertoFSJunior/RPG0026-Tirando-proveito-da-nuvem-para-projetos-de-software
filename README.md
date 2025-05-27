🎮 GameRentalDB – Banco de Dados de Locadora de Jogos

📋 Descrição
Este projeto consiste na modelagem e implementação de um banco de dados relacional para uma locadora de jogos, utilizando o Azure SQL Database. O projeto foi desenvolvido como parte de uma missão prática para aplicar conhecimentos em modelagem, criação de banco de dados e operações CRUD (Create, Read, Update, Delete).

🎯 Objetivos
🔧 Configurar e provisionar um banco de dados no Azure SQL.

🗄️ Projetar e implementar um banco de dados relacional utilizando T-SQL.

💾 Realizar operações CRUD para manipulação de dados no banco.

☁️ Configuração do Ambiente – Azure
Banco de Dados: GameRentalDB

Servidor: gamerental-server

Região: Brasil

Nível de Preço: Básico (ideal para práticas e testes)

🏗️ Modelagem do Banco de Dados
🔗 Relacionamentos
Customers (Clientes) → Rentals (Locações): relacionamento 1:N

Games (Jogos) → Rentals (Locações): relacionamento 1:N

📊 Tabelas
🎮 Games (Jogos)
Campo	Tipo	Descrição
GameID	INT (PK)	ID do Jogo
Titulo	VARCHAR(100)	Título do jogo
Genero	VARCHAR(50)	Gênero do jogo
Desenvolvedor	VARCHAR(100)	Desenvolvedor
AnoLancamento	INT	Ano de lançamento

👥 Customers (Clientes)
Campo	Tipo	Descrição
CustomerID	INT (PK)	ID do Cliente
Nome	VARCHAR(100)	Nome
Endereco	VARCHAR(200)	Endereço
Email	VARCHAR(100)	E-mail
Telefone	VARCHAR(20)	Telefone

📄 Rentals (Locações)
Campo	Tipo	Descrição
RentalID	INT (PK)	ID da locação
CustomerID	INT (FK)	ID do cliente
GameID	INT (FK)	ID do jogo
DataRetirada	DATE	Data de retirada
DataDevolucao	DATE	Data de devolução
Status	VARCHAR(50)	Status (Devolvido, Pendente, etc)

💻 Scripts SQL
🔨 Criação das Tabelas
Arquivo: create_tables.sql

📥 Inserção de Dados
Arquivo: insert_data.sql

🔍 Consultas SQL
Arquivo: queries.sql

🔄 Operações CRUD
Arquivo: crud_operations.sql

🔥 Exemplos de Consultas
🔍 Listar locações por cliente:

sql
Copiar
Editar
SELECT Rentals.RentalID, Customers.Nome AS Cliente, Games.Titulo AS Jogo, Rentals.Status
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
JOIN Games ON Rentals.GameID = Games.GameID;
📝 Atualizar status da locação:

sql
Copiar
Editar
UPDATE Rentals
SET Status = 'Devolvido'
WHERE RentalID = 1;
❌ Excluir uma locação:

sql
Copiar
Editar
DELETE FROM Rentals
WHERE RentalID = 2;
✅ Funcionalidades
✅ Criação e gerenciamento de jogos.

✅ Cadastro de clientes.

✅ Registro de locações com controle de status (pendente, devolvido, atrasado).

✅ Consultas SQL para análises e gestão.

🚀 Próximos Passos
🔗 Integrar o banco de dados com uma aplicação web ou mobile.

📈 Criar relatórios como histórico de locações e ranking dos jogos mais alugados.

🔧 Implementar testes de desempenho e otimizações.

🧠 Aprendizados
Modelagem de banco de dados relacional.

Implementação de tabelas e relacionamentos.

Operações CRUD utilizando T-SQL no Azure SQL Database.

Gerenciamento de recursos na nuvem (Azure).

📜 Licença
Este projeto é de caráter educacional e livre para uso e adaptação.

🤝 Contato
💼 Gilberto F. S. Junior

📧 [gilberto.tnt@hotmail.com]

🌎 LinkedIn (https://www.linkedin.com/in/gilbertofsjunior/)
