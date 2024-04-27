-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 16 déc. 2023 à 19:59
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jeeproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `authentification`
--

CREATE TABLE `authentification` (
  `id` int(11) NOT NULL,
  `Email` varchar(110) NOT NULL,
  `Password` varchar(110) NOT NULL,
  `Role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `authentification`
--

INSERT INTO `authentification` (`id`, `Email`, `Password`, `Role`) VALUES
(1, 'user1@example.com', 'password123', 1),
(2, 'user2@example.com', 'securepass', 2),
(3, 'user3@example.com', 'secretword', 1),
(4, 'anas@gmail.com', 'anas', 3);

-- --------------------------------------------------------

--
-- Structure de la table `chef_projet`
--

CREATE TABLE `chef_projet` (
  `id` int(11) NOT NULL,
  `DeveloppeurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chef_projet`
--

INSERT INTO `chef_projet` (`id`, `DeveloppeurID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `PersonneID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `PersonneID`) VALUES
(1, 4),
(2, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `competance`
--

CREATE TABLE `competance` (
  `id` int(11) NOT NULL,
  `Experience` text NOT NULL,
  `Description` text DEFAULT NULL,
  `DeveloppeurID` int(11) NOT NULL,
  `TechnologieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `competance`
--

INSERT INTO `competance` (`id`, `Experience`, `Description`, `DeveloppeurID`, `TechnologieID`) VALUES
(1, 'Java, Python', NULL, 1, 1),
(2, 'C#, SQL', NULL, 2, 2),
(3, 'JavaScript, HTML, CSS', 'desc3', 4, 3),
(4, 'une application bureau pour la gestion des hotels', 'desc1', 4, 1),
(5, 'une application web pour les etablissement privés', 'desc2', 4, 2),
(12, 'anasa', 'anas', 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `developpeur`
--

CREATE TABLE `developpeur` (
  `id` int(11) NOT NULL,
  `AuthentificationID` int(11) NOT NULL,
  `PersonneID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `developpeur`
--

INSERT INTO `developpeur` (`id`, `AuthentificationID`, `PersonneID`) VALUES
(1, 1, 1),
(2, 2, 8),
(3, 3, 9),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `directeur_info`
--

CREATE TABLE `directeur_info` (
  `id` int(11) NOT NULL,
  `AuthentificationID` int(11) NOT NULL,
  `PersonneID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `directeur_info`
--

INSERT INTO `directeur_info` (`id`, `AuthentificationID`, `PersonneID`) VALUES
(1, 4, 10),
(2, 2, 2),
(3, 6, 12);

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id` int(11) NOT NULL,
  `Chef_projetID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`id`, `Chef_projetID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `membre_equipe`
--

CREATE TABLE `membre_equipe` (
  `id` int(11) NOT NULL,
  `DeveloppeurID` int(11) NOT NULL,
  `EquipeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `membre_equipe`
--

INSERT INTO `membre_equipe` (`id`, `DeveloppeurID`, `EquipeID`) VALUES
(1, 1, 1),
(4, 1, 4),
(2, 2, 2),
(3, 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `membre_service`
--

CREATE TABLE `membre_service` (
  `ServiceID` int(11) NOT NULL,
  `Membre_equipeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `membre_service`
--

INSERT INTO `membre_service` (`ServiceID`, `Membre_equipeID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `methodologie`
--

CREATE TABLE `methodologie` (
  `id` int(11) NOT NULL,
  `Nom` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `methodologie`
--

INSERT INTO `methodologie` (`id`, `Nom`) VALUES
(1, 'Scrum'),
(2, 'Kanban'),
(3, 'Agile');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `Adress` varchar(110) DEFAULT NULL,
  `Nom` varchar(110) DEFAULT NULL,
  `Prenom` varchar(110) DEFAULT NULL,
  `Tel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `Adress`, `Nom`, `Prenom`, `Tel`) VALUES
(1, '123 Main St', 'Doe', 'John', 5551234),
(2, '456 Oak St', 'Smith', 'Jane', 5555678),
(3, '789 Pine St', 'Johnson', 'Bob', 5559012),
(4, 'fes nargiss b', 'anas', 'moufid', 645641934);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `id` int(11) NOT NULL,
  `Nom` varchar(110) NOT NULL,
  `Description` text NOT NULL,
  `Date_demarrage` date NOT NULL,
  `Date_livraison` date NOT NULL,
  `Date_reunion` date NOT NULL,
  `Nbr_jour_developpement` int(11) NOT NULL,
  `Chef_projetID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `MethodologieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`id`, `Nom`, `Description`, `Date_demarrage`, `Date_livraison`, `Date_reunion`, `Nbr_jour_developpement`, `Chef_projetID`, `ClientID`, `MethodologieID`) VALUES
(1, 'Project A', 'Description A', '2023-01-01', '2023-12-31', '2023-02-01', 100, 1, 1, 1),
(2, 'Project B', 'Description B', '2023-02-01', '2023-11-30', '2023-03-01', 120, 2, 2, 2),
(3, 'Project C', 'Description C', '2023-03-01', '2023-05-20', '2023-04-01', 80, 3, 3, 3),
(4, 'projet X', 'description X', '2023-12-01', '2023-12-04', '2023-12-05', 125, 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Durée` int(11) NOT NULL,
  `ProjetID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `Description`, `Durée`, `ProjetID`) VALUES
(1, 'Service A', 10, 1),
(2, 'Service B', 15, 2),
(3, 'Service C', 8, 3),
(4, 'description1', 5, 4),
(5, 'DESC5', 125, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `Pourcentage` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`id`, `description`, `Pourcentage`, `ServiceID`) VALUES
(1, 'des1', 50, 1),
(2, 'des2', 75, 2),
(3, 'des3', 97, 3),
(4, 'des4', 26, 4),
(5, 'tache2', 80, 3),
(6, 'tache 1', 91, 5),
(7, 'tache 2', 86, 5),
(8, 'tache 3', 92, 5);

-- --------------------------------------------------------

--
-- Structure de la table `technologie`
--

CREATE TABLE `technologie` (
  `id` int(11) NOT NULL,
  `nom` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `technologie`
--

INSERT INTO `technologie` (`id`, `nom`) VALUES
(1, 'Java'),
(2, 'C#'),
(3, 'JavaScript'),
(4, 'JEE');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authentification`
--
ALTER TABLE `authentification`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chef_projet`
--
ALTER TABLE `chef_projet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Chef_projet_Developpeur` (`DeveloppeurID`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Client_Personne` (`PersonneID`);

--
-- Index pour la table `competance`
--
ALTER TABLE `competance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DeveloppeurID` (`DeveloppeurID`,`TechnologieID`),
  ADD KEY `FK_Competance_Technologie` (`TechnologieID`);

--
-- Index pour la table `developpeur`
--
ALTER TABLE `developpeur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Developpeur_Personne` (`PersonneID`),
  ADD KEY `FK_Developpeur_Authentification` (`AuthentificationID`);

--
-- Index pour la table `directeur_info`
--
ALTER TABLE `directeur_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Directeur_info_Personne` (`PersonneID`),
  ADD KEY `FK_Directeur_info_Authentification` (`AuthentificationID`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `membre_equipe`
--
ALTER TABLE `membre_equipe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DeveloppeurID` (`DeveloppeurID`,`EquipeID`),
  ADD KEY `FK_Membre_equipe_Equipe` (`EquipeID`);

--
-- Index pour la table `membre_service`
--
ALTER TABLE `membre_service`
  ADD UNIQUE KEY `ServiceID` (`ServiceID`,`Membre_equipeID`),
  ADD KEY `FK_Membre_service_Membre_equipe` (`Membre_equipeID`);

--
-- Index pour la table `methodologie`
--
ALTER TABLE `methodologie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Projet_Chef_projet` (`Chef_projetID`),
  ADD KEY `FK_Projet_Client` (`ClientID`),
  ADD KEY `FK_Projet_Methodologie` (`MethodologieID`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Service_Projet` (`ProjetID`);

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Tache_Service` (`ServiceID`);

--
-- Index pour la table `technologie`
--
ALTER TABLE `technologie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `authentification`
--
ALTER TABLE `authentification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `chef_projet`
--
ALTER TABLE `chef_projet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `competance`
--
ALTER TABLE `competance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `developpeur`
--
ALTER TABLE `developpeur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `directeur_info`
--
ALTER TABLE `directeur_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `membre_equipe`
--
ALTER TABLE `membre_equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `methodologie`
--
ALTER TABLE `methodologie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `tache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `technologie`
--
ALTER TABLE `technologie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chef_projet`
--
ALTER TABLE `chef_projet`
  ADD CONSTRAINT `FK_Chef_projet_Developpeur` FOREIGN KEY (`DeveloppeurID`) REFERENCES `developpeur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_Client_Personne` FOREIGN KEY (`PersonneID`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `competance`
--
ALTER TABLE `competance`
  ADD CONSTRAINT `FK_Competance_Developpeur` FOREIGN KEY (`DeveloppeurID`) REFERENCES `developpeur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Competance_Technologie` FOREIGN KEY (`TechnologieID`) REFERENCES `technologie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `developpeur`
--
ALTER TABLE `developpeur`
  ADD CONSTRAINT `FK_Developpeur_Authentification` FOREIGN KEY (`AuthentificationID`) REFERENCES `authentification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Developpeur_Personne` FOREIGN KEY (`PersonneID`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `directeur_info`
--
ALTER TABLE `directeur_info`
  ADD CONSTRAINT `FK_Directeur_info_Authentification` FOREIGN KEY (`AuthentificationID`) REFERENCES `authentification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Directeur_info_Personne` FOREIGN KEY (`PersonneID`) REFERENCES `personne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `membre_equipe`
--
ALTER TABLE `membre_equipe`
  ADD CONSTRAINT `FK_Membre_equipe_Developpeur` FOREIGN KEY (`DeveloppeurID`) REFERENCES `developpeur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Membre_equipe_Equipe` FOREIGN KEY (`EquipeID`) REFERENCES `equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `membre_service`
--
ALTER TABLE `membre_service`
  ADD CONSTRAINT `FK_Membre_service_Membre_equipe` FOREIGN KEY (`Membre_equipeID`) REFERENCES `membre_equipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Membre_service_Service` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `FK_Projet_Chef_projet` FOREIGN KEY (`Chef_projetID`) REFERENCES `chef_projet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Projet_Client` FOREIGN KEY (`ClientID`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Projet_Methodologie` FOREIGN KEY (`MethodologieID`) REFERENCES `methodologie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_Service_Projet` FOREIGN KEY (`ProjetID`) REFERENCES `projet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `FK_Tache_Service` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
