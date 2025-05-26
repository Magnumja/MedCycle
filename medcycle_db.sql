-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 21/05/2025 às 16:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Criação da tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL, -- Usando VARCHAR(255) para armazenar hashes de senha
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de empresas coletoras
CREATE TABLE IF NOT EXISTS empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    cnpj VARCHAR(20) UNIQUE,
    endereco VARCHAR(200)
);

-- Criação da tabela de tipos de resíduos
CREATE TABLE IF NOT EXISTS residuos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    tipo VARCHAR(20) NOT NULL -- Ex: 'infectante', 'perfurante', 'quimico', 'reciclavel'
);

-- -- Inserindo alguns tipos básicos de resíduos
-- -- INSERT IGNORE INTO residuos (nome, tipo) VALUES
-- -- ('Agulhas', 'perfurante'),
-- -- ('Seringas', 'infectante'),
-- -- ('Luvas contaminadas', 'infectante'),
-- -- ('Embalagens de medicamentos', 'reciclavel'),
-- -- ('Frascos de reagentes', 'quimico');

-- Criação da tabela de registros de descarte
CREATE TABLE IF NOT EXISTS descartes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_descarte DATE NOT NULL,
    peso DECIMAL(10, 2) NOT NULL,
    residuo_id INT NOT NULL,
    empresa_id INT NOT NULL,
    usuario_id INT NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (residuo_id) REFERENCES residuos(id),
    FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
