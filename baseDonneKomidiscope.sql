-- Creation base d donnée
CREATE DATABASE if not exists db_komidi;

-- CREATION UTILISATEUR DE LA BASE DE DONNEE
CREATE USER 'komidi'@'localhost' IDENTIFIED BY 'azerty';
GRANT INSERT,SELECT,UPDATE ON db_komidi. * TO 'komidi'@'localhost';

-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 15, 2017 at 10:05 AM
-- Server version: 5.5.54-MariaDB-1ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_komidi`
--

DELIMITER $$
--
-- Functions
--
CREATE FUNCTION `envoyeMail`( texte VARCHAR(50) ) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE nb INT(1);
	SELECT LENGTH(texte) INTO nb;
	return ( nb);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE IF NOT EXISTS `api_key` (
  `idCle` int(1) NOT NULL AUTO_INCREMENT,
  `cle` varchar(30) NOT NULL,
  PRIMARY KEY (`idCle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `api_key`
--

INSERT INTO `api_key` (`idCle`, `cle`) VALUES
(1, '31bed188884e193d8465226');

-- --------------------------------------------------------

--
-- Stand-in structure for view `cinqBestSpectacle`
--
CREATE TABLE IF NOT EXISTS `cinqBestSpectacle` (
`Spe_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `erec_info_admin`
--

CREATE TABLE IF NOT EXISTS `erec_info_admin` (
  `id_info` int(4) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `code` varchar(15) NOT NULL,
  `message` varchar(255) NOT NULL,
  `fichier` varchar(30) NOT NULL,
  `ligne` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_info`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kdi_contact`
--

CREATE TABLE IF NOT EXISTS `kdi_contact` (
  `id_msg` int(3) NOT NULL AUTO_INCREMENT,
  `msg_civilite` varchar(12) NOT NULL,
  `msg_nom` varchar(25) NOT NULL,
  `msg_prenom` varchar(25) NOT NULL,
  `msg` text NOT NULL,
  `msg_ville` varchar(35) DEFAULT NULL,
  `msg_cde` varchar(5) DEFAULT NULL,
  `msg_email` varchar(255) NOT NULL,
  `msg_date` datetime NOT NULL,
  PRIMARY KEY (`id_msg`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `kdi_contact`
--

INSERT INTO `kdi_contact` (`id_msg`, `msg_civilite`, `msg_nom`, `msg_prenom`, `msg`, `msg_ville`, `msg_cde`, `msg_email`, `msg_date`) VALUES
(1, 'Mademoiselle', 'Lefevre', 'alexandre', '<!DOCTYPE html>\n                <html>\n                <head>\n	                <title>Contact Komidi via plateforme komidiscope</title>\n                </head>\n                <body>\n	                <h1>Mademoiselle, Lefevre alexandre</h1>\n	                <p>Résident à Saint-Louis,97450,</p>\n	                <h1>Message: <p>bonjour</p></h1>\n                </body>\n                </html>', 'Saint-Louis', '97450', 'a@gmail.com', '2017-04-24 17:14:15'),
(2, 'Mademoiselle', 'Lefevre', 'alexandre', '<!DOCTYPE html>\n                <html>\n                <head>\n	                <title>Contact Komidi via plateforme komidiscope</title>\n                </head>\n                <body>\n	                <h1>Mademoiselle, Lefevre alexandre</h1>\n	                <p>Résident à Saint-Louis,97450,</p>\n	                <h1>Message: <p>bonjour</p></h1>\n                </body>\n                </html>', 'Saint-Louis', '97450', 'a@gmail.com', '2017-04-24 17:16:41'),
(3, 'Monsieur', 'Lefevre', 'alexandre', '<!DOCTYPE html>\n                <html>\n                <head>\n	                <title>Contact Komidi via plateforme komidiscope</title>\n                </head>\n                <body>\n	                <h1>Monsieur, Lefevre alexandre</h1>\n	                <p>Résident à Saint-Louis,97450,</p>\n	                <h1>Message: <p>bonjour tes '''' eddf'''' ((rs </p></h1>\n                </body>\n                </html>', 'Saint-Louis', '97450', 'a@gmail.com', '2017-04-24 17:50:24'),
(4, 'Madame', 'Lefevre', 'alexandre', '<!DOCTYPE html>\n                <html>\n                <head>\n	                <title>Contact Komidi via plateforme komidiscope</title>\n                </head>\n                <body>\n	                <h1>Madame, Lefevre alexandre</h1>\n	                <p>Résident à Saint-Louis,97450,</p>\n	                <h1>Message: <p>frreezer</p></h1>\n                </body>\n                </html>', 'Saint-Louis', '97450', 'a@gmail.com', '2017-04-24 17:51:45'),
(5, 'Monsieur', 'Lefevre', 'Loic', '<!DOCTYPE html>\n                <html>\n                <head>\n	                <title>Contact Komidi via plateforme komidiscope</title>\n                </head>\n                <body>\n	                <h1>Monsieur, Lefevre Loic</h1>\n	                <p>Résident à Saint-Louis,97450,</p>\n	                <h1>Message: <p>hi</p></h1>\n                </body>\n                </html>', 'Saint-Louis', '97450', 'a@gmail.com', '2017-04-24 17:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `kdi_genre`
--

CREATE TABLE IF NOT EXISTS `kdi_genre` (
  `Gre_code` int(11) NOT NULL AUTO_INCREMENT,
  `Gre_nom` varchar(80) NOT NULL DEFAULT 'Comédie',
  PRIMARY KEY (`Gre_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `kdi_genre`
--

INSERT INTO `kdi_genre` (`Gre_code`, `Gre_nom`) VALUES
(1, 'Théâtre musical et humoristique'),
(2, 'comédie satirique'),
(3, 'théâtre jeune public'),
(4, 'burlesque et théâtre d''objet en français et en créole'),
(5, 'théâtre'),
(6, 'Théâtre musical et humoristique'),
(7, 'comédie satirique'),
(8, 'Spectacle de dessin sur sable '),
(9, 'Danse-théâtre'),
(10, 'théâtre gestuel'),
(11, 'Marionnette – objet'),
(12, 'Théâtre d''humour musical'),
(13, 'lecture théâtralisée'),
(14, 'spectacle musical - Opéra'),
(15, 'Théâtre danse et humour'),
(16, 'duo de spectacle musical'),
(17, 'Marionnettes sur table, musical et sans paroles');

-- --------------------------------------------------------

--
-- Table structure for table `kdi_horaire`
--

CREATE TABLE IF NOT EXISTS `kdi_horaire` (
  `Hor_id` int(11) NOT NULL AUTO_INCREMENT,
  `Hor_Début` time NOT NULL,
  PRIMARY KEY (`Hor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kdi_horaire`
--

INSERT INTO `kdi_horaire` (`Hor_id`, `Hor_Début`) VALUES
(1, '19:30:00'),
(2, '20:00:00'),
(3, '16:00:00'),
(4, '19:00:00'),
(5, '17:00:00'),
(6, '18:00:00'),
(7, '15:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `kdi_listenbNote_Moyenne`
--
CREATE TABLE IF NOT EXISTS `kdi_listenbNote_Moyenne` (
`nbDenote` bigint(21)
,`Spe_id` int(11)
,`moyenneNote` decimal(14,4)
);
-- --------------------------------------------------------

--
-- Table structure for table `kdi_salle`
--

CREATE TABLE IF NOT EXISTS `kdi_salle` (
  `Sal_id` int(11) NOT NULL,
  `Sal_nom` varchar(30) NOT NULL,
  `Sal_latitude` double DEFAULT NULL,
  `Sal_longitude` double DEFAULT NULL,
  `Sal_jauge` int(4) DEFAULT NULL,
  `Sal_adresse` varchar(255) DEFAULT 'Inconnue',
  PRIMARY KEY (`Sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kdi_salle`
--

INSERT INTO `kdi_salle` (`Sal_id`, `Sal_nom`, `Sal_latitude`, `Sal_longitude`, `Sal_jauge`, `Sal_adresse`) VALUES
(0, 'Césaire', -20.9138081, 55.6106246, 110, 'Saint-Suzanne'),
(1, 'Le Royal', -21.380171, 55.616111, 400, 'Saint Joseph'),
(2, 'Gymnase du lycée de Vincendo', -21.3768, 55.6685, NULL, 'Vincendo'),
(3, 'Auditorium', -21.378829, 55.615206, 170, 'Saint Joseph'),
(4, 'Pierre Poivre', -21.373768, 55.624068, 50, 'Rue Hippolyte Foucque Saint Joseph'),
(5, 'Antoine Roussin', -21.273437, 55.414074, NULL, 'Rue Leconte de Lisle Saint Louis'),
(6, 'Langenier', -21.33367, 55.465727, 210, '1-13 Rue De La Republique Saint Pierre'),
(7, 'Blanche Pierson', -21.377093, 55.614798, 60, '4, rue Roland Garros St Joseph'),
(8, 'Fangourin', -21.355097, 55.566001, 190, '20 Rue du General de Gaulle Petite Ile'),
(9, 'Achile Grondin', -21.377889, 55.607305, NULL, '17 Rue Justinien Vitry Saint-Joseph'),
(10, 'Hall du Marché', NULL, NULL, 600, 'Saint-Joseph'),
(11, 'MpT Jean Petit', -21.339488, 55.628922, 50, '56-58 Rue Amélie Lebon Saint-Joseph'),
(12, 'MpT Plaine des Grègues', -21.326836, 55.607609, 100, '2-12 Rue du Rond Saint-Joseph'),
(13, 'Madoré', -21.359956, 55.767228, 240, '1 Rue du Stade Saint-Philippe'),
(14, 'Césaire', -20.9138081, 55.6106246, 110, 'Saint-Suzanne'),
(15, 'Lespas', -21.002227, 55.1926142, 160, 'Saint-Paul'),
(16, 'Pierrefonds', NULL, NULL, 230, 'Saint-Pierre');

-- --------------------------------------------------------

--
-- Table structure for table `kdi_seance`
--

CREATE TABLE IF NOT EXISTS `kdi_seance` (
  `Sec_idSal` int(11) NOT NULL,
  `Sec_idHor` int(11) NOT NULL,
  `Sec_date` date NOT NULL,
  `Sec_idSpec` int(11) NOT NULL,
  PRIMARY KEY (`Sec_idSal`,`Sec_idHor`,`Sec_date`,`Sec_idSpec`),
  KEY `FK_spcsnc` (`Sec_idSpec`),
  KEY `FK_horsnc` (`Sec_idHor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kdi_spectacle`
--

CREATE TABLE IF NOT EXISTS `kdi_spectacle` (
  `Spe_id` int(11) NOT NULL AUTO_INCREMENT,
  `Spe_titre` varchar(50) NOT NULL,
  `Spe_mes` varchar(50) NOT NULL,
  `Spe_acteur` text,
  `Spe_cie` varchar(80) NOT NULL,
  `Spe_genre` varchar(30) DEFAULT NULL,
  `Spe_duree` int(11) NOT NULL,
  `Spe_Lang` varchar(30) DEFAULT 'Français',
  `Spe_public` enum('tout','Scolaire') DEFAULT 'Scolaire',
  `Spe_affiche` varchar(50) NOT NULL,
  `Spe_resume_court` varchar(500) NOT NULL,
  `Spe_resume_long` text,
  `IdSpecSalle` int(11) NOT NULL,
  PRIMARY KEY (`Spe_id`),
  KEY `SpecSalleId` (`IdSpecSalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=188 ;

--
-- Dumping data for table `kdi_spectacle`
--

INSERT INTO `kdi_spectacle` (`Spe_id`, `Spe_titre`, `Spe_mes`, `Spe_acteur`, `Spe_cie`, `Spe_genre`, `Spe_duree`, `Spe_Lang`, `Spe_public`, `Spe_affiche`, `Spe_resume_court`, `Spe_resume_long`, `IdSpecSalle`) VALUES
(0, '150Kg à deux...On vous en met un peu plus ?', '', '', 'Samovar', '', 60, 'FR', '', '2017-150kg.jpg', 'Deux drôles d’oiseaux se livrent sans retenue à une festive joute verbale, un combat à mots nus, phrases délicates et refrains sans cholestérol.', 'Deux drôles d’oiseaux se livrent sans retenue à une festive joute verbale, un combat à mots nus, phrases délicates et refrains sans cholestérol.\nLeur cahier des charges ? La légèreté ! Sur la balance, pas un gramme de gras, deux écritures aériennes, car, voyez-vous, ces deux-là ont de la plume !\nUn émincé de traits d’esprit en apesanteur, avec pour seules armes une guitare aérienne et deux pupitres venus à pied. Deux poids... démesure !', 1),
(1, 'Au nom du pèze', '', '', 'La belle équipe', '', 60, 'FR', '', '2017-peze.jpg', 'Richard est devenu, à contrario de ses utopies juvéniles, l’homme d’affaire le plus riche de la planète. Il est accro à l’argent. Comme pour toute drogue dure, cette addiction le mène jusqu’à l’overdose.', 'Richard est devenu, à contrario de ses utopies juvéniles, l’homme d’affaire le plus riche de la planète. Il est accro à l’argent. Comme pour toute drogue dure, cette addiction le mène jusqu’à l’overdose. Si cette fois il en réchappe, il n’en demeure pas moins contraint de suivre une cure de désintoxication monétaire. Sur le conseil des A.A.A (les Accros à l’Argent Anonyme) et afin d’éviter la rechute fatale, il doit tout mettre en œuvre pour perdre de l’argent, se « désenrichir » …. Désenrichir ? Le mot n’existe pas. Comment Richard va-t-il réussir cette course au «désenrichissement » ? Comment réaliser cette folle utopie de posséder moins quand on a tout et que ce tout rapporte dividendes sur dividendes contre sa propre volonté ? Comment échapper au système dont on est le maître-artisan ? Comment fuir un film catastrophe quand on en est l’acteur principal ?', 2),
(2, 'Au pied de mon arbre', '', '', 'Maecha Métis', '', 60, 'FR', '', '2017-pieddemonarbre.jpg', 'L’arbre rouge est un fabuleux trésor dans le jardin de l’enfance de deux petites sœurs qui s’inventent milles et une façon de rencontrer la grande Vie et ses mystères. ', 'L’arbre rouge est un fabuleux trésor dans le jardin de l’enfance de deux petites sœurs qui s’inventent milles et une façon de rencontrer la grande Vie et ses mystères. \nFleur a six ans. Elle aime les fleurs, les arbres, l’odeur de la terre, les petites bêtes et les coccinelles, le parfum de la citronnelle et les histoires de graines.\nRosa, la soeur de Fleur a huit ans. Elle aime les livres, les parfums d’orient, la musique, les vieux objets et le parfum de mémé Adélaïde. Elle aime les jupons qui dépassent de sa robe.\nFleur veut la valise Rouge de Rosa, elle sait qu’elle contient les secrets de sa soeur. Rosa veut les lunettes de Fleur, elle sait qu’elles possèdent un pouvoir magique.\nAu pied de mon arbre est l’histoire d’enfants qui cherchent des réponses à leurs questions et qui trouvent des réponses qui font naitre d’autres questions …', 3),
(3, 'Aujourd’hui plus qu’hier', '', '', 'Théâtre enfance', '', 60, 'FR', '', '2017-aujourdhuiplus.jpg', 'Dans leur petite salle-à-manger trop moderne pour eux, Minouche et Minouche, couple de centenaires à la mémoire défaillante, tentent de se rappeler leurs vrais prénoms.', 'Dans leur petite salle-à-manger trop moderne pour eux, Minouche et Minouche, couple de centenaires à la mémoire défaillante, tentent de se rappeler leurs vrais prénoms.\nAujourd''hui, Minouche et Minouche sont très très vieux.  Quel âge a-t-il ? Quel âge a-t-elle ? Ils ne savent plus très bien. Hier, c''était une autre histoire : hier, ils n''avaient pas le même prénom. Il s''appelait....    Elle s''appelait... Comment s''appelaient-ils donc? Ils ont la mémoire qui bugge.\nPourtant Minouche , elle, pourrait tout vous raconter de leur rencontre,  ils étaient des enfants, il y a... combien de temps ? Il y a si longtemps. Et Minouche, lui, pourrait vous dire la suite, quand tout a commencé vraiment, dans ce "bal la poussière".\nMinouche et Minouche connaissent si bien cette histoire là qu''ils en oublient le reste :   ont-ils déjà mangé ce midi? Oui, non, peut-être. Et comment marchent ces choses là, maintenant? Télévision, télécommande, décodeur, ventilateur, télécommande, téléphone, radio, chaîne Hifi, télécommande... Tant d''étranges machines sans fil ni bouton, aujourd''hui. ', 4),
(4, 'Bashir Lazhar', '', '', 'Théâtre des béliers', '', 60, 'FR', '', '2017-bashir.jpg', 'L’histoire extraordinaire d’un homme ordinaire. Embauché au pied levé comme professeur remplaçant dans une école primaire, Bashir Lazhar, enseignant pas comme les autres, apprend peu à peu à connaître et à s’attacher à ses élèves. Et pendant ce temps, personne à l’école ne soupçonne le passé de Bashir…', 'L’histoire extraordinaire d’un homme ordinaire. Embauché au pied levé comme professeur remplaçant dans une école primaire, Bashir Lazhar, enseignant pas comme les autres, apprend peu à peu à connaître et à s’attacher à ses élèves. Et pendant ce temps, personne à l’école ne soupçonne le passé de Bashir…\nUne pièce en forme de puzzle, qui parle à la fois d’éducation, d’amour, de migration, d’enfance, de violence, de dictée, de justice, de cour de récréation, de transmission, de guerre et de taille-crayon.', 5),
(5, 'Boby Lapointe', '', '', 'Lagence de spectacles', '', 60, 'FR', '', '2017-boby.jpg', 'Accompagné de sa guitare et de son accordéon diatonique, Jacques Dau entre de plain-pied dans l’univers absurde de Boby Lapointe et on l’accompagne avec plaisir.', 'Accompagné de sa guitare et de son accordéon diatonique, Jacques Dau entre de plain-pied dans l’univers absurde de Boby Lapointe et on l’accompagne avec plaisir.\nIl nous raconte l’histoire du jeu de mots. Le premier qu’on a compris, c’était lequel ? Et c’était quand ? D’un coup, à ce moment-là, très précis, on a eu cette sensation délicieuse d’être plus intelligent, comme si, dans notre cerveau, une fenêtre supplémentaire s’ouvrait et nous faisant entrevoir un autre monde, parallèle au nôtre, avec son propre langage.', 6),
(6, 'Caché dans son buisson de lavande, Cyrano sentait ', '', '', 'Hecho en casa', '', 60, 'FR', '', '2017-cachecyrano.jpg', 'Quand on a un gros nez, on peut aussi avoir une vie normale. Manger (sans trop de poivre), boire (avec une paille), dormir (sauf sur le ventre) et être amoureux (sans commentaires). Cyrano était amoureux. De sa cousine Roxanne.', 'Quand on a un gros nez, on peut aussi avoir une vie normale. Manger (sans trop de poivre), boire (avec une paille), dormir (sauf sur le ventre) et être amoureux (sans commentaires). Cyrano était amoureux. De sa cousine Roxanne.', 7),
(7, 'Camille et Simon fêtent leur divorce', '', '', 'Toizémoi', '', 60, 'FR', '', '2017-camilleetsimon.jpg', 'Le One-Couple-Show qui titille la libido. Camille et Simon ont la joie de vous faire part de leur divorce ! Ce soir ils donnent une réception avec traiteur et orchestre. Parents et amis sont là pour immortaliser l’évènement.', 'Le One-Couple-Show qui titille la libido. Camille et Simon ont la joie de vous faire part de leur divorce ! Ce soir ils donnent une réception avec traiteur et orchestre. Parents et amis sont là pour immortaliser l’évènement.', 8),
(8, 'Des rêves dans le sable', '', '', 'Compagnie sable d’avril', '', 60, 'FR', '', '2017-revesdanssable.jpg', 'Lorène Bihorel est une jeune artiste qui excelle dans une discipline d’un genre nouveau. Elle présente un spectacle étonnant de dessin sur sable, qui émerveille les enfants et fascine les adultes.', 'PRIX DU FESTIVAL D’AVIGNON 2014\nLorène Bihorel est une jeune artiste qui excelle dans une discipline d’un genre nouveau. Elle présente un spectacle étonnant de dessin sur sable, qui émerveille les enfants et fascine les adultes. Sur sa table lumineuse, rediffusée simultanément sur grand écran, les dessins naissent en quelques secondes et se transforment sous les yeux des spectateurs, au rythme des histoires auxquelles ils donnent vie. Un moment unique et magique.', 9),
(9, 'Des roses dans la salade', '', '', 'Schedia teatro', '', 60, 'FR', '', '2017-rosesdanssalade.jpg', '“Les légumes c’est du sérieux!” dit le Chef. “Les légumes c’est pas marrant !” dit Romilda, son assistante.', '“Les légumes c’est du sérieux!” dit le Chef. “Les légumes c’est pas marrant !” dit Romilda, son assistante.\nIl faudrait y mettre un peu de couleur dans cette cuisine, non ? Qu’en pensez-vous ? À partir du travail de recherche de Bruno Munari, un spectacle avec épluchures de légumes, peinture, ombres chinoises et animations vidéo créé pour les enfants à partir de 2 ans.\nAprès son succès au Festival International de Théâtre pour l’Enfance de Bologne, au Musée des Enfants de Milan et après plusieurs ateliers menés et spectacles joués en écoles maternelles, crèches et théâtres en Italie, le spectacle arrive en France pour la première fois.', 10),
(10, 'I’m gonna sit right down and write myself a letter', '', '', 'Le mime Pato', '', 60, 'FR', '', '432422.jpg', '', '', 11),
(11, 'Intra-muros', '', '', 'ACME', '', 60, 'FR', '', '2017-intramuros.jpg', 'Tandis que l''orage menace, Richard, un metteur en scène sur le retour, vient dispenser son premier cours de théâtre en prison centrale.', 'Tandis que l''orage menace, Richard, un metteur en scène sur le retour, vient dispenser son premier cours de théâtre en prison centrale. Il espère une forte affluence, qui entraînerait d''autres cours - et d''autres cachets - mais seuls deux détenus se présentent : Kevin, un jeune chien fou, et Ange, la cinquantaine mutique, qui n''est là que pour accompagner son ami. Richard, secondé par une de ses anciennes actrices - accessoirement son ex-femme - et par une assistante sociale inexpérimentée, choisit de donner quand même son cours…', 12),
(12, 'J’ai hâte d’aimer', '', '', 'Interface', '', 60, 'FR', '', '2017-jaihatedaimer.jpg', 'J''ai hâte d''aimer est le fruit de la rencontre extraordinaire entre la compagnie Interface et Francis Lalanne. Un spectacle aux multiples langages, hymne à la naissance, hymne à ces instants ou l''univers se présente à soi dans toute sa splendeur et sa force.', 'Prix du public au festival OFF Avignon 2014 avec le spectacle Teruel\nJ''ai hâte d''aimer est le fruit de la rencontre extraordinaire entre la compagnie Interface et Francis Lalanne. Un spectacle aux multiples langages, hymne à la naissance, hymne à ces instants ou l''univers se présente à soi dans toute sa splendeur et sa force. Après avoir vécu j''ai hâte d''aimer, on se souvient que tout part du rêve et quand le rêve disparait, la vie s''éteint. ', 13),
(13, 'Je buterais bien ma mère un dimanche', '', '', 'Cadral SA', '', 60, 'FR', '', '2017-jebuteraisbien.jpg', 'Que celui qui n’a jamais eu envie de tuer sa mère lui jette la première pierre.', 'Que celui qui n’a jamais eu envie de tuer sa mère lui jette la première pierre. Trois générations de femmes esquintées par la vie, de la grand-mère collabo à la fille percluses de névroses, l’histoire n’est pas banale. Julie Villers, comédienne burlesque, propose une thérapie folle-dingue, entre cartoon et Almodovar, pour que toutes ces femmes se (ré)concilient.', 14),
(14, 'Joséphina', '', '', 'Chaliwaté', '', 60, 'FR', '', '2017-josephina.jpg', 'Au travers de jeux de mots et de gestes, d’ellipses et d’indices, une absente omniprésente, Joséphina, occupe l’espace…', 'Récompensé par trois coups de cœur lors du Festival de Montréal, élu « Meilleur spectacle » au Festival International de Théâtre à Monterrey au Mexique. Prix du Public au festival Internationale de Théâtre et de Danse de Huesca en Espagne.\nAu travers de jeux de mots et de gestes, d’ellipses et d’indices, une absente omniprésente, Joséphina, occupe l’espace… Que s’est-il passé trois mois plus tôt ? Au fil des partitions physiques, à demi-mot et à demi-geste, des fragments de vie et d’intimité sont dévoilés. Quelle piste suivre ou croire ? Empreintes gestuelles et traces sonores s’entremêlent, cherchant à révéler le fin mot de l’histoire…', 15),
(15, 'Juliette et Roméo', '', '', 'ACTA', '', 60, 'FR', '', '2017-julietteetromeo.jpg', 'C’est l’histoire de Roméo et Juliette bien sûr... mais racontée par la Nourrice. C’est elle qui a élevé Juliette, c’est elle qui a été le témoin de ses premiers émois amoureux, et tout ça pour finir si tragiquement ! Alors elle a besoin de la raconter cette histoire, encore et encore, avec toutes ses marionnettes. Les marionnettes peuvent mourir tant de fois. Donc revivre aussi. ', 'C’est l’histoire de Roméo et Juliette bien sûr... mais racontée par la Nourrice. C’est elle qui a élevé Juliette, c’est elle qui a été le témoin de ses premiers émois amoureux, et tout ça pour finir si tragiquement ! Alors elle a besoin de la raconter cette histoire, encore et encore, avec toutes ses marionnettes. Les marionnettes peuvent mourir tant de fois. Donc revivre aussi. ', 16),
(16, 'L’homme de rien', '', '', 'Le troupeau dans le crâne', '', 60, 'FR', '', '2017-lhommederien.jpg', 'Un conte mouvementé qui commence la nuit de Noël, et qui dérape ! Quand il était enfant, l’homme de rien a reçu une pelle en cadeau. Depuis il creuse des trous, et un jour il tombe dedans ! Entre danse, théâtre et clown, tous les âges sont invités à découvrir le mime.', 'Un conte mouvementé qui commence la nuit de Noël, et qui dérape ! Quand il était enfant, l’homme de rien a reçu une pelle en cadeau. Depuis il creuse des trous, et un jour il tombe dedans ! Entre danse, théâtre et clown, tous les âges sont invités à découvrir le mime.', 5),
(17, 'La beauté, recherche et développements', '', '', 'Compagnie Batala', '', 60, 'FR', '', '2017-labeaute.jpg', 'Pour relativiser toutes nos angoisses, deux femmes, Brigitte et Nicole, ont trouvé la solution : Le "Parcours Beauté".\nElles vous accueillent et vous guident à travers les méandres de la beauté, entre le délire burlesque et l''absurde.', 'Pour relativiser toutes nos angoisses, deux femmes, Brigitte et Nicole, ont trouvé la solution : Le "Parcours Beauté".\nElles vous accueillent et vous guident à travers les méandres de la beauté, entre le délire burlesque et l''absurde.\nNicole et Brigitte sont deux femmes d''âge moyen, comme on dit. Et c''est d''ailleurs parce qu''elles sont "moyennes" qu''elles sont aussi capables de tout. Le pire et le meilleur.', 8),
(18, 'La fossette bleue', '', '', 'ACME', '', 60, 'FR', '', '2017-fossettebleue.jpg', 'Quels goûts nous ont laissé nos Madeleines ? Que nous reste-t-il de nos souvenirs, nos émotions, nos sensations ? A quoi nous servent-ils ? Difficile pour Clémence d’être “une grande fille efficace au présent”, quand on songe perpétuellement à “la petite fille décalée qu’on a été”.', 'Quels goûts nous ont laissé nos Madeleines ? Que nous reste-t-il de nos souvenirs, nos émotions, nos sensations ? A quoi nous servent-ils ? Difficile pour Clémence d’être “une grande fille efficace au présent”, quand on songe perpétuellement à “la petite fille décalée qu’on a été”. Aidée par Éric, son cousin à l’existence machinale, elle finit par décrocher un job.\nElle rencontre Julien, petit chef obtus qui se fout éperdument des états d’âme de Clémence qui, de son côté, méprise ce petit monsieur chez qui elle ne décèle pas la moindre trace d’affect.\nAprès “Du vent dans mes mollets” et “Et pendant ce temps-là, les araignées tricotent des pulls autour de nos bilboquets”, Raphaële Moussafir revient avec sa toute dernière création.', 3),
(19, 'La main de Leïla', '', '', 'ACME/ATA', '', 60, 'FR', '', '2017-lamainleila.jpg', '1987, Sidi Fares, un petit village proche d’Alger. Dans un garage secrètement transformé en salle de spectacle, Samir rejoue les plus grands baisers du cinéma que l’Etat censure. “Un dinar la place et bienvenue au Haram Cinéma, le cinéma le plus illégal de toute l’Algérie !” Ici, il y a deux règles à respecter: l’identité de Samir doit rester secrète et les femmes sont interdites. Sauf qu’un jour, Leïla, la fille du puissant colonel Bensaada, se glisse dans le public et découvre la mythique hist', '1987, Sidi Fares, un petit village proche d’Alger. Dans un garage secrètement transformé en salle de spectacle, Samir rejoue les plus grands baisers du cinéma que l’Etat censure. “Un dinar la place et bienvenue au Haram Cinéma, le cinéma le plus illégal de toute l’Algérie !” Ici, il y a deux règles à respecter: l’identité de Samir doit rester secrète et les femmes sont interdites. Sauf qu’un jour, Leïla, la fille du puissant colonel Bensaada, se glisse dans le public et découvre la mythique histoire de Casablanca. Un an plus tard, Samir et Leïla s’aiment d’un amour inconditionnel mais interdit... Ils rêvent à un avenir commun tandis que derrière eux, se trame l’ombre d’octobre 88…', 16),
(20, 'La tragédie comique', '', '', 'La fabrique imaginaire', '', 60, 'FR', '', '2017-tragediecomique.jpg', 'A la croisée du théâtre élisabéthain et de la création contemporaine, La Tragédie Comique joue avec la représentation, son cortège d''impostures et de dévoilements, ses limites et son infinité.', 'Prix du « Meilleur spectacle étranger » à Québec (Carrefour International de Théâtre de Québec)\nA la croisée du théâtre élisabéthain et de la création contemporaine, La Tragédie Comique joue avec la représentation, son cortège d''impostures et de dévoilements, ses limites et son infinité. Seul en scène, Yves Hunstad, avec une maîtrise du verbe hors du commun, invente un fabuleux personnage cosmique, humain, grave et fragile, qui nous embarque, séance tenante, pour un voyage jusqu’au coeur d’un grand mystère : celui du THÉÂTRE. Yves Hunstad brasse le plaisir du jeu, l’intelligence alliée à l’émotion et nous livre un inoubliable moment de grâce. ', 16),
(21, 'Le cercle des illusionnistes', '', '', 'ACME', '', 60, 'FR', '', '2017-lecercle.jpg', 'Résumé du spectacle : En 1984, alors que se déroule le championnat d’Europe des Nations, Décembre vole un sac dans le métro. Dans le sac, il trouve la photo d’Avril jolie.', '3 MOLIÈRES 2014 MEILLEUR AUTEUR MEILLEURE MISE EN SCÈNE et REVELATION FÉMININE\n\nRésumé du spectacle : En 1984, alors que se déroule le championnat d’Europe des Nations, Décembre vole un sac dans le métro. Dans le sac, il trouve la photo d’Avril jolie. Il la rappelle, ils se rencontrent dans un café. Il va lui raconter l’histoire de Jean-Eugène Robert-Houdin, horloger, inventeur, magicien du XIXe siècle. Cette histoire les mènera tous deux sous le coffre de la BNP du boulevard des Italiens, dans le théâtre disparu de Robert-Houdin, devant la roulotte d’un escamoteur, derrière les circuits du Turc mécanique, aux prémices du kinétographe, et à travers le cercle des illusionnistes.', 5),
(22, 'Le chat botté', '', '', 'Les Nomadesques', '', 60, 'FR', '', '2017-chatbotte.jpg', 'La Cie Les Nomadesques, qui triomphe depuis 5 ans à Paris avec LE LOUP EST REVENU est de retour à KOMIDI avec LE CHAT BOTTE, complet au festival en 2014! Et 2015 ! à Avignon.', 'La Cie Les Nomadesques, qui triomphe depuis 5 ans à Paris avec LE LOUP EST REVENU est de retour à KOMIDI avec LE CHAT BOTTE, complet au festival en 2014! Et 2015 ! à Avignon.', 3),
(23, 'Le comte de Monte Cristo', '', '', 'Compagnie les ames libres', '', 60, 'FR', '', '2017-comtemontecristo.jpg', 'Tout commence avec la visité guidée au château d''If, forteresse maritime-prison désaffectée, d''un étrange visiteur plus particulièrement intéressé par deux cellules, celles qui furent occupées par un jeune marin et un abbé érudit, savant et philosophe. Commence également un voyage dans le temps et l''espace qui va reconstituer une vie.', 'Tout commence avec la visité guidée au château d''If, forteresse maritime-prison désaffectée, d''un étrange visiteur plus particulièrement intéressé par deux cellules, celles qui furent occupées par un jeune marin et un abbé érudit, savant et philosophe. Commence également un voyage dans le temps et l''espace qui va reconstituer une vie.', 2),
(24, 'Le conte des contes', '', '', 'Lépok Epik', '', 60, 'FR', '', '2017-contedescontes.jpg', 'Ô lecteur, si tu n’as pas les oreilles bouchées par de la bouillie de roseau, si tu n’es pas aveuglé par de la fiente d’hirondelle, je suis sûr que tu sauras goûter toute la truculence et la vivacité de ce Conte des Contes ! ', 'Ô lecteur, si tu n’as pas les oreilles bouchées par de la bouillie de roseau, si tu n’es pas aveuglé par de la fiente d’hirondelle, je suis sûr que tu sauras goûter toute la truculence et la vivacité de ce Conte des Contes ! N’allez pas croire que cet accès de familiarité soit gratuit : c’est, à quelques mots près, la langue de Giambattista Basile, dans « La vieille écorchée », un des cinquante contes enchâssés dans le Conte des Contes. Et précisément un des deux que Sylvie Espérance, traduit en créole. L’autre, « L’Ourse », sera dit en français.', 9),
(25, 'Le petit poilu illustré', '', '', 'Dhang Dhang', '', 60, 'FR', '', '2017-petitpoilu.jpg', 'Paul et Ferdinand, deux poilus, anciennement artistes de cabaret, reviennent de l’au-delà pour raconter la guerre... Entre humour, burlesque et poésie, ils rejoueront pour nous les grands chapitres de l’Histoire.', 'Labellisé et soutenu par le CENTENAIRE de la Grande Guerre (Ministère).\nPaul et Ferdinand, deux poilus, anciennement artistes de cabaret, reviennent de l’au-delà pour raconter la guerre... Entre humour, burlesque et poésie, ils rejoueront pour nous les grands chapitres de l’Histoire. Ce duo clownesque raconte en un condensé facétieux l’histoire et les absurdités de la Grande Guerre.', 15),
(26, 'Le piston de Manoche', '', '', 'Not’ Compagnie', '', 60, 'FR', '', '2017-manoche.jpg', 'Manoche, enfant croisé de Bourvil et de Raymond Devos, nous entraîne dans une désopilante et poétique virée musicale.', 'Prix Coup de Coeur du FESTIVAL D’AVIGNON 2011\nManoche, enfant croisé de Bourvil et de Raymond Devos, nous entraîne dans une désopilante et poétique virée musicale. Tendre clown accroché à son instrument, Manoche jongle subtilement avec les mots qui se jouent de lui et l’entraînent dans des situations rocambolesques, tout en tentant de nous faire découvrir les mystères du cornet à pistons. Un prétexte pour nous dresser un tableau de notre société avec des histoires à dormir debout. Personnage lunaire qui semble s’être trompé d’endroit, il semble avoir oublié qu’il fait là. Empêtré dans ses mots et dans son corps, il bouscule nos certitudes et nos préjugés avec verve, humour, musique et poésie. Plus qu''un simple divertissement, faire rire sans avilir... ', 2),
(27, 'Le tort qu’on a, c’est d’adresser la parole aux ge', '', '', 'La Pata Negra', '', 60, 'FR', '', '2017-letord.jpg', 'L''œuvre de Samuel Beckett, c''est un éventail de styles littéraires et de sujets qui résonnent encore  parmi les plus actuels. Beckett est porteur d''une modernité engagée, post-moderne pour certains mais surtout ancrée dans l''écriture comme lieu d''une résistance à toute habitude de complaisance subjective.', 'L''œuvre de Samuel Beckett, c''est un éventail de styles littéraires et de sujets qui résonnent encore  parmi les plus actuels. Beckett est porteur d''une modernité engagée, post-moderne pour certains mais surtout ancrée dans l''écriture comme lieu d''une résistance à toute habitude de complaisance subjective. La lecture de son œuvre montre comment Beckett nous entraine encore, toujours, dans l''étrangeté de l''être et dans la dimension poétique des traversées de langues. Ses jeux de l''autobiographie fictive, depuis le foisonnement et le labyrinthe des premiers romans jusqu''au minimalisme de ses dernières années, marquent l''histoire unique d''un prix Nobel qui remonte à 1969.', 7),
(28, 'Le tour du monde en 80 jours', '', '', 'Théâtre du midi', '', 60, 'FR', '', '2017-letourdumonde.jpg', 'Fidèlement adapté du chef d’œuvre de Jules Verne, ce spectacle virevoltant, drôle et pétillant nous fait voyager dans l’Égypte, l’Inde, la Chine et les États-Unis du 19e siècle. Trains, bateaux, éléphant et montgolfière transportent nos héros tout autour du globe.', 'Fidèlement adapté du chef d’œuvre de Jules Verne, ce spectacle virevoltant, drôle et pétillant nous fait voyager dans l’Égypte, l’Inde, la Chine et les États-Unis du 19e siècle. Trains, bateaux, éléphant et montgolfière transportent nos héros tout autour du globe.', 6),
(29, 'Les contes d’Hoffmann', '', '', 'L’envolée Lyrique', '', 60, 'FR', '', '2017-lesconteshoffmann.jpg', 'Dans une taverne brumeuse, Hoffmann rencontre un riche industriel, Lindorf, qui le fait boire et raconter l’histoire des trois femmes de sa vie, tandis que leur maîtresse commune, Stella, se fait attendre.', 'Prix du public du FESTIVAL D’AVIGNON 2013 avec Cosi Fan Tutte\nPrix du public du FESTIVAL D’AVIGNON 2014 pour Les contes d’’Hoffmann\nDans une taverne brumeuse, Hoffmann rencontre un riche industriel, Lindorf, qui le fait boire et raconter l’histoire des trois femmes de sa vie, tandis que leur maîtresse commune, Stella, se fait attendre.', 5),
(30, 'Ma class’ Hip Hop', '', '', 'Kader Aoun Productions', '', 60, 'FR', '', '2017-maclasshiphop.jpg', 'Avec Ma Class’ Hip Hop, Céline Lefèvre nous propose un voyage à travers les époques, et les techniques pour découvrir 40 ans d’histoire d’une danse de rue très codée venue des Etats Unis : Le Hip Hop.', 'Avec Ma Class’ Hip Hop, Céline Lefèvre nous propose un voyage à travers les époques, et les techniques pour découvrir 40 ans d’histoire d’une danse de rue très codée venue des Etats Unis : Le Hip Hop.', 4),
(31, 'Ma folle otarie', '', '', 'Compagnie des gens qui tombent', '', 60, 'FR', '', '2017-mafolleotarie.jpg', 'L’employé d’une agence de voyages, insignifiant et timide à l’excès, se trouve confronté soudain à un problème des plus atypiques, à priori risible mais plein de conséquences fâcheuses.', 'L’employé d’une agence de voyages, insignifiant et timide à l’excès, se trouve confronté soudain à un problème des plus atypiques, à priori risible mais plein de conséquences fâcheuses. Tous ses slips et ses pantalons commencent irrésistiblement à rétrécir depuis que ses fesses ont commencé petit à petit, inexorablement, à grossir démesurément. Devenu une sorte de monstre, il trouvera refuge auprès d’une otarie.', 3),
(32, 'Ma vie sans bal', '', '', 'Danse en l’R', '', 60, 'FR', '', '2017-maviesansbal.jpg', 'Dans cette conférence dansée de vingt à trente minutes, Eric Languet et Wilson Payet abordent de façon légère et décomplexée le handicap dans toutes ses dimensions : sociale, symbolique, philosophique et poétique.', 'Dans cette conférence dansée de vingt à trente minutes, Eric Languet et Wilson Payet abordent de façon légère et décomplexée le handicap dans toutes ses dimensions : sociale, symbolique, philosophique et poétique.\nForts d’une expérience de 15 ans en danse intégrée(*), ils nous livrent en mouvements et en mots leur vision à la fois réaliste, provocante et émouvante de ces mondes que l’on réunit sous le terme générique de « Handicap ».\n(*) Danse intégrée : Ateliers de danse intégrant des personnes handicapées et des personnes porteuses de normalité.', 2),
(33, 'Mémoires d’un fou', '', '', 'Le théâtre de l’étreinte', '', 60, 'FR', '', '2017-memoiredunfou.jpg', 'Mémoires d''un fou est le 1er texte en partie autobiographique de Gustave Flaubert, la matrice géniale de toute son œuvre. Il y raconte l''enfance, la jeunesse, les questionnements existentiels aux accents intemporels mais surtout la découverte de l''amour, le plus pur, le plus passionné.', 'Mémoires d''un fou est le 1er texte en partie autobiographique de Gustave Flaubert, la matrice géniale de toute son œuvre. Il y raconte l''enfance, la jeunesse, les questionnements existentiels aux accents intemporels mais surtout la découverte de l''amour, le plus pur, le plus passionné.', 2),
(34, 'Mon jardin', '', '', 'Mile et une façons', '', 60, 'FR', '', '2017-monjardin.jpg', 'Une plongée sensible au cœur de la relation parent-enfant. Au fil des chansons nous partageons l''agitation d''une maman qui veut bien faire, les projets d''avenir d''un papa rêveur, et l''univers d''un joyeux petit garçon qui ne comprend pas que ses plus belles idées soient nommées "bêtises".', 'Une plongée sensible au cœur de la relation parent-enfant. Au fil des chansons nous partageons l''agitation d''une maman qui veut bien faire, les projets d''avenir d''un papa rêveur, et l''univers d''un joyeux petit garçon qui ne comprend pas que ses plus belles idées soient nommées "bêtises". Un spectacle plein d''émotion qui convie enfants et parents à rire ensemble librement.', 5),
(35, 'Nul n’est à l’abri', '', '', 'Schtrockbèn', '', 60, 'FR', '', '2017-nulnestalabri.jpg', '', '', 3),
(36, 'Peter Pan', '', '', 'Chaotik Théâtre', '', 60, 'FR', '', '2017-planete.jpg', 'Trois êtres atypiques sans voix ni lois, habitent trois manipulateurs, témoins et acteurs de leurs confrontations émotionnelles. Tour à tour colériques, versatiles, facétieux, violents ou candides, ils se déchirent ou se rassemblent. Les manipulateurs devront trouver un équilibre entre l’ordre et le chaos.', 'Trois êtres atypiques sans voix ni lois, habitent trois manipulateurs, témoins et acteurs de leurs confrontations émotionnelles. Tour à tour colériques, versatiles, facétieux, violents ou candides, ils se déchirent ou se rassemblent. Les manipulateurs devront trouver un équilibre entre l’ordre et le chaos.', 14);

-- --------------------------------------------------------

--
-- Table structure for table `menbres`
--

CREATE TABLE IF NOT EXISTS `menbres` (
  `mem_id` int(11) NOT NULL AUTO_INCREMENT,
  `mem_email` varchar(200) NOT NULL,
  `mem_pass` varchar(500) NOT NULL,
  `mem_nom` varchar(50) NOT NULL,
  `mem_prenom` varchar(100) NOT NULL,
  `mem_statut` int(11) NOT NULL,
  `mem_dateInscrip` datetime NOT NULL,
  `mem_sex` char(1) NOT NULL,
  PRIMARY KEY (`mem_id`),
  UNIQUE KEY `mem_email` (`mem_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `menbres`
--

INSERT INTO `menbres` (`mem_id`, `mem_email`, `mem_pass`, `mem_nom`, `mem_prenom`, `mem_statut`, `mem_dateInscrip`, `mem_sex`) VALUES
(3, 'alex@gmail.com', 'ab4f63f9ac65152575886860dde480a1', 'lefevre', 'alexandre', 1, '2016-11-12 22:05:27', 'a'),
(4, 'robert@gmail.com', 'ab4f63f9ac65152575886860dde480a1', 'robert', 'stevens', 0, '2016-11-12 22:07:34', 'f'),
(5, 'lo@gmail.com', 'ab4f63f9ac65152575886860dde480a1', 'loic', 'lefevre', 0, '2016-11-12 23:04:45', 'h'),
(6, 'test@gmail.com', 'ab4f63f9ac65152575886860dde480a1', 'test', 'test', 0, '2016-11-21 15:34:58', 'h'),
(7, 'tom@gmail.com', 'ab4f63f9ac65152575886860dde480a1', 'lefevre', 'thomas', 0, '2016-12-05 13:29:57', 'h');

-- --------------------------------------------------------

--
-- Table structure for table `noter`
--

CREATE TABLE IF NOT EXISTS `noter` (
  `mem_id` int(11) NOT NULL,
  `Spe_id` int(11) NOT NULL,
  `nt_note` int(6) NOT NULL,
  PRIMARY KEY (`mem_id`,`Spe_id`),
  KEY `FK_noter_Spe_id` (`Spe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `noter`
--

INSERT INTO `noter` (`mem_id`, `Spe_id`, `nt_note`) VALUES
(4, 4, 2),
(4, 23, 5),
(4, 20, 3),
(4, 6, 1),
(4, 12, 2),
(4, 16, 4),
(4, 31, 3);

-- --------------------------------------------------------

--
-- Structure for view `cinqBestSpectacle`
--
DROP TABLE IF EXISTS `cinqBestSpectacle`;

CREATE  VIEW `cinqBestSpectacle` AS select `kdi_listenbNote_Moyenne`.`Spe_id` AS `Spe_id` from `kdi_listenbNote_Moyenne` order by `kdi_listenbNote_Moyenne`.`moyenneNote` desc limit 5;

-- --------------------------------------------------------

--
-- Structure for view `kdi_listenbNote_Moyenne`
--
DROP TABLE IF EXISTS `kdi_listenbNote_Moyenne`;

CREATE  VIEW `kdi_listenbNote_Moyenne` AS select count(`noter`.`Spe_id`) AS `nbDenote`,`noter`.`Spe_id` AS `Spe_id`,avg(`noter`.`nt_note`) AS `moyenneNote` from `noter` where (`noter`.`Spe_id` = `noter`.`Spe_id`) group by `noter`.`Spe_id`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kdi_seance`
--
ALTER TABLE `kdi_seance`
  ADD CONSTRAINT `FK_horsnc` FOREIGN KEY (`Sec_idHor`) REFERENCES `kdi_horaire` (`Hor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_sasncl` FOREIGN KEY (`Sec_idSal`) REFERENCES `kdi_salle` (`Sal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_spcsnc` FOREIGN KEY (`Sec_idSpec`) REFERENCES `kdi_spectacle` (`Spe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kdi_spectacle`
--
ALTER TABLE `kdi_spectacle`
  ADD CONSTRAINT `SpecSalleId` FOREIGN KEY (`IdSpecSalle`) REFERENCES `kdi_salle` (`Sal_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noter`
--
ALTER TABLE `noter`
  ADD CONSTRAINT `FK_noter_mem_id` FOREIGN KEY (`mem_id`) REFERENCES `menbres` (`mem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_noter_Spe_id` FOREIGN KEY (`Spe_id`) REFERENCES `kdi_spectacle` (`Spe_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



CREATE TABLE if not exists histo_kdi_spectacle(
  id_histo INT(4) AUTO_INCREMENT,
  date_histo DATETIME,
  evenement VARCHAR(7),
  id INT(11),
  titre VARCHAR(50),
  mes VARCHAR(50),
  acteur TEXT,
  cie VARCHAR(80),
  genre VARCHAR(30),
  duree INT(11),
  lang VARCHAR(30),
  public VARCHAR(16),
  affiche VARCHAR(50),
  resume_court VARCHAR(500),
  resume_long TEXT,
  idSpecSalle INT(11),
  PRIMARY KEY (id_histo,date_histo)
);

DELIMITER |
CREATE TRIGGER kdi_spectacle_after_insert AFTER INSERT
ON kdi_spectacle FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_spectacle() VALUES('',NOW(),"insert",NEW.Spe_id,NEW.Spe_titre,NEW.Spe_mes,NEW.Spe_acteur,NEW.Spe_cie,NEW.Spe_genre,NEW.Spe_duree,NEW.Spe_Lang,NEW.Spe_public,NEW.Spe_affiche,NEW.Spe_resume_court,NEW.Spe_resume_long,NEW.idSpecSalle);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_spectacle_before_update BEFORE UPDATE
ON kdi_spectacle FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_spectacle() VALUES('',NOW(),"update",OLD.Spe_id,OLD.Spe_titre,OLD.Spe_mes,OLD.Spe_acteur,OLD.Spe_cie,OLD.Spe_genre,OLD.Spe_duree,OLD.Spe_Lang,OLD.Spe_public,OLD.Spe_affiche,OLD.Spe_resume_court,OLD.Spe_resume_long,OLD.idSpecSalle);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_spectacle_before_delete BEFORE DELETE
ON kdi_spectacle FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_spectacle() VALUES('',NOW(),"delete",OLD.Spe_id,OLD.Spe_titre,OLD.Spe_mes,OLD.Spe_acteur,OLD.Spe_cie,OLD.Spe_genre,OLD.Spe_duree,OLD.Spe_Lang,OLD.Spe_public,OLD.Spe_affiche,OLD.Spe_resume_court,OLD.Spe_resume_long,OLD.idSpecSalle);
END |
DELIMITER ;


CREATE TABLE if not exists histo_membres(
  id_histo INT(4) AUTO_INCREMENT,
  date_histo DATETIME,
  evenement VARCHAR(7),
  mem_id INT(11),
  mem_email VARCHAR(255),
  mem_pass VARCHAR(500),
  mem_nom VARCHAR(50),
  mem_prenom VARCHAR(100),
  mem_statut INT(11),
  mem_dateinscrip DATETIME,
  mem_sex CHAR(1),
  PRIMARY KEY (id_histo,date_histo)
);

DELIMITER |
CREATE TRIGGER membres_after_insert AFTER INSERT
ON menbres FOR EACH ROW
BEGIN
INSERT INTO histo_membres() VALUES('',NOW(),"insert",NEW.mem_id,NEW.mem_email,NEW.mem_pass,NEW.mem_nom,NEW.mem_prenom,NEW.mem_statut,NEW.mem_dateInscrip,NEW.mem_sex);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER membres_before_update BEFORE UPDATE
ON menbres FOR EACH ROW
BEGIN
INSERT INTO histo_membres() VALUES('',NOW(),"update",OLD.mem_id,OLD.mem_email,OLD.mem_pass,OLD.mem_nom,OLD.mem_prenom,OLD.mem_statut,OLD.mem_dateInscrip,OLD.mem_sex);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER membres_before_delete BEFORE DELETE
ON menbres FOR EACH ROW
BEGIN
INSERT INTO histo_membres() VALUES('',NOW(),"delete",OLD.mem_id,OLD.mem_email,OLD.mem_pass,OLD.mem_nom,OLD.mem_prenom,OLD.mem_statut,OLD.mem_dateInscrip,OLD.mem_sex);
END |
DELIMITER ;



CREATE TABLE if not exists histo_kdi_conctact(
  id_histo INT(4) AUTO_INCREMENT,
  date_histo DATETIME,
  evenement VARCHAR(7),
  id_msg INT(4),
  msg_civilite VARCHAR(12),
  msg_nom VARCHAR(25),
  msg_prenom VARCHAR(25),
  msg TEXT,
  msg_ville VARCHAR(35),
  msg_cde VARCHAR(5),
  msg_email VARCHAR(255),
  msg_date DATETIME,
  PRIMARY KEY (id_histo,date_histo)
);

DELIMITER |
CREATE TRIGGER kdi_contact_after_insert AFTER INSERT
ON kdi_contact FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_conctact() VALUES('',NOW(),"insert",NEW.id_msg,NEW.msg_civilite,NEW.msg_nom,NEW.msg_prenom,NEW.msg,NEW.msg_ville,NEW.msg_cde,NEW.msg_email,NEW.msg_date);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_contact_before_update BEFORE UPDATE
ON kdi_contact FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_conctact() VALUES('',NOW(),"update",OLD.id_msg,OLD.msg_civilite,OLD.msg_nom,OLD.msg_prenom,OLD.msg,OLD.msg_ville,OLD.msg_cde,OLD.msg_email,OLD.msg_date);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_contact_before_delete BEFORE DELETE
ON kdi_contact FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_conctact() VALUES('',NOW(),"delete",OLD.id_msg,OLD.msg_civilite,OLD.msg_nom,OLD.msg_prenom,OLD.msg,OLD.msg_ville,OLD.msg_cde,OLD.msg_email,OLD.msg_date);
END |
DELIMITER ;

CREATE TABLE if not exists histo_kdi_genre(
  id_histo INT(4) AUTO_INCREMENT,
  date_histo DATETIME,
  evenement VARCHAR(7),
  code INT(11),
  nom VARCHAR(80),
  PRIMARY KEY (id_histo,date_histo)
);

DELIMITER |
CREATE TRIGGER kdi_genre_after_insert AFTER INSERT
ON kdi_genre FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_genre() VALUES('',NOW(),"insert",NEW.Gre_code,NEW.Gre_nom);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_genre_before_update BEFORE UPDATE
ON kdi_genre FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_genre() VALUES('',NOW(),"update",OLD.Gre_code,OLD.Gre_nom);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_genre_before_delete BEFORE DELETE
ON kdi_genre FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_genre() VALUES('',NOW(),"delete",OLD.Gre_code,OLD.Gre_nom);
END |
DELIMITER ;

CREATE TABLE if not exists histo_kdi_horaire(
  id_histo INT(4) AUTO_INCREMENT,
  date_histo DATETIME,
  evenement VARCHAR(7),
  hor_id INT(11),
  hor_debut TIME,
  PRIMARY KEY (id_histo,date_histo)
);

DELIMITER |
CREATE TRIGGER kdi_horaire_after_insert AFTER INSERT
ON kdi_horaire FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_horaire() VALUES('',NOW(),"insert",NEW.Hor_id,NEW.Hor_Début);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_horaire_before_update BEFORE UPDATE
ON kdi_horaire FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_horaire() VALUES('',NOW(),"update",OLD.Hor_id,OLD.Hor_Début);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_horaire_before_delete BEFORE DELETE
ON kdi_horaire FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_horaire() VALUES('',NOW(),"delete",OLD.Hor_id,OLD.Hor_Début);
END |
DELIMITER ;



CREATE TABLE if not exists histo_kdi_salle(
  id_histo INT(4) AUTO_INCREMENT,
  date_histo DATETIME,
  evenement VARCHAR(7),
  sal_id INT(11),
  sal_nom VARCHAR(30),
  sal_latitude DOUBLE,
  sal_longitude DOUBLE,
  sal_jauge INT(4),
  sal_adresse VARCHAR(255),
  PRIMARY KEY (id_histo,date_histo)
);

DELIMITER |
CREATE TRIGGER kdi_salle_after_insert AFTER INSERT
ON kdi_salle FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_salle() VALUES('',NOW(),"insert",NEW.Sal_id,NEW.Sal_nom,NEW.Sal_latitude,NEW.Sal_longitude,NEW.Sal_jauge,NEW.Sal_adresse);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_salle_before_update BEFORE UPDATE
ON kdi_salle FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_salle() VALUES('',NOW(),"update",OLD.Sal_id,OLD.Sal_nom,OLD.Sal_latitude,OLD.Sal_longitude,OLD.Sal_jauge,OLD.Sal_adresse);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER kdi_salle_before_delete BEFORE DELETE
ON kdi_salle FOR EACH ROW
BEGIN
INSERT INTO histo_kdi_salle() VALUES('',NOW(),"delete",OLD.Sal_id,OLD.Sal_nom,OLD.Sal_latitude,OLD.Sal_longitude,OLD.Sal_jauge,OLD.Sal_adresse);
END |
DELIMITER ;

CREATE TABLE if not exists histo_noter(
  id_histo INT(4) AUTO_INCREMENT,
  date_histo DATETIME,
  evenement VARCHAR(7),
  mem_id INT(11),
  spe_id INT(11),
  nt_note INT(6),
  PRIMARY KEY (id_histo,date_histo)
);

DELIMITER |
CREATE TRIGGER noter_after_insert AFTER INSERT
ON noter FOR EACH ROW
BEGIN
INSERT INTO histo_noter() VALUES('',NOW(),"insert",NEW.mem_id,NEW.Spe_id,NEW.nt_note);
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER noter_before_update BEFORE UPDATE
ON noter FOR EACH ROW
BEGIN
INSERT INTO histo_noter() VALUES('',NOW(),"update",OLD.mem_id,OLD.Spe_id,OLD.nt_note);
END |
DELIMITER ;

DELIMITER |

CREATE TRIGGER noter_before_delete BEFORE DELETE
ON noter FOR EACH ROW
BEGIN
INSERT INTO histo_noter() VALUES('',NOW(),"delete",OLD.mem_id,OLD.Spe_id,OLD.nt_note);
END |
DELIMITER ;


