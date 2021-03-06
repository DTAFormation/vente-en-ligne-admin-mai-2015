-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 19 Mai 2015 à 10:43
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `ecommercedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `adresse_id` int(11) NOT NULL AUTO_INCREMENT,
  `code_postal` int(11) DEFAULT NULL,
  `departement` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adresse_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `adresse`
--

INSERT INTO `adresse` (`adresse_id`, `code_postal`, `departement`, `numero`, `pays`, `rue`, `ville`, `version`) VALUES
(1, 10000, '10', 54, 'france', 'rue emile zola', 'troyes', 0),
(2, 54000, '54', 12, 'france', 'rue de la paix', 'nancy', 0),
(3, 51500, '51', 22, 'france', 'avenue des etats-unis', 'reims', 0),
(4, 33000, '10', 54, 'france', 'rue emile zola', 'troyes', 0),
(5, 52000, '54', 12, 'france', 'rue de la paix', 'nancy', 0),
(6, 11000, '51', 22, 'france', 'avenue des etats-unis', 'reims', 0),
(7, 63000, '10', 54, 'france', 'rue emile zola', 'troyes', 0),
(24, 44, 'dd', 44, 'dd', 'dd', 'dd', 0);

-- --------------------------------------------------------

--
-- Structure de la table `adresses_utilisateur`
--

CREATE TABLE IF NOT EXISTS `adresses_utilisateur` (
  `utilisateur_utilisateur_id` int(11) DEFAULT NULL,
  `adresse_id` int(11) NOT NULL,
  PRIMARY KEY (`adresse_id`),
  KEY `FK_1j74tyg6di4jntlpbtdcguqgu` (`utilisateur_utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adresses_utilisateur`
--

INSERT INTO `adresses_utilisateur` (`utilisateur_utilisateur_id`, `adresse_id`) VALUES
(1, 1),
(1, 2),
(1, 24),
(2, 3),
(2, 5),
(3, 4),
(3, 7),
(4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `nom` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `nb_raters` int(11) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `produit_produit_id` int(11) DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `UK_j6dftii6qdu76ogtvdsns8mks` (`nom`),
  KEY `FK_5q2ep5pqvg0hbs33ntkoyejyi` (`produit_produit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`article_id`, `image`, `nom`, `nb_raters`, `prix`, `rating`, `stock`, `produit_produit_id`, `version`) VALUES
(1, 'http://i.imgur.com/4O86daR.jpg', 'ballon de foot', 0, 10, 0, 25, 1, 0),
(2, 'http://i.imgur.com/kG47bs8.jpg', 'chaussures de foot', 0, 500, 0, 2000, 1, 0),
(3, 'http://i.imgur.com/iDWMUTr.jpg', 'ballon de basket', 1, 15, 5, 30, 2, 0),
(4, 'http://i.imgur.com/z3rOjE9.jpg', 'panier de basket', 0, 100, 0, 30, 2, 0),
(5, 'http://i.imgur.com/NUOJOdC.jpg', 'concombre', 0, 2.35, 0, 10, 3, 0),
(6, 'http://i.imgur.com/lhxWEQ3.jpg', 'courgette', 0, 59.99, 0, 5000, 3, 0),
(7, 'http://i.imgur.com/vBRzDhq.jpg', 'pomme de terre', 0, 2.65, 0, 1000, 4, 0),
(8, 'http://i.imgur.com/XhUhqXX.jpg', 'carotte', 0, 3.05, 0, 60, 4, 0),
(9, 'http://i.imgur.com/BT2FVWT.jpg', 'banane', 0, 4.6, 0, 35, 5, 0),
(10, 'http://i.imgur.com/MQfZPWa.png', 'tomate', 0, 4.7, 0, 25, 5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `catalogue`
--

CREATE TABLE IF NOT EXISTS `catalogue` (
  `catalogue_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`catalogue_id`),
  UNIQUE KEY `UK_akkvjfv05v0wsjw23vbbh7erc` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `catalogue`
--

INSERT INTO `catalogue` (`catalogue_id`, `description`, `nom`, `version`) VALUES
(1, 'catalogue de sport', 'sport', 0),
(2, 'catalogue de primeurs', 'primeurs', 0);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `commande_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` datetime DEFAULT NULL,
  `date_expiration_cartecredit` datetime DEFAULT NULL,
  `num_cartecredit` varchar(255) DEFAULT NULL,
  `type_cartecredit` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `validate` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`commande_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`commande_id`, `date_commande`, `date_expiration_cartecredit`, `num_cartecredit`, `type_cartecredit`, `version`, `validate`) VALUES
(1, '2015-05-05 14:43:57', '2015-05-05 14:43:57', '6531', 'bancaire', 0, 1),
(2, '2015-05-05 14:43:57', '2015-05-05 14:43:57', '9865', 'bancaire', 0, 1),
(3, '2015-05-05 14:43:57', '2015-05-05 14:43:57', '1356', 'bancaire', 0, 1),
(4, '2015-05-05 14:43:57', '2015-05-05 14:43:57', '9647', 'bancaire', 0, 1),
(5, '2015-05-05 14:43:57', '2015-05-05 14:43:57', '7653', 'bancaire', 0, 1),
(6, '2015-05-19 10:11:03', NULL, NULL, NULL, 0, 1),
(7, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `commandes_adresse`
--

CREATE TABLE IF NOT EXISTS `commandes_adresse` (
  `adresse_adresse_id` int(11) DEFAULT NULL,
  `commande_id` int(11) NOT NULL,
  PRIMARY KEY (`commande_id`),
  KEY `FK_28jj8bevghkd32urtojvgi0dy` (`adresse_adresse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes_adresse`
--

INSERT INTO `commandes_adresse` (`adresse_adresse_id`, `commande_id`) VALUES
(1, 1),
(1, 4),
(2, 2),
(3, 3),
(3, 5),
(24, 6);

-- --------------------------------------------------------

--
-- Structure de la table `commandes_utilisateur`
--

CREATE TABLE IF NOT EXISTS `commandes_utilisateur` (
  `utilisateur_utilisateur_id` int(11) DEFAULT NULL,
  `commande_id` int(11) NOT NULL,
  PRIMARY KEY (`commande_id`),
  KEY `FK_n0db72m95f4xs4dvytdqmx1oi` (`utilisateur_utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes_utilisateur`
--

INSERT INTO `commandes_utilisateur` (`utilisateur_utilisateur_id`, `commande_id`) VALUES
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 4),
(3, 3),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `commande_lignecommande`
--

CREATE TABLE IF NOT EXISTS `commande_lignecommande` (
  `commande_commande_id` int(11) DEFAULT NULL,
  `ligneCommandeId` int(11) NOT NULL,
  PRIMARY KEY (`ligneCommandeId`),
  KEY `FK_kampcai6jdtbi2sohp9ljnofu` (`commande_commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande_lignecommande`
--

INSERT INTO `commande_lignecommande` (`commande_commande_id`, `ligneCommandeId`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(11);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE IF NOT EXISTS `lignecommande` (
  `ligneCommandeId` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) NOT NULL,
  `article_article_id` int(11) DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `commande_commande_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ligneCommandeId`),
  KEY `FK_b62ftsfx7klnhqpa8ukpr4cxl` (`article_article_id`),
  KEY `FK_028c6f159ebf4df389967c3ae85` (`commande_commande_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `lignecommande`
--

INSERT INTO `lignecommande` (`ligneCommandeId`, `quantite`, `article_article_id`, `version`, `commande_commande_id`) VALUES
(1, 5, 1, 0, 1),
(2, 25, 2, 0, 1),
(3, 14, 1, 0, 2),
(4, 12, 3, 0, 3),
(8, 1, 1, 0, 6),
(9, 1, 3, 0, 6),
(10, 1, 3, 0, 7);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `produit_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `catalogue_catalogue_id` int(11) DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`produit_id`),
  UNIQUE KEY `UK_f4qk8yboujta1pa8d5kq5ajyd` (`nom`),
  KEY `FK_1re8mopm3i1l587btl1ei2js6` (`catalogue_catalogue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`produit_id`, `description`, `nom`, `catalogue_catalogue_id`, `version`) VALUES
(1, 'liste de produits concernant le football', 'football', 1, 0),
(2, 'liste de produits concernant le basketball', 'natation', 1, 0),
(3, 'liste de cucurbitacés', 'cucurbitacé', 2, 0),
(4, 'liste de tubercules', 'tubercule', 2, 0),
(5, 'liste de fruits', 'fruits', 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `type_util` varchar(1) DEFAULT NULL,
  `version` bigint(20) DEFAULT '0',
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`utilisateur_id`),
  UNIQUE KEY `UK_35ysk0sh9ruwixrld3nc0weut` (`email`),
  UNIQUE KEY `UK_kmw1w139mxftir6ce47jrbxac` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`utilisateur_id`, `email`, `fax`, `login`, `nom`, `password`, `prenom`, `telephone`, `titre`, `type_util`, `version`, `active`) VALUES
(1, 'thunder@hotmail.com', 1357, 'thunder', 'abitbol', 'theclass', 'georges', 3548, 'M', 'a', 0, 1),
(2, 'epicness@hotmail.com', 7865, 'plop', 'dupond', 'ploplop', 'julie', 8541, 'mme', 'c', 0, 1),
(3, 'salameche92@hotmail.com', 9852, 'username', 'dupont', 'secret', 'bob', 5026, 'm', 'm', 0, 1),
(4, 'vegeta91@hotmail.com', 9025, 'pif1991', 'collins', 'genesis', 'phil', 6932, 'm', 'm', 0, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `adresses_utilisateur`
--
ALTER TABLE `adresses_utilisateur`
  ADD CONSTRAINT `FK_1j74tyg6di4jntlpbtdcguqgu` FOREIGN KEY (`utilisateur_utilisateur_id`) REFERENCES `utilisateur` (`utilisateur_id`),
  ADD CONSTRAINT `FK_o79u8befrv7x4sa0wt26693tf` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`adresse_id`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_5q2ep5pqvg0hbs33ntkoyejyi` FOREIGN KEY (`produit_produit_id`) REFERENCES `produit` (`produit_id`);

--
-- Contraintes pour la table `commandes_adresse`
--
ALTER TABLE `commandes_adresse`
  ADD CONSTRAINT `FK_28jj8bevghkd32urtojvgi0dy` FOREIGN KEY (`adresse_adresse_id`) REFERENCES `adresse` (`adresse_id`),
  ADD CONSTRAINT `FK_okktvrrkmurc7okalvm6rwv6o` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`);

--
-- Contraintes pour la table `commandes_utilisateur`
--
ALTER TABLE `commandes_utilisateur`
  ADD CONSTRAINT `FK_1yeribwuakwyjjvsea9jbv6ej` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`),
  ADD CONSTRAINT `FK_n0db72m95f4xs4dvytdqmx1oi` FOREIGN KEY (`utilisateur_utilisateur_id`) REFERENCES `utilisateur` (`utilisateur_id`);

--
-- Contraintes pour la table `commande_lignecommande`
--
ALTER TABLE `commande_lignecommande`
  ADD CONSTRAINT `FK_9mwjdouffhw9crp645b2g9g87` FOREIGN KEY (`ligneCommandeId`) REFERENCES `lignecommande` (`ligneCommandeId`),
  ADD CONSTRAINT `FK_kampcai6jdtbi2sohp9ljnofu` FOREIGN KEY (`commande_commande_id`) REFERENCES `commande` (`commande_id`);

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `FK_028c6f159ebf4df389967c3ae85` FOREIGN KEY (`commande_commande_id`) REFERENCES `commande` (`commande_id`),
  ADD CONSTRAINT `FK_b62ftsfx7klnhqpa8ukpr4cxl` FOREIGN KEY (`article_article_id`) REFERENCES `article` (`article_id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_1re8mopm3i1l587btl1ei2js6` FOREIGN KEY (`catalogue_catalogue_id`) REFERENCES `catalogue` (`catalogue_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
