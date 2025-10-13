SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `administrateur` (`id_admin`, `email`, `mot_de_passe`) VALUES
(1, 'admin@ticngo.com', 'motdepassehashé');


DROP TABLE IF EXISTS `admin_billet`;
CREATE TABLE IF NOT EXISTS `admin_billet` (
  `id_admin` int NOT NULL,
  `id_billet` int NOT NULL,
  PRIMARY KEY (`id_admin`,`id_billet`),
  KEY `id_billet` (`id_billet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `admin_evenement`;
CREATE TABLE IF NOT EXISTS `admin_evenement` (
  `id_admin` int NOT NULL,
  `id_evenement` int NOT NULL,
  PRIMARY KEY (`id_admin`,`id_evenement`),
  KEY `id_evenement` (`id_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `billet`;
CREATE TABLE IF NOT EXISTS `billet` (
  `id_billet` int NOT NULL AUTO_INCREMENT,
  `numero_unique` varchar(50) NOT NULL,
  `statut` enum('valide','annulé','remboursé') DEFAULT 'valide',
  `date_achat` date DEFAULT NULL,
  `prix` decimal(6,2) DEFAULT NULL,
  `id_client` int DEFAULT NULL,
  `id_seance` int DEFAULT NULL,
  PRIMARY KEY (`id_billet`),
  UNIQUE KEY `numero_unique` (`numero_unique`),
  KEY `id_client` (`id_client`),
  KEY `id_seance` (`id_seance`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `billet` (`id_billet`, `numero_unique`, `statut`, `date_achat`, `prix`, `id_client`, `id_seance`) VALUES
(1, 'BIL-001-2025', 'valide', '2025-10-13', 25.00, 1, 1);


DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `adresse` text,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `client` (`id_client`, `nom`, `email`, `telephone`, `adresse`) VALUES
(1, 'Alice Martin', 'alice@mail.com', '0600000001', '12 rue Victor Hugo, Lyon');



DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id_evenement` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(150) NOT NULL,
  `affiche` varchar(255) DEFAULT NULL,
  `description_courte` text,
  `description_longue` text,
  `langue` varchar(50) DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `age_minimum` int DEFAULT NULL,
  `id_lieu` int DEFAULT NULL,
  PRIMARY KEY (`id_evenement`),
  KEY `id_lieu` (`id_lieu`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `evenement` (`id_evenement`, `titre`, `affiche`, `description_courte`, `description_longue`, `langue`, `duree`, `age_minimum`, `id_lieu`) VALUES
(1, 'One Man Show - Paul Dupont', NULL, 'Un spectacle plein d’humour', NULL, 'Français', 90, NULL, 1);

DROP TABLE IF EXISTS `evenement_tag`;
CREATE TABLE IF NOT EXISTS `evenement_tag` (
  `id_evenement` int NOT NULL,
  `id_tag` int NOT NULL,
  PRIMARY KEY (`id_evenement`,`id_tag`),
  KEY `id_tag` (`id_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id_lieu` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `capacite` int DEFAULT NULL,
  PRIMARY KEY (`id_lieu`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `lieu` (`id_lieu`, `nom`, `adresse`, `capacite`) VALUES
(1, 'Théâtre du Rire', '10 rue de Paris, Lyon', 350);



DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promo` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `reduction_pourcent` decimal(5,2) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `id_tarif` int DEFAULT NULL,
  PRIMARY KEY (`id_promo`),
  KEY `id_tarif` (`id_tarif`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id_seance` int NOT NULL AUTO_INCREMENT,
  `date_heure` datetime NOT NULL,
  `id_evenement` int NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `id_evenement` (`id_evenement`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `seance` (`id_seance`, `date_heure`, `id_evenement`) VALUES
(1, '2025-11-20 20:30:00', 1);



DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id_tag` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `tarif`;
CREATE TABLE IF NOT EXISTS `tarif` (
  `id_tarif` int NOT NULL AUTO_INCREMENT,
  `type` enum('plein','réduit','groupe') NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `id_evenement` int DEFAULT NULL,
  PRIMARY KEY (`id_tarif`),
  KEY `id_evenement` (`id_evenement`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

