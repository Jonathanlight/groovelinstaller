-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 25 Juin 2016 à 14:40
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.6.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `groovel`
--

-- --------------------------------------------------------

--
-- Structure de la table `all_contents_type`
--

CREATE TABLE IF NOT EXISTS `all_contents_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=285 ;

--
-- Contenu de la table `all_contents_type`
--

INSERT INTO `all_contents_type` (`id`, `name`, `type`, `template`, `author_id`, `updated_at`, `created_at`) VALUES
(267, 'blog', 'content', 'blog', 72, '2016-06-06 20:26:26', '2016-06-06 20:26:26');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenttranslation_id` int(10) unsigned DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `comment` blob NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

-- --------------------------------------------------------

--
-- Structure de la table `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(10) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ispublish` tinyint(1) NOT NULL,
  `weight` int(11) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `content_type_id` (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=500 ;

-- --------------------------------------------------------

--
-- Structure de la table `contents_translation`
--

CREATE TABLE IF NOT EXISTS `contents_translation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refcontentid` int(10) unsigned DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` blob NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

-- --------------------------------------------------------

--
-- Structure de la table `content_types`
--

CREATE TABLE IF NOT EXISTS `content_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tableName` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `fieldName` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `fieldValue` blob NOT NULL,
  `widget` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_type` int(10) DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=416 ;

--
-- Contenu de la table `content_types`
--

INSERT INTO `content_types` (`id`, `tableName`, `fieldName`, `description`, `type`, `fieldValue`, `widget`, `content_type`, `required`, `updated_at`, `created_at`) VALUES
(379, 'blog', 'post', 'post', 'textarea', '', '11', 267, 0, '2016-06-06 20:26:26', '2016-06-06 20:26:26');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `code` char(2) CHARACTER SET latin1 NOT NULL,
  `name_en` tinytext CHARACTER SET latin1,
  `name_fr` tinytext CHARACTER SET latin1,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `countries`
--

INSERT INTO `countries` (`code`, `name_en`, `name_fr`) VALUES
('AD', 'Andorra', 'Andorre'),
('AE', 'United Arab Emirates', 'Émirats arabes unis'),
('AF', 'Afghanistan', 'Afghanistan'),
('AG', 'Antigua and Barbuda', 'Antigua-et-Barbuda'),
('AI', 'Anguilla', 'Anguilla'),
('AL', 'Albania', 'Albanie'),
('AM', 'Armenia', 'Arménie'),
('AO', 'Angola', 'Angola'),
('AQ', 'Antarctica', 'Antarctique'),
('AR', 'Argentina', 'Argentine'),
('AS', 'American Samoa', 'Samoa américaine'),
('AT', 'Austria', 'Autriche'),
('AU', 'Australia', 'Australie'),
('AW', 'Aruba', 'Aruba'),
('AX', 'Åland Islands', 'Îles d''Åland'),
('AZ', 'Azerbaijan', 'Azerbaïdjan'),
('BA', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine'),
('BB', 'Barbados', 'Barbade'),
('BD', 'Bangladesh', 'Bangladesh'),
('BE', 'Belgium', 'Belgique'),
('BF', 'Burkina Faso', 'Burkina Faso'),
('BG', 'Bulgaria', 'Bulgarie'),
('BH', 'Bahrain', 'Bahreïn'),
('BI', 'Burundi', 'Burundi'),
('BJ', 'Benin', 'Bénin'),
('BL', 'Saint Barthélemy', 'Saint-Barthélemy'),
('BM', 'Bermuda', 'Bermudes'),
('BN', 'Brunei Darussalam', 'Brunei Darussalam'),
('BO', 'Bolivia', 'Bolivie'),
('BQ', 'Caribbean Netherlands ', 'Pays-Bas caribéens'),
('BR', 'Brazil', 'Brésil'),
('BS', 'Bahamas', 'Bahamas'),
('BT', 'Bhutan', 'Bhoutan'),
('BV', 'Bouvet Island', 'Île Bouvet'),
('BW', 'Botswana', 'Botswana'),
('BY', 'Belarus', 'Bélarus'),
('BZ', 'Belize', 'Belize'),
('CA', 'Canada', 'Canada'),
('CC', 'Cocos (Keeling) Islands', 'Îles Cocos (Keeling)'),
('CD', 'Congo, Democratic Republic of', 'Congo, République démocratique du'),
('CF', 'Central African Republic', 'République centrafricaine'),
('CG', 'Congo', 'Congo'),
('CH', 'Switzerland', 'Suisse'),
('CI', 'Côte d''Ivoire', 'Côte d''Ivoire'),
('CK', 'Cook Islands', 'Îles Cook'),
('CL', 'Chile', 'Chili'),
('CM', 'Cameroon', 'Cameroun'),
('CN', 'China', 'Chine'),
('CO', 'Colombia', 'Colombie'),
('CR', 'Costa Rica', 'Costa Rica'),
('CU', 'Cuba', 'Cuba'),
('CV', 'Cape Verde', 'Cap-Vert'),
('CW', 'Curaçao', 'Curaçao'),
('CX', 'Christmas Island', 'Île Christmas'),
('CY', 'Cyprus', 'Chypre'),
('CZ', 'Czech Republic', 'République tchèque'),
('DE', 'Germany', 'Allemagne'),
('DJ', 'Djibouti', 'Djibouti'),
('DK', 'Denmark', 'Danemark'),
('DM', 'Dominica', 'Dominique'),
('DO', 'Dominican Republic', 'République dominicaine'),
('DZ', 'Algeria', 'Algérie'),
('EC', 'Ecuador', 'Équateur'),
('EE', 'Estonia', 'Estonie'),
('EG', 'Egypt', 'Égypte'),
('EH', 'Western Sahara', 'Sahara Occidental'),
('ER', 'Eritrea', 'Érythrée'),
('ES', 'Spain', 'Espagne'),
('ET', 'Ethiopia', 'Éthiopie'),
('FI', 'Finland', 'Finlande'),
('FJ', 'Fiji', 'Fidji'),
('FK', 'Falkland Islands', 'Îles Malouines'),
('FM', 'Micronesia, Federated States of', 'Micronésie, États fédérés de'),
('FO', 'Faroe Islands', 'Îles Féroé'),
('FR', 'France', 'France'),
('GA', 'Gabon', 'Gabon'),
('GB', 'United Kingdom', 'Royaume-Uni'),
('GD', 'Grenada', 'Grenade'),
('GE', 'Georgia', 'Géorgie'),
('GF', 'French Guiana', 'Guyane française'),
('GG', 'Guernsey', 'Guernesey'),
('GH', 'Ghana', 'Ghana'),
('GI', 'Gibraltar', 'Gibraltar'),
('GL', 'Greenland', 'Groenland'),
('GM', 'Gambia', 'Gambie'),
('GN', 'Guinea', 'Guinée'),
('GP', 'Guadeloupe', 'Guadeloupe'),
('GQ', 'Equatorial Guinea', 'Guinée équatoriale'),
('GR', 'Greece', 'Grèce'),
('GS', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les îles Sandwich du Sud'),
('GT', 'Guatemala', 'Guatemala'),
('GU', 'Guam', 'Guam'),
('GW', 'Guinea-Bissau', 'Guinée-Bissau'),
('GY', 'Guyana', 'Guyana'),
('HK', 'Hong Kong', 'Hong Kong'),
('HM', 'Heard and McDonald Islands', 'Îles Heard et McDonald'),
('HN', 'Honduras', 'Honduras'),
('HR', 'Croatia', 'Croatie'),
('HT', 'Haiti', 'Haïti'),
('HU', 'Hungary', 'Hongrie'),
('ID', 'Indonesia', 'Indonésie'),
('IE', 'Ireland', 'Irlande'),
('IL', 'Israel', 'Israël'),
('IM', 'Isle of Man', 'Île de Man'),
('IN', 'India', 'Inde'),
('IO', 'British Indian Ocean Territory', 'Territoire britannique de l''océan Indien'),
('IQ', 'Iraq', 'Irak'),
('IR', 'Iran', 'Iran'),
('IS', 'Iceland', 'Islande'),
('IT', 'Italy', 'Italie'),
('JE', 'Jersey', 'Jersey'),
('JM', 'Jamaica', 'Jamaïque'),
('JO', 'Jordan', 'Jordanie'),
('JP', 'Japan', 'Japon'),
('KE', 'Kenya', 'Kenya'),
('KG', 'Kyrgyzstan', 'Kirghizistan'),
('KH', 'Cambodia', 'Cambodge'),
('KI', 'Kiribati', 'Kiribati'),
('KM', 'Comoros', 'Comores'),
('KN', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis'),
('KP', 'North Korea', 'Corée du Nord'),
('KR', 'South Korea', 'Corée du Sud'),
('KW', 'Kuwait', 'Koweït'),
('KY', 'Cayman Islands', 'Îles Caïmans'),
('KZ', 'Kazakhstan', 'Kazakhstan'),
('LA', 'Lao People''s Democratic Republic', 'Laos'),
('LB', 'Lebanon', 'Liban'),
('LC', 'Saint Lucia', 'Sainte-Lucie'),
('LI', 'Liechtenstein', 'Liechtenstein'),
('LK', 'Sri Lanka', 'Sri Lanka'),
('LR', 'Liberia', 'Libéria'),
('LS', 'Lesotho', 'Lesotho'),
('LT', 'Lithuania', 'Lituanie'),
('LU', 'Luxembourg', 'Luxembourg'),
('LV', 'Latvia', 'Lettonie'),
('LY', 'Libya', 'Libye'),
('MA', 'Morocco', 'Maroc'),
('MC', 'Monaco', 'Monaco'),
('MD', 'Moldova', 'Moldavie'),
('ME', 'Montenegro', 'Monténégro'),
('MF', 'Saint-Martin (France)', 'Saint-Martin (France)'),
('MG', 'Madagascar', 'Madagascar'),
('MH', 'Marshall Islands', 'Îles Marshall'),
('MK', 'Macedonia', 'Macédoine'),
('ML', 'Mali', 'Mali'),
('MM', 'Myanmar', 'Myanmar'),
('MN', 'Mongolia', 'Mongolie'),
('MO', 'Macau', 'Macao'),
('MP', 'Northern Mariana Islands', 'Mariannes du Nord'),
('MQ', 'Martinique', 'Martinique'),
('MR', 'Mauritania', 'Mauritanie'),
('MS', 'Montserrat', 'Montserrat'),
('MT', 'Malta', 'Malte'),
('MU', 'Mauritius', 'Maurice'),
('MV', 'Maldives', 'Maldives'),
('MW', 'Malawi', 'Malawi'),
('MX', 'Mexico', 'Mexique'),
('MY', 'Malaysia', 'Malaisie'),
('MZ', 'Mozambique', 'Mozambique'),
('NA', 'Namibia', 'Namibie'),
('NC', 'New Caledonia', 'Nouvelle-Calédonie'),
('NE', 'Niger', 'Niger'),
('NF', 'Norfolk Island', 'Île Norfolk'),
('NG', 'Nigeria', 'Nigeria'),
('NI', 'Nicaragua', 'Nicaragua'),
('NL', 'The Netherlands', 'Pays-Bas'),
('NO', 'Norway', 'Norvège'),
('NP', 'Nepal', 'Népal'),
('NR', 'Nauru', 'Nauru'),
('NU', 'Niue', 'Niue'),
('NZ', 'New Zealand', 'Nouvelle-Zélande'),
('OM', 'Oman', 'Oman'),
('PA', 'Panama', 'Panama'),
('PE', 'Peru', 'Pérou'),
('PF', 'French Polynesia', 'Polynésie française'),
('PG', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée'),
('PH', 'Philippines', 'Philippines'),
('PK', 'Pakistan', 'Pakistan'),
('PL', 'Poland', 'Pologne'),
('PM', 'St. Pierre and Miquelon', 'Saint-Pierre-et-Miquelon'),
('PN', 'Pitcairn', 'Pitcairn'),
('PR', 'Puerto Rico', 'Puerto Rico'),
('PS', 'Palestine, State of', 'Palestine'),
('PT', 'Portugal', 'Portugal'),
('PW', 'Palau', 'Palau'),
('PY', 'Paraguay', 'Paraguay'),
('QA', 'Qatar', 'Qatar'),
('RE', 'Réunion', 'Réunion'),
('RO', 'Romania', 'Roumanie'),
('RS', 'Serbia', 'Serbie'),
('RU', 'Russian Federation', 'Russie'),
('RW', 'Rwanda', 'Rwanda'),
('SA', 'Saudi Arabia', 'Arabie saoudite'),
('SB', 'Solomon Islands', 'Îles Salomon'),
('SC', 'Seychelles', 'Seychelles'),
('SD', 'Sudan', 'Soudan'),
('SE', 'Sweden', 'Suède'),
('SG', 'Singapore', 'Singapour'),
('SH', 'Saint Helena', 'Sainte-Hélène'),
('SI', 'Slovenia', 'Slovénie'),
('SJ', 'Svalbard and Jan Mayen Islands', 'Svalbard et île de Jan Mayen'),
('SK', 'Slovakia', 'Slovaquie'),
('SL', 'Sierra Leone', 'Sierra Leone'),
('SM', 'San Marino', 'Saint-Marin'),
('SN', 'Senegal', 'Sénégal'),
('SO', 'Somalia', 'Somalie'),
('SR', 'Suriname', 'Suriname'),
('SS', 'South Sudan', 'Soudan du Sud'),
('ST', 'Sao Tome and Principe', 'Sao Tomé-et-Principe'),
('SV', 'El Salvador', 'El Salvador'),
('SX', 'Sint Maarten (Dutch part)', 'Saint-Martin (Pays-Bas)'),
('SY', 'Syria', 'Syrie'),
('SZ', 'Swaziland', 'Swaziland'),
('TC', 'Turks and Caicos Islands', 'Îles Turks et Caicos'),
('TD', 'Chad', 'Tchad'),
('TF', 'French Southern Territories', 'Terres australes françaises'),
('TG', 'Togo', 'Togo'),
('TH', 'Thailand', 'Thaïlande'),
('TJ', 'Tajikistan', 'Tadjikistan'),
('TK', 'Tokelau', 'Tokelau'),
('TL', 'Timor-Leste', 'Timor-Leste'),
('TM', 'Turkmenistan', 'Turkménistan'),
('TN', 'Tunisia', 'Tunisie'),
('TO', 'Tonga', 'Tonga'),
('TR', 'Turkey', 'Turquie'),
('TT', 'Trinidad and Tobago', 'Trinité-et-Tobago'),
('TV', 'Tuvalu', 'Tuvalu'),
('TW', 'Taiwan', 'Taïwan'),
('TZ', 'Tanzania', 'Tanzanie'),
('UA', 'Ukraine', 'Ukraine'),
('UG', 'Uganda', 'Ouganda'),
('UM', 'United States Minor Outlying Islands', 'Îles mineures éloignées des États-Unis'),
('US', 'United States', 'États-Unis'),
('UY', 'Uruguay', 'Uruguay'),
('UZ', 'Uzbekistan', 'Ouzbékistan'),
('VA', 'Vatican', 'Vatican'),
('VC', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les-Grenadines'),
('VE', 'Venezuela', 'Venezuela'),
('VG', 'Virgin Islands (British)', 'Îles Vierges britanniques'),
('VI', 'Virgin Islands (U.S.)', 'Îles Vierges américaines'),
('VN', 'Vietnam', 'Vietnam'),
('VU', 'Vanuatu', 'Vanuatu'),
('WF', 'Wallis and Futuna Islands', 'Îles Wallis-et-Futuna'),
('WS', 'Samoa', 'Samoa'),
('YE', 'Yemen', 'Yémen'),
('YT', 'Mayotte', 'Mayotte'),
('ZA', 'South Africa', 'Afrique du Sud'),
('ZM', 'Zambia', 'Zambie'),
('ZW', 'Zimbabwe', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Structure de la table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `source_download_count` int(11) NOT NULL,
  `sql_download_count` int(11) NOT NULL,
  `id` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `download`
--

INSERT INTO `download` (`source_download_count`, `sql_download_count`, `id`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `forums`
--

CREATE TABLE IF NOT EXISTS `forums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Structure de la table `forum_answer`
--

CREATE TABLE IF NOT EXISTS `forum_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL,
  `pseudo` varchar(65) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(65) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Structure de la table `forum_question`
--

CREATE TABLE IF NOT EXISTS `forum_question` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) NOT NULL,
  `topic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pseudo` varchar(65) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(65) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `view` int(4) NOT NULL DEFAULT '0',
  `reply` int(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- Structure de la table `layout`
--

CREATE TABLE IF NOT EXISTS `layout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `header` blob NOT NULL,
  `footer` blob NOT NULL,
  `logo` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Contenu de la table `layout`
--

INSERT INTO `layout` (`id`, `title`, `layout`, `lang`, `header`, `footer`, `logo`, `updated_at`, `created_at`) VALUES
(73, 'Groovel', 'blog', 'GB', 0x637a6f794d6a4536496a786b615859675932786863334d39496e4e7064475574614756685a476c755a79492b44516f674943416749434167494341674943416750476778506b4e735a57467549454a73623263384c3267785067304b494341674943416749434167494341674944786f6369426a6247467a637a306963323168624777695067304b4943416749434167494341674943416749434167494341674944787a6347467549474e7359584e7a50534a7a64574a6f5a57466b6157356e496a354249454e735a57467549454a73623263675647686c62575567596e6b6755335268636e5167516d397664484e30636d46774948567a5a5751675a6d3979494745675a334a7662335a6c6243426b5a5731764944777663334268626a344e43694167494341675043396b6158592b496a733d, 0x637a6f794d446f695932397765584a705a32683049476479623239325a57786a62584d694f773d3d, 'images/home-bg.jpg/', '2016-03-09 21:21:55', '2016-03-09 21:18:45'),
(72, 'Groovel Blog', 'blog', 'FR', 0x637a6f794d6a5936496941385a476c3249474e7359584e7a50534a7a6158526c4c57686c59575270626d63695067304b494341674943416749434167494341674944786f4d54354462475668626942436247396e5043396f4d54344e4369416749434167494341674943416749434138614849675932786863334d39496e4e7459577873496a344e43694167494341674943416749434167494341674943416749434138633342686269426a6247467a637a306963335669614756685a476c755a79492b5132786c59573467516d78765a79426b5a584e705a3234676347467949464e3059584a3049454a766233527a64484a686343423164476c73615850447153427762335679494856755a53426b77366c746279426e636d3976646d56734944777663334268626a344e436941384c325270646a34694f773d3d, 0x637a6f794d446f695932397765584a705a32683049476479623239325a57786a62584d694f773d3d, 'images/home-bg.jpg', '2016-03-09 20:57:26', '2016-03-09 20:57:26'),
(71, 'Groovel', 'blog', 'US', 0x637a6f794d6a4936496941385a476c3249474e7359584e7a50534a7a6158526c4c57686c59575270626d63695067304b494341674943416749434167494341674944786f4d54354462475668626942436247396e5043396f4d54344e4369416749434167494341674943416749434138614849675932786863334d39496e4e7459577873496a344e43694167494341674943416749434167494341674943416749434138633342686269426a6247467a637a306963335669614756685a476c755a79492b5153424462475668626942436247396e4946526f5a57316c49474a3549464e3059584a3049454a766233527a64484a68634342316332566b49475a766369426849476479623239325a5777675a475674627941384c334e775957342b44516f6749434167494477765a476c3250694937, 0x637a6f794d446f695132397765584a705a32683049476479623239325a57786a62584d694f773d3d, 'images/home-bg.jpg', '2016-03-06 15:00:29', '2016-03-01 22:07:27');

-- --------------------------------------------------------




--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu` blob NOT NULL,
  `layout` varchar(256) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Contenu de la table `menu`
--

INSERT INTO `menu` (`id`, `name`, `lang`, `menu`, `layout`, `updated_at`, `created_at`) VALUES
(65, 'Groovel', 'US', 0x59546f784f6e74704f6a413759546f794f6e74704f6a413759546f784f6e747a4f6a5136496d3568625755694f3245364d7a7037637a6f334f694a305957644f5957316c496a747a4f6a4936496b784a496a747a4f6a5136496d3568625755694f334d364e446f69534739745a534937637a6f7a4f694a31636d6b694f334d364e546f694c326876625755694f33313961546f784f3245364d6a7037637a6f304f694a755957316c496a74684f6a4d3665334d364e7a6f696447466e546d46745a534937637a6f794f694a4d53534937637a6f304f694a755957316c496a747a4f6a5136496c526c633351694f334d364d7a6f6964584a70496a747a4f6a67364969396a6232353059574e30496a7439637a6f314f694a6a61476c735a43493759546f784f6e74704f6a413759546f794f6e747a4f6a5136496d3568625755694f3245364d7a7037637a6f334f694a305957644f5957316c496a747a4f6a4936496b784a496a747a4f6a5136496d3568625755694f334d364e446f696447567a64434937637a6f7a4f694a31636d6b694f334d364e546f694c33526c633351694f33317a4f6a5536496d4e6f6157786b496a74684f6a453665326b364d4474684f6a453665334d364e446f69626d46745a53493759546f7a4f6e747a4f6a6336496e52685a303568625755694f334d364d6a6f6954456b694f334d364e446f69626d46745a534937637a6f314f694a305a584e304d694937637a6f7a4f694a31636d6b694f334d364e546f696447567a644449694f3331396658313966583139, 'blog', '2016-03-06 21:45:04', '2016-03-06 21:45:04'),
(66, 'Groovel Blog', 'FR', 0x59546f784f6e74704f6a413759546f784f6e74704f6a413759546f784f6e747a4f6a5136496d3568625755694f3245364d7a7037637a6f334f694a305957644f5957316c496a747a4f6a4936496b784a496a747a4f6a5136496d3568625755694f334d364e7a6f6951574e6a6457567062434937637a6f7a4f694a31636d6b694f334d364d546f69497949376658313966513d3d, 'blog', '2016-03-09 21:13:09', '2016-03-09 21:13:09'),
(67, 'Summary', 'FR', 0x59546f784f6e74704f6a413759546f784f6e74704f6a413759546f794f6e747a4f6a5136496d3568625755694f3245364d7a7037637a6f334f694a305957644f5957316c496a747a4f6a4936496b784a496a747a4f6a5136496d3568625755694f334d364e446f696447567a64434937637a6f7a4f694a31636d6b694f334d364e546f694c33526c633351694f33317a4f6a5536496d4e6f6157786b496a74684f6a453665326b364d4474684f6a453665334d364e446f69626d46745a53493759546f7a4f6e747a4f6a6336496e52685a303568625755694f334d364d6a6f6954456b694f334d364e446f69626d46745a534937637a6f314f694a305a584e304d694937637a6f7a4f694a31636d6b694f334d364e6a6f694c33526c63335179496a7439665831396658303d, 'blog', '2016-05-29 15:36:25', '2016-05-29 15:36:25');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `body` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `recipient` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isalreadyread` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=122 ;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_05_08_143602_create_users', 1),
('2014_05_21_201217_theme_groovel', 2),
('2014_05_27_213446_ROUTES', 3),
('2014_05_27_214406_ROUTES_GROOVEL', 4),
('2014_07_16_204852_contents', 4),
('2014_07_16_204946_content_types', 4),
('2014_07_16_205349_category', 4),
('2014_07_27_215950_contents_category', 5);

-- --------------------------------------------------------

--
-- Structure de la table `password_reminders`
--

CREATE TABLE IF NOT EXISTS `password_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;



-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owncontent` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `othercontent` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `op_create` tinyint(1) NOT NULL,
  `op_read` tinyint(1) NOT NULL,
  `op_update` tinyint(1) NOT NULL,
  `op_delete` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=722 ;



INSERT INTO `permissions` (`id`, `uri`, `owncontent`, `othercontent`, `op_create`, `op_read`, `op_update`, `op_delete`, `created_at`, `updated_at`) VALUES
(793, 'admin/user/validate', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(792, 'admin/user/editform', 'yes', 'no', 0, 0, 1, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(791, 'forum/topic', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(790, 'forum/topic/post', 'yes', 'no', 1, 0, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(789, 'messages/send', 'yes', 'no', 1, 0, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(787, 'forums/view', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(788, 'user/view/profile/edit', 'yes', 'no', 0, 0, 1, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(785, 'user/view/profile', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(786, 'messages/list', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(784, 'admin/welcome', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(781, 'forum', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(782, 'messages/edit', 'yes', 'no', 0, 0, 1, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(783, 'messages/compose', 'yes', 'no', 0, 0, 1, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(780, 'messages/read', 'yes', 'no', 0, 1, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(779, 'messages/delete', 'yes', 'no', 0, 0, 0, 1, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(778, 'forum/topic/reply/post', 'yes', 'no', 1, 0, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(794, 'admin/file/upload', 'yes', 'no', 0, 0, 1, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(795, 'admin/user/update', 'yes', 'no', 0, 0, 1, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(796, 'comment/post', 'yes', 'no', 1, 0, 0, 0, '2016-06-26 12:54:22', '2016-06-26 12:54:22');






-- --------------------------------------------------------

--
-- Structure de la table `repositoryindex`
--

CREATE TABLE IF NOT EXISTS `repositoryindex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2210 ;

--
-- Contenu de la table `repositoryindex`
--


-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=42 ;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`id`, `role`, `updated_at`, `created_at`) VALUES
(1, 'ADMIN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'NONE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'PUBLIC', '2016-06-21 19:58:40', '2016-06-21 19:58:40');

-- --------------------------------------------------------

--
-- Structure de la table `role_permissions`
--

CREATE TABLE IF NOT EXISTS `role_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` int(10) unsigned NOT NULL,
  `permissionid` int(10) unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`),
  KEY `permissionid` (`permissionid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=429 ;

--
-- Contenu de la table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `roleid`, `permissionid`, `updated_at`, `created_at`) VALUES
(500, 42, 793, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(499, 42, 792, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(498, 42, 791, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(497, 42, 790, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(496, 42, 789, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(495, 42, 788, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(494, 42, 787, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(493, 42, 786, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(492, 42, 785, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(491, 42, 784, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(490, 42, 783, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(489, 42, 782, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(488, 42, 781, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(487, 42, 780, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(486, 42, 779, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(485, 42, 778, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(501, 42, 794, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(502, 42, 795, '2016-06-26 12:54:22', '2016-06-26 12:54:22'),
(503, 42, 796, '2016-06-26 12:54:22', '2016-06-26 12:54:22');

-- --------------------------------------------------------

--
-- Structure de la table `routes_groovel`
--

CREATE TABLE IF NOT EXISTS `routes_groovel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `audit_tracking_url_enable` tinyint(1) NOT NULL,
  `activate_route` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uri` (`uri`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=556 ;

--
-- Contenu de la table `routes_groovel`
--

INSERT INTO `routes_groovel` (`id`, `uri`, `name`, `controller`, `method`, `action`, `view`, `type`, `audit_tracking_url_enable`, `activate_route`, `updated_at`, `created_at`) VALUES
(1, 'admin/dashboard', 'admin panels', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\stats\\GroovelDashBoardController', 'init', 'op_read', 'cmsgroovel.pages.dashboard', 'Groovel', 1, 1, '2015-07-14 17:16:08', '0000-00-00 00:00:00'),
(2, 'admin/routes', 'listing routes', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRouteController', 'showRoutes', 'op_read', '', 'Groovel', 0, 1, '2015-06-10 12:59:24', '0000-00-00 00:00:00'),
(3, 'admin/routes/form', 'form to add new routes', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRoutesFormController', 'init', 'op_update', 'cmsgroovel.pages.admin_form_route', 'Groovel', 0, 1, '2015-07-12 14:48:39', '0000-00-00 00:00:00'),
(4, 'admin/routes/add', 'add route', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRoutesFormController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-06-10 13:09:46', '0000-00-00 00:00:00'),
(5, 'admin/routes/update', 'update route', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRoutesFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2014-09-28 20:18:35', '0000-00-00 00:00:00'),
(6, 'admin/routes/delete', 'delete route', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRoutesFormController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2014-09-28 20:18:39', '0000-00-00 00:00:00'),
(8, 'admin/content/form', 'add new contents', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'init', 'op_update', 'cmsgroovel.pages.admin_content_management', 'Groovel', 0, 1, '2014-10-05 15:47:26', '2014-07-29 21:14:37'),
(9, 'admin/content_type/form', 'form add new content type', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\content_type\\GroovelContentTypeFormController', 'init', 'op_update', 'cmsgroovel.pages.admin_content_type_management', 'Groovel', 0, 1, '2014-10-06 19:38:59', '2014-07-29 21:28:26'),
(10, 'admin/content_type/add', 'add new content type', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\content_type\\GroovelContentTypeFormController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2014-09-28 20:19:00', '2014-08-20 08:54:28'),
(13, 'admin/content/form/view_update', 'update view form content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_content_management', 'Groovel', 0, 1, '2014-10-05 15:47:43', '2014-08-31 14:28:59'),
(14, 'admin/content/add', 'add content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_create', 'cmsgroovel.pages.admin_content_management', 'Groovel', 0, 1, '2014-10-05 15:43:58', '2014-09-19 15:17:27'),
(15, 'admin/contents', 'list all contents', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentsListController', 'init', 'op_read', 'cmsgroovel.pages.admin_list_contents', 'Groovel', 0, 1, '2014-12-14 14:08:39', '2014-09-21 20:00:23'),
(16, 'admin/content/update', 'update content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_content_management', 'Groovel', 0, 1, '2014-10-05 15:48:02', '2014-09-22 20:09:10'),
(17, 'admin/content/delete', 'delete content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_delete', 'cmsgroovel.pages.admin_content_management', 'Groovel', 0, 1, '2014-10-05 15:43:22', '2014-09-22 20:20:44'),
(18, 'admin', 'login', '', '', 'none', 'cmsgroovel.pages.login_form', 'Groovel', 0, 1, '2014-09-28 20:19:24', '2014-09-23 21:54:47'),
(19, 'admin/auth/login/form', 'login authentification', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\auth\\AuthController', 'postLogin', 'none', '', 'Groovel', 0, 1, '2014-09-28 20:19:28', '2014-09-26 09:29:11'),
(21, 'admin/failed/login', 'Login failed', '', '', 'none', 'cmsgroovel.pages.login_form', 'Groovel', 0, 1, '2014-09-28 20:19:31', '2014-09-27 13:29:38'),
(22, 'admin/auth/subscribe', 'Subscribe new users', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\auth\\AuthController', 'postInscription', 'none', 'cmsgroovel.pages.login_subscribe', 'Groovel', 0, 1, '2014-09-28 20:20:08', '2014-09-27 13:40:41'),
(31, 'admin/routes/refresh', 'refresh cache routes', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRouteController', 'clearRoutesCache', 'op_update', 'cmsgroovel.pages.admin_list_routes', 'Groovel', 0, 1, '2014-10-05 15:06:53', '2014-10-05 11:47:48'),
(24, 'admin/auth/subscribe/form', 'Get form to subscribe', '', '', 'none', 'cmsgroovel.pages.login_subscribe', 'Groovel', 0, 1, '2014-09-28 20:20:19', '2014-09-27 18:35:00'),
(25, 'admin/auth/logout', 'log out', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\auth\\AuthController', 'getLogout', 'none', 'cmsgroovel.pages.login_form', 'Groovel', 0, 1, '2014-09-28 20:19:35', '2014-09-27 20:12:00'),
(26, 'admin/auth/login', 'login', '', '', 'none', 'cmsgroovel.pages.login_form', 'Groovel', 0, 1, '2014-10-05 20:37:11', '2014-09-27 20:41:01'),
(27, 'admin/auth/login/remind/form', 'form to reset password', '', '', 'none', 'cmsgroovel.pages.login_remind', 'Groovel', 0, 1, '2014-09-28 20:46:11', '2014-09-28 20:41:29'),
(28, 'admin/content/edit', 'Edit content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2014-10-05 16:36:13', '2014-09-30 05:56:25'),
(32, 'admin/content/editform', 'form to modify content', '', '', 'op_update', 'cmsgroovel.pages.admin_content_form', 'Groovel', 0, 1, '2014-10-05 16:35:34', '2014-10-05 16:34:38'),
(33, 'admin/content/editform/file/browser', 'browser files', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'browserFile', 'op_update', '', 'Groovel', 0, 1, '2014-11-01 16:51:51', '2014-10-29 21:43:58'),
(34, 'admin/content/editform/file/browser/explore', 'search dir browser', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'explorerDir', 'op_update', '', 'Groovel', 0, 1, '2014-11-01 17:33:49', '2014-11-01 16:02:21'),
(35, 'admin/content/form/file/browser', 'form to add content we add file browser', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'browserFile', 'op_update', '', 'Groovel', 0, 1, '2014-11-08 21:49:44', '2014-11-08 21:49:01'),
(36, 'admin/content/form/file/browser/explore', 'form to add content we add explorer file', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'explorerDir', 'op_update', '', 'Groovel', 0, 1, '2014-11-08 21:52:49', '2014-11-08 21:51:21'),
(37, 'admin/file/upload', 'upload file', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-07-09 07:14:15', '2014-11-16 14:23:51'),
(43, 'admin/content_type/edit', 'Edit content type', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\content_type\\GroovelContentTypeFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2014-11-22 11:41:14', '2014-11-22 10:54:11'),
(42, 'admin/content_types', 'list all contents type', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\content_type\\GroovelContentTypesListController', 'init', 'op_read', 'cmsgroovel.pages.admin_list_content_types', 'Groovel', 0, 1, '2014-11-22 10:38:35', '2014-11-22 10:35:50'),
(44, 'admin/content_type/editform', 'form to modify contenttype', '', '', 'op_update', 'cmsgroovel.pages.admin_content_type_form', 'Groovel', 0, 1, '2014-11-22 11:45:29', '2014-11-22 11:44:19'),
(45, 'admin/content_type/update', 'update content type', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\content_type\\GroovelContentTypeFormController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_content_type_form', 'Groovel', 0, 1, '2014-11-23 20:32:44', '2014-11-23 20:30:12'),
(46, 'admin/content_type/fields/delete', 'delete contentype field', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\content_type\\GroovelContentTypeFormController', 'validateForm', 'op_delete', 'cmsgroovel.pages.admin_content_type_form', 'Groovel', 0, 1, '2014-12-13 00:15:31', '2014-12-07 21:41:57'),
(47, 'admin/content_type/delete', 'delete content type', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\content_type\\GroovelContentTypeFormController', 'validateForm', 'op_delete', 'cmsgroovel.pages.admin_content_type_form', 'Groovel', 0, 1, '2014-12-26 13:06:19', '2014-12-13 00:17:20'),
(53, 'undefined', 'undefined routes', '', '', 'none', 'cmsgroovel.pages.pagenotfound', 'Groovel', 0, 1, '2014-12-26 13:57:42', '2014-12-26 12:40:31'),
(55, 'admin/routes/editform', 'route edit form', '', '', 'op_update', 'cmsgroovel.pages.admin_route_form', 'Groovel', 0, 1, '2014-12-28 14:09:11', '2014-12-28 14:09:11'),
(56, 'admin/routes/user', 'route controller only for user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRouteController', 'showOnlyRoutesUser', 'op_read', '', 'Groovel', 0, 1, '2014-12-28 23:15:00', '2014-12-28 23:15:00'),
(58, 'admin/users', 'List all users', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUsersListController', 'init', 'op_read', '', 'Groovel', 0, 1, '2015-01-09 22:16:13', '2015-01-09 22:16:13'),
(59, 'admin/user/form', 'User form', '', '', 'op_create', 'cmsgroovel.pages.admin_user_form_management', 'Groovel', 0, 1, '2015-06-04 15:10:45', '2015-01-09 22:52:58'),
(60, 'admin/user/edit', 'Edit user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-01-10 17:02:55', '2015-01-10 17:02:55'),
(69, 'admin/content/file/upload/widget', 'widget File', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'getWidget', 'op_update', '', 'Groovel', 0, 1, '2015-01-31 21:13:32', '2015-01-31 20:58:19'),
(101, 'admin/user/add', 'add new user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-02-18 23:01:47', '2015-02-18 23:00:11'),
(102, 'admin/users/permissions', 'Users permissions list', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_permissions\\GroovelUsersPermissionsListController', 'init', 'op_read', 'cmsgroovel.pages.admin_list_permissions_users', 'Groovel', 0, 1, '2015-03-15 12:30:47', '2015-03-12 21:50:57'),
(103, 'admin/users/roles', 'List all users roles', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_roles\\GroovelUsersRolesListController', 'init', 'op_read', 'cmsgroovel.pages.admin_list_roles_users', 'Groovel', 0, 1, '2015-03-15 13:13:32', '2015-03-15 13:12:41'),
(104, 'admin/user/permission/add', 'add new user permissions', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_permissions\\GroovelUserPermissionFormController', 'validateForm', 'op_create', 'cmsgroovel.pages.admin_user_permission_management', 'Groovel', 0, 1, '2015-03-21 21:38:45', '2015-03-15 13:31:14'),
(105, 'admin/user/role/form', 'add new user role', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_roles\\GroovelUserRoleFormController', 'init', 'op_update', 'cmsgroovel.pages.admin_user_role_management', 'Groovel', 0, 1, '2015-03-15 14:51:18', '2015-03-15 14:51:18'),
(106, 'admin/users/permission/edit', 'user permissions form update', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_permissions\\GroovelUserPermissionFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-04-01 06:44:19', '2015-03-31 19:59:00'),
(107, 'admin/user/permission/editform', 'form to modify user permission', '', '', 'op_update', 'cmsgroovel.pages.admin_user_permission_form', 'Groovel', 0, 1, '2015-04-01 19:18:03', '2015-03-31 20:16:04'),
(108, 'admin/user/permissions/form', 'add new user permissions', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_permissions\\GroovelUserPermissionFormController', 'init', 'op_update', 'cmsgroovel.pages.admin_user_permission_management', 'Groovel', 0, 1, '2015-04-01 21:31:11', '2015-04-01 21:26:09'),
(109, 'admin/user/role/add', 'add role form', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_roles\\GroovelUserRoleFormController', 'validateForm', 'op_create', 'cmsgroovel.pages.admin_user_role_management', 'Groovel', 0, 1, '2015-04-03 21:24:12', '2015-04-03 21:23:23'),
(110, 'admin/packages', 'Package management', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\bundles\\GroovelPackageManagerController', 'init', 'op_read', 'cmsgroovel.pages.admin_list_packages', 'Groovel', 0, 1, '2015-05-06 14:32:48', '2015-04-20 08:11:33'),
(111, 'admin/packages/composer', 'composer', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\bundles\\GroovelPackageManagerController', 'validateForm', 'op_update', 'cmsgroovel.pages.packages', 'Groovel', 0, 1, '2015-04-23 06:45:10', '2015-04-22 06:20:42'),
(112, 'admin/user/view', 'user view profile', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_read', '', 'Groovel', 0, 1, '2015-05-13 12:21:02', '2015-05-13 12:21:02'),
(113, 'admin/user/view/profile', 'user profile', '', '', 'op_read', 'cmsgroovel.pages.user_profile', 'Groovel', 0, 1, '2015-05-13 13:05:33', '2015-05-13 12:51:52'),
(116, 'admin/user/view/profile/edit', 'edit profile user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-07-11 08:35:39', '2015-05-18 11:31:06'),
(208, 'admin/user/editform', 'edit users form', '', '', 'op_update', 'cmsgroovel.pages.admin_user_form', 'Groovel', 0, 1, '2015-06-04 20:54:12', '2015-06-04 20:42:55'),
(209, 'admin/user/update', 'update user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-06-04 21:11:52', '2015-06-04 21:11:52'),
(210, 'admin/user/delete', 'delete a user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2015-06-05 14:45:09', '2015-06-05 14:45:09'),
(211, 'admin/user/activate', 'activate user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-06-05 14:57:47', '2015-06-05 14:57:47'),
(212, 'admin/user/notactivate', 'block user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-06-05 14:58:45', '2015-06-05 14:58:45'),
(213, 'admin/users/role/edit', 'edit role', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_roles\\GroovelUserRoleFormController', 'validateForm', 'op_update', 'admin::pages.admin_user_role_form', 'Groovel', 0, 1, '2015-06-11 11:03:34', '2015-06-07 09:36:39'),
(214, 'admin/user/role/editform', 'role edit form', '', '', 'op_update', 'cmsgroovel.pages.admin_user_role_form', 'Groovel', 0, 1, '2015-06-07 09:57:42', '2015-06-07 09:53:39'),
(215, 'admin/users/delete/permission', 'deleter user permission', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_permissions\\GroovelUserPermissionFormController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2015-06-11 10:58:25', '2015-06-07 13:24:48'),
(216, 'admin/user/permission/update', 'update permission', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_permissions\\GroovelUserPermissionFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-06-07 13:32:54', '2015-06-07 13:32:54'),
(217, 'admin/user/role/update', 'role update', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users_roles\\GroovelUserRoleFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-06-07 14:59:03', '2015-06-07 14:59:03'),
(220, 'search', 'search engine', '', '', 'op_read', 'cmsgroovel.pages.search_engine_page', 'Groovel', 0, 1, '2015-06-13 21:20:48', '2015-06-13 21:16:07'),
(231, 'admin/search/execute', 'Groovel Search Engine', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\search\\GroovelSearchEngineController', 'validateForm', 'op_read', '', 'Groovel', 0, 1, '2015-06-15 16:56:45', '2015-06-15 16:49:49'),
(244, 'admin/config_system', 'system configuration groovel', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\configuration\\GroovelSystemConfigurationController', 'init', 'op_create', 'cmsgroovel.pages.admin_configuration_system', 'Groovel', 0, 1, '2015-06-29 13:17:01', '2015-06-20 08:38:29'),
(245, 'admin/configuration/update_audit', 'update audit configuration', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\configuration\\GroovelSystemConfigurationController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_configuration_system', 'Groovel', 0, 1, '2015-06-22 09:12:48', '2015-06-22 08:36:39'),
(246, 'admin/dashboard/users/location', 'get users location for dashboard', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\stats\\GroovelDashBoardController', 'getUsersLocation', 'op_read', 'cmsgroovel.pages.dashboard', 'Groovel', 0, 1, '2015-06-27 14:39:05', '2015-06-27 14:09:15'),
(247, 'admin/configuration/update_search_engine', 'configuration search engine', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\configuration\\GroovelSystemConfigurationController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_configuration_system', 'Groovel', 0, 1, '2015-06-29 12:50:49', '2015-06-29 12:20:37'),
(248, 'admin/configuration/maintenance', 'maintenance activation', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\configuration\\GroovelSystemConfigurationController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_configuration_system', 'Groovel', 0, 1, '2015-06-29 13:00:45', '2015-06-29 13:00:45'),
(249, 'admin/configuration/clear_history_tracking_users', 'clear history user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\configuration\\GroovelSystemConfigurationController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_configuration_system', 'Groovel', 0, 1, '2015-06-29 14:30:58', '2015-06-29 14:30:58'),
(254, 'messages/delete', 'message delete', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\messages\\GroovelMessageController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2015-07-01 14:54:40', '2015-07-01 14:54:40'),
(253, 'messages/edit', 'edit message', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\messages\\GroovelMessageController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-07-01 14:52:01', '2015-07-01 14:52:01'),
(252, 'messages/send', 'send message', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\messages\\GroovelMessageController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-07-01 12:34:45', '2015-07-01 12:34:45'),
(251, 'messages/list', 'list messages', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\messages\\GroovelMessageController', 'validateForm', 'op_read', '', 'Groovel', 0, 1, '2015-07-01 11:27:16', '2015-07-01 11:02:11'),
(250, 'messages/compose', 'compose messages', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\messages\\GroovelMessageController', 'validateForm', 'op_update', 'cmsgroovel.pages.email.compose_messages', 'Groovel', 0, 1, '2015-07-01 11:27:56', '2015-07-01 08:29:14'),
(255, 'messages/read', 'read message', '', '', 'op_read', 'cmsgroovel.pages.email.edit_message', 'Groovel', 0, 1, '2015-07-01 17:36:58', '2015-07-01 17:35:26'),
(256, 'messages/reply', 'reply message', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\messages\\GroovelMessageController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-07-01 19:22:46', '2015-07-01 19:22:46'),
(257, 'admin/welcome', 'welcome page', '', '', 'op_read', 'cmsgroovel.pages.welcome', 'Groovel', 0, 1, '2015-07-12 15:47:34', '2015-07-03 07:39:38'),
(258, 'admin/dashboard/users/totalUsersByDay', 'getTotalUsersByDay', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\stats\\GroovelDashBoardController', 'getTotalUsersByDay', 'op_read', 'cmsgroovel.pages.dashboard', 'Groovel', 0, 1, '2015-07-03 12:47:58', '2015-07-03 12:47:02'),
(259, 'admin/templates/add', 'template controller', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\templates\\GroovelTemplateManagerController', 'validateForm', 'op_read', '', 'Groovel', 0, 1, '2015-07-05 13:08:56', '2015-07-05 09:39:07'),
(260, 'admin/templates/create', 'create template form', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\templates\\GroovelTemplateManagerController', 'init', 'op_read', 'cmsgroovel.pages.admin_template_form', 'Groovel', 0, 1, '2015-07-05 15:24:19', '2015-07-05 13:10:34'),
(467, 'admin/layout/add', 'add layout', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutController', 'validateForm', 'op_create', 'cmsgroovel.pages.layout.admin_layout_form', 'Groovel', 0, 1, '2016-01-24 14:02:00', '2016-01-24 14:02:00'),
(280, 'admin/routes/edit', 'edit route', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRoutesFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-07-08 07:00:35', '2015-07-08 07:00:35'),
(466, 'admin/pages/form', 'add new pages', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\page\\GroovelPageController', 'init', 'op_create', 'cmsgroovel.pages.page.admin_page_form', 'Groovel', 0, 1, '2016-01-24 20:09:39', '2016-01-24 11:20:06'),
(465, 'admin/layout', 'layout choice', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutController', 'init', 'op_read', 'cmsgroovel.pages.layout.admin_layout_management', 'Groovel', 0, 1, '2016-01-27 21:30:32', '2016-01-23 22:03:40'),
(464, 'admin/menu/list', 'list menus', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\menu\\GroovelMenusListController', 'init', 'op_read', 'cmsgroovel.pages.admin_list_menus', 'Groovel', 0, 1, '2016-01-23 14:59:31', '2016-01-23 14:28:05'),
(535, 'blogs', 'groovel blog', NULL, NULL, 'none', 'blog.pages.blog', 'blog', 0, 1, '2016-02-13 17:28:54', '2016-02-13 17:28:54'),
(331, 'user/view/profile', 'settings of user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_read', '', 'Groovel', 0, 1, '2015-07-11 08:24:53', '2015-07-10 09:46:47'),
(332, 'user/view/profile/edit', 'edit user profile for user', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-07-11 10:26:35', '2015-07-11 10:25:02'),
(333, 'admin/configuration/email', 'email configuration', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\configuration\\GroovelSystemConfigurationController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_configuration_system', 'Groovel', 0, 1, '2015-07-11 21:07:06', '2015-07-11 21:07:06'),
(345, 'admin/configuration/activate/users', 'configuration activate user at registration', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\configuration\\GroovelSystemConfigurationController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_configuration_system', 'Groovel', 0, 1, '2015-07-14 20:45:35', '2015-07-14 20:45:35'),
(346, 'admin/auth/login/remind', 'reset password reminders', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\auth\\RemindersController', 'validateForm', 'none', '', 'Groovel', 0, 1, '2015-07-15 09:07:15', '2015-07-15 09:07:15'),
(347, 'remind/reset', 'reset password', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\auth\\RemindersController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-07-15 12:47:41', '2015-07-15 12:47:41'),
(348, 'admin/auth/remind/reset', 'reset password', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\auth\\RemindersController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-07-15 13:01:43', '2015-07-15 13:01:43'),
(350, 'contact/post', 'contact form', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contact\\GroovelContactFormController', 'validateForm', 'none', 'cmsgroovel.pages.contact_form', 'Groovel', 0, 1, '2015-07-28 16:37:34', '2015-07-20 15:03:14'),
(351, 'forum', 'forum', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_read', 'cmsgroovel.pages.forum.forum', 'Groovel', 0, 1, '2015-07-24 15:55:46', '2015-07-21 16:39:53'),
(352, 'forum/subject', 'subject form', '', '', 'op_read', 'cmsgroovel.pages.forum.subject_forum', 'Groovel', 0, 1, '2015-07-21 16:54:48', '2015-07-21 16:54:48'),
(353, 'forum/newtopic', 'new topic forum', '', '', 'op_create', 'cmsgroovel.pages.forum.newtopic_form', 'Groovel', 0, 1, '2015-07-22 12:51:08', '2015-07-22 12:51:08'),
(354, 'forums/view', 'list all forums', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'init', 'op_read', 'cmsgroovel.pages.forum.list_forums', 'Groovel', 0, 1, '2015-07-28 21:55:08', '2015-07-23 08:40:51'),
(355, 'admin/forum/form', 'create forum form', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-07-23 19:42:57', '2015-07-23 19:36:40'),
(356, 'forum/create', 'create a forum', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-07-23 19:53:56', '2015-07-23 19:53:56'),
(357, 'forum/topic/post', 'post a topic', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-07-24 20:47:56', '2015-07-24 20:47:56'),
(358, 'forum/topic', 'topic with their answers', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_read', 'cmsgroovel.pages.forum.forum_topic', 'Groovel', 0, 1, '2015-07-29 08:50:53', '2015-07-24 22:04:26'),
(360, 'forum/topic/reply/post', 'reply to topic form', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2015-07-25 10:19:24', '2015-07-25 10:19:24'),
(361, 'forum/delete', 'delete forum', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2015-07-25 14:50:14', '2015-07-25 14:41:09'),
(362, 'forum/topic/delete', 'delete topic', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2015-07-25 15:07:51', '2015-07-25 14:41:53'),
(363, 'forum/topic/answer/delete', 'delete answer topic', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\forum\\GroovelForumController', 'validateForm', 'op_delete', 'cmsgroovel.pages.forum.forum', 'Groovel', 0, 1, '2015-07-29 08:54:10', '2015-07-25 14:42:34'),
(463, 'admin/menu/delete', 'delete menu', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\menu\\GroovelMenuController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2016-01-21 23:47:15', '2016-01-21 23:47:15'),
(462, 'admin/menu/add', 'add menu', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\menu\\GroovelMenuController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2016-01-20 21:16:16', '2016-01-20 21:16:16'),
(461, 'admin/menu/create', 'create a menu', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\menu\\GroovelMenuController', 'init', 'op_read', 'cmsgroovel.pages.admin_menu_management', 'Groovel', 0, 1, '2016-01-20 22:06:02', '2016-01-06 23:13:26'),
(393, 'admin/content/translate', 'translate content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2015-10-29 21:11:01', '2015-10-29 20:56:46'),
(420, 'admin/content/viewcode', 'code viewer contents', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_read', '', 'Groovel', 0, 1, '2015-11-21 17:04:32', '2015-11-21 17:04:32'),
(449, 'admin/content/validate', 'validation contents rules', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'makeValidation', 'op_read', '', 'Groovel', 0, 1, '2015-12-31 10:56:48', '2015-12-31 10:41:10'),
(538, 'comment/post', 'save comment', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\comments\\GroovelCommentController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2016-03-05 11:06:13', '2016-03-05 11:06:13'),
(453, 'admin/user/validate', 'user validation', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\users\\GroovelUserFormController', 'makeValidation', 'op_read', '', 'Groovel', 0, 1, '2016-01-03 09:36:19', '2016-01-02 13:00:25'),
(536, 'admin/layout/validate', 'validate layout', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutController', 'makeValidation', 'op_read', '', 'Groovel', 0, 1, '2016-02-29 21:01:17', '2016-02-29 21:01:17'),
(421, '/', 'home page first install', '', '', 'none', 'cmsgroovel.pages.firstinstall.welcome', 'blog', 0, 1, '2016-06-15 20:14:15', '2015-11-22 10:03:33'),
(468, 'admin/pages/add', 'add new pages', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\page\\GroovelPageController', 'validateForm', 'op_create', 'cmsgroovel.pages.page.admin_page_form', 'Groovel', 0, 1, '2016-01-24 20:29:19', '2016-01-24 20:29:19'),
(540, 'blog/posts/file/browser', 'browser file for blog post', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'browserFile', 'op_update', '', 'Groovel', 0, 1, '2016-03-12 10:07:02', '2016-03-12 10:07:02'),
(542, 'blog/posts/file/browser/explore', 'blog search dir browser', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\files\\GroovelFileController', 'explorerDir', 'op_update', '', 'Groovel', 0, 1, '2016-03-12 10:22:41', '2016-03-12 10:22:41'),
(508, 'admin/pages/delete', 'delete page', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\page\\GroovelPageController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2016-01-25 22:29:37', '2016-01-25 22:29:37'),
(514, 'admin/layout/list', 'list all layouts', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutsListController', 'init', 'op_read', '', 'Groovel', 0, 1, '2016-01-26 22:40:42', '2016-01-26 22:39:07'),
(515, 'admin/layout/edit', 'edit layout', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutController', 'validateForm', 'op_update', 'cmsgroovel.pages.layout.admin_layout_form', 'Groovel', 0, 1, '2016-01-27 20:43:41', '2016-01-27 20:43:41'),
(516, 'admin/layout/delete', 'delete layout', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2016-01-27 20:44:39', '2016-01-27 20:44:39'),
(517, 'admin/layout/editform', 'edit layout form', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutController', 'validateForm', 'op_update', 'cmsgroovel.pages.layout.admin_layout_form', 'Groovel', 0, 1, '2016-01-28 20:17:41', '2016-01-28 20:17:41'),
(518, 'admin/layout/update', 'layout update', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\layout\\GroovelLayoutController', 'validateForm', 'op_update', 'cmsgroovel.pages.layout.admin_layout_form', 'Groovel', 0, 1, '2016-01-28 21:15:23', '2016-01-28 21:15:23'),
(519, 'admin/menu/edit', 'edit menu', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\menu\\GroovelMenuController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_menu_form', 'Groovel', 0, 1, '2016-01-28 22:41:37', '2016-01-28 22:10:23'),
(520, 'admin/menu/editform', 'edit menu form', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\menu\\GroovelMenuController', 'validateForm', 'op_update', 'cmsgroovel.pages.admin_menu_form', 'Groovel', 0, 1, '2016-01-28 22:41:00', '2016-01-28 22:35:16'),
(528, 'admin/filemanager', 'filemanager', '', '', 'op_read', 'cmsgroovel.pages.filesmanager.index', 'Groovel', 0, 1, '2016-02-06 18:48:03', '2016-02-06 18:48:03'),
(530, 'admin/search/edit', 'search and edit content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\search\\GroovelSearchEngineController', 'validateForm', 'op_read', '', 'Groovel', 0, 1, '2016-02-11 20:29:43', '2016-02-11 20:29:43'),
(525, 'admin/pages/code/save', 'update page code view', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\routes\\GroovelRoutesFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2016-02-06 09:07:51', '2016-02-06 09:07:51'),
(531, 'testtype', 'testtype', '', '', 'op_read', 'blogfrancoistesttype', 'basic', 0, 0, '2016-02-13 10:03:59', '2016-02-13 10:03:59'),
(537, 'blog/posts', 'quick posts blogs', '', '', 'op_read', 'cmsgroovel.pages.blog.blog_form', 'Groovel', 0, 1, '2016-03-03 22:34:09', '2016-03-03 22:25:05'),
(543, 'testo', 'Et plus encore!', NULL, NULL, 'op_read', 'blog.pages.test', 'blog', 0, 1, '2016-06-06 21:20:07', '2016-06-06 21:20:07'),
(544, 'blog/content/show', 'show blog content', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\contents\\GroovelContentFormController', 'validateForm', 'op_read', 'blog.pages.article', 'blog', 0, 1, '2016-06-13 21:18:05', '2016-06-13 20:22:43'),
(545, 'admin/roles/permissions/form', 'rolepermissions', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\role_permissions\\GroovelRolePermissionsFormController', 'init', 'op_create', '', 'Groovel', 0, 1, '2016-06-19 14:17:12', '2016-06-18 08:07:58'),
(546, 'admin/role/permission/add', 'role add', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\role_permissions\\GroovelRolePermissionsFormController', 'validateForm', 'op_create', '', 'Groovel', 0, 1, '2016-06-19 09:14:57', '2016-06-19 09:14:57'),
(547, 'admin/roles/permissions', 'list role permissions', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\role_permissions\\GroovelRolesPermissionsListController', 'init', 'op_read', '', 'Groovel', 0, 1, '2016-06-19 14:23:42', '2016-06-19 14:23:42'),
(548, 'admin/roles/permissions/role/edit', 'role edit', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\role_permissions\\GroovelRolePermissionsFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2016-06-19 19:55:39', '2016-06-19 19:55:39'),
(549, 'admin/role/permission/editform', 'edit role permission', '', '', 'op_create', 'cmsgroovel.pages.admin_role_permissions_form', 'Groovel', 0, 1, '2016-06-20 12:19:30', '2016-06-20 12:19:30'),
(550, 'admin/role/permission/update', 'update role permissions', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\role_permissions\\GroovelRolePermissionsFormController', 'validateForm', 'op_update', '', 'Groovel', 0, 1, '2016-06-20 13:42:33', '2016-06-20 13:42:33'),
(552, 'notauthorized', 'not authorized', '', '', 'op_read', 'cmsgroovel.pages.pagenotauthorized', 'Groovel', 0, 1, '2016-06-20 15:29:08', '2016-06-20 15:29:08'),
(555, 'admin/role/delete', 'role delete', 'Groovel\\Cmsgroovel\\Http\\Controllers\\groovel\\admin\\role_permissions\\GroovelRolePermissionsFormController', 'validateForm', 'op_delete', '', 'Groovel', 0, 1, '2016-06-23 19:58:07', '2016-06-23 19:58:07');



INSERT INTO `routes_groovel` (`id`, `uri`, `name`, `controller`, `method`, `action`, `view`, `type`, `audit_tracking_url_enable`, `activate_route`, `updated_at`, `created_at`) VALUES
(557, 'api/authenticate', 'api authentificate login', 'Groovel\\Restapi\\Http\\Controllers\\api\\auth\\AuthenticateController', 'authenticate', 'op_none', '', 'Groovel', 0, 1, '2016-06-29 19:27:18', '2016-06-29 19:27:18'),
(558, 'api/getmessages', 'get all messages for a given user', 'Groovel\\Restapi\\Http\\Controllers\\api\\messages\\MessageController', 'getMessages', 'op_none', '', 'Groovel', 0, 1, '2016-06-29 21:19:11', '2016-06-29 21:19:11'),
(559, 'api/auth/signup', 'sign up api rest', 'Groovel\\Restapi\\Http\\Controllers\\api\\auth\\AuthenticateController', 'signup', 'op_none', '', 'Groovel', 0, 1, '2016-07-02 09:37:13', '2016-07-02 09:33:32'),
(560, 'api/auth/logout', 'logout', 'Groovel\\Restapi\\Http\\Controllers\\api\\auth\\AuthenticateController', 'logout', 'op_none', '', 'Groovel', 0, 1, '2016-07-02 10:26:05', '2016-07-02 10:26:05'),
(561, 'api/token', 'get token', 'Groovel\\Restapi\\Http\\Controllers\\api\\auth\\AuthenticateController', 'getToken', 'op_none', '', 'Groovel', 0, 1, '2016-07-02 10:34:47', '2016-07-02 10:34:47'),
(562, 'api/auth/authenticated_user', 'get user authenticated user', 'Groovel\\Restapi\\Http\\Controllers\\api\\auth\\AuthenticateController', 'authenticatedUser', 'op_none', '', 'Groovel', 0, 1, '2016-07-02 11:00:46', '2016-07-02 11:00:46'),
(563, 'api/sendmessage', 'send message', 'Groovel\\Restapi\\Http\\Controllers\\api\\messages\\MessageController', 'sendMessage', 'op_none', '', 'Groovel', 0, 1, '2016-07-02 11:11:35', '2016-07-02 11:11:35');




-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Structure de la table `system_configuration`
--

CREATE TABLE IF NOT EXISTS `system_configuration` (
  `id` int(11) NOT NULL,
  `enable_user_tracking` tinyint(1) NOT NULL,
  `enable_map_location` tinyint(1) NOT NULL,
  `enable_elasticsearch` tinyint(1) NOT NULL,
  `enable_maintenance` tinyint(1) NOT NULL,
  `enable_email` tinyint(1) NOT NULL,
  `enable_user_activation` tinyint(1) NOT NULL,
  `maxNumberContents` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `system_configuration`
--

INSERT INTO `system_configuration` (`id`, `enable_user_tracking`, `enable_map_location`, `enable_elasticsearch`, `enable_maintenance`, `enable_email`, `enable_user_activation`, `maxNumberContents`) VALUES
(0, 0, 0, 0, 0, 0, 1, 100);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activate` tinyint(1) NOT NULL,
  `lastTimeSeen` datetime NOT NULL,
  `notification_email_enable` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo_unique` (`pseudo`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=83 ;

--
-- Contenu de la table `users`
--


-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `roleid` int(10) unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Contenu de la table `user_roles`
--



-- --------------------------------------------------------

--
-- Structure de la table `user_tracking`
--

CREATE TABLE IF NOT EXISTS `user_tracking` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `ref` varchar(250) NOT NULL DEFAULT '',
  `agent` varchar(250) NOT NULL DEFAULT '',
  `addr_type` enum('ipv4','ipv6') NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `hostname` varchar(20) NOT NULL DEFAULT '',
  `count` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=740 ;

-- --------------------------------------------------------

--
-- Structure de la table `widgets`
--

CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Contenu de la table `widgets`
--

INSERT INTO `widgets` (`id`, `name`, `updated_at`, `created_at`) VALUES
(11, 'tinymce', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'file', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
