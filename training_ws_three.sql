-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 10 nov. 2025 à 20:24
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `training_ws_three`
--

-- --------------------------------------------------------

--
-- Structure de la table `communes`
--

CREATE TABLE `communes` (
  `commune_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `communes`
--

INSERT INTO `communes` (`commune_id`, `name`) VALUES
(1, 'Bruxelles');

-- --------------------------------------------------------

--
-- Structure de la table `wifi_access_points`
--

CREATE TABLE `wifi_access_points` (
  `wifi_id` int(11) NOT NULL,
  `dataset_id` varchar(255) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `commune_id` int(11) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wifi_access_points`
--

INSERT INTO `wifi_access_points` (`wifi_id`, `dataset_id`, `location_name`, `address`, `commune_id`, `latitude`, `longitude`) VALUES
(1, 'dca511e3265e966d122be3f0815d1355965807e1', 'Place Royale', 'Place Royale, 2 - 1000 Bruxelles', 1, 50.842305, 4.359477),
(2, 'c87d044a36f6a5a499c53c19db37b517a0735b2d', 'Place Sainte-Catherine', 'Place Sainte-Catherine', 1, 50.850595, 4.347675),
(3, 'f9cf1b4f293fc4304b89671f8e57fcee04ffb46c', 'Centre sportif de Haren', 'Rue du hall des Sports, 15 - 1000 Bruxelles', 1, 50.891685, 4.420471),
(4, 'c4ec585e4e73dbcdce2b98295a8188408437aefd', 'Mont des Arts - Bibliothèque Royale', 'Boulevard de l\'Empereur, 4 - 1000 Bruxelles', 1, 50.843862, 4.356764),
(5, '02e9d17942b60229814e87de7aa84256c7c477f5', 'Actiris - Bureau Bruxelles', 'Bd d\'Anvers 26 - 1000 Bruxelles', 1, 50.856941, 4.351586),
(6, '96320f915111676a463d6ab8630a9a67062e7d43', 'Grand-Place', 'Grand-Place', 1, 50.846747, 4.352462),
(7, '24498390161ae755a373fcb042d68059312ee2f9', 'Centre Administratif de la Ville de Bruxelles', 'Boulevard Anspach 6 - 1000 Bruxelles', 1, 50.850561, 4.352256),
(8, '7cdc4eb638c2d28b83b57cbab6834cab3f870273', 'Maison d\'Art Actuel des Chartreux (MAAC)', 'Rue des Chartreux 26 - 1000 Bruxelles', 1, 50.848753, 4.346705),
(9, 'abe051d819bf3e1830e2a5e73b959f5ea8bdf528', 'Maison Patricienne', 'Rue du Chêne 10 - 1000 Bruxelles', 1, 50.844642, 4.350480),
(10, 'ad18d3d82d1d3f75abc7555f3b0b2bc0495bdb35', 'Metro_Porte de Hal', NULL, 1, 50.833213, 4.345604),
(11, 'd46c8699e85063ac765dc137ff2375b6149d4053', 'Metro_Anneessens', NULL, 1, 50.844104, 4.345216),
(12, 'bc2f13e3bcacedece7b9b2c1f137bc4783743039', 'Metro_Louise', NULL, 1, 50.835645, 4.355096),
(13, '0dbe239418d66765f31af1d4ec3e8a7392c83b9b', 'Fondation Kanal', 'Quai de Willebroek, 6 - 1000 Brussels', 1, 50.859056, 4.348970),
(14, '0977c251d399c9679fdaf1d01df54e08198ecd55', 'Centre d\'informatique pour la Région Bruxelloise (CIRB)', 'Avenue des Arts, 21 - 1000 Bruxelles', 1, 50.846142, 4.369319),
(15, 'e4d8075bf8d6d25ad54605b2beb588b4c733150e', 'Bruxelles Environnement - Tour & Taxis', 'Tour & Taxis - Avenue du Port, 86C', 1, 50.867894, 4.349752),
(16, 'b287cff4d616c680c04f598ce6e398c438b552b5', 'Metro_Sainte-Catherine', NULL, 1, 50.852280, 4.347710),
(17, '2b5dee0e6e1e4d942479ecb410f207fdbee9c5d6', 'Metro_Parc', NULL, 1, 50.845785, 4.362196),
(18, 'f76d7fdbc7decdec467198adced8d476ebf617d5', 'Metro_Gare Centrale', NULL, 1, 50.846500, 4.358921),
(19, 'd3037655c16291c7b60d1580715d97788cd0d434', 'Metro_Houba-Brugmann', NULL, 1, 50.889122, 4.338201),
(20, '05bb9860259fb60c206906c8238a088073d99498', 'Metro_Schuman', NULL, 1, 50.842820, 4.381816),
(21, '494d0c4f56b47ac85e819ca4cf0fef8cdafb2576', 'BUP Bruxelles Urbanisme et Patrimoine', 'Mont des Arts, 12-13 - 1000 Bruxelles', 1, 50.844437, 4.357479),
(22, 'abc6edc4036a7d47babbc24a012c7af16d802e9a', 'Complexe sportif de Neder-Over-Heembeek', 'Rue de Lombartzyde 120 - 1120 Neder-Over-Hembeek', 1, 50.892882, 4.376918),
(23, '8b6f2433db53ddae28e32bbb02fc8e80821ca963', 'Complexe sportif du Palais du Midi', 'Rue Roger Van der Weyden 3 - 1000 Bruxelles', 1, 50.841889, 4.343493),
(24, '0712f10090932fd747391e8d82dd5a925ab6a339', 'Hotel Continental', 'Place De Brouckère 41', 1, 50.852100, 4.353410),
(25, 'd61139b9194ba9e6c067274053d886c9f4e1db97', 'Espace S Léopold', 'Square Prince Léopold', 1, 50.883673, 4.341004),
(26, 'b6aee36c8dbc58e5ba53d6421358f66aa32babbf', 'Maison de Quartier Millénaire', 'Chaussée d\'Anvers 150 A', 1, 50.863265, 4.356395),
(27, 'cbe41a627ff553c99ecf424fd166f380cc798e7a', 'GardeRobe MannekenPis', 'rue du Chene, 19 - 1000 Bruxelles', 1, 50.844192, 4.350792),
(28, '99d6315e200e856b4b00e65de0853bb6fd1f653b', 'Metro_Heysel - Heizel', NULL, 1, 50.896593, 4.337014),
(29, '5213a4a4eac5cba1c0566c807bc82ac0eb89c2bf', 'Place Rouppe', 'Place Rouppe - 1000 Bruxelles', 1, 50.842803, 4.345832),
(30, '211bfd37db0dffad2da2600647b0fc8735756d1e', 'Musée du Costume et de la Dentelle', 'Rue de la Violette 12 - 1000 Bruxelles', 1, 50.845769, 4.351964),
(31, '5e6a1393a9aee506f94546b4e8ac5ce286a0a715', 'Metro_Lemonnier', NULL, 1, 50.840311, 4.341259),
(32, '1baa269a33a6e4688ab93b0600f5e2e71ff52af9', 'Place Emile Bockstael', 'Place Emile Bockstael', 1, 50.877137, 4.347440),
(33, 'a7c7d16e79b4e9d36252e983504218f3430883b8', 'Place du Jeu de Balle', 'Place du Jeu de Balle - 1000 Bruxelles', 1, 50.837009, 4.345736),
(34, '3bdc80f7fcd81b682375fd8d3ebc69c76fcae25d', 'Metro_Bourse', NULL, 1, 50.847835, 4.349138),
(35, 'de749d37f317052d62cd2c773396380761484ed7', 'Bruxelles Formation - Carrefour Site', 'Bd Bischoffsheim, 22-25 - 1000 Bruxelles (bâtiment Orion rez + 1e étage +', 1, 50.850649, 4.368268),
(36, 'e902957961e55e1c20ea2a6e932f9669e3f90cc2', 'Place de la Monnaie', 'Place de la Monnaie - 1000 Bruxelles', 1, 50.850002, 4.353347),
(37, '11d873c5e3c2d7d559178caaca430402e1ce67aa', 'GIAL', 'Boulevard Emile Jacqmainlaan 95', 1, 50.854423, 4.354657),
(38, 'afc13986cca23dd4a3e355d222c9c625694efd62', 'Bureau de liaison Louise', 'Boulevard de la Cambre 34', 1, 50.815917, 4.374788),
(39, '4c6857f8ede7da7ac6481f709c58c9dc2dccafa6', 'Metro_Arts-loi', NULL, 1, 50.845500, 4.368804),
(40, '8ac3a97a6a2260e1adc2b5ccfca2bf25ed697fec', 'Metro_Stuyvenbergh', NULL, 1, 50.885614, 4.342651),
(41, '27115602e58d2034d9a9317e67dc4b27c93b787e', 'Metro_Maelbeek', NULL, 1, 50.843862, 4.376787),
(42, 'ca24f18947fd984a674c3cf555efab3c6945bf7d', 'Metro_Trône', NULL, 1, 50.840637, 4.366192),
(43, '556a879c28cc34239b36d485469657c4a48a00b6', 'Metro_Yser', NULL, 1, 50.857239, 4.351470),
(44, '34a2be23674191f4c328ae5a56c9b47521540886', 'Musée de la Ville de Bruxelles', 'Grand Place - 1000 Bruxelles', 1, 50.847001, 4.352809),
(45, '55824cc2c5e8e27e0cd89d1388402d5bbaa0db83', 'CENTRALE/lab', 'Place Sainte-Catherine 44 - 1000 Bruxelles', 1, 50.850255, 4.348217),
(46, '5180c4aabedeec63c4ac67254d8c9605a70c735b', 'Quai des Péniches', 'Quai des péniches, 16 - 1000 Bruxelles', 1, 50.860511, 4.348487),
(47, '959e3e4700bdacd187ed07d7057f4d3286165c65', 'Parlement Bruxellois', 'Rue du Lombard, 69 - 1000 Bruxelles', 1, 50.844917, 4.351521),
(48, 'cf1b7960fea8e6aff176c0b53be5a3f369b55a25', 'Bruxelles Formation - site Tremplin Jeunes', 'Rue Royale, 180', 1, 50.851447, 4.364560),
(49, 'df8e74dbce36b39b6ae406e12b26bb1b5c464e8e', 'Metro_Bockstael', NULL, 1, 50.879692, 4.347800),
(50, '979277444643c4506a26e3c964c9cf48a7991f17', 'Coudenberg', 'Koudenberg, 3 - 1000 Bruxelles', 1, 50.843094, 4.358020),
(51, '663f790de76e942491cc04449f22dcb932721278', 'Metro_Madou', NULL, 1, 50.850431, 4.368904),
(52, 'a576dbadabe89890e89d0f2d30d818cccbb2d16f', 'Espace S Cinquantenaire', 'Parc du Cinquantenaire', 1, 50.842585, 4.389637),
(53, 'bca78b72c83d979a01d95fab64e55fd60eb12bad', 'BruSurf', 'Rue Saint-André 4 - 1000 Bruxelles', 1, 50.854057, 4.345801),
(54, 'b555c644c4fd40af9887c55e1392f26373281ab8', 'Maison de Quartier Cité Modèle', 'Allée du Rubis', 1, 50.895658, 4.324171),
(55, 'd31517e1c769f90eb5d5cdacc4c48b440a7adeaf', 'Metro_Porte de Namur', NULL, 1, 50.838464, 4.362112),
(56, '1afe034c43e3c4721575aa22605febc65af15816', 'Maison de Quartier Haren', 'Rue de Cortenbach 11', 1, 50.892259, 4.417291),
(57, '2a5c04c69a4c251e4acd2386018184a451f42fcf', 'Metro_Roi Baudouin', NULL, 1, 50.896433, 4.328128),
(58, '934f7952fb03852810eb33c0ba61a1f4d5b8ef1f', 'Hotel de Ville de Bruxelles', 'Grand Place - 1000 Bruxelles', 1, 50.846615, 4.351937),
(59, 'd54f0281fa133911cdd31947842c2dd5f1851e3a', 'Centre sportif Croix de Guerre', 'Avenue des Croix de Guerre - 1120 NOH', 1, 50.891557, 4.384266),
(60, '2cdebea3583f1dc6b4b58814cb761d56a6e5b3f2', 'Bureau de liaison Nord-Est', 'Rue Van Campenhout 16', 1, 50.847698, 4.385719),
(61, '1c3ca11afc7b187d6e2f0cf10bf41cfbecc45be0', 'Maison de Quartier Rossignol', 'Chemin du Rossignol 18-2°', 1, 50.895585, 4.385503),
(62, '3f1fdb24fcc6dc352462dfce3e9b2e5791c31804', 'Actiris - Observatoire Bruxellois de l\'emploi', 'Rue Royale,145 -  1000 Bruxelles', 1, 50.852674, 4.365730),
(63, '8513b96ed5e7e7d186b7ba7eab951a6517398e3a', 'Metro_Hôtel des Monnaies', NULL, 1, 50.833588, 4.349862),
(64, 'a4b4d6f767bbe69f1726b64f24b74db683c1b327', 'Place De Brouckère', 'Place De Brouckère - 1000 Bruxelles', 1, 50.851457, 4.352785),
(65, 'ec29ffc4b767162eee64a8aa3a729f3c2aea153a', 'Bruxelles Formation - Site Botanique', 'Boulevard Adolphe Max, 157 - 1000 Bruxelles', 1, 50.854985, 4.357631),
(66, '189f21266b098a4695ec7de98c9eb9870bd9eccb', 'parking.brussels', 'Rue de l\'Hopital, 31', 1, 50.843881, 4.353419),
(67, '66c881902b0bcb329a537bbbf8fe54ac850777b6', 'Metro_Pannenhuis', NULL, 1, 50.873364, 4.342759),
(68, 'b0a4c17ca2c22872f6d32ef90955fbfc164c521b', 'Bruxelles Formation - Site Tremplin', 'Rue Royale, 93 - 1000 Bruxelles', 1, 50.847886, 4.362798),
(69, '4338785ef34d3c9754f5857d2ae23b12d73ef61b', 'Musée des Instruments de Musique (MIM)', 'Hofberg, 2 - 1000 Bruxelles', 1, 50.842725, 4.359079),
(70, 'b2dd65804ca3e4bedef1e36b428f272fa85f95e3', 'Place de la Bourse', 'Place de la Bourse - 1000 Bruxelles', 1, 50.848609, 4.349734),
(71, '412e8057824c19339337db11e060e724c7aab04b', 'Centre de jeunes Averroès', 'Cité Modèle - Allée du Rubis', 1, 50.895161, 4.323581),
(72, '4aeeb3711e0d10a18ac2901aaa516c0b524b9d75', 'Place Saint-Jean', 'Rue du Lombard, 77 - 1000 Bruxelles', 1, 50.844660, 4.352997),
(73, '17f3a54994778ce179ce65b5e7a2b9bf4a61106c', 'Metro_De Brouckere', NULL, 1, 50.850982, 4.352450),
(74, '9c6da2963e1681dd0f1122907126069531806c22', 'Archives de la Ville de Bruxelles', 'Rue des Tanneurs 65 - 1000 Bruxelles', 1, 50.839493, 4.346098),
(75, '88040a98691332227cffd76017f10a8ebbbe348e', 'Central d’Achats', 'Boulevard du Neuvième de Ligne 39', 1, 50.857249, 4.345635),
(84, 'c87d044a36f6a5a499c53c19db37b517a0735b2c', 'Place Sainte-Catherine', 'Place Sainte-Catherine', 1, 50.850595, 4.347675),
(85, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'Place Sainte-Catherine', 'Place Sainte-Catherine', 1, 50.850595, 4.347675);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `wifi_access_points_view`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `wifi_access_points_view` (
`wifi_id` int(11)
,`dataset_id` varchar(255)
,`location_name` varchar(255)
,`address` varchar(255)
,`commune_id` int(11)
,`commune_name` varchar(100)
,`latitude` decimal(9,6)
,`longitude` decimal(9,6)
);

-- --------------------------------------------------------

--
-- Structure de la vue `wifi_access_points_view`
--
DROP TABLE IF EXISTS `wifi_access_points_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wifi_access_points_view`  AS SELECT `w`.`wifi_id` AS `wifi_id`, `w`.`dataset_id` AS `dataset_id`, `w`.`location_name` AS `location_name`, `w`.`address` AS `address`, `w`.`commune_id` AS `commune_id`, `c`.`name` AS `commune_name`, `w`.`latitude` AS `latitude`, `w`.`longitude` AS `longitude` FROM (`wifi_access_points` `w` left join `communes` `c` on(`w`.`commune_id` = `c`.`commune_id`)) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `communes`
--
ALTER TABLE `communes`
  ADD PRIMARY KEY (`commune_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `wifi_access_points`
--
ALTER TABLE `wifi_access_points`
  ADD PRIMARY KEY (`wifi_id`),
  ADD UNIQUE KEY `dataset_id` (`dataset_id`),
  ADD KEY `commune_id` (`commune_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `communes`
--
ALTER TABLE `communes`
  MODIFY `commune_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `wifi_access_points`
--
ALTER TABLE `wifi_access_points`
  MODIFY `wifi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `wifi_access_points`
--
ALTER TABLE `wifi_access_points`
  ADD CONSTRAINT `wifi_access_points_ibfk_1` FOREIGN KEY (`commune_id`) REFERENCES `communes` (`commune_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
