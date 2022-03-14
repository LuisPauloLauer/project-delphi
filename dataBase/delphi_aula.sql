-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18-Abr-2020 às 23:43
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delphi_aula`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE `cidade` (
  `ID` varchar(10) NOT NULL,
  `NOME` varchar(300) NOT NULL,
  `PAIS` varchar(4) NOT NULL,
  `ESTADO` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`ID`, `NOME`, `PAIS`, `ESTADO`) VALUES
('0000000001', 'São Leopoldo', 'BR', 'RS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_empresa`
--

CREATE TABLE `cliente_empresa` (
  `ID` varchar(10) NOT NULL,
  `TIPO` varchar(2) NOT NULL,
  `NOME` varchar(300) NOT NULL,
  `ENDERECO` varchar(300) NOT NULL,
  `NUMERO` int(6) NOT NULL,
  `COMPLEMENTO` varchar(300) DEFAULT NULL,
  `BAIRRO` varchar(300) NOT NULL,
  `CEP` int(8) NOT NULL,
  `CIDADE` varchar(10) NOT NULL,
  `ESTADO` varchar(2) NOT NULL,
  `PAIS` varchar(4) NOT NULL,
  `TELEFONE1` int(12) DEFAULT NULL,
  `TELEFONE2` int(12) DEFAULT NULL,
  `EMAIL` varchar(300) DEFAULT NULL,
  `CPF` int(11) DEFAULT NULL,
  `CNPJ` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente_empresa`
--

INSERT INTO `cliente_empresa` (`ID`, `TIPO`, `NOME`, `ENDERECO`, `NUMERO`, `COMPLEMENTO`, `BAIRRO`, `CEP`, `CIDADE`, `ESTADO`, `PAIS`, `TELEFONE1`, `TELEFONE2`, `EMAIL`, `CPF`, `CNPJ`) VALUES
('0000000001', 'CL', 'Teste', 'Teste', 123, 'Teste', 'Teste', 123, '0000000001', 'RS', 'BR', 1, 1, '', 1, 1),
('0000000002', 'CL', 'TESTE 01', 'teste ccccc', 123, 'TESTE', 'TESTE', 123, '0000000001', 'RS', 'BR', 1, 1, 'TESTE', 1123, 1223);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `ID` varchar(2) NOT NULL,
  `NOME` varchar(200) NOT NULL,
  `PAIS` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`ID`, `NOME`, `PAIS`) VALUES
('RS', 'RIO GRANDE DO SUL', 'BR');

-- --------------------------------------------------------

--
-- Estrutura da tabela `idioma`
--

CREATE TABLE `idioma` (
  `ID` varchar(4) NOT NULL,
  `NOME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `idioma`
--

INSERT INTO `idioma` (`ID`, `NOME`) VALUES
('POR', 'PORTUGUÊS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `moeda`
--

CREATE TABLE `moeda` (
  `ID` varchar(4) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `SIGLA` varchar(20) NOT NULL,
  `COTACAO` double(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `moeda`
--

INSERT INTO `moeda` (`ID`, `NOME`, `SIGLA`, `COTACAO`) VALUES
('RL', 'REAL', 'R$', 1.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE `pais` (
  `ID` varchar(4) NOT NULL,
  `NOME` varchar(200) NOT NULL,
  `IDIOMA` varchar(4) NOT NULL,
  `MOEDA` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`ID`, `NOME`, `IDIOMA`, `MOEDA`) VALUES
('BR', 'BRASIL', 'POR', 'RL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID` varchar(10) NOT NULL,
  `NOME` varchar(300) NOT NULL,
  `SENHA` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `NOME`, `SENHA`) VALUES
('lpgl', 'Luís Paulo Gomes Lauer', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PAIS` (`PAIS`),
  ADD KEY `ESTADO` (`ESTADO`);

--
-- Indexes for table `cliente_empresa`
--
ALTER TABLE `cliente_empresa`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PAIS` (`PAIS`),
  ADD KEY `ESTADO` (`ESTADO`),
  ADD KEY `CIDADE` (`CIDADE`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PAIS` (`PAIS`);

--
-- Indexes for table `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `moeda`
--
ALTER TABLE `moeda`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDIOMA` (`IDIOMA`),
  ADD KEY `MOEDA` (`MOEDA`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`ID`),
  ADD CONSTRAINT `cidade_ibfk_2` FOREIGN KEY (`ESTADO`) REFERENCES `estado` (`ID`);

--
-- Limitadores para a tabela `cliente_empresa`
--
ALTER TABLE `cliente_empresa`
  ADD CONSTRAINT `cliente_empresa_ibfk_1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`ID`),
  ADD CONSTRAINT `cliente_empresa_ibfk_2` FOREIGN KEY (`ESTADO`) REFERENCES `estado` (`ID`),
  ADD CONSTRAINT `cliente_empresa_ibfk_3` FOREIGN KEY (`CIDADE`) REFERENCES `cidade` (`ID`);

--
-- Limitadores para a tabela `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`ID`);

--
-- Limitadores para a tabela `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `pais_ibfk_1` FOREIGN KEY (`IDIOMA`) REFERENCES `idioma` (`ID`),
  ADD CONSTRAINT `pais_ibfk_2` FOREIGN KEY (`MOEDA`) REFERENCES `moeda` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
