-- Criação do Banco de Dados
CREATE DATABASE GameRentalDB;
GO

-- Seleção do banco
USE GameRentalDB;
GO

-- ========================
-- TABELA DE CLIENTES/CUSTOMERS
-- ========================
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);
GO

-- ========================
-- TABELA DE JOGOS/GAMES
-- ========================
CREATE TABLE Games (
    GameID INT IDENTITY(1,1) PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Genero VARCHAR(50) NOT NULL,
    Desenvolvedor VARCHAR(100),
    AnoLancamento INT
);
GO

-- ========================
-- TABELA DE LOCAÇÕES/RENTALS
-- ========================
CREATE TABLE Rentals (
    RentalID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    GameID INT NOT NULL,
    DataRetirada DATE,
    DataDevolucao DATE,
    Status VARCHAR(50),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (GameID) REFERENCES Games(GameID)
);
GO

-- ========================
-- INSERÇÃO DE DADOS TESTE
-- ========================

-- Clientes
INSERT INTO Customers (Nome, Endereco, Email, Telefone) VALUES
('Maria Oliveira', 'Rua B, 200', 'maria@example.com', '21999999999'),
('João Silva', 'Avenida Central, 123', 'joao@example.com', '21988887777'),
('Ana Souza', 'Rua das Flores, 50', 'ana@example.com', '21977776666');

-- Jogos
INSERT INTO Games (Titulo, Genero, Desenvolvedor, AnoLancamento) VALUES
('The Legend of Zelda', 'Aventura', 'Nintendo', 1986),
('God of War', 'Ação', 'Santa Monica Studio', 2018),
('FIFA 23', 'Esporte', 'EA Sports', 2022),
('Minecraft', 'Sandbox', 'Mojang Studios', 2011);

-- Locações
INSERT INTO Rentals (CustomerID, GameID, DataRetirada, DataDevolucao, Status) VALUES
(1, 2, '2025-05-01', '2025-05-05', 'Devolvido'),
(2, 3, '2025-05-03', NULL, 'Pendente'),
(3, 4, '2025-05-02', '2025-05-06', 'Devolvido');
GO

-- ========================
-- CONSULTAS DE TESTE
-- ========================

-- Ver todas as locações com nomes de clientes e jogos
SELECT 
    Rentals.RentalID,
    Customers.Nome AS Cliente,
    Games.Titulo AS Jogo,
    Rentals.DataRetirada,
    Rentals.DataDevolucao,
    Rentals.Status
FROM Rentals
JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
JOIN Games ON Rentals.GameID = Games.GameID;
GO

-- Ver clientes
SELECT * FROM Customers;
GO

-- Ver jogos
SELECT * FROM Games;
GO

-- ========================
-- ATUALIZAR STATUS DA LOCAÇÃO
-- ========================
UPDATE Rentals
SET Status = 'Devolvido', DataDevolucao = GETDATE()
WHERE RentalID = 2;
GO

-- ========================
-- EXCLUIR UMA LOCAÇÃO
-- ========================
DELETE FROM Rentals
WHERE RentalID = 3;
GO
