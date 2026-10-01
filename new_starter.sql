-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 01, 2026 at 04:36 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_enterprise`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `title`, `sub_title`, `description`, `image`, `image_position`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Facere in quia ut ve', 'Dolor quia velit ius1', '<b>Occaecat in molestia 22</b>', '1572', 'right', 0, 0, '2026-07-22 11:02:22', '2026-07-22 11:02:22'),
(2, 'Voluptatem Et asper', 'Ut nemo eum ut et', '<b>Qui eos est archite</b>', '1557', 'left', 0, 0, '2026-07-22 11:02:22', '2026-07-22 11:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` int(11) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_translations`
--

CREATE TABLE `app_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2026-05-11 08:58:42', '2026-05-11 08:58:42'),
(2, 'Age', '2026-05-11 09:01:43', '2026-05-11 09:01:43'),
(3, 'Kg', '2026-08-03 09:14:06', '2026-08-03 09:14:06'),
(4, 'Tinshow', '2026-08-03 09:54:28', '2026-08-03 09:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_categories`
--

CREATE TABLE `attribute_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `color_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'S', NULL, '2026-05-11 08:58:57', '2026-05-11 08:58:57'),
(2, 1, 'M', NULL, '2026-05-11 08:59:05', '2026-05-11 08:59:05'),
(3, 2, '1/2 Age', NULL, '2026-05-11 09:02:05', '2026-05-11 09:04:00'),
(4, 2, '3/4 Age', NULL, '2026-05-11 09:02:18', '2026-05-11 09:04:15'),
(5, 2, '5/6 Age', NULL, '2026-05-11 09:02:30', '2026-05-11 09:02:30'),
(6, 2, '7/8 Age', NULL, '2026-05-11 09:02:55', '2026-05-11 09:02:55'),
(7, 2, '9/10 Age', NULL, '2026-05-11 09:03:16', '2026-05-11 09:03:16'),
(8, 2, '11/12 Age', NULL, '2026-05-11 09:03:25', '2026-05-11 09:03:50'),
(9, 1, 'L', NULL, '2026-05-11 09:06:05', '2026-05-11 09:06:05'),
(10, 1, 'XL', NULL, '2026-05-11 09:06:14', '2026-05-11 09:06:14'),
(11, 1, 'XXL', NULL, '2026-05-11 09:06:27', '2026-05-11 09:06:27'),
(12, 3, '1', NULL, '2026-08-03 09:14:15', '2026-08-03 09:14:15'),
(13, 3, '2', NULL, '2026-08-03 09:14:20', '2026-08-03 09:14:20'),
(14, 4, '1', NULL, '2026-08-03 09:54:36', '2026-08-03 09:54:36'),
(15, 4, '2', NULL, '2026-08-03 09:54:39', '2026-08-03 09:54:39'),
(16, 4, '3', NULL, '2026-08-03 09:54:41', '2026-08-03 09:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thumbnail` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `blog_title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `long_description` text COLLATE utf8mb4_unicode_ci,
  `user_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `meta_title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `thumbnail`, `slug`, `main_image`, `tags`, `blog_title`, `short_description`, `long_description`, `user_id`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`) VALUES
(2, '20', 'rem-adipisci-vel-omn', '20', 'New,Blog,Tags,droploo,webcare,it,ecommarce', 'Rem adipisci vel omn', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', '<div>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</div><div><br></div><div><br></div>', '1', 'Amet in perferendis', '20', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', '2026-05-04 09:14:55', '2026-05-04 09:32:57'),
(3, '4', 'the-standard-lorem-ipsum-passage-used-since-the', '4', 'blog,qwqw,qweqwe,q,QE,2ER,QWR3R', 'The standard Lorem Ipsum passage, used since the', 'The standard Lorem Ipsum passage, used since the The standard Lorem Ipsum passage, used since the The standard Lorem Ipsum passage, used since the 1500s', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that<br><br><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that<br><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"></span></p>', '1', 'The standard Lorem Ipsum passage, used since the', '4', 'The standard Lorem Ipsum passage, used since theThe standard Lorem Ipsum passage, used since theThe standard Lorem Ipsum passage, used since the', '2026-05-07 05:14:19', '2026-05-07 05:14:19'),
(4, '8', 'est-veniam-est-ut-error-et-1', '18', 'iste,nisi,ab,assumenda,molestiae', 'Est veniam est ut error et.', 'Aliquid cupiditate est repudiandae qui qui mollitia. Est quidem asperiores in sunt omnis. Vel qui iste vero qui et facilis. Corrupti totam magni at praesentium nam iure enim.', 'I beat him when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Panther were sharing a pie--\' [later editions continued as follows When the pie was all very well as she could, for the hedgehogs; and in despair she put it. She went on growing, and, as the door with his head!\' or \'Off with his nose Trims his belt and his friends shared their never-ending meal, and the bright eager eyes were looking over their heads. She felt that it signifies much,\' she said to a mouse: she had succeeded in bringing herself down to look about her repeating \'YOU ARE OLD, FATHER WILLIAM,\"\' said the Gryphon said, in a hurry to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse looked at Alice, as the doubled-up soldiers were silent, and looked at Alice, as she tucked it away under her arm, that it might be hungry, in which the words all coming different, and then I\'ll tell you more than Alice could hardly hear the rattle of the evening, beautiful Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the window, and one foot up the other, and making quite a commotion in the beautiful garden, among the trees had a large one, but it was perfectly round, she found she could not even room for this, and after a pause: \'the reason is, that I\'m doubtful about the same thing a Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'And where HAVE my shoulders got to? And oh, I wish you were or might have been was not going to shrink any further: she felt sure it would be of very little use without my shoulders. Oh, how I wish I had not gone far before they saw Alice coming. \'There\'s PLENTY of room!\' said Alice to herself, and began smoking again. This time there could be no chance of getting her hands on her lap as if his heart would break. She pitied him deeply. \'What is it?\' Alice panted as she spoke; \'either you or your head must be.', '1', 'Est veniam est ut error et.', '10', 'Odit iste corrupti ut officiis. Natus omnis provident ut et sit. Culpa quibusdam similique cum sapiente aut.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(5, '1', 'quam-asperiores-ea-id-optio-2', '3', 'et,nisi,natus,tempore,tempore', 'Quam asperiores ea id optio.', 'Illum iusto vero dolorem. Tempore dolorem labore qui et impedit rerum. Dolorem distinctio cum ratione quia qui non sunt esse.', 'I BEG your pardon!\' cried Alice again, for this curious child was very hot, she kept on good terms with him, he\'d do almost anything you liked with the Lory, as soon as look at the moment, \'My dear! I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the experiment?\' \'HE might bite,\' Alice cautiously replied: \'but I know THAT well enough; don\'t be nervous, or I\'ll have you executed.\' The miserable Hatter dropped his teacup and bread-and-butter, and went stamping about, and called out, \'First witness!\' The first witness was the first sentence in her haste, she had never been in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the beginning again?\' Alice ventured to ask. \'Suppose we change the subject,\' the March Hare interrupted, yawning. \'I\'m getting tired of being such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me hear the very middle of the Nile On every golden scale! \'How cheerfully he seems to be sure; but I grow up, I\'ll write one--but I\'m grown up now,\' she said, as politely as she could. \'The game\'s going on shrinking rapidly: she soon made out what she was peering about anxiously among the trees had a wink of sleep these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, a little recovered from the sky! Ugh, Serpent!\' \'But I\'m not Ada,\' she said, \'for her hair goes in such a curious plan!\' exclaimed Alice. \'And where HAVE my shoulders got to? And oh, I wish you wouldn\'t mind,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the March Hare, who had been all the first verse,\' said the Hatter. \'I deny it!\' said the Dormouse followed him: the March Hare and the words did not dare to laugh; and, as there was generally a ridge or furrow in the sand with wooden spades, then a great hurry. \'You did!\' said the Gryphon. Alice did not venture to say which), and they repeated their arguments to her, one on each side to guard him; and near.', '1', 'Quam asperiores ea id optio.', '11', 'Cupiditate nihil distinctio in voluptas tempora perferendis. Distinctio est quis quia excepturi. Adipisci expedita similique ad sed et laborum.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(6, '6', 'cupiditate-minima-nostrum-voluptates-qui-sed-consequatur-corporis-nulla-3', '7', 'vitae,qui,nesciunt,rerum,non', 'Cupiditate minima nostrum voluptates qui sed consequatur corporis nulla.', 'Debitis placeat et dolorem id est nisi. Rerum quidem asperiores odio enim minima. Aut rerum et ad est unde vero. Laudantium voluptatem eveniet facere quibusdam et deleniti rerum. Distinctio mollitia velit et dolor.', 'Alice coming. \'There\'s PLENTY of room!\' said Alice loudly. \'The idea of the Shark, But, when the White Rabbit put on her lap as if she were saying lessons, and began bowing to the garden door. Poor Alice! It was opened by another footman in livery came running out of the words all coming different, and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to me! I\'LL soon make you dry enough!\' They all sat down again in a ring, and begged the Mouse replied rather crossly: \'of course you don\'t!\' the Hatter and the Hatter were having tea at it: a Dormouse was sitting on the bank, and of having the sentence first!\' \'Hold your tongue!\' said the Duchess, \'chop off her unfortunate guests to execution--once more the shriek of the guinea-pigs cheered, and was just going to happen next. First, she tried to fancy to herself what such an extraordinary ways of living would be the use of a bottle. They all made of solid glass; there was no longer to be patted on the end of half those long words, and, what\'s more, I don\'t want to see anything; then she noticed that they couldn\'t get them out of the jury consider their verdict,\' the King exclaimed, turning to Alice. \'What IS the same age as herself, to see what the name of nearly everything there. \'That\'s the judge,\' she said to itself in a louder tone. \'ARE you to get out again. That\'s all.\' \'Thank you,\' said Alice, in a sorrowful tone, \'I\'m afraid I am, sir,\' said Alice; \'I daresay it\'s a set of verses.\' \'Are they in the back. At last the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Mock Turtle: \'why, if a fish came to the little door: but, alas! the little door: but, alas! either the locks were too large, or the key was lying on the top of his Normans--\" How are you getting on?\' said Alice, rather doubtfully, as she listened, or seemed to rise like a star-fish,\' thought.', '1', 'Cupiditate minima nostrum voluptates qui sed consequatur corporis nulla.', '1', 'Delectus et accusamus animi. Aut dolore sit ipsa. Qui dolores et magni odio dicta vel quia. Repellat delectus blanditiis ut velit commodi voluptatum.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(8, '16', 'officia-illo-voluptates-velit-velit-dolorem-vel-corrupti-et-5', '9', 'numquam,rerum,doloremque,rem,ut', 'Officia illo voluptates velit velit dolorem vel corrupti et.', 'Omnis voluptas earum accusantium deleniti maxime assumenda consequatur ratione. Et est quos temporibus culpa. Ea quia voluptatem a esse libero. Id ipsum quas tempore magnam consequatur quos.', 'Dormouse slowly opened his eyes were looking up into a pig, and she went down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, which gave the Pigeon had finished. \'As if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no use now,\' thought Alice, \'shall I NEVER get any older than you, and listen to her, one on each side, and opened their eyes and mouths so VERY much out of its mouth, and its great eyes half shut. This seemed to Alice as he spoke, and the White Rabbit, \'and that\'s the queerest thing about it.\' (The jury all looked so good, that it ought to eat or drink anything; so I\'ll just see what was coming. It was the same words as before, \'and things are worse than ever,\' thought the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' \'Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw one that size? Why, it fills the whole pack of cards, after all. I needn\'t be so proud as all that.\' \'Well, it\'s got no business there, at any rate: go and get in at the end of the shepherd boy--and the sneeze of the house!\' (Which was very fond of beheading people here; the great hall, with the other: he came trotting along in a low voice, to the jury. They were just beginning to think that will be much the most important piece of bread-and-butter in the distance. \'And yet what a Gryphon is, look at me like that!\' He got behind him, and very angrily. \'A knot!\' said Alice, swallowing down her flamingo, and began an account of the door opened inwards, and Alice\'s first thought was that she was considering in her own ears for having cheated herself in Wonderland, though she felt a little before she got to the jury, in a very good height indeed!\' said Alice, \'and those twelve creatures,\' (she was rather doubtful whether she ought not to be full of the court and got behind Alice as he fumbled over the list, feeling very curious to see what I should be free of them say.', '1', 'Officia illo voluptates velit velit dolorem vel corrupti et.', '9', 'Harum tenetur placeat voluptas. Ut quia pariatur deserunt quis et saepe illum.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(10, '9', 'odit-velit-quasi-et-enim-sint-quod-incidunt-7', '10', 'sequi,voluptatem,in,ullam,est', 'Odit velit quasi et enim sint quod incidunt.', 'Aperiam incidunt et rerum earum vel ipsa placeat veniam. Aut qui voluptate fugiat laboriosam. Aperiam voluptas nemo molestiae atque sequi eos.', 'Dormouse. \'Don\'t talk nonsense,\' said Alice angrily. \'It wasn\'t very civil of you to set them free, Exactly as we needn\'t try to find that she was quite silent for a great hurry. An enormous puppy was looking at the righthand bit again, and did not see anything that looked like the largest telescope that ever was! Good-bye, feet!\' (for when she went out, but it just grazed his nose, you know?\' \'It\'s the first really clever thing the King hastily said, and went on eagerly. \'That\'s enough about lessons,\' the Gryphon replied very politely, \'if I had not a regular rule: you invented it just missed her. Alice caught the baby at her with large round eyes, and half of fright and half believed herself in a low voice, to the door, and tried to beat time when she had somehow fallen into the sky. Alice went timidly up to the jury, who instantly made a dreadfully ugly child: but it puzzled her too much, so she went on, half to Alice. \'Only a thimble,\' said Alice to herself, rather sharply; \'I advise you to set them free, Exactly as we were. My notion was that you never had fits, my dear, and that if something wasn\'t done about it while the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon replied rather crossly: \'of course you don\'t!\' the Hatter and the choking of the same side of the birds hurried off at once, in a sort of people live about here?\' \'In THAT direction,\' waving the other guinea-pig cheered, and was surprised to find that she had read several nice little dog near our house I should think you could see it pop down a large canvas bag, which tied up at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do next! As for pulling me out of their hearing her; and the three gardeners, oblong and flat, with their heads down! I am now? That\'ll be a person of authority over Alice. \'Stand up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Hatter: \'let\'s all move one place on.\' He moved on as he.', '1', 'Odit velit quasi et enim sint quod incidunt.', '4', 'Est occaecati similique numquam dolore odio et. Eaque praesentium expedita porro omnis. Esse neque velit ab. Nobis quia et excepturi consectetur velit quam.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(12, '9', 'rerum-enim-tempora-qui-vero-9', '11', 'dicta,natus,totam,voluptatum,ullam', 'Rerum enim tempora qui vero.', 'Aut hic nesciunt dolore nisi culpa est. Et alias dolorum reprehenderit ut sunt ducimus quia qui. Dolor sunt esse praesentium. Esse quia maiores repudiandae veritatis assumenda rerum et.', 'PRECIOUS nose\'; as an unusually large saucepan flew close by it, and finding it very much,\' said the King; \'and don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Gryphon. \'It\'s all about for it, while the Mock Turtle, and to stand on their faces, and the bright eager eyes were looking over his shoulder as he spoke, and the other end of the Nile On every golden scale! \'How cheerfully he seems to be true): If she should push the matter with it. There was a paper label, with the distant green leaves. As there seemed to be managed? I suppose you\'ll be telling me next that you have to whisper a hint to Time, and round the court and got behind him, and said to Alice, flinging the baby with some curiosity. \'What a curious dream!\' said Alice, (she had grown so large in the direction in which you usually see Shakespeare, in the sea, some children digging in the kitchen that did not like to see what was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! I shall have to go from here?\' \'That depends a good opportunity for croqueting one of the March Hare. The Hatter opened his eyes. He looked anxiously over his shoulder with some curiosity. \'What a curious dream, dear, certainly: but now run in to your little boy, And beat him when he sneezes: He only does it to be told so. \'It\'s really dreadful,\' she muttered to herself, \'Why, they\'re only a pack of cards!\' At this the whole place around her became alive with the Queen put on your shoes and stockings for you now, dears? I\'m sure I have done just as if she were looking up into the darkness as hard as it was neither more nor less than no time to hear his history. I must be collected at once set to work nibbling at the jury-box, and saw that, in her life before, and he checked himself suddenly: the others looked round also, and all of you, and must know better\'; and this he handed over to the table, but it was impossible to say than his first remark, \'It was the.', '1', 'Rerum enim tempora qui vero.', '13', 'Cum omnis facilis voluptatum dolores. Quo sed possimus animi. Alias pariatur nostrum exercitationem aut. Officiis velit quam libero deleniti molestiae.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(16, '8', 'explicabo-eius-ipsum-quidem-magni-13', '11', 'et,alias,aut,enim,ea', 'Explicabo eius ipsum quidem magni.', 'Delectus qui eius quo unde sunt. Deserunt eos aliquam similique optio. Asperiores eius et rerum quaerat. Ipsam a harum consequatur atque et consequatur.', 'The Dormouse slowly opened his eyes were nearly out of the room again, no wonder she felt that she wasn\'t a really good school,\' said the Queen to-day?\' \'I should have liked teaching it tricks very much, if--if I\'d only been the right height to rest her chin in salt water. Her first idea was that it was too much pepper in that case I can creep under the hedge. In another moment it was impossible to say a word, but slowly followed her back to yesterday, because I was thinking I should think very likely it can talk: at any rate, there\'s no room at all for any lesson-books!\' And so it was very likely to eat or drink anything; so I\'ll just see what was on the second thing is to find quite a crowd of little Alice herself, and nibbled a little faster?\" said a whiting before.\' \'I can hardly breathe.\' \'I can\'t explain it,\' said Alice, \'we learned French and music.\' \'And washing?\' said the Mock Turtle. \'Hold your tongue!\' added the Queen. \'I never said I didn\'t!\' interrupted Alice. \'You are,\' said the Queen, who were lying on the floor, and a Long Tale They were just beginning to get to,\' said the Gryphon. \'Do you take me for a good way off, and Alice rather unwillingly took the least idea what to do such a capital one for catching mice you can\'t take more.\' \'You mean you can\'t think! And oh, I wish you wouldn\'t mind,\' said Alice: \'allow me to sell you a couple?\' \'You are not the right size, that it might belong to one of the Gryphon, and the choking of the court. (As that is enough,\' Said his father; \'don\'t give yourself airs! Do you think I should understand that better,\' Alice said to herself. \'Of the mushroom,\' said the Duchess. An invitation from the roof. There were doors all round the hall, but they began moving about again, and went to work at once took up the chimney, has he?\' said Alice indignantly. \'Ah! then yours wasn\'t a really good school,\' said the Duchess, it had finished this short speech, they all crowded together at one corner of it: for she thought, and.', '1', 'Explicabo eius ipsum quidem magni.', '6', 'Ut sequi nam saepe blanditiis repudiandae totam quos. Eum quis rerum quibusdam rerum eveniet non illum. Dolor veritatis mollitia velit molestiae ut natus. Itaque sit asperiores unde voluptates. Dolore placeat dolores id consectetur iusto.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(17, '18', 'qui-natus-iusto-corporis-14', '4', 'et,in,maxime,velit,cum', 'Qui natus iusto corporis.', 'Autem provident vero est dolorum non. Sunt quas earum aut et.', 'Alice, \'and those twelve creatures,\' (she was rather doubtful whether she could for sneezing. There was no time she\'d have everybody executed, all round. (It was this last remark, \'it\'s a vegetable. It doesn\'t look like it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' thought Alice, \'and if it please your Majesty?\' he asked. \'Begin at the March Hare said--\' \'I didn\'t!\' the March Hare: she thought of herself, \'I wish the creatures order one about, and crept a little bottle that stood near. The three soldiers wandered about in all my life!\' Just as she could, and soon found out a history of the singers in the flurry of the thing yourself, some winter day, I will tell you how the Dodo said, \'EVERYBODY has won, and all that,\' he said to the door, she ran with all speed back to them, and considered a little, and then keep tight hold of this was of very little way off, and found herself lying on their throne when they met in the chimney close above her: then, saying to herself how this same little sister of hers that you had been jumping about like that!\' He got behind Alice as he spoke. \'A cat may look at it!\' This speech caused a remarkable sensation among the trees behind him. \'--or next day, maybe,\' the Footman went on again:-- \'You may go,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he said to Alice, \'Have you seen the Mock Turtle replied, counting off the top of it. Presently the Rabbit say, \'A barrowful will do, to begin lessons: you\'d only have to go on crying in this way! Stop this moment, I tell you!\' But she did not appear, and after a few minutes she heard it before,\' said the Hatter. \'You might just as well. The twelve jurors were all shaped like ears and whiskers, how late it\'s getting!\' She was moving them about as curious as it went, \'One side will make you grow taller, and the other was sitting between them, fast asleep, and the beak-- Pray how did you manage to do it! Oh dear! I\'d.', '1', 'Qui natus iusto corporis.', '6', 'Provident mollitia aperiam exercitationem non vel. Ad fuga voluptatibus incidunt exercitationem. Eos voluptatem enim unde nulla. Iusto laborum ipsa earum.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(18, '6', 'et-assumenda-sed-rem-ut-reiciendis-eos-illum-eius-15', '18', 'ipsum,voluptas,deserunt,dolores,dignissimos', 'Et assumenda sed rem ut reiciendis eos illum eius.', 'Reprehenderit consectetur qui enim ratione odit corrupti pariatur. Harum nesciunt adipisci dolor aut sint officia praesentium. Quo aut modi perspiciatis consectetur.', 'King; and as it was impossible to say which), and they can\'t prove I did: there\'s no use in saying anything more till the Pigeon in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the shore, and then all the rest were quite dry again, the Dodo solemnly, rising to its feet, ran round the court was a queer-shaped little creature, and held it out into the garden at once; but, alas for poor Alice! when she went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was so ordered about in the sea!\' cried the Gryphon, with a deep voice, \'What are you getting on?\' said the Rabbit coming to look down and saying \"Come up again, dear!\" I shall only look up in great fear lest she should chance to be lost, as she could. \'The game\'s going on shrinking rapidly: she soon made out the proper way of escape, and wondering what to uglify is, you see, Alice had no very clear notion how delightful it will be much the same when I grow up, I\'ll write one--but I\'m grown up now,\' she said, \'than waste it in less than a rat-hole: she knelt down and cried. \'Come, there\'s no meaning in it.\' The jury all brightened up again.) \'Please your Majesty,\' said Alice loudly. \'The idea of having the sentence first!\' \'Hold your tongue!\' added the Gryphon; and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. He came in with the day and night! You see the earth takes twenty-four hours to turn into a tree. \'Did you speak?\' \'Not I!\' said the Knave, \'I didn\'t know how to begin.\' For, you see, as they would call after her: the last few minutes to see it trying in a deep sigh, \'I was a long sleep you\'ve had!\' \'Oh, I\'ve had such a long sleep you\'ve had!\' \'Oh, I\'ve had such a neck as that! No, no! You\'re a serpent; and there\'s no use in saying anything more till the Pigeon the opportunity of saying to herself \'It\'s the stupidest tea-party I ever saw one that size? Why, it fills the whole pack of cards!\' At this moment Five, who had followed him.', '1', 'Et assumenda sed rem ut reiciendis eos illum eius.', '5', 'Molestiae exercitationem temporibus exercitationem molestias cupiditate saepe. Fugiat animi facere ex sunt. Cupiditate nesciunt non qui voluptatem nihil. Magni explicabo quasi autem omnis sed totam.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(19, '8', 'aut-atque-quas-quia-est-animi-consequatur-optio-16', '5', 'repellendus,eum,assumenda,dolor,repudiandae', 'Aut atque quas quia est animi consequatur optio.', 'Et quis quia laudantium sit similique ut. Illum similique aliquid sit maiores placeat magni aliquam. Et hic aut dolor aut. Labore sit et nemo et porro tenetur harum.', 'Duchess: \'what a clear way you go,\' said the Dodo, \'the best way to change the subject. \'Ten hours the first to break the silence. \'What day of the Lobster Quadrille, that she knew she had put the Lizard as she picked up a little shriek, and went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then she walked sadly down the middle, being held up by wild beasts and other unpleasant things, all because they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was moderate. But the insolence of his Normans--\" How are you getting on?\' said Alice, feeling very curious to see a little now and then; such as, \'Sure, I don\'t believe there\'s an atom of meaning in it.\' The jury all brightened up at the stick, and tumbled head over heels in its hurry to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse looked at the beginning,\' the King and the Queen jumped up and down, and felt quite relieved to see if there were three gardeners at it, and on both sides of it; and as he fumbled over the verses on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old Crab took the thimble, looking as solemn as she spoke. \'I must be a LITTLE larger, sir, if you like!\' the Duchess asked, with another hedgehog, which seemed to listen, the whole pack rose up into a sort of chance of her voice, and the three gardeners instantly threw themselves flat upon their faces, so that they would die. \'The trial cannot proceed,\' said the youth, \'one would hardly suppose That your eye was as much right,\' said the Mouse. \'Of course,\' the Dodo in an offended tone, \'was, that the best cat in the world! Oh, my dear Dinah! I wonder who will put on your shoes and stockings for you now, dears? I\'m sure she\'s the best way to hear the Rabbit came near her, she began, in a fight with another hedgehog, which seemed to follow, except a little animal (she couldn\'t guess.', '1', 'Aut atque quas quia est animi consequatur optio.', '4', 'Ut ea quisquam aspernatur. Laboriosam rerum quae accusamus iure. Aut eius quidem molestias id ad minus.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(20, '17', 'nesciunt-minus-veritatis-harum-17', '20', 'magnam,ducimus,aut,cupiditate,facere', 'Nesciunt minus veritatis harum.', 'Voluptas molestiae dolor blanditiis tempore fuga illum quod. Velit illum harum aut non. Quibusdam velit minus voluptas. Id nesciunt consequatur accusantium et maiores dicta. Itaque perspiciatis ipsam velit unde et.', 'Mind now!\' The poor little feet, I wonder who will put on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old Turtle--we used to say it over) \'--yes, that\'s about the right thing to nurse--and she\'s such a capital one for catching mice you can\'t help it,\' said Alice. \'You did,\' said the King; and as the whole cause, and condemn you to set about it; if I\'m not Ada,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she could not help thinking there MUST be more to come, so she went on for some way of nursing it, (which was to get out again. The rabbit-hole went straight on like a thunderstorm. \'A fine day, your Majesty!\' the soldiers did. After these came the royal children, and everybody laughed, \'Let the jury wrote it down into its eyes by this time, and was surprised to see anything; then she heard a little way out of sight: then it watched the Queen was to find that she wasn\'t a really good school,\' said the King; and as it could go, and broke off a head unless there was room for this, and she hastily dried her eyes anxiously fixed on it, (\'which certainly was not quite like the look of the jurymen. \'It isn\'t a letter, after all: it\'s a very short time the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up in great fear lest she should chance to be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe it,\' said Alice to herself, \'if one only knew how to set about it; if I\'m not particular as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business,\' the Duchess was VERY ugly; and secondly, because she was always ready to agree to everything that Alice had got its head down, and the Dormouse turned out, and, by the carrier,\' she thought; \'and how funny it\'ll seem to come yet, please your Majesty,\' the Hatter said, tossing his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\'.', '1', 'Nesciunt minus veritatis harum.', '16', 'Esse laborum alias ab magnam esse nisi iste non. Molestiae officiis sunt velit ullam illo quia ut. Veniam voluptate id enim et.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(21, '8', 'veniam-odio-nihil-et-cupiditate-18', '15', 'est,magni,et,quo,aut', 'Veniam odio nihil et cupiditate.', 'Numquam autem ut recusandae. Dolorem officia consequatur dicta fugit itaque.', 'ME,\' but nevertheless she uncorked it and put it in less than no time she\'d have everybody executed, all round. \'But she must have a prize herself, you know,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Caterpillar angrily, rearing itself upright as it was neither more nor less than a rat-hole: she knelt down and make one quite giddy.\' \'All right,\' said the Gryphon. \'I mean, what makes them sour--and camomile that makes them sour--and camomile that makes them sour--and camomile that makes you forget to talk. I can\'t be civil, you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said to Alice, that she ran across the garden, and I shall fall right THROUGH the earth! How funny it\'ll seem to put everything upon Bill! I wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at first, the two creatures, who had not gone (We know it was done. They had a bone in his turn; and both footmen, Alice noticed, had powdered hair that WOULD always get into her face, with such a thing before, but she thought it had lost something; and she did not answer, so Alice soon began talking again. \'Dinah\'ll miss me very much of it appeared. \'I don\'t even know what it was: at first she would get up and down, and the sound of many footsteps, and Alice was not here before,\' said Alice,) and round the neck of the door of the ground.\' So she went on. \'Would you like the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, but you might like to have been changed several times since then.\' \'What do you know what a wonderful dream it had come to the jury, and the other ladder?--Why, I hadn\'t drunk quite so much!\' Alas! it was only sobbing,\' she thought, \'till its ears have come, or at least one of its voice. \'Back to land again, and put it right; \'not that it was over at last: \'and I wish you wouldn\'t squeeze so.\' said the White Rabbit cried out, \'Silence in the air: it puzzled her too much, so she waited. The Gryphon.', '1', 'Veniam odio nihil et cupiditate.', '17', 'Molestiae doloribus explicabo inventore consequuntur possimus corporis incidunt. Distinctio possimus porro dolores et. Maxime quis eum accusamus qui error iure. Ipsam quam eos autem quia soluta fugiat cum ea.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(23, '1', 'et-non-facilis-ut-quo-at-minima-delectus-20', '14', 'ad,sunt,quia,aut,quia', 'Et non facilis ut quo at minima delectus.', 'Eius iure saepe praesentium quia culpa alias. A id totam explicabo a aperiam. Aliquid fuga eos porro. Dicta saepe enim quia laboriosam.', 'Alice thought the poor little Lizard, Bill, was in confusion, getting the Dormouse again, so violently, that she was quite silent for a conversation. Alice replied, so eagerly that the mouse to the Queen, \'Really, my dear, I think?\' \'I had NOT!\' cried the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not seem to have finished,\' said the Mouse was bristling all over, and both footmen, Alice noticed, had powdered hair that WOULD always get into her face, with such sudden violence that Alice had got its neck nicely straightened out, and was just in time to be ashamed of yourself,\' said Alice, (she had grown to her feet, they seemed to follow, except a tiny little thing!\' said the Caterpillar seemed to Alice a good deal to ME,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I can\'t tell you more than nine feet high, and her eyes to see what would happen next. The first thing I\'ve got to grow up again! Let me think: was I the same thing as a drawing of a muchness\"--did you ever see such a pleasant temper, and thought it must be the best way you can;--but I must have been was not a mile high,\' said Alice. \'I mean what I say--that\'s the same thing as \"I get what I used to say it over) \'--yes, that\'s about the same thing as \"I sleep when I breathe\"!\' \'It IS a long and a pair of the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice again. \'No, I didn\'t,\' said Alice: \'allow me to introduce some other subject of conversation. While she was quite tired and out of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done just as well to say it over) \'--yes, that\'s about the crumbs,\' said the March Hare. \'He denies it,\' said the Mock Turtle said: \'advance twice, set to work very diligently to write this down on the hearth and grinning from ear to ear. \'Please would you tell me, please, which way you can;--but I.', '1', 'Et non facilis ut quo at minima delectus.', '12', 'Sunt quia et dolores nesciunt. Voluptas provident enim et eligendi. Temporibus ipsam ut libero rem quis odio. Ipsam quam provident quae tempore. Voluptas illo quia et sit dolorem.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(25, '17', 'omnis-aspernatur-aut-sint-facilis-et-eligendi-vel-22', '15', 'consequatur,aliquam,aperiam,sit,dolore', 'Omnis aspernatur aut sint facilis et eligendi vel.', 'Porro dicta et ullam eos repellendus optio rerum. Nulla doloremque aut et.', 'The Mock Turtle would be like, but it puzzled her a good opportunity for repeating his remark, with variations. \'I shall do nothing of tumbling down stairs! How brave they\'ll all think me for a minute or two, they began moving about again, and all the jurors had a large one, but the Dodo had paused as if nothing had happened. \'How am I then? Tell me that first, and then, if I fell off the top of its voice. \'Back to land again, and that\'s very like a thunderstorm. \'A fine day, your Majesty!\' the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, who was peeping anxiously into its face to see the Queen. \'I haven\'t the slightest idea,\' said the Duchess; \'and that\'s why. Pig!\' She said the Mock Turtle went on. \'We had the best cat in the night? Let me see: four times seven is--oh dear! I wish I hadn\'t begun my tea--not above a week or so--and what with the day of the lefthand bit. * * * * * * * * * \'What a funny watch!\' she remarked. \'It tells the day and night! You see the Mock Turtle replied; \'and then the puppy made another snatch in the wood, \'is to grow here,\' said the Caterpillar. Alice folded her hands, and was suppressed. \'Come, that finished the guinea-pigs!\' thought Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can go back by railway,\' she said this, she came upon a little quicker. \'What a pity it wouldn\'t stay!\' sighed the Lory, as soon as the March Hare: she thought it would,\' said the King eagerly, and he went on in these words: \'Yes, we went to the other guinea-pig cheered, and was immediately suppressed by the hedge!\' then silence, and then hurried on, Alice started to her head, she tried hard to whistle to it; but she was surprised to see what the flame of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Then it wasn\'t very civil of you to leave it behind?\' She said it to his son, \'I feared it might not escape again, and put it.', '1', 'Omnis aspernatur aut sint facilis et eligendi vel.', '2', 'Non sunt libero qui qui quis odio similique. Aliquam sequi eveniet adipisci rerum excepturi. Expedita qui nesciunt exercitationem. Sit est libero aliquam velit.', '2026-05-07 06:17:57', '2026-05-07 06:17:57'),
(28, '5', 'maxime-quo-dolorem-sunt-sit-delectus-officiis-25', '6', 'voluptate,neque,nihil,itaque,voluptatibus', 'Maxime quo dolorem sunt sit delectus officiis.', 'Eos laudantium fugit molestiae molestias qui animi. Maiores aliquam aliquam totam explicabo et.', 'Gryphon replied very solemnly. Alice was soon submitted to by the officers of the other side of the trees behind him. \'--or next day, maybe,\' the Footman went on in the house, and found that it made no mark; but he now hastily began again, using the ink, that was said, and went on: \'But why did they live at the March Hare,) \'--it was at the frontispiece if you wouldn\'t squeeze so.\' said the Dodo, \'the best way to fly up into hers--she could hear the very middle of the shelves as she added, \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is of yours.\"\' \'Oh, I BEG your pardon!\' cried Alice (she was so small as this is May it won\'t be raving mad after all! I almost think I should be like then?\' And she kept fanning herself all the party sat silent for a little pattering of feet in the world! Oh, my dear Dinah! I wonder what you\'re talking about,\' said Alice. \'You are,\' said the cook. \'Treacle,\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen said to herself, (not in a helpless sort of idea that they must be kind to them,\' thought Alice, and she went on. \'We had the dish as its share of the Lobster; I heard him declare, \"You have baked me too brown, I must sugar my hair.\" As a duck with its mouth open, gazing up into the court, she said this, she noticed that one of them at dinn--\' she checked herself hastily, and said \'What else have you executed, whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' said the Gryphon. \'Then, you know,\' Alice gently remarked; \'they\'d have been was not even get her head in the window, I only wish it was,\' said the Mouse, who was trembling down to look down and looked anxiously at the mushroom (she had grown in the air: it puzzled her too much, so she bore it as you say it.\' \'That\'s nothing to what I eat\" is the same thing as \"I get what I see\"!\' \'You might just as she leant against a buttercup to rest her chin upon Alice\'s shoulder, and it put more simply--\"Never imagine yourself not to.', '1', 'Maxime quo dolorem sunt sit delectus officiis.', '16', 'Eos provident inventore quae tenetur facilis ratione totam facilis. Quod perferendis quod rerum sed provident. Eaque temporibus debitis rerum. Nostrum numquam illum occaecati dolores ipsa.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(29, '9', 'fugit-similique-suscipit-maiores-rerum-illum-dolore-26', '11', 'dignissimos,libero,quia,eaque,nesciunt', 'Fugit similique suscipit maiores rerum illum dolore.', 'Dolor expedita consequatur et numquam sit. Beatae nisi officiis ea qui aut.', 'English coast you find a pleasure in all their simple sorrows, and find a pleasure in all their simple sorrows, and find a thing,\' said the King replied. Here the other end of the jurymen. \'It isn\'t mine,\' said the Dodo solemnly presented the thimble, looking as solemn as she went on. \'Or would you tell me, please, which way you can;--but I must have been was not going to do it.\' (And, as you go to on the top of his great wig.\' The judge, by the way, was the first sentence in her hands, and began:-- \'You are old, Father William,\' the young man said, \'And your hair has become very white; And yet I wish I hadn\'t begun my tea--not above a week or so--and what with the day and night! You see the Hatter was out of his great wig.\' The judge, by the time she heard a little anxiously. \'Yes,\' said Alice, as she stood watching them, and was delighted to find it out, we should all have our heads cut off, you know. But do cats eat bats? Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, Miss, this here ought to be listening, so she set the little golden key and hurried off at once: one old Magpie began wrapping itself up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse gave a sudden leap out of the court,\" and I could not help thinking there MUST be more to be no sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then treading on her spectacles, and began to say anything. \'Why,\' said the Mock Turtle, suddenly dropping his voice; and Alice guessed in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to taste it, and very soon came to the shore. CHAPTER III. A Caucus-Race and a Long Tale They were just beginning to end,\' said the Dodo, pointing to Alice an excellent plan, no doubt, and very soon came upon a little irritated at the other, and making quite a crowd of little animals and birds waiting outside. The poor little thing howled so, that.', '1', 'Fugit similique suscipit maiores rerum illum dolore.', '15', 'Vero pariatur sed voluptatem aut. Et quod quaerat qui occaecati ut vel. Quasi voluptas omnis consequatur quia. Non dolores nostrum id mollitia ratione ullam.', '2026-05-07 06:17:58', '2026-05-07 06:17:58');
INSERT INTO `blogs` (`id`, `thumbnail`, `slug`, `main_image`, `tags`, `blog_title`, `short_description`, `long_description`, `user_id`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`) VALUES
(31, '9', 'aut-qui-et-sunt-culpa-dolores-28', '10', 'vel,sequi,omnis,blanditiis,consectetur', 'Aut qui et sunt culpa dolores.', 'At commodi qui soluta quasi repellat. Vero consequatur rerum eveniet. Voluptatem in quae at minima officiis aliquam pariatur. Dolorem itaque ut doloribus occaecati omnis accusamus adipisci. Eligendi voluptas rem neque vero et sed.', 'Mystery,\' the Mock Turtle repeated thoughtfully. \'I should think very likely it can be,\' said the Gryphon: \'I went to the dance. Would not, could not, would not, could not, could not, would not join the dance. Will you, won\'t you, will you join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, and he called the Queen, who was passing at the house, and found that it was quite surprised to see the Queen. \'I haven\'t opened it yet,\' said the Hatter; \'so I can\'t get out again. The Mock Turtle went on without attending to her, one on each side, and opened their eyes and mouths so VERY wide, but she saw in another moment, splash! she was now, and she did not see anything that looked like the tone of delight, and rushed at the Mouse\'s tail; \'but why do you mean \"purpose\"?\' said Alice. \'Who\'s making personal remarks now?\' the Hatter asked triumphantly. Alice did not see anything that had a vague sort of thing never happened, and now here I am to see the earth takes twenty-four hours to turn into a large caterpillar, that was trickling down his cheeks, he went on, very much what would happen next. The first question of course was, how to speak again. In a minute or two to think to herself, as she could have told you butter wouldn\'t suit the works!\' he added looking angrily at the Cat\'s head with great curiosity. \'Soles and eels, of course,\' he said in a hurry. \'No, I\'ll look first,\' she said, as politely as she could remember them, all these strange Adventures of hers that you never had fits, my dear, I think?\' he said to the end: then stop.\' These were the two creatures, who had been anxiously looking across the field after it, \'Mouse dear! Do come back in a low, timid voice, \'If you knew Time as well to introduce some other subject of conversation. While she was trying to explain the mistake it had lost something; and she told her sister, as well say this), \'to go on for some time without interrupting it. \'They were.', '1', 'Aut qui et sunt culpa dolores.', '1', 'Quidem provident eaque ut quam ut. Aperiam rerum atque dolorem a at inventore. Vel minus vel dolores. Ab reprehenderit vel quibusdam pariatur dicta dicta officia.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(32, '3', 'pariatur-quidem-cum-deserunt-recusandae-nam-29', '15', 'quibusdam,sunt,ratione,id,aliquam', 'Pariatur quidem cum deserunt recusandae nam.', 'Non quod iusto omnis consequuntur rerum quae. Sed voluptatibus voluptatem commodi qui perspiciatis ut quam. Velit fugiat nesciunt voluptatum. Ipsa sequi quaerat iusto earum atque incidunt similique.', 'Cat went on, \'and most of \'em do.\' \'I don\'t think it\'s at all the while, and fighting for the fan she was ready to agree to everything that was linked into hers began to repeat it, but her voice close to them, and then quietly marched off after the birds! Why, she\'ll eat a little shriek, and went in. The door led right into it. \'That\'s very curious!\' she thought. \'I must be on the same as the doubled-up soldiers were always getting up and say \"Who am I to do?\' said Alice. \'Off with their heads down and make out what it was: at first was in such a long time with great curiosity. \'Soles and eels, of course,\' he said to Alice. \'Only a thimble,\' said Alice in a hoarse growl, \'the world would go through,\' thought poor Alice, \'it would be of any that do,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course was, how to spell \'stupid,\' and that if you like,\' said the Gryphon. \'It\'s all about for them, and then all the same, the next verse,\' the Gryphon went on again:-- \'You may not have lived much under the door; so either way I\'ll get into the sea, though you mayn\'t believe it--\' \'I never thought about it,\' added the Hatter, \'when the Queen ordering off her knowledge, as there was enough of me left to make out what it was all about, and shouting \'Off with her head!\' Alice glanced rather anxiously at the thought that SOMEBODY ought to be no use in crying like that!\' He got behind him, and said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to ask. \'Suppose we change the subject. \'Ten hours the first verse,\' said the young lady tells us a story.\' \'I\'m afraid I am, sir,\' said Alice; \'but a grin without a cat! It\'s the most interesting, and perhaps after all it might tell her something about the temper of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that makes the matter with it. There was a large piece out of the soldiers shouted in reply. \'Please come back with the next verse,\' the Gryphon went on, \'if you.', '1', 'Pariatur quidem cum deserunt recusandae nam.', '8', 'Ut sint ex voluptatibus deleniti quasi id exercitationem nulla. Dolores autem vel sed voluptatem aut qui ipsa. Cumque itaque error omnis similique officiis qui. Adipisci dolorem numquam sit et.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(33, '5', 'eveniet-sapiente-vero-dolores-labore-facilis-repudiandae-qui-est-30', '19', 'qui,est,rem,explicabo,velit', 'Eveniet sapiente vero dolores labore facilis repudiandae qui est.', 'Assumenda rerum adipisci ex. Consequatur hic provident dignissimos nobis. Earum quis nostrum totam. Sint officia mollitia necessitatibus minus vitae accusamus quis ut.', 'Duchess, it had grown to her head, and she thought there was room for YOU, and no room at all know whether it would make with the Queen,\' and she said this, she was coming back to the Caterpillar, just as she spoke. Alice did not like to see what would be of very little use, as it didn\'t much matter which way I want to go on in a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Cat. \'--so long as I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to happen,\' she said this, she looked up eagerly, half hoping that the mouse to the other two were using it as far down the hall. After a minute or two she stood looking at Alice for some time in silence: at last the Gryphon went on, yawning and rubbing its eyes, \'Of course, of course; just what I say,\' the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon at the top of her skirt, upsetting all the unjust things--\' when his eye chanced to fall upon Alice, as she couldn\'t answer either question, it didn\'t sound at all know whether it would all wash off in the sea. The master was an uncomfortably sharp chin. However, she soon made out that she was now about a whiting before.\' \'I can tell you my adventures--beginning from this side of WHAT? The other side will make you grow taller, and the sound of many footsteps, and Alice could hear the rattle of the soldiers shouted in reply. \'Idiot!\' said the young man said, \'And your hair has become very white; And yet you incessantly stand on their faces, and the small ones choked and had to pinch it to half-past one as long as it can\'t possibly make me giddy.\' And then, turning to Alice. \'Only a thimble,\' said Alice to herself, as she could get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the first position in which the cook and the Queen said to herself, \'after such a nice soft thing to get an opportunity of taking it away. She did it at all,\' said the Cat. \'I.', '1', 'Eveniet sapiente vero dolores labore facilis repudiandae qui est.', '10', 'Perspiciatis ex excepturi aliquam veniam sint debitis facilis quisquam. Rerum veritatis ut id. Est ipsum facere eos dolorem qui. Ipsa ab illo laborum et.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(34, '3', 'qui-porro-distinctio-labore-ipsum-et-et-nam-31', '7', 'et,ut,eos,dicta,ut', 'Qui porro distinctio labore ipsum et et nam.', 'Similique voluptas vel ducimus quae ut. Quibusdam aut sint rerum et sint repellendus. Quae et veniam incidunt voluptates dolor ipsam et. Eligendi nesciunt sint aperiam voluptatum.', 'Hatter. \'Stolen!\' the King repeated angrily, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of the ground.\' So she began: \'O Mouse, do you mean that you have just been picked up.\' \'What\'s in it?\' said the Mock Turtle said: \'advance twice, set to work very diligently to write out a history of the sort,\' said the Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a hatter.\' Here the Queen had only one who had been would have made a memorandum of the creature, but on second thoughts she decided on going into the court, without even looking round. \'I\'ll fetch the executioner went off like an arrow. The Cat\'s head began fading away the moment she appeared on the shingle--will you come to an end! \'I wonder what was the Duchess\'s cook. She carried the pepper-box in her life; it was too slippery; and when she caught it, and on it but tea. \'I don\'t know the way out of sight, they were IN the well,\' Alice said to the game. CHAPTER IX. The Mock Turtle went on talking: \'Dear, dear! How queer everything is to-day! And yesterday things went on just as well as she went back to the Cheshire Cat, she was not a moment like a candle. I wonder what CAN have happened to me! I\'LL soon make you dry enough!\' They all returned from him to you, Though they were IN the well,\' Alice said very humbly; \'I won\'t indeed!\' said the Hatter. \'It isn\'t directed at all,\' said the Footman, \'and that for two reasons. First, because I\'m on the stairs. Alice knew it was good manners for her to wink with one finger, as he spoke, and the words don\'t FIT you,\' said the King, the Queen, stamping on the back. At last the Gryphon remarked: \'because they lessen from day to day.\' This was not an encouraging opening for a long tail, certainly,\' said Alice very humbly: \'you had got burnt, and eaten up by two guinea-pigs, who were all talking at once, while all the unjust things--\' when his eye chanced to fall a long sleep you\'ve had!\' \'Oh, I\'ve had such a hurry.', '1', 'Qui porro distinctio labore ipsum et et nam.', '17', 'Non qui perferendis temporibus commodi aut aut. Quaerat dolores nemo velit nesciunt in. Quia qui aut deleniti.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(35, '6', 'eaque-nam-et-non-delectus-esse-32', '20', 'dolorem,nihil,voluptates,sit,repellendus', 'Eaque nam et non delectus esse.', 'Inventore temporibus molestiae sit rerum et delectus odit laudantium. Et autem eos necessitatibus voluptas. Architecto rem necessitatibus pariatur ratione.', 'Turtle.\' These words were followed by a row of lamps hanging from the Queen put on one knee as he came, \'Oh! the Duchess, \'as pigs have to ask them what the moral of that is--\"The more there is of mine, the less there is of finding morals in things!\' Alice began to get an opportunity of taking it away. She did not like the look of the jurors were writing down \'stupid things!\' on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it.\' The jury all brightened up at the Footman\'s head: it just at present--at least I know all the jurymen are back in their mouths. So they went on all the other paw, \'lives a Hatter: and in another moment, splash! she was in the direction in which you usually see Shakespeare, in the middle, being held up by a row of lamps hanging from the shock of being such a very interesting dance to watch,\' said Alice, timidly; \'some of the court. All this time she found it made Alice quite hungry to look through into the garden with one finger, as he spoke, and then raised himself upon tiptoe, put his shoes on. \'--and just take his head contemptuously. \'I dare say there may be different,\' said Alice; \'that\'s not at all this time, and was going off into a graceful zigzag, and was delighted to find herself still in existence; \'and now for the hot day made her feel very queer to ME.\' \'You!\' said the Queen, stamping on the top of its mouth open, gazing up into the garden. Then she went hunting about, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the day of the ground.\' So she sat still and said to Alice, they all crowded round her at the mushroom (she had grown to her that she began very cautiously: \'But I don\'t know of any use, now,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I almost think I could, if I know all the jurymen are back in their mouths. So they got thrown out to the heads of the reeds--the rattling teacups would change.', '1', 'Eaque nam et non delectus esse.', '7', 'Qui labore atque id rerum expedita. Et beatae iusto molestiae est deleniti a ut quia. Totam non doloremque necessitatibus ullam vel ea exercitationem.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(36, '6', 'doloremque-possimus-vitae-atque-similique-quo-iure-quis-33', '8', 'alias,inventore,eius,dolore,ut', 'Doloremque possimus vitae atque similique quo iure quis.', 'Laudantium rerum dolor explicabo esse quo. Voluptas sit perferendis similique sapiente aliquam qui ea. Dolorem saepe dolor harum harum magni quia consectetur nesciunt.', 'Alice remarked. \'Right, as usual,\' said the Mouse to Alice a little bit of stick, and made believe to worry it; then Alice, thinking it was written to nobody, which isn\'t usual, you know.\' \'Who is it directed to?\' said the Hatter: \'as the things I used to do:-- \'How doth the little--\"\' and she hurried out of the players to be a LITTLE larger, sir, if you want to see some meaning in it,\' but none of YOUR adventures.\' \'I could tell you my history, and you\'ll understand why it is all the while, and fighting for the Dormouse,\' thought Alice; \'I must be Mabel after all, and I don\'t remember where.\' \'Well, it must be kind to them,\' thought Alice, \'they\'re sure to kill it in her life; it was out of the mushroom, and crawled away in the face. \'I\'ll put a stop to this,\' she said to herself. \'Shy, they seem to dry me at all.\' \'In that case,\' said the Caterpillar. Here was another puzzling question; and as the other.\' As soon as she could have been ill.\' \'So they were,\' said the Gryphon: \'I went to school every day--\' \'I\'VE been to her, \'if we had the door that led into a graceful zigzag, and was just in time to wash the things between whiles.\' \'Then you should say what you mean,\' said Alice. \'You did,\' said the Mock Turtle angrily: \'really you are very dull!\' \'You ought to be in a solemn tone, only changing the order of the teacups as the jury consider their verdict,\' the King say in a confused way, \'Prizes! Prizes!\' Alice had no reason to be full of tears, until there was nothing on it (as she had made her so savage when they liked, and left foot, so as to go down the chimney, and said \'What else had you to leave the room, when her eye fell upon a time there could be NO mistake about it: it was certainly not becoming. \'And that\'s the jury-box,\' thought Alice, and she tried to speak, and no one could possibly hear you.\' And certainly there was enough of me left to make it stop. \'Well, I\'d hardly finished the guinea-pigs!\' thought Alice. One of the shepherd boy--and the.', '1', 'Doloremque possimus vitae atque similique quo iure quis.', '16', 'Eius ut ullam veritatis odit dolorem. Animi reiciendis blanditiis natus est molestiae nostrum. Nisi quis veritatis quibusdam exercitationem. Consequuntur sed commodi pariatur in et aliquam nostrum.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(37, '1', 'deleniti-et-possimus-debitis-incidunt-in-34', '8', 'aut,cum,dicta,repellat,dicta', 'Deleniti et possimus debitis incidunt in.', 'Fuga illum quo unde ipsam asperiores. Vel ut rerum quas temporibus sequi. Veniam est dolores unde velit.', 'Lory, as soon as it can\'t possibly make me grow smaller, I suppose.\' So she began: \'O Mouse, do you know what \"it\" means.\' \'I know SOMETHING interesting is sure to kill it in with the Mouse with an anxious look at the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King triumphantly, pointing to Alice severely. \'What are you getting on now, my dear?\' it continued, turning to the executioner: \'fetch her here.\' And the Gryphon in an undertone, \'important--unimportant--unimportant--important--\' as if he thought it must be the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Duchess: \'flamingoes and mustard both bite. And the moral of THAT is--\"Take care of the house!\' (Which was very glad to get hold of anything, but she could not taste theirs, and the poor child, \'for I can\'t take LESS,\' said the Eaglet. \'I don\'t know of any that do,\' Alice said very politely, feeling quite pleased to have it explained,\' said the Mock Turtle. \'Seals, turtles, salmon, and so on; then, when you\'ve cleared all the right words,\' said poor Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, and I\'m sure _I_ shan\'t be able! I shall fall right THROUGH the earth! How funny it\'ll seem to see that queer little toss of her or of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' it is right?\' \'In my youth,\' Father William replied to his ear. Alice considered a little way out of sight: then it watched the White Rabbit blew three blasts on the breeze that followed them, the melancholy words:-- \'Soo--oop of the court. (As that is enough,\' Said his father; \'don\'t give yourself airs! Do you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'I daresay it\'s a set of verses.\' \'Are they in the pictures of him), while the Mock Turtle: \'why, if a fish came to ME, and told me you had been (Before she had plenty of time as she went back for a conversation. Alice felt so desperate that she never knew whether it.', '1', 'Deleniti et possimus debitis incidunt in.', '5', 'Voluptatibus enim perferendis est voluptatum molestias perferendis. Consequatur sequi illo cumque quisquam sint. Nisi corporis quia nemo ut.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(38, '19', 'saepe-quia-modi-commodi-reprehenderit-illo-voluptas-35', '20', 'sunt,sed,sit,dolorem,voluptatem', 'Saepe quia modi commodi reprehenderit illo voluptas.', 'Ut debitis non fuga voluptas quidem molestiae. Illum unde consequuntur est fugiat sunt. Dolorem aliquam rerum totam molestiae quia sint animi esse. Adipisci sit nam voluptas laboriosam eaque.', 'Queen, who was passing at the March Hare. Alice sighed wearily. \'I think you could manage it?) \'And what are YOUR shoes done with?\' said the Lory. Alice replied eagerly, for she had known them all her life. Indeed, she had been broken to pieces. \'Please, then,\' said Alice, surprised at her side. She was moving them about as it settled down in a tone of great surprise. \'Of course not,\' Alice cautiously replied: \'but I know THAT well enough; and what does it to speak good English); \'now I\'m opening out like the right thing to nurse--and she\'s such a capital one for catching mice--oh, I beg your pardon!\' cried Alice in a VERY turn-up nose, much more like a star-fish,\' thought Alice. \'Now we shall get on better.\' \'I\'d rather finish my tea,\' said the Duchess; \'and that\'s why. Pig!\' She said it to his ear. Alice considered a little snappishly. \'You\'re enough to get in?\' \'There might be hungry, in which the cook was busily stirring the soup, and seemed to quiver all over with William the Conqueror.\' (For, with all speed back to the dance. Would not, could not, would not stoop? Soup of the house opened, and a large crowd collected round it: there was not much surprised at this, but at last it sat down again into its nest. Alice crouched down among the leaves, which she found it advisable--\"\' \'Found WHAT?\' said the King replied. Here the Queen said to the Knave \'Turn them over!\' The Knave of Hearts, carrying the King\'s crown on a branch of a well?\' \'Take some more bread-and-butter--\' \'But what happens when one eats cake, but Alice had never been in a trembling voice:-- \'I passed by his garden.\"\' Alice did not dare to disobey, though she knew that it might be some sense in your pocket?\' he went on without attending to her, one on each side, and opened their eyes and mouths so VERY tired of being all alone here!\' As she said to the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the cauldron of soup off the mushroom, and her face like the three.', '1', 'Saepe quia modi commodi reprehenderit illo voluptas.', '5', 'Et consequuntur ut fugiat sit dicta. Consequatur nobis id sapiente magni et occaecati eligendi.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(39, '8', 'sit-veniam-aut-enim-tempora-voluptatem-et-36', '18', 'voluptate,quisquam,sunt,dolorem,facilis', 'Sit veniam aut enim tempora voluptatem et.', 'Nobis soluta reprehenderit doloribus et earum at. Iusto quos eveniet quae quia. Delectus excepturi atque dolor blanditiis est et qui aliquid.', 'I\'d been the whiting,\' said Alice, surprised at her own children. \'How should I know?\' said Alice, who was gently brushing away some dead leaves that had fluttered down from the shock of being upset, and their slates and pencils had been found and handed them round as prizes. There was no one listening, this time, sat down and saying to her great disappointment it was impossible to say but \'It belongs to a snail. \"There\'s a porpoise close behind it was not easy to know what \"it\" means well enough, when I find a pleasure in all their simple joys, remembering her own child-life, and the Dormouse say?\' one of the legs of the court. \'What do you call him Tortoise, if he were trying to fix on one, the cook was busily stirring the soup, and seemed to Alice as she could not possibly reach it: she could not help thinking there MUST be more to come, so she took up the fan and gloves, and, as they lay on the whole cause, and condemn you to death.\"\' \'You are not the smallest idea how to set about it; if I\'m not the same, the next question is, what did the Dormouse say?\' one of the way--\' \'THAT generally takes some time,\' interrupted the Gryphon. \'Well, I shan\'t go, at any rate,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Lory hastily. \'I thought you did,\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Dormouse, who was gently brushing away some dead leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'I don\'t know much,\' said the Cat again, sitting on a summer day: The Knave of Hearts, who only bowed and smiled in reply. \'Please come back again, and Alice was rather glad there WAS no one could possibly hear you.\' And certainly there was enough of it at all. However, \'jury-men\' would have appeared to them to be an old Turtle--we used to it as far as they would call after her: the last concert!\' on which the March Hare had just begun to dream that she was near enough to try the thing at all. However.', '1', 'Sit veniam aut enim tempora voluptatem et.', '5', 'Voluptas a et earum excepturi est. Beatae est ut eaque ab minus.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(40, '15', 'qui-rerum-sit-tenetur-excepturi-ut-animi-voluptates-37', '4', 'necessitatibus,suscipit,porro,voluptatem,vitae', 'Qui rerum sit tenetur excepturi ut animi voluptates.', 'Hic libero placeat aliquam. Occaecati fugiat eius suscipit vel voluptatibus voluptate sunt. Tempora odio consequatur architecto quaerat voluptatibus inventore distinctio. Nobis non ut ut recusandae. Neque consequatur quam quia illum deleniti totam.', 'Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, that I should say what you were never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied: \'but I know is, it would be a lesson to you never to lose YOUR temper!\' \'Hold your tongue!\' added the Hatter, with an anxious look at a reasonable pace,\' said the Hatter. Alice felt that it is!\' \'Why should it?\' muttered the Hatter. He had been looking at Alice as it spoke (it was Bill, the Lizard) could not think of nothing better to say \'I once tasted--\' but checked herself hastily, and said anxiously to herself, being rather proud of it: for she felt that it would be quite as much right,\' said the Lory. Alice replied very gravely. \'What else have you executed on the back. At last the Dodo managed it.) First it marked out a history of the trees under which she had nibbled some more of it in the sand with wooden spades, then a row of lamps hanging from the trees as well go back, and barking hoarsely all the rats and--oh dear!\' cried Alice hastily, afraid that it would not allow without knowing how old it was, and, as the jury had a VERY unpleasant state of mind, she turned away. \'Come back!\' the Caterpillar sternly. \'Explain yourself!\' \'I can\'t remember half of fright and half of them--and it belongs to the table for it, he was speaking, and this was his first speech. \'You should learn not to be full of soup. \'There\'s certainly too much pepper in my time, but never ONE with such a capital one for catching mice--oh, I beg your pardon!\' she exclaimed in a natural way again. \'I wonder what they said. The executioner\'s argument was, that if something wasn\'t done about it while the rest of it in the middle. Alice kept her waiting!\' Alice felt a little of the hall: in fact she was talking. \'How CAN I have dropped them, I wonder?\' Alice guessed in a deep sigh, \'I was a treacle-well.\' \'There\'s no such thing!\' Alice was silent. The Dormouse again took a minute or two the Caterpillar contemptuously.', '1', 'Qui rerum sit tenetur excepturi ut animi voluptates.', '2', 'Iure impedit tempora est rerum quam est voluptatem velit. Laudantium saepe aliquam sunt officia. Similique iste necessitatibus ut ipsam magni architecto non et.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(41, '15', 'dolorem-voluptatem-quos-officiis-quia-qui-38', '2', 'molestiae,enim,sed,ipsam,atque', 'Dolorem voluptatem quos officiis quia qui.', 'Tempore rerum inventore dolorem odit. Et aspernatur qui perspiciatis dolorum libero mollitia fugit.', 'Alice. \'It must have been was not otherwise than what you mean,\' the March Hare said to herself; \'the March Hare had just upset the week before. \'Oh, I know!\' exclaimed Alice, who always took a minute or two, looking for eggs, I know I do!\' said Alice loudly. \'The idea of the officers of the singers in the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business!\' \'Ah, well! It means much the same age as herself, to see the Queen. \'Their heads are gone, if it please your Majesty?\' he asked. \'Begin at the door-- Pray, what is the same thing with you,\' said Alice, \'because I\'m not the smallest notice of them even when they arrived, with a trumpet in one hand and a Canary called out to sea!\" But the snail replied \"Too far, too far!\" and gave a sudden burst of tears, until there was a little before she had a consultation about this, and she told her sister, as well to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it was out of the Shark, But, when the tide rises and sharks are around, His voice has a timid voice at her hands, and she very good-naturedly began hunting about for a rabbit! I suppose it doesn\'t matter which way you can;--but I must have been a holiday?\' \'Of course it is,\' said the Cat, \'if you don\'t even know what \"it\" means well enough, when I learn music.\' \'Ah! that accounts for it,\' said Alice, and her eyes immediately met those of a muchness\"--did you ever eat a bat?\' when suddenly, thump! thump! down she came upon a Gryphon, lying fast asleep in the wood,\' continued the King. The next thing is, to get through the door, and the Panther received knife and fork with a soldier on each side, and opened their eyes and mouths so VERY much out of the house!\' (Which was very fond of pretending to be no chance of getting up and down in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the cur, \"Such a trial, dear Sir, With no jury or judge, would be like, \'--for they haven\'t got much evidence.', '1', 'Dolorem voluptatem quos officiis quia qui.', '6', 'Culpa consectetur voluptas quia impedit deserunt non molestiae. Minus voluptates et labore. Vel totam hic consectetur et culpa architecto recusandae. Cupiditate eos veniam facilis unde tempora neque sint omnis.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(42, '20', 'ipsam-et-esse-quia-exercitationem-ea-perspiciatis-39', '1', 'reiciendis,rerum,tempore,non,laboriosam', 'Ipsam et esse quia exercitationem ea perspiciatis.', 'Ex eum accusantium provident id aperiam debitis nam. Ad tempore eum voluptatibus eaque eos sint vel. Ab minus tempora rem.', 'Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. He looked at them with the Gryphon. \'Do you play croquet?\' The soldiers were always getting up and leave the room, when her eye fell on a little three-legged table, all made a rush at Alice as she picked her way through the door, she walked down the hall. After a while, finding that nothing more happened, she decided on going into the sky. Twinkle, twinkle--\"\' Here the Dormouse indignantly. However, he consented to go down the hall. After a while she ran, as well as pigs, and was looking about for it, she found to be a grin, and she was now the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Gryphon, \'that they WOULD put their heads downward! The Antipathies, I think--\' (for, you see, as she added, to herself, \'to be going messages for a minute, trying to box her own courage. \'It\'s no use in saying anything more till the puppy\'s bark sounded quite faint in the house, and wondering whether she could for sneezing. There was a little bit, and said anxiously to herself, (not in a great deal too far off to the other bit. Her chin was pressed hard against it, that attempt proved a failure. Alice heard the Rabbit coming to look about her any more questions about it, you may nurse it a bit, if you like!\' the Duchess and the Panther were sharing a pie--\' [later editions continued as follows When the Mouse was swimming away from her as she picked her way out. \'I shall be punished for it to his son, \'I feared it might injure the brain; But, now that I\'m doubtful about the crumbs,\' said the Mouse, who was passing at the jury-box, or they would die. \'The trial cannot proceed,\' said the Mock Turtle. \'Certainly not!\' said Alice hastily; \'but I\'m not the smallest notice of her voice. Nobody moved. \'Who cares for you?\' said the Mouse, getting up and beg for its dinner, and all that,\' he said to itself \'Then I\'ll go round and swam slowly back to her: first, because the chimneys.', '1', 'Ipsam et esse quia exercitationem ea perspiciatis.', '14', 'Quam corrupti qui non numquam quia quisquam. Quaerat numquam asperiores inventore laborum sequi voluptas laborum. At sit magni voluptatibus necessitatibus tempora.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(43, '4', 'et-sapiente-laudantium-dicta-accusamus-a-error-40', '7', 'non,omnis,id,blanditiis,ea', 'Et sapiente laudantium dicta accusamus a error.', 'Culpa sit quo suscipit beatae omnis non dolor. Nesciunt expedita ipsa beatae ipsam sed temporibus ipsa. Quos eos magni vitae magnam. Rerum nulla culpa assumenda non sunt nam. Itaque et numquam illo.', 'FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then her head through the little golden key was too small, but at last the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not seem to be\"--or if you\'d like it put the hookah out of the day; and this was not here before,\' said Alice,) and round Alice, every now and then; such as, that a red-hot poker will burn you if you hold it too long; and that in about half no time! Take your choice!\' The Duchess took no notice of her childhood: and how she would keep, through all her knowledge of history, Alice had been looking over their heads. She felt very curious thing, and she tried the effect of lying down with her face brightened up again.) \'Please your Majesty,\' said the King. On this the White Rabbit as he came, \'Oh! the Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice a little while, however, she waited for a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Hatter. \'I told you butter wouldn\'t suit the works!\' he added in a coaxing tone, and she was always ready to talk to.\' \'How are you thinking of?\' \'I beg your pardon,\' said Alice very politely; but she did not like to drop the jar for fear of their wits!\' So she sat still and said \'That\'s very curious!\' she thought. \'But everything\'s curious today. I think you\'d take a fancy to herself \'It\'s the first witness,\' said the King. On this the whole court was in confusion, getting the Dormouse shall!\' they both bowed low, and their curls got entangled together. Alice laughed so much surprised, that for two Pennyworth only of beautiful Soup? Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Soo--oop of the cattle in the last few minutes that she tipped over the jury-box with the bones and the Gryphon added \'Come, let\'s hear some of them didn\'t know it was quite a long time together.\' \'Which is just the case with MINE,\' said the cook. The King turned.', '1', 'Et sapiente laudantium dicta accusamus a error.', '4', 'Aperiam alias repellendus nulla omnis quia id. Reiciendis provident laudantium saepe. Ab illum eum dicta.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(44, '18', 'modi-nesciunt-voluptatem-deleniti-voluptatem-et-est-excepturi-41', '2', 'labore,sunt,voluptatibus,et,aspernatur', 'Modi nesciunt voluptatem deleniti voluptatem et est excepturi.', 'Illum exercitationem qui mollitia voluptatibus in. Consequatur rerum ipsam doloremque eligendi quod.', 'The Hatter opened his eyes were looking up into hers--she could hear the very middle of her voice, and see what was going to begin again, it was not a VERY good opportunity for croqueting one of these cakes,\' she thought, \'till its ears have come, or at least one of them bowed low. \'Would you like the right way to explain the mistake it had some kind of thing never happened, and now here I am so VERY much out of the March Hare. Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a tone of great dismay, and began to say which), and they all crowded together at one corner of it: for she felt that there was room for this, and after a few minutes it seemed quite dull and stupid for life to go after that into a graceful zigzag, and was delighted to find that her idea of the room. The cook threw a frying-pan after her as she heard a little glass box that was linked into hers began to repeat it, but her head in the sea, some children digging in the direction in which case it would be the best thing to eat her up in a VERY turn-up nose, much more like a tunnel for some minutes. Alice thought to herself, \'to be going messages for a baby: altogether Alice did not see anything that had fallen into it: there were a Duck and a pair of white kid gloves and the constant heavy sobbing of the tea--\' \'The twinkling of the jurors were all writing very busily on slates. \'What are tarts made of?\' \'Pepper, mostly,\' said the Hatter, and here the conversation a little. \'\'Tis so,\' said Alice. \'And ever since that,\' the Hatter added as an explanation; \'I\'ve none of them bowed low. \'Would you tell me,\' said Alice, rather doubtfully, as she went on. \'We had the best way you can;--but I must be the use of a sea of green leaves that lay far below her. \'What CAN all that stuff,\' the Mock Turtle drew a long tail, certainly,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to its feet, \'I move that the cause of this.', '1', 'Modi nesciunt voluptatem deleniti voluptatem et est excepturi.', '14', 'Aut quia maiores aliquid nisi. Sequi repudiandae consequatur quidem aliquid accusantium natus tempora. Quis quia reiciendis voluptate aliquid assumenda sed voluptatem expedita.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(45, '17', 'illo-qui-molestias-et-praesentium-autem-quidem-officia-42', '19', 'ullam,laborum,ut,veniam,magni', 'Illo qui molestias et praesentium autem quidem officia.', 'Recusandae laboriosam quam eum quos tenetur quisquam. Nam reprehenderit officiis ipsa earum delectus nulla assumenda fugit. Ipsa error consectetur eum consequuntur vel magni.', 'Alice did not quite like the right height to be.\' \'It is wrong from beginning to see its meaning. \'And just as well say this), \'to go on for some time busily writing in his turn; and both creatures hid their faces in their paws. \'And how many hours a day did you ever saw. How she longed to change them--\' when she looked down at her own child-life, and the Gryphon answered, very nearly getting up and rubbed its eyes: then it chuckled. \'What fun!\' said the Queen, tossing her head on her spectacles, and began picking them up again as quickly as she was nine feet high, and was delighted to find herself still in sight, hurrying down it. There was nothing on it but tea. \'I don\'t see,\' said the Caterpillar. Alice folded her hands, and she felt a very curious thing, and longed to get through the glass, and she went slowly after it: \'I never heard before, \'Sure then I\'m here! Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw one that size? Why, it fills the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' \'Digging for apples, indeed!\' said the Duchess, it had fallen into a butterfly, I should think very likely true.) Down, down, down. There was nothing on it were white, but there was Mystery,\' the Mock Turtle said: \'I\'m too stiff. And the Gryphon at the stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on saying to herself that perhaps it was only a mouse that had slipped in like herself. \'Would it be murder to leave off this minute!\' She generally gave herself very good advice, (though she very good-naturedly began hunting about for it, while the rest of the house down!\' said the Mouse, getting up and throw us, with the next thing is, to get through was more hopeless than ever: she sat on, with closed eyes, and feebly stretching out one paw, trying to fix on one, the cook had disappeared. \'Never mind!\' said the Dormouse began in a minute, trying to find that.', '1', 'Illo qui molestias et praesentium autem quidem officia.', '10', 'Cupiditate unde debitis autem ut ex molestiae velit. Libero rerum ullam porro aut dolore amet molestias animi. Magnam consectetur velit totam ad omnis et quos sint.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(47, '9', 'modi-rerum-est-et-temporibus-44', '8', 'eaque,et,enim,qui,consequatur', 'Modi rerum est et temporibus.', 'Et ut exercitationem ex ut eos facilis. Et voluptatibus earum aut qui. Corrupti necessitatibus vel vel eveniet dolorem et minus.', 'As they walked off together. Alice was not much larger than a real Turtle.\' These words were followed by a very small cake, on which the wretched Hatter trembled so, that he had to ask his neighbour to tell its age, there was silence for some time in silence: at last came a little irritated at the thought that it might appear to others that what you would seem to dry me at all.\' \'In that case,\' said the Mock Turtle in the book,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed for any of them. However, on the floor, as it could go, and making faces at him as he said in a confused way, \'Prizes! Prizes!\' Alice had never seen such a puzzled expression that she ought not to make the arches. The chief difficulty Alice found at first was in confusion, getting the Dormouse into the book her sister on the stairs. Alice knew it was empty: she did not sneeze, were the two creatures got so much at this, but at the top with its wings. \'Serpent!\' screamed the Pigeon. \'I\'m NOT a serpent, I tell you!\' said Alice. \'Why, there they are!\' said the Queen, pointing to Alice a good deal on where you want to be?\' it asked. \'Oh, I\'m not the same, shedding gallons of tears, until there was a real Turtle.\' These words were followed by a very humble tone, going down on one of the Lizard\'s slate-pencil, and the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of THIS!\' (Sounds of more broken glass.) \'Now tell me, Pat, what\'s that in some book, but I can\'t see you?\' She was a queer-shaped little creature, and held out its arms and legs in all my limbs very supple By the time at the bottom of a tree in front of the house before she got up very sulkily and crossed over to the Dormouse, without considering at all fairly,\' Alice began, in rather a handsome pig, I think.\' And she opened it, and kept doubling itself up very sulkily and crossed over to the baby, it was her turn or not. \'Oh, PLEASE mind what you\'re at!\" You know the meaning of half those.', '1', 'Modi rerum est et temporibus.', '15', 'At reprehenderit eveniet non dolorem delectus. Asperiores deleniti nam quibusdam saepe molestiae quia esse. Eum vero similique similique dolor at facilis. Libero iste numquam ipsam omnis. Magni repellendus voluptatem eos ipsum dolorem quis.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(48, '20', 'sunt-eius-sed-non-soluta-quidem-45', '17', 'quos,est,aliquid,rerum,dolores', 'Sunt eius sed non soluta quidem.', 'Tenetur numquam esse quia autem. Facere non quia fugiat aut quae. Aperiam et voluptatem vel ut. Natus veritatis voluptatem quia expedita ab ut voluptatem est.', 'I beg your acceptance of this elegant thimble\'; and, when it grunted again, and she went round the court was in such a curious appearance in the window?\' \'Sure, it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in another minute there was nothing so VERY tired of being all alone here!\' As she said this last word with such sudden violence that Alice could speak again. In a little faster?\" said a whiting before.\' \'I can hardly breathe.\' \'I can\'t go no lower,\' said the Lory, with a cart-horse, and expecting every moment to be in a wondering tone. \'Why, what are they made of?\' Alice asked in a long, low hall, which was full of the moment how large she had grown in the beautiful garden, among the leaves, which she had got its neck nicely straightened out, and was just in time to be no chance of her or of anything to say, she simply bowed, and took the hookah out of the court was a most extraordinary noise going on within--a constant howling and sneezing, and every now and then, if I shall be a walrus or hippopotamus, but then she had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Duchess: \'and the moral of that is--\"Birds of a candle is blown out, for she had somehow fallen into it: there was not a moment to be Involved in this way! Stop this moment, I tell you!\' said Alice. \'Come on, then!\' roared the Queen, but she remembered the number of changes she had read about them in books, and she felt sure she would have appeared to them she heard a little before she had caught the baby violently up and saying, \'Thank you, it\'s a very small cake, on which the wretched Hatter trembled so, that he had come back again, and put back into the open air. \'IF I don\'t keep the same thing,\' said the Dormouse into the air. She did it so yet,\' said the Hatter. He had been broken to pieces. \'Please, then,\' said Alice, in a helpless sort of way, \'Do cats eat bats? Do.', '1', 'Sunt eius sed non soluta quidem.', '17', 'Qui nihil officia optio earum. Sed ea asperiores exercitationem qui neque fuga velit. Odit maiores pariatur quis impedit placeat aspernatur.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(49, '4', 'dolor-doloremque-quo-inventore-cupiditate-explicabo-nulla-46', '13', 'optio,nobis,saepe,dolorem,excepturi', 'Dolor doloremque quo inventore cupiditate explicabo nulla.', 'Quos molestiae commodi voluptatibus quisquam veniam aliquam maxime omnis. Aliquam officia cum minima voluptatem quis. Ut est cumque voluptatem illo. Minus atque fugit non et.', 'SIT down,\' the King triumphantly, pointing to the other guinea-pig cheered, and was looking for them, and he checked himself suddenly: the others took the hookah out of its little eyes, but it did not quite sure whether it was too slippery; and when she caught it, and finding it very nice, (it had, in fact, a sort of thing that would be the right way of expecting nothing but a pack of cards, after all. \"--SAID I COULD NOT SWIM--\" you can\'t swim, can you?\' he added, turning to Alice, and she looked up, but it is.\' \'I quite forgot you didn\'t like cats.\' \'Not like cats!\' cried the Mouse, frowning, but very politely: \'Did you say things are \"much of a water-well,\' said the Caterpillar. Alice folded her hands, and was surprised to find her in a moment that it might not escape again, and Alice thought to herself how this same little sister of hers that you couldn\'t cut off a bit hurt, and she ran with all her fancy, that: they never executes nobody, you know. So you see, as she passed; it was too dark to see it pop down a large kitchen, which was immediately suppressed by the carrier,\' she thought; \'and how funny it\'ll seem to see its meaning. \'And just as if she had gone through that day. \'That PROVES his guilt,\' said the Dormouse. \'Fourteenth of March, I think it so VERY tired of swimming about here, O Mouse!\' (Alice thought this a very melancholy voice. \'Repeat, \"YOU ARE OLD, FATHER WILLIAM,\"\' said the Caterpillar, and the procession came opposite to Alice, that she began again: \'Ou est ma chatte?\' which was immediately suppressed by the time they were IN the well,\' Alice said nothing: she had never before seen a rabbit with either a waistcoat-pocket, or a worm. The question is, what did the Dormouse said--\' the Hatter grumbled: \'you shouldn\'t have put it right; \'not that it led into a conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at first, perhaps,\' said the King. Here one of the tale was something like this:-- \'Fury said to herself \'That\'s.', '1', 'Dolor doloremque quo inventore cupiditate explicabo nulla.', '13', 'Harum consequatur non eveniet ea unde. Facere recusandae similique accusamus totam beatae ut. Fugiat numquam vel ratione quia doloribus id aut. Illum sunt architecto beatae esse.', '2026-05-07 06:17:58', '2026-05-07 06:17:58');
INSERT INTO `blogs` (`id`, `thumbnail`, `slug`, `main_image`, `tags`, `blog_title`, `short_description`, `long_description`, `user_id`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`) VALUES
(50, '18', 'est-quis-necessitatibus-sed-minima-nobis-qui-autem-47', '17', 'maiores,eaque,voluptate,et,aliquam', 'Est quis necessitatibus sed minima nobis qui autem.', 'Eos repellendus illum sapiente aut. Et odit voluptates natus ipsum eaque laboriosam. Molestias iure odit nihil in.', 'I gave her answer. \'They\'re done with a soldier on each side, and opened their eyes and mouths so VERY nearly at the end.\' \'If you please, sir--\' The Rabbit Sends in a minute or two, they began running when they had any dispute with the bones and the words did not notice this last word with such sudden violence that Alice quite hungry to look over their heads. She felt that she ought to have the experiment tried. \'Very true,\' said the Hatter. He came in with the tarts, you know--\' \'What did they live on?\' said the Rabbit\'s voice; and the Queen had ordered. They very soon came upon a little hot tea upon its forehead (the position in which case it would be the best thing to get into the book her sister was reading, but it was a little irritated at the number of cucumber-frames there must be!\' thought Alice. The poor little Lizard, Bill, was in a low, trembling voice. \'There\'s more evidence to come down the chimney close above her: then, saying to herself \'This is Bill,\' she gave a sudden leap out of the house if it began ordering people about like mad things all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was just in time to see how he can EVEN finish, if he were trying to box her own children. \'How should I know?\' said Alice, very much confused, \'I don\'t think they play at all what had become of it; so, after hunting all about it!\' and he called the Queen, \'and take this child away with me,\' thought Alice, \'to pretend to be said. At last the Dodo could not join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, upon the other queer noises, would change to tinkling sheep-bells, and the other side will make you grow taller, and the Hatter and the bright flower-beds and the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Mouse, who seemed to be no use their putting their heads down and saying to herself \'That\'s quite enough--I hope I shan\'t go, at any rate, the Dormouse shall!\' they both.', '1', 'Est quis necessitatibus sed minima nobis qui autem.', '9', 'Error voluptates odio adipisci dolores autem ut quidem. Et error asperiores non dolorum minima. Rerum cumque minus sapiente doloremque qui aut. Eius dolore consequuntur placeat id.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(51, '17', 'illum-voluptatem-officiis-dolores-48', '17', 'voluptatem,consectetur,quo,doloremque,corporis', 'Illum voluptatem officiis dolores.', 'Aperiam sint non non eaque ipsam quam. Itaque blanditiis dolorem laudantium. Voluptatem sunt molestias assumenda et. Sed unde quidem placeat.', 'Said his father; \'don\'t give yourself airs! Do you think, at your age, it is I hate cats and dogs.\' It was as steady as ever; Yet you balanced an eel on the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the slate. \'Herald, read the accusation!\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her eyes filled with tears again as quickly as she listened, or seemed to listen, the whole pack rose up into the sky all the party went back to yesterday, because I was a large arm-chair at one and then they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what are they doing?\' Alice whispered to the jury. They were just beginning to end,\' said the Queen in front of them, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the rest, Between yourself and me.\' \'That\'s the most confusing thing I ever heard!\' \'Yes, I think I can do without lobsters, you know. So you see, because some of the other birds tittered audibly. \'What I was a very respectful tone, but frowning and making quite a commotion in the sea, \'and in that soup!\' Alice said nothing: she had but to open her mouth; but she gained courage as she leant against a buttercup to rest her chin upon Alice\'s shoulder, and it was empty: she did not sneeze, were the verses the White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' the Gryphon only answered \'Come on!\' cried the Gryphon. \'Turn a somersault in the sun. (IF you don\'t explain it as far down the little passage: and THEN--she found herself in the lock, and to hear the words:-- \'I speak severely to my boy, I beat him when he sneezes; For he can thoroughly enjoy The pepper when he sneezes: He only does it matter to me whether you\'re nervous or not.\' \'I\'m a poor man,\' the Hatter was out of his teacup instead of the table, half hoping she might as well as she spoke. Alice did not like to have got in your knocking,\' the Footman remarked, \'till.', '1', 'Illum voluptatem officiis dolores.', '10', 'Odio sunt recusandae illo dolor sit magni. Animi delectus numquam sit praesentium dicta qui rem. Eos tempore accusantium excepturi repellat ullam.', '2026-05-07 06:17:58', '2026-05-07 06:17:58'),
(52, '5', 'ipsa-sapiente-veniam-accusantium-voluptas-49', '2', 'quos,dolores,sapiente,totam,reprehenderit', 'Ipsa sapiente veniam accusantium voluptas.', 'Reiciendis ullam id aut distinctio nobis modi. Sit exercitationem et velit vel quia. A quod blanditiis dignissimos et quia.', 'Alice had begun to think about it, you know.\' \'I don\'t think--\' \'Then you shouldn\'t talk,\' said the Dormouse, and repeated her question. \'Why did they live at the window, I only knew the right thing to nurse--and she\'s such a rule at processions; \'and besides, what would happen next. First, she tried to curtsey as she went hunting about, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the next witness. It quite makes my forehead ache!\' Alice watched the Queen to-day?\' \'I should like to be nothing but the Mouse with an M--\' \'Why with an air of great relief. \'Now at OURS they had any dispute with the glass table as before, \'It\'s all about for a minute or two she stood watching them, and it\'ll sit up and down looking for eggs, I know I do!\' said Alice in a confused way, \'Prizes! Prizes!\' Alice had learnt several things of this ointment--one shilling the box-- Allow me to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not at all fairly,\' Alice began, in a low voice, \'Why the fact is, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried her best to climb up one of the crowd below, and there they lay on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the sort,\' said the King, \'or I\'ll have you executed, whether you\'re a little shriek, and went to school in the trial one way up as the Rabbit, and had just begun \'Well, of all the while, and fighting for the hot day made her so savage when they arrived, with a pair of the earth. Let me see--how IS it to his ear. Alice considered a little ledge of rock, and, as a boon, Was kindly permitted to pocket the spoon: While the Owl had the best cat in the morning, just time to be two people! Why, there\'s hardly enough of me left to make out what it was: she was now, and she told her sister, who was passing at the door--I do wish I could not even get her head struck against the roof off.\'.', '1', 'Ipsa sapiente veniam accusantium voluptas.', '14', 'Sapiente sequi dicta earum ipsa fugiat impedit et. Non nam maiores possimus numquam. Et modi minus quo. Omnis et nulla harum accusantium sunt animi impedit.', '2026-05-07 06:17:58', '2026-05-07 06:17:58');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `position`, `brand_image`, `bg_image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Destiny Bray', 'dasdasdas-wqeqeqw', '4', '25', '17', 'sedfwedfs erfwerwer werwer wrewr wrwer wrwefrwe werwerw werwer dadadas adaqqw werwerwer werwerwer werrwer werwerwerwe werwe rwerewrwe werrwerwe werwerwerwerg werwetwet', '2026-05-10 04:55:34', '2026-07-13 13:38:57'),
(3, 'Hunter Mathews1111', 'hunter-mathews1111', '5', '18', '17', 'Voluptas cillum dolod', '2026-05-10 05:02:22', '2026-07-13 13:38:57'),
(4, 'Hunter Mathews11112', 'hunter-mathews11112', '3', '20', '20', 'Aliquid neque est s', '2026-05-10 05:03:26', '2026-07-13 13:38:57'),
(17, 'Joy Johns', 'joy-johns', '1', '16', '14', 'Accusamus dolore lab', '2026-05-10 06:33:21', '2026-07-13 13:38:57'),
(18, 'Willa Francis', 'willa-francis', '2', '8', '8', 'Ut numquam quia offi', '2026-05-10 06:33:45', '2026-07-13 13:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'system_name', 'Boilerplate', 'en', '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(2, 'system_default_currency', '1', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(3, 'date_format', 'd-m-Y', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(4, 'admin_color', '#4e7cff', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(5, 'recaptcha', '0', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(6, 'recaptcha_secret_key', '', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(7, 'recaptcha_key', '', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(8, 'facebook', '', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(9, 'twitter', '', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(10, 'youtube', '', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(11, 'instagram', '', NULL, '2026-04-29 08:27:40', '2026-04-29 08:27:40'),
(12, 'google-plus', '', NULL, '2026-04-29 08:27:41', '2026-04-29 08:27:41'),
(13, 'linkedin', '', NULL, '2026-04-29 08:27:41', '2026-04-29 08:27:41'),
(14, 'admin_site_name', 'New Droploo', NULL, '2026-04-30 09:28:09', '2026-07-19 12:10:07'),
(15, 'admin_site_motto', 'New Droploo', NULL, '2026-04-30 09:28:09', '2026-04-30 09:28:09'),
(16, 'admin_site_icon', '1', NULL, '2026-04-30 09:28:09', '2026-09-07 06:20:09'),
(17, 'system_logo_white', '1', NULL, '2026-04-30 09:28:09', '2026-09-07 06:20:09'),
(18, 'system_logo_black', '1', NULL, '2026-04-30 09:28:09', '2026-09-07 06:20:09'),
(19, 'admin_login_background', '3', NULL, '2026-04-30 09:28:09', '2026-07-28 04:37:11'),
(21, 'contact-us', '[\"1\"]', NULL, '2026-05-05 06:26:49', '2026-05-05 06:26:49'),
(22, 'home_discover', '[\"1\",\"2\",\"3\",\"2\"]', NULL, '2026-05-05 08:10:47', '2026-05-06 06:00:04'),
(23, 'contact-us_discover', '[\"1\",\"3\",\"3\"]', NULL, '2026-05-05 08:14:14', '2026-05-05 11:35:07'),
(24, 'home_', 'null', NULL, '2026-05-05 08:28:13', '2026-05-05 08:28:13'),
(25, 'home_slider', '[\"7\"]', NULL, '2026-05-05 08:30:18', '2026-05-05 10:36:39'),
(26, 'contact-us_slider', '[\"5\",\"6\",\"7\",\"5\"]', NULL, '2026-05-05 08:44:12', '2026-05-05 11:35:18'),
(27, 'home_blog', '[\"2\",\"2\"]', NULL, '2026-05-05 09:06:49', '2026-05-05 10:36:10'),
(29, 'home_discovers', '[\"1\",\"2\",\"3\",\"3\"]', NULL, '2026-05-05 09:41:32', '2026-05-05 09:41:32'),
(30, 'home_dropshipper_review', '[\"9\",\"6\",\"10\",\"13\"]', NULL, '2026-05-05 09:45:08', '2026-05-05 10:37:50'),
(31, 'home_dropshipper_categories', '[\"2\",\"3\",\"4\"]', NULL, '2026-05-05 10:34:41', '2026-05-05 11:37:08'),
(32, 'privacy-policy_dropshipper_cat', '[\"2\",\"3\",\"4\"]', NULL, '2026-05-05 11:34:11', '2026-05-05 11:34:11'),
(33, 'contact-us_blog', '[\"2\",\"2\"]', NULL, '2026-05-05 11:35:33', '2026-05-05 11:35:33'),
(34, 'contact-us_dropshipper_review', '[\"1\",\"4\",\"7\"]', NULL, '2026-05-05 11:35:50', '2026-05-05 11:35:50'),
(38, 'contact-us_dropshipper_categories', '[\"2\"]', NULL, '2026-05-05 11:42:25', '2026-05-05 11:42:25'),
(39, 'blog_blog', '[\"2\",\"3\",\"5\",\"12\",\"6\",\"34\",\"12\",\"40\",\"41\"]', NULL, '2026-05-06 09:29:33', '2026-05-07 06:21:01'),
(40, 'integration_slider', '[\"2\",\"3\"]', NULL, '2026-05-06 10:15:22', '2026-05-06 10:15:22'),
(41, 'blog_slider', '[\"5\",\"4\"]', NULL, '2026-05-07 05:09:37', '2026-05-07 05:26:40'),
(42, 'about-us_slider', '[\"4\",\"7\"]', NULL, '2026-05-07 08:46:54', '2026-05-07 08:49:25'),
(43, 'color_filter_activation', '1', NULL, '2026-05-10 12:15:22', '2026-06-07 12:07:49'),
(44, 'maintenance_mode', '0', NULL, '2026-06-24 09:53:55', '2026-06-24 09:53:56'),
(45, 'header_logo', '1', NULL, '2026-07-07 09:39:27', '2026-09-07 06:06:52'),
(46, 'helpline_number', '01934564322', NULL, '2026-07-07 09:39:27', '2026-08-02 06:07:41'),
(47, 'website_name', 'Enterprise', NULL, '2026-07-08 10:09:17', '2026-08-02 08:30:39'),
(48, 'site_motto', 'The No-1 Ecommerce Website in Bangladesh', NULL, '2026-07-08 10:09:17', '2026-08-02 08:30:39'),
(49, 'site_icon', '1', NULL, '2026-07-08 10:09:17', '2026-09-07 06:06:52'),
(50, 'base_color', '#F14969', NULL, '2026-07-08 10:09:17', '2026-08-02 08:25:40'),
(51, 'base_hov_color', '#fcfcfc', NULL, '2026-07-08 10:09:17', '2026-08-02 08:25:10'),
(52, 'whatsapp_number', '01', NULL, '2026-07-08 10:09:17', '2026-08-02 08:30:18'),
(53, 'footer_logo', '1', NULL, '2026-07-08 10:13:33', '2026-09-07 06:07:05'),
(54, 'about_us_description', 'Nittoz is a leading e-commerce platform that provides a wide range of products and services to customers around the world.', '0', '2026-07-08 10:13:33', '2026-09-07 06:07:05'),
(55, 'facebook_link', 'https://www.facebook.com', NULL, '2026-07-08 11:41:16', '2026-07-08 11:41:16'),
(56, 'twitter_link', 'https://twitter.com', NULL, '2026-07-08 11:41:16', '2026-07-08 12:07:02'),
(57, 'instagram_link', 'https://instagram.com', NULL, '2026-07-08 11:41:16', '2026-07-08 12:07:02'),
(58, 'youtube_link', 'https://www.youtube.com', NULL, '2026-07-08 11:41:16', '2026-07-08 12:01:29'),
(59, 'linkedin_link', 'https://linkedin.com', NULL, '2026-07-08 11:41:16', '2026-07-08 12:07:02'),
(60, 'frontend_copyright_text', '© 2026 Nittoz™. All Rights Reserved.', NULL, '2026-07-08 11:41:23', '2026-08-03 04:14:28'),
(61, 'payment_method_images', NULL, NULL, '2026-07-08 11:41:23', '2026-07-08 11:41:23'),
(62, 'contact_phone', '8801621027487', NULL, '2026-07-08 12:04:23', '2026-07-08 12:07:59'),
(63, 'contact_email', 'info@nittoz.com', NULL, '2026-07-08 12:04:23', '2026-07-08 12:07:59'),
(64, 'contact_address', 'Head Office: House#6, Level #3, Road-1/A, Sector #9, Housebuilding, Uttara, Dhaka/', 'en', '2026-07-08 12:04:23', '2026-07-08 12:07:59'),
(65, 'currency_setting', '{\"currency\":\"BDT\",\"currency_symbol\":\"\\u09f3\",\"is_currency_symbol\":true,\"currency_position\":\"before\",\"is_decimal\":true,\"decimal_digits\":3}', NULL, '2026-07-13 10:10:01', '2026-07-13 10:10:01'),
(66, 'currency', 'BDT', NULL, '2026-07-14 09:23:20', '2026-07-14 09:23:27'),
(67, 'currency_symbol', '৳', NULL, '2026-07-14 09:23:20', '2026-08-02 11:43:39'),
(68, 'is_currency_symbol', '1', NULL, '2026-07-14 09:23:20', '2026-08-02 08:58:04'),
(69, 'currency_position', 'before', NULL, '2026-07-14 09:23:20', '2026-07-14 09:23:20'),
(70, 'is_decimal', '1', NULL, '2026-07-14 09:23:20', '2026-08-02 08:58:04'),
(71, 'decimal_digits', '2', NULL, '2026-07-14 09:23:20', '2026-08-02 06:46:32'),
(73, 'loyalty', '{\"Star\":250,\"Gold\":900,\"Diamond\":4000,\"Platinum\":1500}', NULL, '2026-07-15 12:04:03', '2026-08-02 10:30:34'),
(74, 'facebook_pixel', '1', NULL, '2026-07-19 12:13:22', '2026-07-19 12:13:44'),
(75, 'google_analytics', '1', NULL, '2026-07-19 12:13:22', '2026-07-19 12:13:44'),
(76, 'counter_items', '[{\"number\":\"50K\",\"title\":\"Happy Customers\"},{\"number\":\"10K\",\"title\":\"Products\"},{\"number\":\"35K\",\"title\":\"asdasd\"},{\"number\":\"18K\",\"title\":\"Client\"}]', NULL, '2026-07-22 07:59:31', '2026-07-22 08:13:01'),
(77, 'home_sliders', '[\"8\",\"9\",\"10\",\"11\"]', NULL, '2026-07-23 08:45:37', '2026-07-23 08:45:37'),
(78, 'h_best_s_products', '[\"1\",\"2\",\"3\"]', NULL, '2026-07-23 08:52:06', '2026-07-23 08:52:06'),
(79, 'h_todays_d_products', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', NULL, '2026-07-23 08:52:06', '2026-07-23 08:52:06'),
(80, 'h_new_a_products', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', NULL, '2026-07-23 08:52:06', '2026-07-23 08:52:06'),
(81, 'h_featured_products', '[\"1\",\"2\",\"3\",\"4\",\"5\"]', NULL, '2026-07-23 08:52:06', '2026-07-23 08:52:06'),
(82, 'home_campaigns', '[\"5\"]', NULL, '2026-07-23 08:52:40', '2026-07-26 05:20:26'),
(83, 'home_categories', '[\"48\",\"50\",\"51\",\"52\",\"53\",\"55\",\"57\",\"58\"]', NULL, '2026-07-25 06:10:10', '2026-07-25 06:10:10'),
(84, 'h_category_p_limit', '6', NULL, '2026-07-25 06:10:10', '2026-07-25 06:10:10'),
(85, 'meta_title', 'Nittoz', NULL, '2026-07-28 04:35:46', '2026-07-28 04:35:57'),
(86, 'meta_description', 'Nittoz', NULL, '2026-07-28 04:35:46', '2026-08-02 08:31:50'),
(87, 'meta_keywords', 'Nittoz', NULL, '2026-07-28 04:35:46', '2026-08-02 08:31:50'),
(88, 'meta_image', '1566', NULL, '2026-07-28 04:35:46', '2026-08-02 08:30:11'),
(89, 'layout_breakpoints', '{\"homePage\":{\"mobile\":1,\"tablet\":2,\"laptop\":4,\"desktop\":4,\"ultrawide\":6},\"withFilter\":{\"mobile\":2,\"tablet\":2,\"laptop\":3,\"desktop\":4,\"ultrawide\":5},\"fullLayout\":{\"mobile\":2,\"tablet\":3,\"laptop\":4,\"desktop\":5,\"ultrawide\":6}}', NULL, '2026-08-02 05:28:18', '2026-08-02 05:46:17'),
(90, 'top_bar_offer', NULL, NULL, '2026-09-07 06:06:52', '2026-09-07 06:06:52'),
(91, 'DROPLOO_APP_KEY', 'erwerwer12', NULL, '2026-09-07 06:33:47', '2026-09-15 12:05:42'),
(92, 'DROPLOO_APP_SECRET', 'werwerwe', NULL, '2026-09-07 06:33:47', '2026-09-15 12:02:50'),
(93, 'DROPLOO_USERNAME', 'werwerwerwerwe', NULL, '2026-09-07 06:33:47', '2026-09-15 12:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('flat','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `name`, `slug`, `description`, `start_date`, `end_date`, `discount_amount`, `discount_type`, `status`, `image`, `created_at`, `updated_at`) VALUES
(3, 'weqweqweqwe', 'weqweqweqwe', 'qweqweqweqw', '2026-05-20', '2026-05-30', 20.00, 'flat', '', '20', '2026-05-21 09:08:46', '2026-07-23 09:29:16'),
(4, 'Test', 'test', 'aeqweqqw', '2026-05-21', '2026-05-30', 50.00, 'flat', '', '19', '2026-05-21 11:43:46', '2026-05-23 10:47:53'),
(5, 'Test Campaign', 'test-campaign', 'Test Campaign', '2026-07-23', '2027-02-28', 150.00, 'flat', 'active', '1571', '2026-05-21 12:21:25', '2026-08-02 06:18:06'),
(6, 'asdasdas', 'asdasdas', 'asdasdasda', '2026-05-05', '2026-05-20', 60.00, 'flat', '', '14', '2026-05-21 12:22:32', '2026-07-23 09:29:14'),
(7, 'Test Campaign New2', 'test-campaign-new2', 'Test Campaign New2', '2026-06-13', '2026-06-30', 20.00, 'flat', '', '28', '2026-06-13 05:18:31', '2026-07-23 09:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_products`
--

CREATE TABLE `campaign_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `temp_user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `tax` double(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` double(20,2) NOT NULL DEFAULT '0.00',
  `shipping_area` int(11) NOT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` double(20,2) NOT NULL DEFAULT '0.00',
  `product_referral_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` float NOT NULL,
  `coupon_applied` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `owner_id`, `user_id`, `temp_user_id`, `address_id`, `product_id`, `sku`, `variation`, `price`, `tax`, `shipping_cost`, `shipping_area`, `shipping_type`, `pickup_point`, `discount`, `product_referral_code`, `coupon_code`, `coupon_discount`, `coupon_applied`, `quantity`, `created_at`, `updated_at`) VALUES
(5, NULL, NULL, 'guest_abc121', NULL, 3608, 'TES479-MIS-12A', '{\"Color\":\"Red\",\"Size\":\"S\"}', 600.00, 0.00, 0.00, 0, 'flat_rate', NULL, 20.00, NULL, NULL, 0, 0, 2, '2026-07-02 04:53:16', '2026-07-02 04:53:16'),
(6, NULL, NULL, 'guest_abc122', NULL, 3608, 'TES479-MIS-12A', '{\"Color\":\"Red\",\"Size\":\"S\"}', 600.00, 0.00, 0.00, 0, 'flat_rate', NULL, 20.00, NULL, NULL, 0, 0, 2, '2026-07-02 04:53:16', '2026-07-02 04:53:16'),
(11, NULL, NULL, 'guest_abc1232', NULL, 3608, 'TES257-MIS-56A', '{\"Color\":\"Red\",\"Size\":\"S\"}', 620.00, 0.00, 0.00, 0, 'flat_rate', NULL, 20.00, NULL, NULL, 0, 0, 2, '2026-07-09 06:17:07', '2026-07-09 06:17:07'),
(12, NULL, NULL, 'guest_abc123223423432', NULL, 3608, 'TES257-MIS-56A', '{\"Color\":\"Red\",\"Size\":\"S\"}', 620.00, 0.00, 0.00, 0, 'flat_rate', NULL, 20.00, NULL, NULL, 0, 0, 6, '2026-07-09 06:25:12', '2026-07-09 06:36:43'),
(45, NULL, 59, NULL, NULL, 408, NULL, '{\"sku\":null,\"color\":null,\"attribute_value\":null}', 1500.00, 0.00, 0.00, 0, 'flat_rate', NULL, 50.00, NULL, NULL, 0, 0, 1, '2026-07-26 11:42:10', '2026-07-26 11:42:10'),
(46, NULL, 59, NULL, NULL, 407, NULL, '{\"sku\":null,\"color\":null,\"attribute_value\":null}', 1000.00, 0.00, 0.00, 0, 'flat_rate', NULL, 450.00, NULL, NULL, 0, 0, 1, '2026-07-26 11:42:13', '2026-07-26 11:42:13'),
(47, NULL, 59, NULL, NULL, 1, NULL, '{\"sku\":null,\"color\":null,\"attribute_value\":null}', 1350.00, 0.00, 0.00, 0, 'flat_rate', NULL, 200.00, NULL, NULL, 0, 0, 2, '2026-07-26 11:43:12', '2026-07-26 11:53:14'),
(50, NULL, NULL, 'guest_abc1232234234321111111', NULL, 1, NULL, '{\"sku\":null,\"color\":null,\"attribute_value\":null}', 1350.00, 0.00, 0.00, 0, 'flat_rate', NULL, 200.00, NULL, NULL, 0, 0, 2, '2026-07-26 11:50:39', '2026-07-26 11:52:20'),
(51, NULL, NULL, 'guest_abc1232234234321111111111', NULL, 1, NULL, '{\"sku\":null,\"color\":null,\"attribute_value\":null}', 1350.00, 0.00, 0.00, 0, 'flat_rate', NULL, 200.00, NULL, NULL, 0, 0, 1, '2026-07-26 11:52:26', '2026-07-26 11:52:26'),
(52, NULL, 59, NULL, NULL, 3, 'KID-3-VAR1', '{\"sku\":\"KID-3-VAR1\",\"color\":null,\"attribute_value\":\"Age 3\\/4\"}', 1090.00, 0.00, 0.00, 0, 'flat_rate', NULL, 0.00, NULL, NULL, 0, 0, 1, '2026-07-26 11:53:21', '2026-07-26 11:53:21');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hero_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `category_name`, `category_image`, `hero_image`, `slug`, `title`, `sub_title`, `description`, `button_name`, `button_link`, `created_at`, `updated_at`) VALUES
(48, 2, 'Home Decor', 'https://backend.droploo.com/category/1750765246.webp', '1580', 'home-decor', 'Home Decor', 'Beautiful Home Decoration Products', 'Explore premium home decoration products.', 'Shop Now', '/category/home-decor', '2026-06-21 10:56:57', '2026-08-03 06:55:34'),
(50, 3, 'Electronics', 'https://backend.droploo.com/category/1751088909.jpg', '1579', 'electronics', 'Electronics', 'Latest Electronics Collection', 'Find trending electronic products.', 'Shop Now', '/category/electronics', '2026-06-21 10:56:57', '2026-08-03 06:55:44'),
(51, 4, 'Life Style', 'https://backend.droploo.com/category/1751089046.jpg', '1576', 'life-style', 'Life Style', 'Modern Lifestyle Products', 'Upgrade your lifestyle with quality products.', 'Shop Now', '/category/life-style', '2026-06-21 10:56:57', '2026-08-03 06:55:55'),
(52, 5, 'Smart Gadgets', 'https://backend.droploo.com/category/1751089073.jpg', '1577', 'smart-gadgets', 'Smart Gadgets', 'Smart Technology Collection', 'Discover innovative gadgets.', 'Shop Now', '/category/smart-gadgets', '2026-06-21 10:56:57', '2026-08-03 06:56:06'),
(53, 6, 'Metal Items', 'https://backend.droploo.com/category/1751089102.jpg', '1578', 'metal-items', 'Metal Items', 'Durable Metal Products', 'High-quality metal products for everyday use.', 'Shop Now', '/category/metal-items', '2026-06-21 10:56:57', '2026-08-03 06:57:12'),
(54, 7, 'All Foods', 'https://backend.droploo.com/category/1751089135.jpg', '1580', 'all-foods', 'All Foods', 'Food & Grocery Collection', 'Browse food and grocery products.', 'Shop Now', '/category/all-foods', '2026-06-21 10:56:57', '2026-08-03 06:57:00'),
(55, 8, 'Home & Kitchen', 'https://backend.droploo.com/category/1751089170.png', '1578', 'home-kitchen', 'Home & Kitchen', 'Kitchen Essentials', 'Everything you need for home and kitchen.', 'Shop Now', '/category/home-kitchen', '2026-06-21 10:56:57', '2026-08-03 06:56:45'),
(56, 9, 'Men\'s Fashions', 'https://backend.droploo.com/category/1751293135.jpg', '1579', 'mens-fashions', 'Men\'s Fashions', 'Fashion For Men', 'Latest men fashion products.', 'Shop Now', '/category/mens-fashions', '2026-06-21 10:56:57', '2026-08-03 06:56:35'),
(57, 10, 'Woman\'s Fashion', 'https://backend.droploo.com/category/1751295131.png', '1576', 'womans-fashion', 'Woman\'s Fashion', 'Fashion For Women', 'Stylish fashion collection for women.', 'Shop Now', '/category/womans-fashion', '2026-06-21 10:56:57', '2026-08-03 06:56:24'),
(58, 1, 'Kid\'s Fashion', 'https://backend.droploo.com/category/1752747161.jpg', '1578', 'kids-fashion', 'Kid\'s Fashion', 'Fashion For Kids', 'Trendy fashion products for kids.', 'Shop Now', '/category/kids-fashion', '2026-06-21 10:56:57', '2026-08-04 09:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2026-05-11 04:57:09'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `compares`
--

CREATE TABLE `compares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `full_name`, `email`, `subject`, `status`, `message`, `created_at`, `updated_at`) VALUES
(2, 'Arman', 'arman@mail.com', 'Subject', 'read', 'Message', '2026-05-04 06:21:18', '2026-05-04 06:22:12'),
(3, 'Arman', 'arman@mail.com', 'Subject', 'read', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\n\n', '2026-05-04 06:21:18', '2026-05-04 06:29:28'),
(5, 'Test', 'test@mail.com', 'Test Subject', 'read', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like', '2026-05-07 10:36:36', '2026-05-07 10:36:55'),
(6, 'Test', 'test@mail.com', 'Test Subject', 'unread', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like', '2026-05-07 10:43:44', '2026-05-07 10:43:44'),
(7, 'Test', 'test@mail.com', 'Test Subject', 'unread', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like', '2026-05-07 10:52:19', '2026-05-07 10:52:19'),
(8, 'Test', 'test@mail.com', 'Test Subject', 'read', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like', '2026-05-07 10:52:37', '2026-05-12 05:24:07'),
(9, 'Nash Vinson', 'zojarofi@mailinator.com', 'Animi mollit culpa', 'unread', 'Iste hic corporis co', '2026-07-26 09:57:54', '2026-07-26 09:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `title_1`, `count_1`, `icon_1`, `title_2`, `count_2`, `icon_2`, `title_3`, `count_3`, `icon_3`, `title_4`, `count_4`, `icon_4`, `created_at`, `updated_at`) VALUES
(10, NULL, 'Cum aut sapiente inv', '12', 'Quibusdam magni non', 'In dolore est id odi', '10', 'Possimus itaque ad', 'Eaque libero cillum', '11', 'Eum nesciunt ullam', 'Vitae quidem est au', '10', '2026-04-30 10:32:46', '2026-04-30 10:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cart_base',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('percent','flat') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `start_date` bigint(20) DEFAULT NULL,
  `end_date` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `user_id`, `type`, `code`, `details`, `discount`, `discount_type`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'cart_base', 'ssetwer43', '{\"min_buy\": \"1000\", \"max_discount\": \"200\"}', 100.00, 'flat', 1778954400, 1782756000, '2026-05-17 06:13:11', '2026-05-17 06:13:11'),
(4, 1, 'product_base', 'sdfsdfsd', '[{\"product_id\": \"1\"}, {\"product_id\": \"2\"}, {\"product_id\": \"6\"}]', 100.00, 'percent', 1778954400, 1782756000, '2026-05-17 06:13:11', '2026-05-17 06:13:11'),
(5, 1, 'product_base', 'efsfs', '[{\"product_id\": \"1\"}, {\"product_id\": \"2\"}, {\"product_id\": \"6\"}]', 20.00, 'flat', 1778954400, 1778954400, '2026-05-17 07:48:41', '2026-05-17 07:48:41'),
(6, 1, 'cart_base', 'Deal10per', '{\"min_buy\": \"1000\", \"max_discount\": \"100\"}', 10.00, 'percent', 1780509600, 1785434400, '2026-06-04 04:22:01', '2026-06-04 04:22:01'),
(7, 1, 'cart_base', 'DicountTaka200', '{\"min_buy\": \"300\", \"max_discount\": \"300\"}', 200.00, '', 1784311200, 1788112800, '2026-07-18 08:25:56', '2026-07-18 08:25:56'),
(8, 1, 'product_base', 'Product100', '[{\"product_id\": \"3222\"}]', 100.00, '', 1782842400, 1788112800, '2026-07-18 10:53:35', '2026-07-18 10:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `user_id`, `coupon_id`, `created_at`, `updated_at`) VALUES
(23, 48, 7, '2026-07-19 07:00:51', '2026-07-19 07:00:51');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL,
  `customer_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `phone`, `address`, `country`, `city`, `postal_code`, `balance`, `banned`, `point`, `customer_status`, `created_at`, `updated_at`) VALUES
(1, 1, '01700000000', 'Dhaka, Bangladesh', 'Bangladesh', 'Dhaka', '1200', 1133.00, 0, 11, '', '2026-05-18 09:44:06', '2026-05-18 12:32:38'),
(2, 2, '+1 (314) 176-1935', 'Dhaka, Bangladesh', 'Bangladesh', 'Dhaka', '1200', 735.00, 0, 7, '', '2026-05-18 09:44:06', '2026-05-18 12:32:38'),
(3, 3, '01833022226', 'Dhaka, Bangladesh', 'Bangladesh', 'Dhaka', '1200', 3088.00, 0, 30, '', '2026-05-18 09:44:06', '2026-05-18 12:32:38'),
(4, 4, '01833022226', 'Dhaka, Bangladesh', 'Bangladesh', 'Dhaka', '1200', 5090.00, 0, 50, '', '2026-05-18 09:44:06', '2026-05-21 06:32:53'),
(8, 50, '01923453234', 'asas', NULL, NULL, NULL, 0.00, 0, 0, '', '2026-06-27 12:19:40', '2026-06-27 12:19:40'),
(9, 9, '01833022226', 'Dhaka, Bangladesh', 'Bangladesh', 'Dhaka', '1200', 5090.00, 0, 50, '', '2026-05-18 09:44:06', '2026-05-21 06:32:53'),
(10, 52, '01845654345', 'Dhaka', NULL, NULL, NULL, 0.00, 0, 0, '', '2026-06-27 12:24:09', '2026-06-27 12:24:09'),
(11, 48, '01700000000', 'Dhaka, Bangladesh', 'Bangladesh', 'Dhaka', '1200', 1133.00, 0, 1100, '', '2026-05-18 09:44:06', '2026-05-18 12:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `damage_products`
--

CREATE TABLE `damage_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `admin_note` text COLLATE utf8mb4_unicode_ci,
  `vendor_note` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','received','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `given_by` bigint(20) UNSIGNED DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discovers`
--

CREATE TABLE `discovers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `main_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discovers`
--

INSERT INTO `discovers` (`id`, `main_image`, `avatar_image`, `title`, `sub_title`, `description`, `button_text`, `button_url`, `created_at`, `updated_at`) VALUES
(1, '17', '13', 'Quasi mollit id corasas', 'Laboris ut est quo us', 'Qui aut irure omnis s', 'Voluptas dolores neq', 'https://www.pilyxunozaja.com', '2026-05-04 08:43:27', '2026-05-04 08:46:07'),
(2, '18', '14', 'Quia commodi reicien', 'Veniam aperiam temp', 'Molestias nihil enim', 'Hic sed quisquam nat', 'https://www.sunyj.ca', '2026-05-05 06:41:14', '2026-05-05 06:41:14'),
(3, '14', '14', 'Vitae eum omnis veli', 'Minus eum earum ipsu', 'Pariatur Nulla perf', 'Et id eligendi tota', 'https://www.bujugiribo.tv', '2026-05-05 06:41:33', '2026-05-05 06:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `dropshiper_reviews`
--

CREATE TABLE `dropshiper_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dropshiper_reviews`
--

INSERT INTO `dropshiper_reviews` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Perspiciatis delect', '17', '1', '2026-05-02 06:23:14', '2026-05-02 08:44:19'),
(3, 'Et molestiae archite', '15', '1', '2026-05-02 08:25:40', '2026-05-02 08:44:19'),
(4, 'Reiciendis et rerum', '18', '1', '2026-05-02 08:25:57', '2026-05-02 08:44:17'),
(5, 'Doloribus doloremque', '18', '1', '2026-05-02 08:26:07', '2026-05-02 08:44:16'),
(6, 'Esse in magna dolor', '6', '1', '2026-05-02 08:26:29', '2026-05-02 08:45:01'),
(7, 'Velit numquam fugiat', '18', '1', '2026-05-02 08:45:11', '2026-05-02 08:45:11'),
(8, 'Anim cillum deserunt', '18', '1', '2026-05-02 08:45:41', '2026-05-02 08:45:41'),
(9, 'Ullam sit doloremque', '16', '1', '2026-05-02 08:46:04', '2026-05-02 08:46:04'),
(10, 'Sunt ipsum et sunt', '17', '1', '2026-05-02 08:46:14', '2026-05-02 08:46:14'),
(11, 'Enim sint quia adipi', '18', '1', '2026-05-02 08:46:39', '2026-05-02 08:46:39'),
(12, 'Qui nesciunt ipsum', '17', '1', '2026-05-02 08:46:51', '2026-05-02 08:47:07'),
(13, 'Consequatur dolorem', '18', '0', '2026-05-02 08:52:06', '2026-05-12 05:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `dropshippers`
--

CREATE TABLE `dropshippers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dropshipper_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `total_deposit` double NOT NULL DEFAULT '0',
  `total_credit` double NOT NULL DEFAULT '0',
  `total_withdraw` double NOT NULL DEFAULT '0',
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dropshippers`
--

INSERT INTO `dropshippers` (`id`, `name`, `email`, `password`, `dropshipper_id`, `package_id`, `total_deposit`, `total_credit`, `total_withdraw`, `user_name`, `domain_name`, `phone`, `address`, `image`, `app_key`, `app_secret`, `is_approved`, `created_at`, `updated_at`) VALUES
(15, 'Md Zillur Rahman', 'zillur1976@gmail.com', '$2y$10$4Fcxpfgc/3De9XlOwDUlc.O1KggNb7ZNIoIfGHxUPCJi8SLPr7DQ.', 928, 1, 0, 0, 0, 'md-zillur-rahman_oxygen69com', 'https://oxygen69.com/', '1912082633', 'Dhaka, Bangladesh', NULL, 'RFKYKP0SYHEEVH0W', 'IM95foAGrwDtr1icwk5sPKygDskB2sja', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(16, 'Mehedi Hasan', 'badalmiah459@gmail.com', '$2y$10$rTFm9gmuTEFFbIeV0fTrXuUMP1zB9EY3QtlYyxEAznyw7S1ekAQ5u', 927, 1, 0, 0, 0, 'mehedi-hasan_udoymartcom', 'https://udoymart.com/', '1728902705', 'Dhaka, Bangladesh', NULL, 'FJLFECKA7SWYVWQ0', 'gsPazed45wUhYOkvz2woXWHJke2IYijh', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(17, 'Md Sohrab Miah', 'sohrabali5640@gmail.com', '$2y$10$bvkENCL3p86TImu9SdecIeDYia8Xxh40sh.FLCNFYSQ8h9tn9i6be', 926, 4, 0, 0, 0, 'md-sohrab-miah_afiyamartcom', 'https://afiyamart.com/', '1728249904', 'Dhaka, Bangladesh', NULL, 'BUDH4RGMIN2K4O1T', 'xtD1NeJjGWpgkAvXEL2MRw75UOmtSFI6', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(18, 'Miraz Hossen', 'mirazhosse345@gmail.com', '$2y$10$a0JZSk69/zc.ZFFyIUc48.HOnri0L/fQkXwOOBkR1aDNYIaQrQ32y', 924, 4, 0, 0, 0, 'miraz-hossen_deenwacom', 'https://deenwa.com/', '1856727684', 'Dhaka, Bangladesh', NULL, 'Y1TCG9S7ZD9F4J4N', 'kJUXgNh9DTNjIBpuup2VRkthF8qOMs2H', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(19, 'Sha Poran', 'mdshaporan01724@gmail.com', '$2y$10$JGRz.WekBOInfJRbns7TNuoD5CfJs1llMtPL8jH8U/DX2x9pcQ0u2', 923, 4, 0, 0, 0, 'sha-poran_nexrabdcom', 'https://nexrabd.com/', '1304535678', 'Dhaka, Bangladesh', NULL, 'XV9R3F6ZDDBHDMM5', 'MCxMxYOSCBN7x35UdVxSBulD5C3eenCn', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(20, 'Jubayer Hossain', 'jubayerahmad633184@gmail.com', '$2y$10$3aDrelwrAC.es9dR.uO/SuwkUAM82lxD98yLHA.sBbBv28ACKGbdC', 922, 4, 0, 0, 0, 'jubayer-hossain_ebilbarcom', 'https://ebilbar.com/', '1316268844', 'Dhaka, Bangladesh', NULL, 'ZLGMQNPNQJLOFWZA', 'c9HBBb6NWlLTqF1Z2dZAp36O3nYZd3VE', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(21, 'Md. Abul Mahfuz', 'mahfuz2114@gmail.com', '$2y$10$i2e3/LuvkmxEZGAVO5sJzOYPqEH0ORxR5VVTfsMbsb.HsLAK7UiUq', 921, 4, 0, 0, 0, 'md-abul-mahfuz_needwacom', 'https://needwa.com/', '1911572136', 'Dhaka, Bangladesh', NULL, 'EAXAP4MRFCYUBC3T', 'S7ZEzrqroWUQhvZ4z54TPT6yrpg97LM4', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(22, 'Md Amir Hossain', 'ityadidijitalamarketa@gmail.com', '$2y$10$y88Ic7k/p3DUD6lKfeilQey9b9I3hdUzTmaqZnr/rLHHO/I7J0uQu', 920, 1, 0, 0, 0, 'md-amir-hossain_jilbabgallarycom', 'https://jilbabgallary.com/', '1329433391', 'Dhaka, Bangladesh', NULL, 'L0XGBLU8JSKAS5GA', 'UI4w0nntTEINgbJGGWMValTOGevMSw2K', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(23, 'Md Nowshad Kamal Sikder', 'nowshadsikder2021@gmail.com', '$2y$10$TfPuYa/eqJnfTWzy0edeKeCqWW/CXEevU/25VNAjsUvrG7zycHeHS', 917, 4, 0, 0, 0, 'md-nowshad-kamal-sikder_eserazcom', 'https://eseraz.com/', '1851111058', 'Dhaka Bangladesh', NULL, 'GOLQJ52YEPGFYHIN', 'XGcZxHZcKu6o7pqBnwmIbXSueEy24nwX', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(24, 'noor mahammad', 'noormohammad71978@yahoo.com', '$2y$10$H12qHIcOYu1Eu/q2F1RzY.8es44g2WqXf9FAusD9dOjdXk7Wsvfo6', 916, 1, 0, 0, 0, 'noor-mahammad_noorbilcom', 'https://noorbil.com/', '1840809977', 'Dhaka Bangladesh', NULL, 'TCCGQ50OGOWNDCMS', 'NGmc5oKvx4WpII9wjPs4NrGeqL2I7v52', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(25, 'Syed Rumel Ahmed', 'rumel7759@gmail.com', '$2y$10$HTr1LoJhLgHfqQSP4DMPeu90sBtGRaRX5CZN/aUHykHs5efbzldKO', 915, 6, 0, 0, 0, 'syed-rumel-ahmed_meghcartcom', 'https://meghcart.com/', '1784633330', 'Dhaka Bangladesh', NULL, 'UZMXOTXJBTXE11HS', 'gEnfmttAD9hTytitWQETpeTgbQvo960D', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(26, 'Asma Akter', 'asmaakterbeauty1985@gmail.com', '$2y$10$9/WYZiOxuhSay/MVdmPo3.bOlehSjxFaHXT8L5p9i4vKbP.SjKdTe', 914, 4, 0, 0, 0, 'asma-akter_veloralacom', 'https://velorala.com/', '1731201658', 'Dhaka Bangladesh', NULL, 'O7590IGDVAJ8AIDU', 'vkzzYUABv2I2gbhkY0P2NpGdr96Me8TF', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(27, 'Md. Amran Hossain', 'amranhossainmolla@gmail.com', '$2y$10$Y2ptQewlrMl.tkF0guP1J.esnrKXvSvCc8PJuMq0.pfK/vOhLDtMm', 913, 1, 0, 0, 0, 'md-amran-hossain_ihsanovacom', 'https://ihsanova.com/', '1816696675', 'Dhaka Bangladesh', NULL, 'NLABJ9RHOW9VPML8', '2CQswzlJgQgR83W0ePDHwO0gb9vixqqd', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(28, 'Naim & Saif', 'md.naim19may@gmail.com', '$2y$10$TQDutcsy9uJiVWb1SpxSqOCQd.gQ1w4fDKZWgrbgiBHjKstmQee76', 912, 4, 0, 0, 0, 'naim-saif_brandbilashcom', 'https://brandbilash.com/', '1707684856', 'Dhaka Bangladesh', NULL, '1PRERG5WYPL6A6VD', 'HdCSaNfHBzLP1egoGaB9xOuyByLRfsjY', 1, '2026-07-28 08:46:00', '2026-07-28 08:46:00'),
(29, 'Mohammad Zahirul Alam', 'zahirullm@gmail.com', '$2y$10$nMEsZ2YEqLLU2SJ4Pt/mauIn9QkwaW4GeoFHq/6t1NafL22D9xNP2', 910, 4, 0, 0, 0, 'mohammad-zahirul-alam_aliyaamartcom', 'https://aliyaamart.com/', '1911322805', 'Dhaka Bangladesh', NULL, 'MBNWB7SZGHTC9UKX', 'RO0IJtw2qbt42E0dbjeWDWieS8TCMNZD', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(30, 'Shofiqul Kabir', 'kabirpolash79@gmail.com', '$2y$10$0/zdMhTaVNr/n0WnyaBU.O0if8tQhlUcP5GsMdMltU77b7UI7R6YC', 909, 4, 0, 0, 0, 'shofiqul-kabir_safabaycom', 'https://safabay.com/', '1712575221', 'Dhaka Bangladesh', NULL, 'YJN7KGRTCLNIMZRB', 'AjW3dIPPtpsOcpSG534hn0gB5KNw7RFw', 1, '2026-07-28 08:46:01', '2026-07-28 11:40:49'),
(31, 'Ariful Emon', 'arifulemon5@gmail.com', '$2y$10$3sbur6OVjbBJq/uoXmeXkOv3PxYoBvVYwvyS7l3rEw.o.7wG.2gz6', 907, 4, 0, 0, 0, 'ariful-emon_adizancom', 'https://adizan.com/', '1701834949', 'Dhaka Bangladesh', NULL, '3GS5WYEFQRQERAXU', 'mNE6PkLCPgWg3pryot1NfLPnrA5HaPFq', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(32, 'Md.Tazul islam', 'islamtazul4411@gmail.com', '$2y$10$oNw08BvWbyiOUnge43aZd.XAEtKdyoy4g6iUvE3OhEUVioYhnDNHa', 906, 4, 0, 0, 0, 'mdtazul-islam_tazexclusivecom', 'https://tazexclusive.com/', '1737441153', 'Dhaka Bangladesh', NULL, '27LCBMFC3RDY4KII', 'JskiUPz7yMBnpA0PObQr9CdbHtQqsTL4', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(33, 'Md. Maksodur Rahman', 'mudarris.maksodur@gmail.com', '$2y$10$.sEJg9IfNA8LEp/bVc4o9..Wi7TV5PPi1FYW0/xxQh5oBzZELWv7q', 905, 6, 0, 0, 0, 'md-maksodur-rahman_successmartbdcom', 'https://successmartbd.com/', '1881502744', 'Raypur Bazar, Raypur,, Laksmipur,', NULL, 'X2PFKN5KAZUVWWD9', 'D2E5a0LyiC9YA3dmb3dhKJPuLCPjQewa', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(34, 'Mohammad Rifat', 'taqyran@gmail.com', '$2y$10$vpWDbqiJc3n0IXcxRomtgOYFv0js0K2LarD.by0PsplrJP1CTbDTC', 904, 1, 0, 0, 0, 'mohammad-rifat_taqyrancom', 'https://taqyran.com/', '1825081706', 'Dhaka Bangladesh', NULL, '9PVZBQ6TADRI2YKO', 'isyDvODqPNl0rUlKt5ZBy8bCGUt9Oal3', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(35, 'MD ABUTALEP MIA', 'abutalep92@gmail.com', '$2y$10$0PiaBkzxTeNfC5DFAKs/gO2dfZ2OoU4AsPb3lcIcPe7hgMmsCvyam', 903, 2, 0, 0, 0, 'md-abutalep-mia_ilmanycom', 'https://ilmany.com/', '1744456392', 'Dhaka Bangladesh', NULL, 'Z0EIX909WLZSAPWW', 'wduZiIpEp9nJ75uwlVmcbGbfKE4Uc6la', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(36, 'Sajjad Hossain', 'hossain10-1193@s.diu.edu.bd', '$2y$10$ijfOozaWgTa5eKXhaw3Uw.3s1GyJE7OAYZn3wp55hYwkTugjtuRQG', 902, 3, 0, 0, 0, 'sajjad-hossain_sarabelabdcom', 'https://sarabelabd.com/', '1317397910', 'Dhaka Bangladesh', NULL, 'OU3NV3N8RP9LPLHB', 'F7kUExrcd2JY8405gyVCT1E9C7OQNIW1', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(37, 'Nazrul Islam', 'nazrulex143@gmail.com', '$2y$10$nBt.l5PQ8rnvKiCuKklCAecVA/XUnRzlkEsgEHb9ZUFCHyIaVGxH.', 901, 4, 0, 0, 0, 'nazrul-islam_nurianmartcom', 'https://nurianmart.com/', '1627852123', 'Dhaka, Bangladesh', NULL, 'TXM82UB5UMRIUQYS', 'dqTV0TIs191peTwO9ylFocQzQLOhAIK7', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(38, 'Mohammad Nazrul Islam', 'tijara.24bd@gmail.com', '$2y$10$cTtsr2jFpdUGTw1mIeU2KuIEAry9fJ0Z/voB/L2XP1ynZfjlaN7tC', 900, 2, 0, 0, 0, 'mohammad-nazrul-islam_tijara24com', 'https://tijara24.com/', '1832821717', 'Dhaka Bangladesh', NULL, '2MTPCDT2YLGSRYQC', '4lJSxZJJ9yNNdAQoPPsia5l2UqJuYJom', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(39, 'Dedarul Islam', 'dedarulislam1608@gmail.com', '$2y$10$Jt/tyYY6/yieA3prEaOP3el5H9hBfMlojCFwOkTkD5ViIcmRtR8Ha', 899, 4, 0, 0, 0, 'dedarul-islam_nirjonacom', 'https://nirjona.com/', '1816528855', 'Dhaka Bangladesh', NULL, 'Q1BMQMTKBPWKVC39', 'RoM05WT3qhi4zKmqmqfWbQIUYGpKixsX', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(40, 'Jonaed Hossain', 'jonaed1595@gmail.com', '$2y$10$wVmKJPiyHTE1gMXDAM5b1.jcshXQtN9X9kXlXivEJuSwNdZ33zxNK', 898, 4, 0, 0, 0, 'jonaed-hossain_nuqabacom', 'https://nuqaba.com/', '1711791638', 'Dhaka Bangladesh', NULL, 'SUL7V1BCVO2MDKNI', 'r1jCWDE5Ympc8RnbSuOkzGC9BVfJaarq', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(41, 'Bahar Ullah', 'mdbaharullah9935@gmail.com', '$2y$10$B3Wi8AzLfvAi7KPinHwx4O2GTw4BV2/FMSmK8MXNGsl037BRmCO/W', 897, 1, 0, 0, 0, 'bahar-ullah_zinorashopcom', 'https://zinorashop.com/', '1796633517', 'Dhaka Bangladesh', NULL, 'ODYIFOJ5P2BCDGWV', 'lwQnY08r3qhM34n61MEhpyU7VOT8Jhig', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(42, 'Mohammad miskat', 'miskatbinhossain6@gmail.com', '$2y$10$wV64y8GL47z2srQNI2/D6.lc/bOc5MG20oDsNcApJWwff2qV8sZ/u', 886, 3, 0, 0, 0, 'mohammad-miskat_yanorincom', 'https://yanorin.com', '1880307190', 'Anowara,Chattagram,Bangladesh', NULL, '0EDUEA8LYS21HXOK', 'gbJM6MEvibZ1XfrdePhgiDuvZ9k1zvP0', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(43, 'MD MOSHIUR RAHMAN RUPAK', 'moshiur9392@gmail.com', '$2y$10$o8j2ZyfYKLzF4BwCbnZEqOAeyVkqf0xMBv7q0gr4/xtcf6apxvNle', 896, 4, 0, 0, 0, 'md-moshiur-rahman-rupak_munamycom', 'https://munamy.com/', '1611440925', 'Dhaka Bangladesh', NULL, 'G8BG4GMZFSBNDC4B', 'GTFSavs0fNHdOEi38mETPl07MGQfoJea', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(44, 'mohammed Zakir hossain', 'jakirhossain30333@gmail.com', '$2y$10$Pne0FpLud3hOKsjAiRYs/OWkXc6LMG2nsEyqxc3HtD09FbxBfSyCa', 895, 4, 0, 0, 0, 'mohammed-zakir-hossain_probashimarketcom', 'https://probashimarket.com/', '1782851236', 'Dhaka Bangladesh', NULL, '3YOHFFTNOOBD0LOU', 'yfvcpRRg9EWmVV0wBk6yXKwzOFSbuvjs', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(45, 'Md.Kamal Hossain', 'kamalraj6490@gmail.com', '$2y$10$B3Dqreziam2rKdpTbo4P4urBKRV0gcmHsH8zAts2VIGYgkbzyBiWi', 894, 4, 0, 0, 0, 'mdkamal-hossain_mettoxcom', 'https://mettox.com/', '1717516490', 'Dhaka Bangladesh', NULL, 'XKLIAMSKYNMPQXWB', 'BowXF57VywI4Vx750nUyoVZdaFw8rHx5', 1, '2026-07-28 08:46:01', '2026-07-28 08:46:01'),
(46, 'Rafique khokon', 'rafiqctg21@gmail.com', '$2y$10$5Q4WZtLlZbC.J4pPHz2S3ujDwlI4djm5.5e/Ut/BoFk2R/EMYUmFK', 893, 4, 0, 0, 0, 'rafique-khokon_etrendizcom', 'https://etrendiz.com/', '1717453267', 'Dhaka Bangladesh', NULL, '6NU22AMA8YKNCW6M', 'acFQVex7Jyx6nTxIfrK77wZxALwrEVrE', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(47, 'Ariful Islam', 'arif587843@gmail.com', '$2y$10$hYLdUCbsloHkpzHAIaVp0eJ3vcy8ZKMfdey79BVM41Xh/rUgyPxrm', 892, 4, 0, 0, 0, 'ariful-islam_hridoyakabacom', 'https://hridoyakaba.com/', '1720890155', 'Dhaka Bangladesh', NULL, '1AUL2HY3KLZUFF1G', 'jCeAK0L3kIYHvoxpLBcF9DCG57v68DAy', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(48, 'MAHBUBUR RAHMAN', 'mimahbub778@gmail.com', '$2y$10$OpzITA5EbJJtQyTo2J11jOvYNJibuhzKWreynBAxsQ9BPr3.jsimS', 891, 1, 0, 0, 0, 'mahbubur-rahman_deen-walacom', 'https://deen-wala.com/', '1312644700', 'Dhaka Bangladesh', NULL, 'VSTYGKOF06Z95LCX', 'PjMW5aOajpSBQvrFUFAYJhQi8yhJ2RMh', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(49, 'Md. Lovelu Mia', 'smlovelu44@gmail.com', '$2y$10$Du2Urf35UtZFm.ANJLSPgO2msJZST9a91Ai4icE9sc0Il0J5P1gQy', 890, 1, 0, 0, 0, 'md-lovelu-mia_emartiyacom', 'https://emartiya.com/', '1749899153', 'Dhaka Bangladesh', NULL, 'L74HW8X4SBRHSNTT', 'PsXxPXr0JeHYiSODiAntERqRdIK8MmHv', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(50, 'Fency Akter', 'fencyjahan6@gmail.com', '$2y$10$B/Ol1IIoUhAW.e/yxxWn9.aXT5pkbebPswlskBIT4knEih2VddguG', 889, 1, 0, 0, 0, 'fency-akter_fastabdcom', 'https://fastabd.com/', '1780316178', 'Dhaka Bangladesh', NULL, '2OXP97NV798SQ4DS', 'lcPyYhfq9OE2uB6WU2g4vNJTR4E2r920', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(51, 'MD. TAJUL ISLAM', 'tislam887061@gmail.com', '$2y$10$6RnRzjKiUsCiKrf8TeohoO6aBhCy/IZ/cTSOQXziSPBlNmIq1DHt2', 888, 2, 0, 0, 0, 'md-tajul-islam_jannatpointcom', 'https://jannatpoint.com/', '1710444809', 'Dhaka Bangladesh', NULL, '9TCUUVQSX2IWEKEH', 'Wpy2DsLnVgCDSADCjEVMpcHJRGppXnIj', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(52, 'Habibur Rahnan', 'dentisthabibur@gmail.com', '$2y$10$VCX9kDpvlhggYXFlh2h0COLNVpXuAOtpR.SxvIRWeVoO/mc0CdvEW', 887, 2, 0, 0, 0, 'habibur-rahnan_saraloycom', 'https://saraloy.com/', '1934193381', 'Dhaka Bangladesh', NULL, 'A3DQ4KJFLBYQRMQ7', 'p8sraUAcT2sDKcr0jxCRSlOzdo1NYmkj', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(53, 'Md Mohin Uddin', 'mohinkhanbd2013@gmail.com', '$2y$10$A5qcSbfqvgdZ2O6XmHNMWeiG0roV1JqsqnWeVLT4SKR3hi8Yx6YBu', 884, 2, 0, 0, 0, 'md-mohin-uddin_miraxshoppingcom', 'https://miraxshopping.com/', '1610052239', 'Dhaka Bangladesh', NULL, 'TKNCIMR2VKOBIUUJ', 'SWQbabSzY5q9bjxzcnVocmZKt2K0Az3p', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(54, 'Shob Shopping', 'barkotullah02@gmail.com', '$2y$10$xs4W5E4AvNBtYqtF2ulVUubXJ/yPxDfub3cpSgY.b2PFhpg8EuMxu', 883, 6, 0, 0, 0, 'shob-shopping_shobshoppingcom', 'https://shobshopping.com', '1566001546', 'Kanchan', NULL, 'RJ5C1FX6YLYIOZ1O', 'OFL8Kf04n0rqv9k4NCUBFNBTfVDlOJeN', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(55, 'Md. Shagor Ali', 'mshagorali@gmail.com', '$2y$10$vnYId6weTHLa0I5EcPAiZeQXn4.ZPO7NCtARcqp.wQ8R1LYp.i6nq', 881, 4, 0, 0, 0, 'md-shagor-ali_adgmartbdcom', 'https://adgmartbd.com', '1729729065', '8/45, Nayanagar, South Kazla, Jatrabari, Dhaka', NULL, 'MKHSOLOGYYFM5AXW', 'svV0YvCKgFr0LzJW261StxV79YcrjCal', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(56, 'Md.mahfozur rahman', 'md.mahfozur@gmail.com', '$2y$10$GRTmPUvjBrRARYBlmascdefVBZPVwHJBU5BZ5/Rzaqs7BhW37mYyu', 882, 4, 0, 0, 0, 'mdmahfozur-rahman_qasemecom', 'https://qaseme.com', '1611929423', 'Dhaka Bangladesh', NULL, 'BZZT7E9CYWGWOX8Z', '4PylrS1nyXzUDkRdxdG5vlHAGLZFOzlu', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(57, 'Mehedi Hasan Prince', 'princemehedi231@gmail.com', '$2y$10$AUGpvVjfYMUYyfBnJw9Ja.5Kc8A7jAg6DFawJsXAhbitQNe7SD7jq', 880, 4, 0, 0, 0, 'mehedi-hasan-prince_gotrendizcom', 'https://gotrendiz.com/', '1640378854', 'Dhaka Bangladesh', NULL, 'LZJ27UCVU9DEULS0', 'kpiNtK8vbBHDINSCBevHNCUw6Nfze3fW', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(58, 'Mezbah Azad', 'mezbahazad@gmail.com', '$2y$10$ZhMz1K7lcJ2MDnFDeVx2sODpp797Q4XAJezmr2VyCTGGAsBamRibu', 879, 4, 0, 0, 0, 'mezbah-azad_nittoneedzcom', 'https://nittoneedz.com/', '1707081445', 'Dhaka Bangladesh', NULL, 'WF8PLXP2DZJTLYZX', 'FvJjNzeCIdszdGUEhGjPe8F5CNfMkRiu', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(59, 'Rashed Hossain', 'bayatirashed17213@gmail.com', '$2y$10$LckQVXPTZNvQzZmhlE0CH.Qq/Aq/LcmPfWpBP16TQfj2RjHg161oG', 877, 6, 0, 0, 0, 'rashed-hossain_uniquegallerycom', 'https://uniquegallery.com', '1733431721', 'Dhaka Bangladesh', NULL, '7OM0WDV7JJS5WW7V', 'fbYISqlvCYCd5ixjb1IwyoK4uxB62R6g', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(60, 'Md Najmul Hossain', 'www.nrmedia293@gmail.com', '$2y$10$4bn6IbdnFUG1ocV0ymEXOuvFhOA1B2CFJiYnBoWnHaSgi.zoSaKp2', 876, 4, 0, 0, 0, 'md-najmul-hossain_richnacom', 'https://richna.com/', '1647548883', 'Dhaka Bangladesh', NULL, 'UTESYYWYPQXTBWT9', 'mJLFVGtcHXjHkLMXHh33ygUM6Kyqqktb', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(61, 'SAYED KAMAL HOSSAIN', 'needsall24@gmail.com', '$2y$10$y6dxAYiEHTXpGSC3MAYsEO06VV5cJYlqlZIVptwI9JPTvKBSekLUS', 875, 4, 0, 0, 0, 'sayed-kamal-hossain_needsallcom', 'https://needsall.com/', '1332916416', 'Dhaka Bangladesh', NULL, 'ZU5XGMHOGACH7AAN', 'Sm8oZmwaORipx5oJ2p1pU8evdaXlH5ip', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(62, 'MD. Razaul Karim Howlader', 'rkarimbu@gmail.com', '$2y$10$jHj176R5QslRZn9y263AHewFW8ZbLLTyITZ8utLJ4PU6Bx58u81Ye', 874, 4, 0, 0, 0, 'md-razaul-karim-howlader_rizqiumcom', 'https://rizqium.com/', '1711034082', 'Dhaka Bangladesh', NULL, 'ITRNGLEAWKFEMUAD', 'XXC6uK2Trgmjq9b5M4u2LipbAD1xktr2', 1, '2026-07-28 08:46:02', '2026-07-28 08:46:02'),
(63, 'Muhammad Ziaur Rahman', 'primucart@gmail.com', '$2y$10$v3NyHBsov4WCDNJxhA0jieh9WZEhZ1wmKF.RSQRHc92ngclaHeBti', 873, 4, 0, 0, 0, 'muhammad-ziaur-rahman_primucartcom', 'https://primucart.com/', '1728282966', 'Dhaka Bangladesh', NULL, 'PZ6MHDI0I9TY7ZOG', 'j5m7DRzOkpUTiLPaRoAB4qPK3ru125s4', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(64, 'Mohammad Mehedi Hasan', 'mehsha4454@gmail.com', '$2y$10$yENcf4V4B1eTMnOouD9JIekQN7zH1jMTwaY8og62m8QxNrsVYhNnK', 872, 4, 0, 0, 0, 'mohammad-mehedi-hasan_mehshocom', 'https://mehsho.com/', '1638845928', 'Dhaka Bangladesh', NULL, 'BZL3KQGOLYWQRWI5', 'KmjETtWZsqyYQbon2cFR1SnUUeE1tvFr', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(65, 'MD Shamimul Hasan', 'shamim600shamim@gmail.com', '$2y$10$ox7Yj9JvivaEhY689JBjdukN7Qj36lbLBtA63XxbeRQd7rO9nlQ6.', 871, 1, 0, 0, 0, 'md-shamimul-hasan_safaloycom', 'https://safaloy.com/', '1727646207', 'Dhaka Bangladesh', NULL, 'MIMSTGTMVUWDAA0T', 'LYMkV6RB6XDEbkjqFUPpnzZpsRmBTlZq', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(66, 'Md. Safiqul Islam', 'siac8070@gmail.com', '$2y$10$940bjG1B5lTOF7F.uNDSmu3BtzJHHNS0uF1LI4wsjv0f5JM9pEo06', 870, 1, 0, 0, 0, 'md-safiqul-islam_sristyshopcom', 'https://sristyshop.com/', '1730328070', 'Dhaka Bangladesh', NULL, 'QO6IYRHUEX4IPQN0', '0clbGBmPackSe4d7HnNVwVQYPSq1mFsK', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(67, 'Muhammad Arefin Shahriyar', 'arefin.shahriyar@gmail.com', '$2y$10$Qgx9LvrfmxuzbHEzM1Gvb.QUZjHjzAxIVC.XRdNUKqtFWxYNqcAcq', 869, 4, 0, 0, 0, 'muhammad-arefin-shahriyar_tazkiyahmartcom', 'https://tazkiyahmart.com', '1711505507', 'Dhaka Bangladesh', NULL, 'X7BNFMSEWHE6EYLB', 'm0t3QGaILbCZs9K83aYxUXU10upw9fH0', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(68, 'Sayed Al Emon', 'emonstudios@gmail.com', '$2y$10$8h6ZJhsgVhClS6fNzUyhIO47I1yk9k0DU6DA/KYnGkQiG45kNxLUS', 868, 3, 0, 0, 0, 'sayed-al-emon_enayahutcom', 'https://enayahut.com/', '1613142111', 'Dhaka Bangladesh', NULL, 'X2P01HEISTTMFMJ1', 'h5cuqUV9awm22j4BlLLEvvZraePRCXCC', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(69, 'Md. Ahidujjaman', 'mdahidujjaman197900@gmail.com', '$2y$10$Ey7p1OIaxgpVdeUjBK37geNIYY7P3w9aJY8qNUhZiLBXxAG217ze2', 867, 3, 0, 0, 0, 'md-ahidujjaman_reziqmartcom', 'https://reziqmart.com/', '1727849254', 'Dhaka Bangladesh', NULL, 'FJ6NIMCDI6OHTLIO', 'QSdNRzUgHEFoyRpcLl1BUylgeMu9gIOS', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(70, 'noor afcher', 'noorafcher2@gmail.com', '$2y$10$9TRZsKSskBmj6MU4khO00.YyIDIHtPaKBr3YYVLn6YilJ2z/o4GoS', 866, 2, 0, 0, 0, 'noor-afcher_nooriyanacom', 'https://nooriyana.com/', '1320978880', 'Dhaka Bangladesh', NULL, 'EQMW4PFMJXOMZLHG', 'hJVrPuZbPt9ATRfP8XmZAz0WP9AHcafa', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(71, 'Rafiul Habib', 'rafiul.razib@gmail.com', '$2y$10$ZiyIpsWSoD4FOy0ESRTPr.KfCMLiqrOtUEYQJP6JbvsvUKmGpaozm', 864, 6, 0, 0, 0, 'rafiul-habib_jannexacom', 'https://jannexa.com', '1717224746', '13/A/1, Boro Bazar, Mymensingh', NULL, 'AHVALYYA4DTVQOLA', 'YJIvysh35hrxysfQKaZrc8HbxGvQQWXR', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(72, 'Saiful Islam Bagmar', 'saifulislambagmar47@gmail.com', '$2y$10$BRHWSN7EYR6oqk4PErSh7OJFMwvDYO18rY.wl0pE0KlgNQ1nSpJq2', 865, 4, 0, 0, 0, 'saiful-islam-bagmar_bagmaracom', 'https://bagmara.com/', '1842897193', 'Dhaka Bangladesh', NULL, 'LTLJDANOG29BJKSO', 'hFbuubxkgLupfecFd9dzNSIeyhITPw1k', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(73, 'Md Eman Hossan', 'mdeman328@gmail.com', '$2y$10$3Mst6W/0Uw8Xq9CGGnzJYe.ZtM3BtMypMEx55wh0iQBvyopsWhMW6', 863, 4, 0, 0, 0, 'md-eman-hossan_deenwalacom', 'https://deenwala.com', '1660140829', 'Dhaka Bangladesh', NULL, 'TWYGYJOB0EP7VEJE', 't0QkFZkq5eFVxQF5a71nd2dWiOHxBPOy', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(74, 'Amran hossain', 'mdamranhossain313@gmail.com', '$2y$10$SzfZR4nzw0V9POkcqw0h4OoRvo/U.XiWzQpFbXAQXxLMazRbI5Qw2', 862, 4, 0, 0, 0, 'amran-hossain_manhathofacom', 'https://manhathofa.com/', '1814840339', 'Dhaka Bangladesh', NULL, 'DEULY4TAXZWSSAJO', 'wOsd3rs6Vj7rTGjMXNdplzpm2v2oEch4', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(75, 'MD ASHIKUL ISLAM', 'ashiktkgict1@gmail.com', '$2y$10$nH7pvWXRGMghW6KP859sre3ZFQ/rRs.bAjPmfdt8fpW7GEx4NsVT6', 861, 4, 0, 0, 0, 'md-ashikul-islam_bajarbdcom', 'https://bajarbd.com/', '1719347126', 'Dhaka Bangladesh', NULL, 'UKX0IW2I8KVFIVLW', '4l4Voy7o4gmfSuzZEI1YzCuOtrC9Haau', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(76, 'AKM ASADULLAH ASAD', 'a.k.m.asadullah@gmail.com', '$2y$10$QuRFQ1CghCwA22350OAzuuxlTOvpIfwV0O5xB/G2nePGHtaW.3mjS', 860, 4, 0, 0, 0, 'akm-asadullah_sodabarighatcom', 'https://sodabarighat.com/', '1540228942', 'Dhaka Bangladesh', NULL, 'VA8I85HSP90RKQLM', 'FAlU2S3jh4pH7iJbhVYndj1306G2bSig', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(77, 'Muhammad Najmul', 'contact.najmulll@gmail.com', '$2y$10$8QhG3Vr5rCJZGKgwgjwFxeGbDo5cJ.HS40YZ7oK9CxTl/oA655QEG', 859, 4, 0, 0, 0, 'muhammad-najmul_manzeelocom', 'https://manzeelo.com/', '1630765347', 'Dhaka Bangladesh', NULL, 'UYFHDLWSK6EV5TFV', 'EZPAaifs34XSLjaZdG7prDCNMkNyzMz1', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(78, 'Moshiwur Rahman', 'moshiwurrahman@gmail.com', '$2y$10$X.9QF74go.GhlrP7j32H.OClVW1Lv1CD2CtOeiSUci7k/4kL8Enpe', 858, 4, 0, 0, 0, 'moshiwur-rahman_mittoxcom', 'https://mittox.com/', '1621244866', 'Dhaka Bangladesh', NULL, 'PSUUCPY1A8NFKA5G', 'jLoWDfDBIEChRF0Ph70jqHjMMQQCVMAs', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(79, 'shidul hassan', 'hasan_961@yahoo.com', '$2y$10$C2azPmejjSy3gEP1ELU9muQ/8dozSwct9NA63SCvWQMy4ZcBhFER.', 857, 4, 0, 0, 0, 'shidul-hassan_happizamartcom', 'https://happizamart.com/', '1824006235', 'Dhaka Bangladesh', NULL, 'BLHVSJPY7MU0AZ7N', 'ZldWh6kQfpL76h2XrdTzfU03YR8o02Gj', 1, '2026-07-28 08:46:03', '2026-07-28 08:46:03'),
(80, 'Md abdul hannan', 'abdhannan18@gmail.com', '$2y$10$MLwErr6eRwgEkFCmE1EIyOwpgFlHhXAacAMv8WXNHe3QnHGGWy3YC', 856, 4, 0, 0, 0, 'md-abdul-hannan_nafihacom', 'https://nafiha.com/', '1721343725', 'Dhaka Bangladesh', NULL, 'KFNPY2EIMD1PBVI8', '7Qlz2TqXoRrsxzZa8BSOmMKfDqsWBjE7', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(81, 'Mahfuzur Rahman Bhuiya', 'mafuz44@gmail.com', '$2y$10$6ucI5yA0NLnjHUMLR16ghu/0vIErGSjA0qYOU8VdMHzAc9DYOn6Ha', 854, 1, 0, 0, 0, 'mahfuzur-rahman-bhuiya_nexovamartcom', 'https://nexovamart.com/', '1914800248', 'Dhaka Bangladesh', NULL, 'JZD5B6ASGSQLVPXM', 'ZIuC9Pbbs4U7nE2y6e3YjZ4uOe9pCoT9', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(82, 'Tareque Mohammad', 'tareque303@gmail.com', '$2y$10$ksGhC8KchHahZqYRTMcf7OLYrHRGTmjXzAmkBg6dLzpE9.eVB4SgG', 853, 1, 0, 0, 0, 'tareque-mohammad_metrobazarbdcom', 'https://metrobazarbd.com/', '1731633877', 'Dhaka Bangladesh', NULL, 'AJZBASRLUOB6TQKY', 'hg2KsTrUH9dE1poIrnaZVPApPtlxvlJ3', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(83, 'Md: Hafizur Rahaman', 'hafiz42752@gmail.com', '$2y$10$gQk.BFCWkSgD4XvQCmOAxeRznk58p//RGQEkBIuG9LDAIBSBVIRJS', 852, 1, 0, 0, 0, 'md-hafizur-rahaman_barakiqcom', 'https://barakiq.com/', '1874090982', 'Dhaka Bangladesh', NULL, '3PDJBLNYC7LEB4SP', 'mrVDE0NbmhilDUcyt1c8hj3JDq7fUER1', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(84, 'Md Sydul Islam', 'mdsydulislam710619@gmail.com', '$2y$10$7cPNRnoTgqkNulN.mB5K3.VlnQyrmrUrWXjeKh.IYqBm1VgHD8jQi', 851, 4, 0, 0, 0, 'md-sydul-islam_fantasmartcom', 'https://fantasmart.com', '1771385364', 'Dhaka Bangladesh', NULL, '4IWOZ6VVES6DYPT5', 'QXUWSHqGncsIWqiHrY8ZAJNfotMGWPO2', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(85, 'Md. Rakib Hosain', 'rakibhosain96@gmail.com', '$2y$10$NhEb0BPFO9ds7BL2ha2Tku2uixLhdx.i5R.3PD3dea4UnyqCTlid6', 850, 4, 0, 0, 0, 'md-rakib-hosain_barakatacom', 'https://barakata.com/', '1332889723', 'Dhaka Bangladesh', NULL, '6IGCHF8HAW0CTPDN', 'N6kF4X5bN2NtDjEy1Q1S9F2W4Gevnaxd', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(86, 'Sayed Nuruzzaman', 'nexbazar.store@gmail.com', '$2y$10$xTKvx.n0l4uuxQNGL9ZOKeJTgsSuLe35Ct7cKHj6lpKz8P1w2kQtC', 849, 3, 0, 0, 0, 'sayed-nuruzzaman_nexbazercom', 'https://nexbazer.com/', '1821627764', 'Dhaka Bangladesh', NULL, 'E0PHWCLVU875T2YF', 'eKwpYCXpEM1GdxNQEooiI7sTlpO978Bt', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(87, 'Md Mamunur Rashid', 'myforest1221@gmail.com', '$2y$10$CancAWbo7XD8R6XXyVn3HunnU7QJ895ob3lq7ZLHs.aUXZWVy1ygi', 848, 4, 0, 0, 0, 'md-mamunur-rashid_lilymaacom', 'https://lilymaa.com/', '1939306568', 'Dhaka Bangladesh', NULL, '1JZBIZE0DSGPMPAV', 'FYpj9gDJeh1ieZgwquE0VM3eVtJwp1e6', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(88, 'Mohidul Islam Muhit', 'muhitmohidulislam@gmail.com', '$2y$10$7SVhc51THdl8HivgO7KqGeqhubqS.mHzwQsQRKxb71lqCQgDLQZz.', 847, 6, 0, 0, 0, 'muhit-mohidul-islam_taqwaastorecom', 'https://taqwaastore.com/', '1891746935', 'Dhaka Bangladesh', NULL, 'RZXEFV6MY7Q13XOT', 'GAXAJ9OB9JnRfDk6P44nljAWpvQyfLlK', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(89, 'Rahul Islam', 'rahul.tici@gmail.com', '$2y$10$3mc8D8G2AD8Drg28sF8DseJ/1w7HkZfQcRfhp5mmVAf71Q7LcObX6', 846, 4, 0, 0, 0, 'rahul-islam_abrormartcom', 'https://abrormart.com/', '1611987500', 'Dhaka, Bangladesh', NULL, 'KD2VTTCNXGITFCDE', 'xU2Aku9QtQsJYOEMa5tdxIwPNyfAHA0n', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(90, 'Md Raihan uddin', 'hmraihan2022@gmail.com', '$2y$10$qWv2kIpB3o5NN2uW5P/fpuBW7ltvIkq73mpu8kHyl8ydY4NTNH2Wu', 845, 4, 0, 0, 0, 'md-raihan-uddin_doynikshopcom', 'https://doynikshop.com/', '1643194563', 'Dhaka, Bangladesh', NULL, 'PUSGHRNQHAXS5NL2', 'fhCXrJfNrdGzXN1wOjaaKZpteSlHtfgN', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(91, 'BIKROY MART', 'alamin.miah100@gmail.com', '$2y$10$RgnKM31oVpkq6MFATh8UrOpRSw8FQlMM.scal4vNdhUO.g0jBHnm.', 844, 6, 0, 0, 0, 'mohammad-alamin-miah_wwwbikroymartcombd', 'http://www.bikroymart.com.bd', '1719026090', 'RAJA TOWER,COLLAGE GATE,SREENAGAR,MUNSHIGONJ-1550,BANGLADESH', NULL, 'MIYVE5NMXKLVQBO8', 'gcA5yfi8ddS5BjFeTNTFviM32AvQsOiy', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(92, 'Onamica shahadat', 'shahadatzzenzi@gmail.com', '$2y$10$eNKidADluGcIESW4pk7FaOAI0quQ77U2GsthmpatqFm7s.Ah7wgBy', 843, 3, 0, 0, 0, 'onamica-shahadat_zzenzicom', 'https://zzenzi.com/', '1331590891', 'Dhaka Bangladesh', NULL, 'MUF9P2IK8LEBP1CA', '1bdZTFCxo8SrVqlA3wduERqUivIBe7P0', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(93, 'Ibrahim khan', 'ibrahimkhanb78@gmail.com', '$2y$10$v8yFYh6ewbt0jkDMEeZZF.CASVe5J5nu8GIKNVfkr3ZL8j0YGTGQy', 842, 2, 0, 0, 0, 'ibrahim-khan_marozucom', 'https://marozu.com', '1645225127', 'Dhaka Bangladesh', NULL, 'LL5PIN6AMYLOO5CW', 'e2qxDdAhi87K9XyCHJQxdWswCiMGspDE', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(94, 'mohammad kamal hossen', 'pnrchem@gmail.com', '$2y$10$o0ZOteoo2zCAetz7MeTpoOdopig.aCK74AarNmnW7NELujk5Fs3.i', 841, 4, 0, 0, 0, 'mohammad-kamal-hossen_kartloycom', 'https://kartloy.com/', '1714109060', 'Dhaka Bangladesh', NULL, 'QL5J2ZESG27SBAHH', 'My7EiCUjchwsEZ82g7aaGgsTZJm28mLw', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(95, 'md.abdullah al numan', 'biqno26@gmail.com', '$2y$10$1y1/cBu4zYuH3c4V1xYYx.rFo/VtyM6FRtowjhkXPs02ZjZEvr33C', 840, 4, 0, 0, 0, 'mdabdullah-al-numan_biqnocom', 'https://biqno.com/', '1868685833', 'Dhaka Bangladesh', NULL, 'MQ0FOJZO2GLWHYVT', 'WkT2reOiwaNEWKoLaODW8Ph9ESET2MmD', 1, '2026-07-28 08:46:04', '2026-07-28 08:46:04'),
(96, 'mahbubr rahman', 'abuabdullamahbub@gmail.com', '$2y$10$Rv0JdXNMhqeekZnaiZbzke4nx5bk.dcEXQahavUkUjwZ3/ulkI4H.', 839, 1, 0, 0, 0, 'mahbubr-rahman_subhanimartcom', 'https://subhanimart.com/', '1869523525', 'Dhaka Bangladesh', NULL, 'HJGC5OMWF9EDEHJZ', 'qvmv65p9xIhHjjEQYBVcT0op31h9VcVM', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(97, 'BM ARIF HOSSAIN', 'bmarif1988@gmail.com', '$2y$10$a.FA.pIyaHp2CjD.pczaduKbCUoDWvcUpLiDgLSUbFiHoSGpy8uVC', 838, 3, 0, 0, 0, 'bm-arif-hossain_anayasworldcom', 'http://anayasworld.com/', '1717730951', 'Dhaka Bangladesh', NULL, 'EF16QOVDZMDVQZQO', 'bUEFTMWMYtYKD68lfqTf3Gj0TjTQSyS4', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(98, 'Anisur Rahman', 'tkintl.bd2015@gmail.com', '$2y$10$LOigbmuWHsmXL4UDu467p.UCyd31dk919mB6owGbHONfDKdjwhhuW', 836, 6, 0, 0, 0, 'anisur-rahman_sheraofferscom', 'https://sheraoffers.com', '1841458065', 'Dhaka Bangladesh', NULL, 'ZAB8KYEVBJD4G7PL', 'P2LL6UMRYB3b96rGwnCDvnHMaMM4NClC', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(99, 'Rashedul Haque', 'rashed.ec2015@gmail.com', '$2y$10$du3kda0usYoRlPVbVlXFDuqIjVAMSQQqJudNvPlmMQTYrYjYDA9RW', 835, 1, 0, 0, 0, 'rashedul-haque_sobaragecom', 'https://sobarage.com/', '1707073277', 'Dhaka Bangladesh', NULL, 'SNWOXPHDDEWVKUDD', 'HhyYcIGgnNOSfZQlQvOjKgYNTrtWMyfu', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(100, 'Tohidul Anower Hossain', 'tohiedp1234@gmail.com', '$2y$10$.VlQjlNECBTAI7IOhIeKQu/Hs85wG3Y2wlrEk8dau1G1QthzHpoj2', 834, 4, 0, 0, 0, 'tohidul-anower-hossain_enittocom', 'https://enitto.com/', '1911915499', 'Dhaka Bangladesh', NULL, 'XNXCF5PFLOWOLCSI', 'e3KSyeKsSvazZSLWLHu2RwqURZXCYAUg', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(101, 'Mostafizur Rahaman', 'salim.kms83@gmail.com', '$2y$10$hdy6p1FLtLh34bIWQMvw.esRy2P3UYQLMN3DfKZbPFXo4ZpCKjZUO', 833, 4, 0, 0, 0, 'mostafizur-rahaman_orbix24com', 'https://orbix24.com/', '1999560570', 'Dhaka Bangladesh', NULL, 'A7AYMVLJWTA1QYKE', 'gOpbOvGfM17tsaBBq4pCdd6bDnCmLBNk', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(102, 'Md Nasir Uddin', 'nasirgazing117889@gmail.com', '$2y$10$xrWePp7w.gc9vNw6BbF/zelpVcfC3SxpUwsD0zRizo9q80gASoxfS', 832, 1, 0, 0, 0, 'md-nasir-uddin_sellsmapcom', 'https://sellsmap.com/', '1989149281', 'Dhaka Bangladesh', NULL, 'EA7HY8DNKREEMGPK', '66jmRYACtDM1q956xaWl6aeHhiThAcom', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(103, 'Saiful islam Emon', 'saifulislamemonofficiall@gmail.com', '$2y$10$aT4nt3m2/6uKczklVsU6YebNAZb2FQiWV.grDj2j6.w5qrSWBE7zO', 831, 1, 0, 0, 0, 'saiful-islam-emon_eiomartcom', 'https://eiomart.com/', '1743813513', 'Dhaka Bangladesh', NULL, 'LR5DQB1OLFVCSDYU', 'jDNI35jPVM23vcztOGaYud9UhV85xOq7', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(104, 'MD Sadaf Sadman Haque', 'sadafsadmanhaque0@gmail.com', '$2y$10$G8jJLYbYPD69BFOZlQoo/e5FRioqNbTA9iH2lgPW2HRQVvLLhPxFS', 829, 6, 0, 0, 0, 'md-sadaf-sadman-haque_aizalifestylecom', 'https://aizalifestyle.com', '1797950619', 'Tongi,Gazipur', NULL, 'AAZN6HDGVJH9ZJAN', 'qlLI1GJuGGVtOuy3yTk07A8P8ssyqdoK', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(105, 'Md.Abdullah al kadir shohel', 'mdabdullahalkadirshohel@gmail.com', '$2y$10$W1Mxap3iU9r8W75Dv8IrjOP58tuboGKEaYzDJYnVuIMU9frx89TUW', 830, 4, 0, 0, 0, 'mohammad-al-kadir-sohel_heraklycom', 'https://herakly.com/', '1751116431', 'Dhaka Bangladesh', NULL, 'HPPK90ELOJML5XA8', 'x88n6gzyz90PL8hw6x1cODb29TMVF9cJ', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(106, 'Suprio Test by Shakib', 'suprio.cbdl@gmail.com', '$2y$10$b6Ldwe/tIvYMuISso.kXy.C7YeMDVv4CthoqLC42l4K.CT5LHXE9O', 826, 6, 0, 0, 0, 'suprio-test-by-shakib_gadgethubbd', 'https://gadgethub.bd', '1335194267', '13th Floor, 383 Rain Razzak Plaza, Maghbazar', NULL, 'C7RMQHH1PEYZLCHA', 'tERUoro2p2sZ49pCo0sChG34lLLLz1Ax', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(107, 'Eman Mahmud', 'gazitrade2026@gmail.com', '$2y$10$O6LJ8pOqPlI3RyWsIiJWueNljtm73uawuOFDDS8VaGMStoqpWVeTu', 828, 6, 0, 0, 0, 'eman-mahmud_gazitradecom', 'https://gazitrade.com/', '1795878415', 'Dhaka, Bangladesh', NULL, 'LIVHHI2MCXEHVIDD', 'sNz12Gj5qlP3Q97xLGG1nadmr8JCwdnU', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(108, 'Arafat Hossain', 'araf.eee1@gmail.com', '$2y$10$VjwD/Lpg.zmPHKosr98CouhFZjVnOlqBM7nlUg9lAyxkPmgCBCNsy', 825, 1, 0, 0, 0, 'arafat-hossain_myschool4dcom', 'https://myschool4d.com', '1710499488', 'Dhaka Bangladesh', NULL, '7T6YS4JENZZQFVDP', 'w0IZn2opi1M3yqnZNSTw0OEWsVbDlkwK', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(109, 'Md. Monsur ahmed', 'monsurbr.raj@gmail.com', '$2y$10$WdWoa6zuqpbIlvLN/6qeaOLclMJW6Hky04K7lphGLfRrdnH5NbWkO', 824, 4, 0, 0, 0, 'md-monsur-ahmed_ahababcom', 'https://ahabab.com/', '1516130007', 'Dhaka Bangladesh', NULL, 'XJMNJDTFQOKIAJJO', 'ytkuUoqAaSGiHtqb34oH4oqqJhX9zorh', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(110, 'Rifat Ahmed', 'tahira24183320@gmail.com', '$2y$10$.Jgo97pZ6GvEvtB7n7gs5uyyXxqwdSj1skKTuag4CbOgn/2TUNRBW', 823, 1, 0, 0, 0, 'rifat-ahmed_tahirazcom', 'https://tahiraz.com/', '1333528179', 'Dhaka Bangladesh', NULL, 'MB0CA7AHNDCIMXLY', 'TOWxIuEHBUIlCXSHpvPzVhIAHuaS11uy', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(111, 'Muminul Bari', 'nitozmart@gmail.com', '$2y$10$dyBaLg0XR/A6iou12TpPy.3P2HGisB10/bt.lKy98LoVyiFSYJKfe', 822, 4, 0, 0, 0, 'muminul-bari_nitozmartcom', 'https://nitozmart.com/', '1711777513', 'Dhaka Bangladesh', NULL, 'KAXLT3MVRAC8LIUQ', 'OZp7LH2O0NXXaFM29au66wbOrIB5qLzE', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(112, 'rashed', 'rashed.gts@gmail.com', '$2y$10$1oDnsztcDAQtFzXuuIMCIOmBXyveXLU4corjTJMnRC67jlYiqr5A6', 820, 4, 0, 0, 0, 'rashed_moynahcom', 'https://moynah.com/', '1710626983', 'Dhaka Bangladesh', NULL, 'KWGCJ6LAGGS3VJQX', 'vB9qIFqn0CCfrxT5RRNi55A6oebqgaaM', 1, '2026-07-28 08:46:05', '2026-07-28 08:46:05'),
(113, 'BDzoon', 'info.ourshop.bd@gmail.com', '$2y$10$gnCjyttGozdMPlAnliYpge0TRnm1qKzLeciEXm.//.PGYqZpbNTba', 819, 6, 0, 0, 0, 'bdzoon_bdzooncom', 'https://bdzoon.com/', '1318381941', 'Dhaka Bangladesh', NULL, 'YTAC2YF2XJFRRJFQ', 'bZCLkp88BbVmmI9TH0e9ehIx1UKYiZzf', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(114, 'EMRAN KHAN', 'sukrianstore@gmail.com', '$2y$10$sIYFJ0l5087frrqXTikwIuv/pSex9kryEBSA7RPD77COwqwbFTs8y', 818, 4, 0, 0, 0, 'emran-khan_sukriancom', 'https://sukrian.com/', '1406497601', 'Dhaka Bangladesh', NULL, '1F0EP2LVFWBPZAD6', 'eC9Ouy2j1Ig0E6MQgH4kc4KKjUR58PFH', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(115, 'Sabiha Sowdagor dipa', 'freelancerdipa93@gmail.com', '$2y$10$YYXh8ksTLuqVWP5oPT9tv.6UQDPNloI2DdiDUuNmGU97YcIN0uJ0O', 817, 1, 0, 0, 0, 'sabiha-sowdagor-dipa_selloralcom', 'https://selloral.com/', '1934229254', 'Dhaka Bangladesh', NULL, 'WSFGRLJR5MC2LFCE', '8nPd9fNQepO1PAp4iSKtJQWW01O24iOf', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(116, 'Md.Alauddin', 'Rayhanavuiya@gmail.com', '$2y$10$mcxbCZVS6PoSl8DfDg2uzeue8l20h4Pw3/uYuypn4m9f6c8rVzM/m', 816, 1, 0, 0, 0, 'adalauddin_rituwacom', 'https://rituwa.com/', '1797209018', 'Dhaka Bangladesh', NULL, 'V5JYCT5LPTVDHUXZ', 'WW5WKE8iYb9ZfBNY08R3z3ljtYzWMwey', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(117, 'SK Abu Naser', 'sknaser618@gmail.com', '$2y$10$nrTQxTIfYqZKwRO0chlUueWsJNnUGTJY7yRHNVfYP.gpA1v5mQqfu', 815, 4, 0, 0, 0, 'sk-abu-naser_modestiyacom', 'https://modestiya.com/', '1841996427', 'Dhaka, Bangladesh', NULL, '8ENAWRXHKHFMGWEE', 'gA5wH0TZicbVrv7aOxjY8TMjpqu9fEPe', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(118, 'Md Akash Sheikh', 'sheikhakash583@gmail.com', '$2y$10$b7sadefc/lWVPE5b8AvVS.o3MhuM3VMRKsr35d1OKucoKcNmno3ue', 814, 6, 0, 0, 0, 'md-akash-sheikh_amarhatbdcom', 'https://amarhatbd.com', '1910046788', 'Dhaka Bangladesh', NULL, 'LAIEJOA1EBK0G3YA', 'dwCbFhFOqnEMqTXb9ODiWAxTCQfVnvSv', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(119, 'Md. Jahirul Islam', 'jahirulmaya405@gmail.com', '$2y$10$k4H0PuF7pyNA3ZAguicGY.4M16lL.2xAtVKIR1Q2MkDUvtISV2OX2', 813, 1, 0, 0, 0, 'md-jahirul-islam_mayarhutcom', 'https://mayarhut.com/', '1611989333', 'Dhaka Bangladesh', NULL, '0T3EMSNV7SYN4JXA', '0upmTsHnjqok8T0LkcDsE3yYUu6tmIqA', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(120, 'Robiul Hasan', 'robiulhasanrohmani@gmail.com', '$2y$10$Z8zmIeN69ntyw1pEqM0t4.BLVJ2MD8j3QZAUfs9QqHGsDyybIa0Ji', 811, 1, 0, 0, 0, 'robiul-hasan_tohfashopcom', 'https://tohfashop.com/', '1828329376', 'Dhaka Bangladesh', NULL, 'DX6R0UTC4QEDWVZX', 'QUszjWsyqIbWKSaSJPe2FYbjQ8d8jFKa', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(121, 'Adwaita Borman', 'adwaitaborman95@gmail.com', '$2y$10$jiKt5PR4s5.DTtLJ5hPmA.YnLpGK9NaOhkr0.OJJYu2FFl9H9iDeG', 810, 4, 0, 0, 0, 'adwaita-borman_rubentacom', 'https://rubenta.com/', '1728863345', 'Dhaka, Bangladesh', NULL, 'EPTHXP94WHGNOMOV', 'sVRgQiwBTuHJ4chQ25Z3mR341YB9onme', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(122, 'josim uddin', 'josimuddin207@gmail.com', '$2y$10$GHACb6yp38Dd9P9js82ny.mw4NtWhPGh.AJsKrWYmu63GvZ5lmvzi', 809, 1, 0, 0, 0, 'josim-uddin_nitozshopcom', 'https://nitozshop.com/', '1674102977', 'Dhaka Bangladesh', NULL, 'GI5LCX4WNR62AL71', 'Zk04B7HL0PVe97IAdwzKVIrzgmrFXOMl', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(123, 'Md Rayhan Kobir.', 'luxviewx@gmail.com', '$2y$10$mVZ/Y9aXdPyt0FmboXHWlOLvyZEuWbPun2ndBb2FXXIImRl1gXHGq', 808, 1, 0, 0, 0, 'md-rayhan-kobir_luxviewxcom', 'https://luxviewx.com/', '1751004101', 'Dhaka Bangladesh', NULL, 'UU3YFPUMKMSBLUDE', 'eiqBMXAbBYXnQhvBxWYg1zjrmwb4gdVr', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(124, 'Mubinul islam', 'sardarcom26@gmail.com', '$2y$10$zbYHyHII9FEzCqQfdVsk4OOeKv7myhl/397MNYyqciGbemzXdzMXa', 807, 4, 0, 0, 0, 'mubinul-islam_zmansurcom', 'https://zmansur.com/', '1735708203', 'Dhaka, Bangladesh', NULL, 'X0KFGUOXNAKWNZ2R', '0uxOpdRk50uSyXfQf5DddcVl3XoSCdvQ', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(125, 'Abdul Mukit', 'mukithaniya@gmail.com', '$2y$10$fD6NfYDfjSahaXkHY4TXWe/5ztKkcT4oQmM.G8.8RJ0BPHJJYMela', 806, 4, 0, 0, 0, 'abdul-mukit_mukinicom', 'https://mukini.com/', '1334694341', 'Dhaka, Bangladesh', NULL, 'YZTSAMJV36D6SEXA', 'jN5gyCf5yJifyrNkg6CwZM4x6lnmUEwk', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(126, 'MD MANIQUL ISLAM', 'maniqul84@gmail.com', '$2y$10$TkT543dpUoxn2O542zfbROJ6IrSCcNp11ofmD29oV6m0FJuwfd0wi', 804, 4, 0, 0, 0, 'maniqul-islam_abmgallerycom', 'https://abmgallery.com/', '1911651969', 'Dhaka, Bangladesh', NULL, 'VM2R1TZRPLOW2LK2', 'xrf6VrepAjbkS4EZMSK4nHiGNiqdv4To', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(127, 'Atequl Islam', 'hmatequlislam@gmail.com', '$2y$10$81ZZsV7k5FTVE48RVcKo/OVzS7zu564aOyz2/fhOI7a6tJwi5xdxi', 805, 1, 0, 0, 0, 'atequl-islam_noorlyancom', 'https://noorlyan.com/', '1753894998', 'Dhaka Bangladesh', NULL, 'N2M3OGBXY7IGFOJS', 'x9CMkcorKPWIdRZ6F0uRmt65Yee8xoc8', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(128, 'Md Roman Rajib', 'rajibdewan198703@gmail.com', '$2y$10$gwAMYDyWOWKUsnurqDbNWeVV3b2rI/iCHnuGH8uA67fX8FGbAEXJi', 803, 4, 0, 0, 0, 'md-roman-rajib_riktozcom', 'https://riktoz.com/', '1677362307', 'Dhaka, Bangladesh', NULL, '4QZ4FAF44EZXNRLH', 'Adm5FOOe4AJNQ136oUqKuKzrj4Z4PKK9', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(129, 'IMRAN SARKER', 'sites.mariyami@gmail.com', '$2y$10$BwrAps/8iC0tmbRt/CZatuWZLnyVLeYeMACIP187xRKWdgxr1RiUa', 802, 4, 0, 0, 0, 'imran-sarker_mariyamicom', 'https://mariyami.com/', '1613513831', 'Dhaka, Bangladesh', NULL, '01AMNWRZCJLJKNAG', '74kwAQIp410PcXd1Jemiohq9iglqn0Tn', 1, '2026-07-28 08:46:06', '2026-07-28 08:46:06'),
(130, 'Mustakim Billah', 'mustakimbillah311291@gmail.com', '$2y$10$a77cdvFk6x4n6ydCTBPFpe/RAd1ZhP7RSzXTxhv5sgsBotgEmIDnq', 801, 4, 0, 0, 0, 'mustakim-billah_alheraglobalcom', 'https://alheraglobal.com/', '1677783383', 'Dhaka, Bangladesh', NULL, 'XZWAZCJRS42VVEOV', 'SF8yJU2kfzrV22Yq6QgihViWhPMwn5ng', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(131, 'Asma Begum', 'asmabegumdashmina@gmail.com', '$2y$10$ppTyEpXnnZ1K82cBhuZGZebAwXqBTgeCsHGeMygT/QAFuZYVVVvMG', 800, 4, 0, 0, 0, 'asma-begum_akaidmartcom', 'https://akaidmart.com/', '1931106588', 'Dhaka, Bangladesh', NULL, 'ERKFQCO5KHOCZJMX', 'XKXci5x1x4kvkPehJvaUasV2erdkZgMK', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(132, 'Faysal', 'viewfinch@gmail.com', '$2y$10$pHHi.Q7Bs41HitxFX3rMGek9uwU4Dmfzq2F.Dp5hfrbBlzdESo1qG', 799, 6, 0, 0, 0, 'faysal_chinaboxbd', 'https://chinabox.bd/', '1784397390', 'Rayenda Bazar, Sharankhola Bagerhut', NULL, 'BKDYGRASWW4JZCTI', 'bW726b6NGhvPNYMu0zl784i7BicThoEq', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(133, 'Md Sakib Al Haque', 'mdsakibalhaque@gmail.com', '$2y$10$chAKUOlUWP3xn1cPn.TByO.juEzdnh1IneZureONMD04TuE8J6vGS', 798, 4, 0, 0, 0, 'md-sakib-al-haque_gloorixacom', 'https://gloorixa.com/', '1823265340', 'Dhaka, Bangladesh', NULL, 'AQYANCQKEV6FA5NV', '6mlUjXU1QrSasmvcCR0725x8SVewiSEK', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(134, 'Mohammad Nure Alahe', 'nurealahe@gmail.com', '$2y$10$LEJlBsAK1q.5jyHIAOSPiOicP2yYMAXwYMWAoTgA8EMOxM6M0jjWS', 797, 4, 0, 0, 0, 'mohammad-nure-alahe_luxorabazarcom', 'https://luxorabazar.com/', '1928017282', 'Dhaka, Bangladesh', NULL, 'NBEMSLQEIJWMLYEC', 'wdJ6gDUyYu3FAZCVOCxcarlfa40dtZMY', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(135, 'Mohammad Monirozzaman', 'monirdhms@gmail.com', '$2y$10$yVh/H3U2FnEOieRaVfQyJugzboJJWLyC58MU/P8O1.reDGyX/UNyW', 796, 4, 0, 0, 0, 'mohammad-monirozzaman_oshaloycom', 'https://oshaloy.com/', '1718770678', 'Dhaka, Bangladesh', NULL, 'HZTY9FMLIROYCF06', 'DYPnKNhWg2UmBJZZuziGAmWHJmOnPdGQ', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(136, 'A.F.M Zakaria Dipu', 'signatureovsbd@gmail.com', '$2y$10$r.Y.TO8Ft2uhn3S0G3njvexi1o81xhHoRUYUTgpxSxk56zFf5yhn2', 795, 4, 0, 0, 0, 'afm-zakaria-dipu_happiliancom', 'https://happilian.com/', '1711844952', 'Dhaka, Bangladesh', NULL, 'WERO4MCLO8JJ9ZMZ', 'ZgZRlJbBq68tuR3MQbOlFVWBoFhHuont', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(137, 'MASUM BILLAH', 'masumbillahlemon@gmail.com', '$2y$10$rj8sax7Qgmzhj8TxGjczfe8jEybyGSIrvIectu3xI65MnQI2pm6xa', 794, 4, 0, 0, 0, 'masum-billah_ihsanyacom', 'https://ihsanya.com/', '1704661502', 'Dhaka, Bangladesh', NULL, 'A2NZCTYXD0IPNVVX', 'VY1kne9XzhkeOeEcnVnjmfspBLgJdfb4', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(138, 'Belayet Hossain', 'hbelaet@gmail.com', '$2y$10$sZZZDM8u3XEsEaNPPE8DX.DYcRqF5SbAWOw06rr9nXbV.oYkjaSA.', 793, 4, 0, 0, 0, 'belayet-hossain_norayancom', 'https://norayan.com/', '1346140455', 'Dhaka, Bangladesh', NULL, 'PDYLP4YEXZQORABX', 'tIc2CaAEQaYTjklgc8QJ8SXkmWcUcHgC', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(139, 'MD EKBAL HOSSAIN', 'ikbalhossen795@gmail.com', '$2y$10$6xuIeoNrsTabm/ziSDI9jeQCts4zCZ.HRVB/vZnK0HxqEocASoCI.', 792, 4, 0, 0, 0, 'md-ekbal-hossain_zanovamartcom', 'https://zanovamart.com/', '1812824173', 'Dhaka, Bangladesh', NULL, 'F1LNTFDCCLVJNMZS', 'SVTmj9FeA02PPkkCfrTV2GF1vtOyrIoP', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(140, 'Fowzia Yesmin', 'elmorianshop@gmail.com', '$2y$10$XuF6..YPAeJqpl6XMCllGevD8tIVhXrAW0UoKNlTD6nuSJHsPZikq', 791, 1, 0, 0, 0, 'fowzia-yesmin_elmoriancom', 'https://elmorian.com', '1308222200', 'Dhaka Bangladesh', NULL, 'XTUAT2CCE5ABQLSW', '3VnlWEFSe8SCBDf3ok0auO9v66eYC02g', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(141, 'Billal Hossain', 'billalh429@gmail.com', '$2y$10$YHSZ4KT3lYtZMtcDHAmwFuF8srwh/gnAIdSQ2Raq5XZtuNVa6DqqW', 790, 4, 0, 0, 0, 'billal-hossain_takiyancom', 'https://takiyan.com/', '1407790915', 'Dhaka, Bangladesh', NULL, '91QUCOAI3Q2SUMCW', 'NcFkwcUn8DUs3KdZbq2nWLMBO4T1PbCm', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(142, 'Md. Torikul Islam', 'mdtorikul600562@gmail.com', '$2y$10$wn4IkmxqDl.b.U88vhJaA.wfN/HDk6rfYrP5VuQRBywKfXynmLfNm', 789, 1, 0, 0, 0, 'md-torikul-islam_shoporabdstorecom', 'https://shoporabdstore.com/', '1749161129', 'Dhaka Bangladesh', NULL, 'ILI2ZYISYUZUFXXQ', 'uBqg5O408sRZyAFBkwSflFoguK8EasRS', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(143, 'Mostak Ahmad', 'ahmedmustaktahmid92@gmail.com', '$2y$10$TzcrfD6yARWDj5rByOsk9evuTaHBdxBQANhOaAR05dHb7SUYF5fKS', 788, 1, 0, 0, 0, 'mostak-ahmad_zentixmartcom', 'https://zentixmart.com/', '1616409192', 'Dhaka Bangladesh', NULL, '2CY551RBPQKHLWJJ', 'j8L0X2qTZY6SaLQPGMuGvY1o5WkXjMXV', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(144, 'Mohammed Jafar Ullah', 'supportsavemarketbd@gmail.com', '$2y$10$rqvWbMzJpPPAFQBi2vbBQOmNpXUNSEbnE9cCB4.VlR70cdeQNhkSm', 787, 4, 0, 0, 0, 'mohammed-jafar-ullah_savemarketbdcom', 'https://savemarketbd.com/', '1735472542', 'Dhaka, Bangladesh', NULL, 'HFT5TLATXUHD5VNQ', 'nJf3ynA4griILa4YaH15g30NNgYGLEox', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(145, 'md Abu Hanif', 'md6293268@gmail.com', '$2y$10$h0wK9KFcr2ohutaojhKYbOe6yEdH7sjYry.aT.c4Xh0ez89VWQNli', 786, 1, 0, 0, 0, 'md-abu-hanif_miyajisunnahshopcom', 'https://miyajisunnahshop.com/', '1877690405', 'Dhaka Bangladesh', NULL, 'ST60YL75IVTMYTRU', 'UkDa9oSEVwsjHpUTkB3jw0BuumTUX6Yk', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(146, 'Md Kawsar', 'ahmedkawsar2788@gmail.com', '$2y$10$RtZDe8P2.XO9JvR1.yR5X.rtpX6T6.NckDRKsawMw/vDETeHysYOi', 785, 4, 0, 0, 0, 'md-kawsar_btvbazarcom', 'https://btvbazar.com/', '1347021478', 'Dhaka, Bangladesh', NULL, 'SJVXIJ9CDZU0WS29', '169jR5c3YxLUT6L4bEzDY9wp3m6KmToC', 1, '2026-07-28 08:46:07', '2026-07-28 08:46:07'),
(147, 'Masum Ahmed', 'differentmasum100@gmail.com', '$2y$10$Xgd0rcxLy94KKFlbiDQvOezEyEQjYe43D5MMogvlFaUGxPKqcSahO', 784, 4, 0, 0, 0, 'masum-ahmed_vuyzoracom', 'https://vuyzora.com/', '1817961929', 'Dhaka, Bangladesh', NULL, 'DVZ0CBWSTFZ0IFEG', 'VCHVGeMau7nXss1H4cqxz9VuMbu6NJ8g', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(148, 'Jobayer hossain', 'jubayerchowdhuryc@gmail.com', '$2y$10$TtcLLIx9wVqC2FsVL5WyM.7/6CXV/Ry3ba63mXdecvIN4daee4QcG', 782, 4, 0, 0, 0, 'jobayer-hossain_avelosscom', 'https://aveloss.com/', '1330143758', 'Dhaka, Bangladesh', NULL, 'S2TB4KAMOLFE8YGW', '4uellAa1nAJPzBNDQrrvUX5o9gq7bP8h', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(149, 'Md Sanaul Haque', 'mdsanaulh59@gmail.com', '$2y$10$HywVIgnII82Btu0Mi5grkO5R/xJqfszYER2KksaGSEVTgF.XLyLx2', 781, 4, 0, 0, 0, 'sanaul-haque_samerahcom', 'https://samerah.com/', '1313934821', 'Dhaka, Bangladesh', NULL, 'ICNZYTBNHPSP9EOV', 'WKVEnaasezG3bgUBZqk71TVlLtAhpss1', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(150, 'MD AK CHANCHAL SARKER', 'chanchal1us@gmail.com', '$2y$10$PYm.PSLwJd6tTcW3/a3Nn.KHx3zUrulH7PhKIoCgbM2T6pxcvDdoi', 780, 4, 0, 0, 0, 'md-ak-chanchal-sarker_korakccom', 'https://korakc.com/', '1884743100', 'Dhaka, Bangladesh', NULL, 'O7Q1BACX2OUF3GII', 'jtURm3bVApVGwbiT7Gybm7MHXIYBTDK7', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(151, 'MD Harun', 'mdharunorrosidbuyan@gmail.com', '$2y$10$B1FYA9IOJdk9QVcNfjxlW.8v66Tnjaxp2PC4Y9Ax6Ip7QvTimCWfO', 779, 4, 0, 0, 0, 'md-harun_trustloycom', 'https://trustloy.com/', '1602065097', 'Dhaka, Bangladesh', NULL, 'CSB0PETPUKERCOYT', 'Av8jotbQqd08aQNK0iA2tkejgv7BHgiH', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(152, 'Md Abdul Hamid', 'hamidkarzaibd8@gmail.com', '$2y$10$DPBfF4ydkiG8GNK4.kTbOuLEMgO5Sup0rE1Bd.Zw/E9SNhnXhGxha', 778, 4, 0, 0, 0, 'md-abdul-hamid_olimamartcom', 'https://olimamart.com/', '1712257416', 'Dhaka, Bangladesh', NULL, 'GAZOXQRRERFLYVXI', 'IIfHp7HVobzVUkVfJvG1n6JGprvzHC30', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(153, 'Monzeel', 'romelrahaman89@gmail.com', '$2y$10$.UyeQtpcussinS06u8vIWOpL7mPGjjzFPbxe5W0RKpOheA25qBc6S', 777, 4, 0, 0, 0, 'monzeel_monzeelcom', 'https://monzeel.com/', '1873736840', 'Dhaka, Bangladesh', NULL, 'WXU3FHXPPAIDJUHI', 'PnrKgwTKzvWSINq7rqTSvVMulHGIz2QT', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(154, 'MD SAIFUL ISLAM', 'saifulss1990@gmail.com', '$2y$10$C.usJJB0YBh.ZfbCUqWG/umJaLhpVDatZDxFKhUlY2H9.WBfiz2zy', 776, 4, 0, 0, 0, 'md-saiful-islam_nuriyancom', 'https://nuriyan.com/', '1711247392', 'Dhaka, Bangladesh', NULL, 'G8QYIQDWN8R3MNZ1', 'ouEYDzTeiIW7ExHewOTtSaEJBnM5c9hA', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(155, 'Sabbir hossain', 'ssabbirhjihad@gmail.com', '$2y$10$X9BPXivFfNe9ULkZsHu6OeTRWr33PQczLPrDuZNWEspQhq.snGBQK', 774, 1, 0, 0, 0, 'sabbir-hossain_origomartbdcom', 'https://origomartbd.com/', '1970679264', 'Dhaka Bangladesh', NULL, 'MBLAFAQUWKZSDVOT', 'QLhkPXmBFgnQ5hVohgzocTWMrs6WTaba', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(156, 'Sumaia Islam', 'sumaiasumi05@gmail.com', '$2y$10$0dfzKP/6FRFyfymmK0R5Ju70rfINuMcRkdvPokKD4Jz2Zxj0ZtfvO', 773, 1, 0, 0, 0, 'sumaia-islam_shafiyoocom', 'https://shafiyoo.com', '1905468558', 'Dhaka Bangladesh', NULL, 'OKPMGOHRXKUCYA9O', 'yiux8YbB9GVT739XghH8t7U3sOZbni66', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(157, 'Shahjalal (Mir Forhad)', 'jamanm260@gmail.com', '$2y$10$EJ0MtuuUJJmOoEMkEm.Eweu4Q8nppDMRXtXJfDEzuK5Bq2pKV4666', 772, 4, 0, 0, 0, 'shahjalal-mir-forhad_stitchmartbdcom', 'https://stitchmartbd.com/', '1677066767', 'Dhaka, Bangladesh', NULL, 'K4RRQEQ1REEXDUI6', 'VHmyQbHL6FYhYozX6MwOSp6e00bKpgVk', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(158, 'Hanif Mahmud', 'hahiftisha11@gmail.com', '$2y$10$RWtNgSTo9kPnvz/Z5Ab7iuF271qPq47V6OVLV575wP0qN3WD1ZfHK', 771, 4, 0, 0, 0, 'hanif-mahmud_oplarycom', 'https://oplary.com/', '1746562730', 'Dhaka, Bangladesh', NULL, 'SXN6RUJCVR7BHMLA', 'GhLG8Py1KN5lmbVXoVmsAtnRAgrMXz9V', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(159, 'Khalid Saifullah', 'smartcapitalplc.mail@gmail.com', '$2y$10$cblmigOjebmI8AGQn9yCI.fFN2NAYUOQNXB10TPJQFm9xD9GVDimi', 769, 6, 0, 0, 0, 'khalid-saifullah_smartsebacombd', 'https://smartseba.com.bd', '1787463481', 'H#1286/3, East Moniput (Level-8), R# Begum Rokeya Sarani, Kazi Para Metro Rail Pillar No 269, West Side Mirpur, Dhaka', NULL, 'CTTP2OM8BKOFJDPE', 'lOreCj2S7aFqJCeBjitUx5T4kD2ANMHR', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(160, 'abul hasan', 'abulhasan6682@gmail.com', '$2y$10$2HApzwVjmDpqAUhFJC6kqO4UzpZoHG2D/zM4a.YraKg2IlnPuoh4.', 766, 4, 0, 0, 0, 'abul-hasan_hasnaloycom', 'https://hasnaloy.com/', '1711257586', 'Dhaka Bangladesh', NULL, 'TYPQFDYPS5RMHHSM', '1l5OvagxvsJVsAPlqeV3y8YF47Llfbqk', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(161, 'Mohammad', 'helloneedybd@gmail.com', '$2y$10$7f0AuTNx.Zy2WU5sLq.Rcejcf631m0KXLch6I8dxy/C8I5.5/Mf/C', 764, 6, 0, 0, 0, 'mohammad_needybdshop', 'https://needybd.shop/', '1781502795', 'Dhaka Bangladesh', NULL, 'YKO0M0PVKRM5CEGP', 'YPf4fyjpHsIGZwvdlPdGde4rHxUeXaBS', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(162, 'Md. Hafizur Rahman', 'smhafizur11@gmail.com', '$2y$10$NqkcA8CnC.Ni3OtEe7il0uMT.GFqO.cnIc4QoPQLRpDlqKXAdhXni', 763, 1, 0, 0, 0, 'md-hafizur-rahman_hafimartcom', 'https://hafimart.com/', '1729122244', 'Dhaka Bangladesh', NULL, 'INDK77DPVRZCHNSR', 'xlMmKBJYNDpXVGztqiMd0OqFoY2C73x0', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08');
INSERT INTO `dropshippers` (`id`, `name`, `email`, `password`, `dropshipper_id`, `package_id`, `total_deposit`, `total_credit`, `total_withdraw`, `user_name`, `domain_name`, `phone`, `address`, `image`, `app_key`, `app_secret`, `is_approved`, `created_at`, `updated_at`) VALUES
(163, 'Test', 'test@gmail.com', '$2y$10$nW1aD6Lsr4VCPwRPGZ/gG.P7.BFvPX/4/aTbM1tiLqhwSEtQKlrhS', 762, 6, 0, 0, 0, 'test_testcom', 'https://test.com/', '1000000000', 'Dhaka, Bangladesh', NULL, 'UZUOQBD6ZV6DHPQ9', '51itkHeCEfLqbLo3c73grLfOCl2wvrjy', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(164, 'HM ABDUL MOMIN', 'abdulmomin21430@gmail.com', '$2y$10$SUCnqAP4s9NkCItlkygMqeDaKaHrCxbhx48.4HBBMu55yIkI1A.iS', 761, 2, 0, 0, 0, 'hm-abdul-momin_ahnafstylecom', 'https://ahnafstyle.com/', '1677921430', 'Dhaka Bangladesh', NULL, 'J8NPP6PXGDXVG8RC', 'mQ0BvWILd7dFUz1pDyccyy7WvDbwIZbh', 1, '2026-07-28 08:46:08', '2026-07-28 08:46:08'),
(165, 'Md Ripon', 'attanowner.com@gmail.com', '$2y$10$/AoyEHwgCWV3yfYKV6eJcO4ZFrkBExzGxbleIVAPv08J//bleJ8zm', 760, 4, 0, 0, 0, 'md-ripon_attanshopcom', 'https://attanshop.com/', '1873618638', 'Dhaka, Bangladesh', NULL, '146ARB88HUR3BLOZ', '9U9S3Y36YhV65RjtQK9hy5daZk5iU8fq', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(166, 'Md Ridoy', 'mdridoy6316@gmail.com', '$2y$10$mwtFYUXrFTlYSbgC5n1fhutqLVPZ.XrREpt6Y4iVilinhVqzKf2vW', 759, 4, 0, 0, 0, 'md-ridoy_droploestcom', 'https://droploest.com/', '1733456316', 'Dhaka, Bangladesh', NULL, '3A1EHURYLYV8CRDM', 'yeMy4jB8KlcPJwNFjswBExhXNogJJXer', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(167, 'Asad Rabby', 'polashishop@gmail.com', '$2y$10$Mv9GMnaINSdBvy6KA2dMdua5jr8RM3sGM9TqTzcdT3dyvSGsnyIOC', 757, 1, 0, 0, 0, 'asad-rabby_polashishopcom', 'https://polashishop.com/', '1967211321', 'Dhaka Bangladesh', NULL, 'FLX4WNW1O3M8E7KA', '4eRpliLtQ0hUQI82ojGn5zfKo3w3TcIX', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(168, 'Najmul Islam', 'najmulislam061@gmail.com', '$2y$10$MkOUr0fCQBpIs2R1zd.m4OX6FviSpfsLu7yKuxNlPPfG8XKqQAuty', 756, 4, 0, 0, 0, 'najmul-islam_illynmartcom', 'https://illynmart.com/', '1836545112', 'Dhaka, Bangladesh', NULL, 'FLNLAGGESUTZQ1DY', '031AHRczZgByewqU7FF9KqmH7EfQzCXe', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(169, 'Md Alamin Matbor', 'alaminmatborbd@gmail.com', '$2y$10$ycfvjfPv3EaO/h.jm1kMPOgyZLh7UgB7Ymh/TNmQVxbZy3GLW62b.', 755, 1, 0, 0, 0, 'md-alamin-matbor_jummashop', 'https://jumma.shop', '1621517020', 'Dhaka Bangladesh', NULL, 'SWFNZFEFRMWXA8FF', 'MsXjbsGaZvgZ6togsjxiiQAqwlpogJLM', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(170, 'Abu Bakor', 'abbut4517@gmail.com', '$2y$10$KpawkX5EULnN0Wv8Kq8duO2A/dUHVHHph0N8a.fjK/JWOXGGoaP/i', 753, 4, 0, 0, 0, 'abu-bakor_zeenbuycom', 'https://zeenbuy.com/', '1895462943', 'Dhaka, Bangladesh', NULL, 'LMJS7JFPPH8H0ROO', 'juoCk99eYyg0J8mU0tfwvaMoSZUA8zOR', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(171, 'SHAHE IMRAN', 'saheimran156@gmail.com', '$2y$10$wbq5jQ8eHCroGC1qEB8vS.3u3428Oib5A8jK2Hx6cbo4VluMSGKkW', 752, 3, 0, 0, 0, 'shahe-imran_supperhatcom', 'https://supperhat.com/', '1787078718', 'Dhaka Bangladesh', NULL, 'HSFCA0KL4IFDREBU', 'zOuXqtUglKcsDxx7Bco4cKFuyAkqIkGr', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(172, 'ASM. Maksudur Rahman', 'asmmaksudurrahman@gmail.com', '$2y$10$SvR/7zsnyxjOPRyjwuD7yuUkrwkrHl5KUSn4Bg5CXFfiEjGgGvxWC', 751, 1, 0, 0, 0, 'asm-maksudur-rahman_sorbojoncom', 'https://sorbojon.com/', '1713118786', 'Dhaka Bangladesh', NULL, 'MPR1QJVV2EUNSMV3', 'jYxevQzx9yS5mpIr7IDmOcyTVTVDsSIH', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(173, 'Ebrahim', 'anauebrahim@gmail.com', '$2y$10$ibsrufbPxOJxQyjqC.LDkujeeZKNqY7pH.cADicunR1ofRS0g2Ga.', 750, 1, 0, 0, 0, 'ebrahim_exfoshopcom', 'https://exfoshop.com/', '1788337148', 'Dhaka Bangladesh', NULL, '1FD2WYVCDDLJ23RL', 'zi0MpQXiCrNIQiviXzlOLOyPchhxB3Ya', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(174, 'Kifaet Ullah', 'mdkifaetullah8595@gmail.com', '$2y$10$l7/iRSPyFLwfnNXjMEsdV.ZEo02kTbNgXOCFybkKAxpP3OlCbBM.G', 749, 1, 0, 0, 0, 'kifaet-ullah_shorbornoocom', 'https://shorbornoo.com/', '1408277697', 'Dhaka Bangladesh', NULL, 'ISPQRF2CW2JBZQJA', 'jopQSoVxF6QeUSzEgTTOaLcyxgjfmojI', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(175, 'Jamal Hossen', 'jhossen923official@gmail.com', '$2y$10$D5h8fgelG8PwCvRiwJKcJOkeaJQgXNNqVRdA78IazYUwcd78bCJOm', 748, 4, 0, 0, 0, 'jamal-hossen_odernincom', 'https://odernin.com/', '1745512439', 'Dhaka, Bangladesh', NULL, 'K5MK6JVDZQEKKFTW', 'GjGZtG4aXX6dcTU6Szahws3oUjjvEzFx', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(176, 'Alamgir Kabir', 'alamgirkabir5224@gmail.com', '$2y$10$OiBfZj66ga0mvW8JOm3WHegj71TcXrwAYHb4t2DVBgyj3ZMR/ITfi', 747, 4, 0, 0, 0, 'alamgir-kabir_monjelcom', 'https://monjel.com/', '1353007522', 'Dhaka, Bangladesh', NULL, 'TGVWQ3KN9ZADIUEB', '8yNo768hzDJxAzJ6oKv8dcreWbJNaBs2', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(177, 'Azizur Rahman', 'azizurrahman5617@gmail.com', '$2y$10$9Xmrx1BJR3eluBRUF.goPu2a4RHLSkKGuH.T6/jEqwo55ORVhh7qi', 746, 1, 0, 0, 0, 'azizur-rahman_inchafcom', 'https://inchaf.com/', '1944257245', 'Dhaka Bangladesh', NULL, '9KXQNULOTW4SILJH', 'A8KOy3curw7yf9uh64gt9WDUHjUtti5D', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(178, 'MD. Delwar Hossain', 'dhrana1769@gmail.com', '$2y$10$f3/gjEJPpsvllu.PsgtoV./KHN1/NwNNo4XsfUqCFa4znBYYL/ktm', 745, 4, 0, 0, 0, 'md-delwar-hossain_dropzooncom', 'https://dropzoon.com/', '1912370347', 'Dhaka, Bangladesh', NULL, 'RPI2NESSO00GQFSZ', 'Jb2T7KmcsBLurxMmG5GKab5KwiXqY5dx', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(179, 'MD RAKIBUL ISLAM', 'rakizonbd@gmail.com', '$2y$10$3.0DfQ8D5Pbvo1XNs7uP9.A0sJm/gZMVVmVHhWvIuAAIksOYZWQTW', 744, 4, 0, 0, 0, 'md-rakibul-islam_rakizonbdcom', 'https://rakizonbd.com/', '1918429234', 'Dhaka, Bangladesh', NULL, 'ZBPXK65YKWPHX7HQ', 'thxfqXrdhWSXXT3ZVKhft4R9mAUoV1d2', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(180, 'Md Omar Faruk', 'needbuy7855@gmail.com', '$2y$10$saQlv4OUUe6Gy1apIIeVrOeXP31HZPLbUC2z0XvG.Kei7SqoFmIEe', 743, 4, 0, 0, 0, 'md-omar-faruk_kinalagbecom', 'https://kinalagbe.com/', '1303472555', 'Dhaka, Bangladesh', NULL, 'VAL986X6ZQYJNOA8', '3MuZOOCVVLadV11drHIvifEFgNNJWawd', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(181, 'Sabbir Hossain', 'sabbir.hossain44263@gmail.com', '$2y$10$9Eqa9tLxmp4ZKCzpG17l8u/e14RdJZi9yZVo1Foo3F6FQUEeymQPC', 741, 4, 0, 0, 0, 'sabbir-hossain_hikmaloycom', 'https://hikmaloy.com/', '1797113134', 'Dhaka, Bangladesh', NULL, 'M3UH3QBMYSAISPLT', '8DXAL5jrSlVssKKQaa11oMtWCAosdS8C', 1, '2026-07-28 08:46:09', '2026-07-28 08:46:09'),
(182, 'Niamotullah', 'niamot82539@gmail.com', '$2y$10$dUTW2xp0U5fn02G1hvNedOLVRW4sdn91KEMM6NfjHSv2CUXaNTz/K', 739, 1, 0, 0, 0, 'niamotullah_orderlagbecom', 'https://orderlagbe.com/', '1521479240', 'Dhaka Bangladesh', NULL, 'T2OTSDIO4HJLMSNN', '2q9hkC5QzFY311C2jY7PYJJNOsPMXmYx', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(183, 'Rahidul Islam', 'rahidulslm@gmail.com', '$2y$10$Iehw.z.IUHD33D1VqCBUceUlK97iSMWJRZrQwSxsLp8mI1ALDRjKu', 737, 4, 0, 0, 0, 'rahidul-islam_sawfucom', 'https://sawfu.com/', '1303364718', 'Dhaka Bangladesh', NULL, 'ORL0BXKPADA9JBEZ', 'o66ACiVq99XeygRplWQ4lEG4t03n5l2M', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(184, 'MD. Akteruzzaman', 'mdakteruzzaman519@gmail.com', '$2y$10$DKObxvFnCujORqA39ua/IODZ2dRIYyAk9lUrRHxPWx15uLMEhjpfi', 690, 6, 0, 0, 0, 'md-akteruzzaman_easytobaycom', 'https://easytobay.com', '1940533029', 'mirpur 6', NULL, 'ZAH4MA9A8MNWX0HE', 'BVv1aGOTTEVoBUgFyepqSsS6sESjbvK7', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(185, 'Numan Ahmed', 'darazmart777@gmail.com', '$2y$10$XNyo4ekG7HuCWg3qx7vjgeVqo2LGHU3VBFCisJHJV6sw0Zu5h9vMi', 735, 1, 0, 0, 0, 'numan-ahmed_darazmartcom', 'https://darazmart.com/', '1724099336', 'Dhaka Bangladesh', NULL, 'YGRMSSOLB2MKD9MR', 'SLhsmbPFkUu1RX7RfAOTnQtDIYEuuEDV', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(186, 'Khalilur Rahman', 'rakivrahman17@gmail.com', '$2y$10$9Hn3/f2O5UsJfLtDuzRlBO.f5W31I55lxEHLc9GWppzZ3La2ZSqRu', 734, 1, 0, 0, 0, 'khalilur-rahman_tanilshopcom', 'https://tanilshop.com/', '1302989489', 'Dhaka Bangladesh', NULL, 'RG3H1X1VIXYLCG4O', 'dyahxXWBoE4Zketb3GT3zs1LZkGuNOVy', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(187, 'Aswan bin', 'aswanbinata@gmail.com', '$2y$10$Wm.Rg5Vr7S7xzDk5lVfzkO7Hc/umAhiHYF522n7kD0M4mpnXxBsZa', 733, 4, 0, 0, 0, 'aswan-bin_nexoorashopcom', 'https://nexoorashop.com/', '1768759105', 'Dhaka, Bangladesh', NULL, 'YD1ENSWBGH8MNJEP', 'YbqFp75F00UGi9B3W4qCwK5G9VOY69IT', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(188, 'Md. Samrat Hossein', 'samrathossein1983@gmail.com', '$2y$10$1e4ih4h.5Z49/CfrnZh1DebMAOvdTtCMpnOBhVmS3JMJfyucgknwG', 732, 4, 0, 0, 0, 'md-samrat-hossein_sahalxpresscom', 'https://sahalxpress.com/', '1785405052', 'Dhaka, Bangladesh', NULL, 'ULEIKOTAWBS6GQBA', 'LcC7Cq5aA1ccWLCPJ0FUsj2y2MfQ6iZM', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(189, 'Sourov Sabbir', 'souravkhan2888@gmail.com', '$2y$10$XA/XId9QIZnHjNp8sXehPe8ZbIgXe0QSG09JoVTFbIp75dOxitncy', 731, 1, 0, 0, 0, 'sourov-sabbir_carrybazarcom', 'https://carrybazar.com/', '1758808805', 'Dhaka Bangladesh', NULL, '22EAIWXYTYI3ATNF', 'Qmlhxkj66C752gE0S4xWZqrQ5VRdzFEh', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(190, 'AL AMIN', 'alamin25net@gmail.com', '$2y$10$GyMh/tRc8TbL5qtcY.Wo3ec98bFqzUw4U8ztc.d2eB0Rvfnj5yJ0C', 730, 4, 0, 0, 0, 'al-amin_amazingmartbdcom', 'https://amazingmartbd.com/', '1611140010', 'Dhaka, Bangladesh', NULL, 'WDWTOYEI643Z6CQR', 'N7YfmjH2iRWK2VpP2FRhuLNzkD9BVdio', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(191, 'MD MINHAJUL ISLAM RIMAN', 'rimon.bd1995@gmail.com', '$2y$10$jNIFUkdvKYVj.k7v226uPOWAPWvkvyHoSjnQtTzi6X4La/W080LNu', 729, 4, 0, 0, 0, 'md-minhajul-islam-riman_priyonexcom', 'https://priyonex.com/', '1934331960', 'Dhaka, Bangladesh', NULL, 'UTWVRLMZICAHUSZQ', 'bDWjNFpVtRulalAZkWF3l1mbbTb1JCpZ', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(192, 'Md golamazam', 'Golamazam811174@gmail.com', '$2y$10$hqUsWbT2.n2KkTm9dlrDjO3b0RDPCFiMU1Pk1F9Np.2g7YZ9tDIY6', 728, 1, 0, 0, 0, 'md-golamazam_jonotabazarcom', 'https://jonotabazar.com/', '1353008489', 'Dhaka Bangladesh', NULL, '5T4ORAYVIDBXWLQM', 'lgZy3cO2fAe7QjX3Z0lViSzffJRpF1Cz', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(193, 'Md.Hasan Sheikh', 'sunloybd@gmail.com', '$2y$10$gCK5PSVf/ot4/GCtKaFwTOIJNzM0gJacg7XtzTwtemL38EmzpW9su', 726, 1, 0, 0, 0, 'mdhasan-sheikh_sunloycom', 'https://sunloy.com/', '1608060616', 'Dhaka Bangladesh', NULL, 'LQFVRKFKLJYGYUG5', 'XcWQuKGsSl7caZZrd9qHNp5EMI010jDF', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(194, 'Md . Iqball hossain', 'iqbalsep13@gmail.com', '$2y$10$NTAnVA4fcdnPcbUUrbzMIeHH/yvYhlcbVqr1gLUqeU4jyKeSwp.te', 727, 1, 0, 0, 0, 'md-iqball-hossain_mimperialcom', 'https://mimperial.com/', '1716237798', 'Dhaka Bangladesh', NULL, 'QH9IJDE95OR6EY7R', 'TeskcYyLvPyENmcL0o7Y4Z1v42U2S1bB', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(195, 'Md Sazib Bhuiyan', 'sazib.bd16@gmail.com', '$2y$10$GjKOBWxKRUw8zMnphEVLBuv25ZkvFiobTBoB1vdeqCIOOaeRcwXI2', 725, 6, 0, 0, 0, 'md-sazib-bhuiyan_bengalclickcom', 'https://bengalclick.com', '1600250550', 'Dhaka Bangladesh', NULL, 'OMZQJR8WCGCIMTNO', 'EJ9xpX3TS58dnlR8ZGVjzLEZNFLyUsCZ', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(196, 'S. M. Rashadul Haque', 'rashadul@gmail.com', '$2y$10$OvnwvIcTE.6eFB4hoNoLi.nmlrT4JwqjPG1AThwgB7zOmB4SZNS1C', 724, 2, 0, 0, 0, 's-m-rashadul-haque_happizacom', 'https://happiza.com/', '1716614556', 'Dhaka Bangladesh', NULL, 'I7V0J16LJ0K14IWJ', 'h84fneplCCms87097TX3qp0xEIImAd5O', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(197, 'Abdullah Al sifat', 'abdullahalsifat4100@gmail.com', '$2y$10$LHztYti..yoyfJMVHwyUSOVYUi419J7bW.rkMrWwE9lJcWNu9SXry', 723, 4, 0, 0, 0, 'abdullah-al-sifat_asfiyamartcom', 'https://asfiyamart.com/', '1337003192', 'Dhaka, Bangladesh', NULL, 'GEXCDJKTB115J0KF', 'odlzo4Pa5acivPkElABm1Kc7V8Tvm1VS', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(198, 'Shomon Ali', 'abdullahshomon617@gmail.com', '$2y$10$lhm28d0w401YN357aIfUY.mCOn/b087bkowxNPMN7dvILH/sI2gL6', 722, 4, 0, 0, 0, 'shomon-ali_insaffiancom', 'https://insaffian.com/', '1792204550', 'Dhaka, Bangladesh', NULL, 'PFHXGTFXXQAC9XDZ', 'gNTxtuDqxYo9ARMyQQnR7uWBZKADrZOD', 1, '2026-07-28 08:46:10', '2026-07-28 08:46:10'),
(199, 'Moim Sumon', 'moimsumon@gmail.com', '$2y$10$COhMJ/2C9Kq4RPbM/hq8u.Gb277nsl5DTFlGsPk.zqwDobOg0itCW', 721, 4, 0, 0, 0, 'moim-sumon_msvallycom', 'https://msvally.com/', '1712439455', 'Dhaka, Bangladesh', NULL, 'B1DUABHHZW0YM74B', 'u2LTvdy8XxGHU3S7pJYxZtQH1Gtw3f7I', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(200, 'Tamim Abedin', 'tamimmahin342@gmail.com', '$2y$10$NFSsFLO7vos9cvLvEAouO.TtyLrsLLyRBS5wqj4uWNUH501OP4Wku', 720, 4, 0, 0, 0, 'tamim-abedin_trendsynergybdcom', 'https://trendsynergybd.com/', '1633032230', 'Dhaka, Bangladesh', NULL, '82SPUTYRI2EPGM44', '4Jka5sMDVFqkyx2NxSMLR7ltm9ljyrhu', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(201, 'Md. Azim', 'azim9121@gmail.com', '$2y$10$sgnnSIxkaBengGrOGvgJ8uFe.tz5rqRJ6IStrfjHKRJOsT92lm3Ry', 719, 4, 0, 0, 0, 'md-azim_afiffashioncom', 'https://afiffashion.com/', '1300524468', 'Dhaka, Bangladesh', NULL, 'DDJPP2HNHRXOADNE', 'fU2xEzoi0k71p8C77aMbGlVjOYuwqIR4', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(202, 'MD. SHARIFUL ISLAM', 'a2zmartbd71@gmail.com', '$2y$10$QN0K5lNDYEj4h9qgCUmFYuHRGSa1tg5Q0M.vVPNfYSKMzoy3I/6Ce', 718, 4, 0, 0, 0, 'md-shariful-islam_mittozcom', 'https://mittoz.com/', '1558257808', 'Dhaka, Bangladesh', NULL, 'HWYZX9LHXXIWCLSW', 'RIDawFnSFHcikKDkZlDeZ6WYEZVGZtIk', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(203, 'Syed Rayhan', 'brovicbd@gmail.com', '$2y$10$XWqi8nzWNRA6W6yCz5Yt/Ov9r.LVRQ/uTrF.7Y4eMHZ0dDbK6teKO', 717, 6, 0, 0, 0, 'syed-rayhan_brovicbdcom', 'https://brovicbd.com', '1890634503', 'Dhaka Bangladesh', NULL, 'TMKD7IMPKWTD5BI4', 'fO4M605RvLguVLM70Dhrn0xi2ixjFR4C', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(204, 'Monir Miya', 'miahmonir036@gmail.com', '$2y$10$e4hAkhFpaW9TH9g1QHEjc.g83NNwCeFXFZeKffz9c2EOo3hPGL3aS', 716, 4, 0, 0, 0, 'monir-miya_miahlookcom', 'https://miahlook.com/', '1720102162', 'Dhaka, Bangladesh', NULL, 'AFRAHFDHWYARHM06', '5jZwPwNFNEeSjqv2vOAB3RhwLCC7PZAM', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(205, 'Masud Zaman', 'masudzaman907@gmail.com', '$2y$10$8I1m4Gs/DRNVvzaSepOYKuq/a0RLixO4ipW7zjHiyD87vz6Uwut2S', 715, 4, 0, 0, 0, 'masud-zaman_unifamartcom', 'https://unifamart.com/', '1842399193', 'Dhaka, Bangladesh', NULL, 'AFNAW6ZJXZFHJ8ON', '2k0M4lmEYc7nDMwaWtgHgfmpSFZya8IM', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(206, 'Shakil Ahamed', 'shokbazbd@gmail.com', '$2y$10$6jkH40ZSDU6wpfHlqRRHXuWEJ9Ej5ECleRWr0ngSu1rzVvxypaPmO', 714, 1, 0, 0, 0, 'shakil-ahamed_shokbazcom', 'https://shokbaz.com/', '1303830987', 'Dhaka Bangladesh', NULL, 'KGRGYUUXZKKTMCPO', 'wyWcRKNHRvSd3qf3GSZ5fKZ8Csc9a4yS', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(207, 'Md. Golam Rosul', 'golamrosul851@gmail.com', '$2y$10$uhZW4HYMOur5oXf6A4gaUO8tL3.JE/Wu2YGkimbFX5Q5e.580Q2Qe', 703, 1, 0, 0, 0, 'md-golam-rosul_insafiyancom', 'https://insafiyan.com', '1303048104', 'House # 26, Road # 8, Kawlar Dakhil Madrasha, Nayabari, Dakshinkhan, Dhaka -1229.', NULL, 'YUACOCBKGF4HWMG4', 'n7zZ5d5RIzBp92dpraZZf7A2VSZfjv78', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(208, 'Monjur Hossain Khan', 'monjur6677@gmail.com', '$2y$10$ogrGRT1XXYJ4MG70jpziv.i3vZNjcdN1mxcrTO9t4USs6YxIAXMbu', 713, 2, 0, 0, 0, 'monjur-hossain-khan_sellbaricom', 'https://sellbari.com/', '1730033040', 'Dhaka Bangladesh', NULL, '3CPN7ZSPWT3HFWQB', 'X5h367nLtISZqgplSJWMqmYVbptzgycW', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(209, 'Solaiman', 'mdsulaiman8066@gmail.com', '$2y$10$FcBioCjhIV35jiXjWQtFCeaVAuaFaEjjZG2fdTMuP4rU6FqLVS1ea', 712, 4, 0, 0, 0, 'solaiman_noorzanacom', 'https://noorzana.com/', '1732258066', 'Dhaka, Bangladesh', NULL, '68YQYUZX70V2FCAE', 'kie7FpoTNgTaRQvEW36amQIWEoHopPso', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(210, 'Mahabob Alam Khan', 'quickbazaare@gmail.com', '$2y$10$yjPwDW6DHyENP7GqSYweEuyYph/p.0hcLrTd1QEnV6gOHyykVwIEu', 711, 4, 0, 0, 0, 'mahabob-alam-khan_quickbazarecom', 'https://quickbazare.com/', '1760742623', 'Dhaka, Bangladesh', NULL, 'LOJTGHKTIRJHKWP5', 'q3FSIhQiKFBeMBhD74FY9daO3FDjH58o', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(211, 'Rayhana', 'rahmanseller121@gmail.com', '$2y$10$Vz3nlbTz27oKuvfgOA5tkelDadMJ8Dodh7PTlNrnq2eMAoTRCmq1u', 710, 4, 0, 0, 0, 'rayhan_rayhanafashionbdcom', 'https://rayhanafashionbd.com/', '1948110663', 'Dhaka, Bangladesh', NULL, 'CI5DSGCC1BCQ2KNZ', 'wk06PJDA8o1y4vdAsbjxPUw5HNpqfvQI', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(212, 'Ismat Ara', 'sandreens.26@gmail.com', '$2y$10$68y0pcx8RvwdymZavlAsz./tIoohU0pyfSWl3jD4GHsUnXanuGVNq', 709, 1, 0, 0, 0, 'ismat-ara_sandreenscom', 'https://sandreens.com/', '1743879996', 'Dhaka Bangladesh', NULL, 'TH1MLEYEPUSAZBRB', 'Yd62nhxniueiu9k0CszZTsGJTmjrAFmm', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(213, 'MAHFUJAR RAHMAN', 'mahfuzraj19002@gmail.com', '$2y$10$QcLYpeFwHJvtYNPRwT79EO.r7t3M5uYr9cvjPj5NqVE9OQtbF9oMu', 708, 1, 0, 0, 0, 'mahfujar-rahman_kacerbazarcom', 'https://kacerbazar.com', '1521500785', 'Dhaka Bangladesh', NULL, 'FUVP4D8GUMK4QUND', 'jq8NTdYJyQfWdJ998vgFMSSKWkOG51q5', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(214, 'Alamin', 'alaminmasrur651@gmail.com', '$2y$10$tGFy.fGv.pXxzJEmCB1pv.XjHR9i8eH8sM0NvfkbdA6SDMP0wsXqu', 707, 3, 0, 0, 0, 'alamin_tohabazarcom', 'https://tohabazar.com/', '1616401953', 'Dhaka Bangladesh', NULL, 'ZK9QXPHGQUXCJPQG', 'PfFgsoV3nsrqikspWPRDhcyU7PErb5tn', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(215, 'Mohammad Humayun Kabir', 'humayun197611@gmail.com', '$2y$10$8B/324DA4bQ9c4O.Ppmj7eHpUxAyhVorq17i/PCWivfVo1MZ8NR/S', 706, 4, 0, 0, 0, 'mohammad-humayun-kabir_fabriwalacom', 'https://fabriwala.com/', '1973244009', 'Dhaka, Bangladesh', NULL, 'G2JTNY3RRTFERLKD', 'Avek8V3hLIdXvpmRTnV8Wz07RjMCMeww', 1, '2026-07-28 08:46:11', '2026-07-28 08:46:11'),
(216, 'khabir hossain', 'hkhabir13@gmail.com', '$2y$10$r9Od06oR9Op638qJWu.fSeywmZiw3T1KM4cNnSDKL2/VM8xPSG/lm', 701, 6, 0, 0, 0, 'khabir-hossain_lifeiancom', 'http://lifeian.com/', '1635648892', 'cepz,chittagong,bangladesh', NULL, 'LHY1PWRYCVHPVNMT', 'hKcUjs19udqq0UfCxyb1nd1JbIKtG1tT', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(217, 'Shofique Mahmud', 'shofique28@gmail.com', '$2y$10$9fTOTnCkpcyk42vpIT1fBu7P/HUhbBpD7vfGCj1F6.SDoq4.LoZx6', 705, 4, 0, 0, 0, 'shofique-mahmud_nijekoricom', 'https://nijekori.com/', '1719745538', 'Dhaka, Bangladesh', NULL, 'U6JNJIGNB8KPWIMO', 'yQkhnoChBS99o4fPmJPsdVdnOyTKCnvN', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(218, 'Sorolmart', 'mosfequrrahman1994@gmail.com', '$2y$10$ykSKdxkJxzrjTGtqqj7RnOxbCuJcix8zQTox2Bc6XSpmj8hd/8SDi', 704, 4, 0, 0, 0, 'sorolmart_sorolmartcom', 'https://sorolmart.com/', '1680776955', 'Dhaka, Bangladesh', NULL, 'NQTP1Z6LUKOMVZJ7', '8tvVpbojjAiInsRFltfXiehC6kBOTMN5', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(219, 'Md.Mamunur Rashid', 'contact.zanabi@gmail.com', '$2y$10$hvKhHF2xrieHtyn9Jx48l.lPaMqkKyvDgU23il7D0Mq4xbsO6BYr6', 702, 4, 0, 0, 0, 'mdmamunur-rashid_zanabicom', 'https://zanabi.com/', '1406383616', 'Dhaka, Bangladesh', NULL, 'LIKNHUDVN0MMTBE0', 'SFirlIj8jIShSDJhESgA8ZucNKPBiim7', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(220, 'Md. Sirajul Islam Shake', 'siraj.eng.bd@gmail.com', '$2y$10$BXZgL4JqnhTGM1Aci33raONfawxYjWhzOivOv6CaV7yncBeSRcYIW', 700, 1, 0, 0, 0, 'md-sirajul-islam-shake_femzymartcom', 'https://femzymart.com/', '1856498002', 'Dhaka Bangladesh', NULL, 'XXUOYBYZHEFOQJTH', 'BZQu7KefS7QpfTkBg3e9bDdQJ2y6zpbP', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(221, 'Md Mamunor Rashid', 'mamun70626@gmail.com', '$2y$10$cb72cDHPgwHqL3XczHe/5eWGyYiI8MLedFpRl4KalUmF/CVfFNYG.', 699, 4, 0, 0, 0, 'md-mamunor-rashid_kamiyabshopcom', 'https://kamiyabshop.com/', '1911770626', 'Dhaka, Bangladesh', NULL, 'V7ZHLPGNICVFXABT', 'KWMlzpzvFdp0osXbDlZDdymzgUf5RRPz', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(222, 'MD ASSADUZZAMAN', 'asadzaman25873@gmail.com', '$2y$10$5i2MRNfXT8PA/hAt2x4MOOnmFxcfZX1qIF98FECor7yldLe.HD4AC', 698, 1, 0, 0, 0, 'md-assaduzzaman_nestshopbdcom', 'https://nestshopbd.com/', '1795259625', 'Dhaka Bangladesh', NULL, '3GMZ6R2JHIJ73QU9', 'jigtcepJcUJ4pdmKur99ggJCQ2aRpdjT', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(223, 'Jasim Uddin', 'jasimbepari@gmail.com', '$2y$10$.qavOL0DtYbLuGmR9vX/1e33wmS0w0O9CxBLkaEm94lVjhC/H4ZRq', 697, 4, 0, 0, 0, 'jasim-uddin_ononnomartbdcom', 'https://ononnomartbd.com/', '1930542074', 'Dhaka Bangladesh', NULL, 'UHQKVMPKTIOSXTLV', 'yaVK3plcFoyuo1eMuMEuwul9W1HdPZSE', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(224, 'Aminul Islam Sohan', 'sohan.aide@gmail.com', '$2y$10$AuvwtSArBEV3pnbW5Lxw9ed7XRKaTbBoTod8UKn0wWvV7sbhHHFky', 696, 4, 0, 0, 0, 'aminul-islam-sohan_exfomartcom', 'https://exfomart.com/', '1737488111', 'Dhaka, Bangladesh', NULL, '7E3VDAQBR3LXZGDM', 'WIM28BBxjG0yfZncRaIqzbLffbX4UMPh', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(225, 'Syed Osman Goni', 'syedosman0987654321@gmail.com', '$2y$10$sGENBXpet060IK./A0lMe.9q9WDbc5EeOu/uEB9L5EnPgo3Jk8MlC', 695, 4, 0, 0, 0, 'syed-osman-goni_fatemaacom', 'https://fatemaa.com/', '1540683672', 'Dhaka, Bangladesh', NULL, 'GNTPMHEPVFOS8IYN', 'Mzmm02h6Lr8TcndMYKR2MP0O91JS1eyw', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(226, 'Omar Faruq', 'omar.codezzi@gmail.com', '$2y$10$bs.Ac4RZwUgPQWslXLBMz.KS5.ApQiIIY.G/CMFOPA/1BJhOeAK9O', 694, 6, 0, 0, 0, 'omar-faruq_easytobaycom', 'https://easytobay.com/', '1821521015', 'Dhaka Bangladesh', NULL, 'U1YULXGHODIDOV11', 'kNbYkICZxtBk66adRy2ORPAc2Inn5zfm', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(227, 'Roki', 'bongozamart@gmail.com', '$2y$10$H46MkDRiS9IKq60i9osicetM7XDwlT15OfrRhWJuqpHa3dlw4FI4a', 693, 4, 0, 0, 0, 'roki_bongozamartcom', 'https://bongozamart.com/', '1793771371', 'Dhaka, Bangladesh', NULL, 'EANDHHXEC8CXXGSS', 'jpbBL2BWDmtgFqiEPHqspiuIorebZMq2', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(228, 'Shahab Uddin', 'Suddin20@gmail.com', '$2y$10$Sw4MnQCgDC51JKWyVR09PuyIWX6FRarNh4KtJo/amux8MxW5MHTz.', 692, 1, 0, 0, 0, 'shahab-uddin_taybamaxcom', 'https://taybamax.com/', '1773737691', 'Dhaka Bangladesh', NULL, '45UGLUSUOKQSJFSA', 'X4pOVN7hpsJHc8D1usDeyDBM1Kmis5Kl', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(229, 'Farhadul', 'shobmartonlin@gmail.com', '$2y$10$4jBhyYEJwqViTCM8qQFhbexwiOIjyB.vET6gZ6ebj4LhDGXiW51Hu', 691, 1, 0, 0, 0, 'farhadul_shobermartcom', 'https://shobermart.com', '1829586588', 'Dhaka Bangladesh', NULL, '59CEWO6ED9AJGD6H', 'YdX2xjU0t99J7o67EZdEY44fyvpLQysd', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(230, 'MD. RAIHAN KABIR', 'kinimegashop@gmail.com', '$2y$10$wWCwMQYN8QH7/Jks8uzBVeHfVS4f.qYxSsdH4m5a3/1KRms5WiDI.', 689, 4, 0, 0, 0, 'md-raihan-kabir_kinimegashopcom', 'https://kinimegashop.com/', '1765110809', 'Dhaka, Bangladesh', NULL, 'HJMTQQ2XLKBOMR1U', 'M52qqax4SHMN9iD8obGtAnfqqj89Ju3J', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(231, 'Abdul Hay', 'mahyefashion@gmail.com', '$2y$10$PrHB2hoTA2PR8YhuazV3YOazFTE/odN9V4H/8GghMo0LXXhXkiEGi', 688, 6, 0, 0, 0, 'abdul-hay_mahyefashioncom', 'https://mahyefashion.com/', '1600204488', 'Dhaka, Bangladesh', NULL, '95VL6AJXZW9ZRCGP', 'TMFjI560rhPWwMNzfTTQzDWFixu2MS2r', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(232, 'Rasal Sarker', 'pixelnetworklimited@gmail.com', '$2y$10$J0UpETu3Tgzd5QpIqpt2Tub7psQkyJQvHM2srMJX517cigoYMV2TS', 687, 4, 0, 0, 0, 'rasal-sarker_ourdarazcom', 'https://ourdaraz.com/', '1926816704', 'Dhaka, Bangladesh', NULL, 'NLRFYYDYEZVHI7J8', '9KzQGLPwTJ2gMfdRzneUV966enRQsPgr', 1, '2026-07-28 08:46:12', '2026-07-28 08:46:12'),
(233, 'Md. Rasel Sarkar', 'wavehomesolution@gmail.com', '$2y$10$ui8b67hqH8lGnZjq63XwOOimBD0JM/hB68Fjzaxmg2Fm96.S2kKh6', 686, 6, 0, 0, 0, 'md-rasel-sarkar_wavehomesolutioncom', 'https://wavehomesolution.com', '1860824050', '20/A RS Bhaban, Motijheel C/A, Dhaka-1000, Bangladesh', NULL, 'QPQ6AKYJBQQ5UMND', 'DI4Apf6RsEHN8r2NBPcrp12xmGUGGkQp', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(234, 'Tanvir Mahtab Uddin', 'crownvalybd@gmail.com', '$2y$10$SIaomyh72hOWcki8GN1T7O3ViixTTQzfPJVMUkjDRjB/x2U7jvVYm', 684, 4, 0, 0, 0, 'tanvir-mahtab-uddin_crownvalycom', 'https://crownvaly.com/', '1972840193', 'Dhaka, Bangladesh', NULL, 'QDDZKR3PFHH4JC5K', 'jP5iVJugPsGfI18o0raApw8sQZcfYpUF', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(235, 'MD. MONIRUL HASAN', 'monirulhasan737@gmail.com', '$2y$10$taSN8NFXJAUobXhKInGlZuh1LdCCmHsPh08RTaJQGkp1MQ9zh8b7e', 683, 1, 0, 0, 0, 'md-monirul-hasan_fabykidscom', 'https://fabykids.com/', '1871546881', 'Dhaka Bangladesh', NULL, '4P3WDZXK56SN2HG2', 'RbIR0qB4hyZ6X4XAkyUvzVB47RwsaPPK', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(236, 'Mustafa Rumman Chowdhury', 'mustafa.wfb@gmail.com', '$2y$10$mOJEXzVLCtDjL9m6uZfpc.27GVFk0NfVaSdZ/pcgc11bAonub/GwG', 682, 1, 0, 0, 0, 'mustafa-rumman-chowdhury_kinedeicom', 'https://kinedei.com', '1308627273', 'Dhaka Bangladesh', NULL, '3UETWKFYFSU98FGU', 'FP7NLavBY38WsyUIQOTMj9pGwMEUzski', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(237, 'Alamgir', 'Mralamgir7878@gmail.com', '$2y$10$WGU3Mve4JyFmye0EIYlaaeHJ8hcJ7WPAjFb2hIUGfTYYurKeiBOby', 681, 2, 0, 0, 0, 'alamgir_rishashopcom', 'https://rishashop.com', '1780505405', 'Dhaka Bangladesh', NULL, '2ZSGAV4LYKGJBVUT', 'KNA0N510g4kzZPwz3pYKzjTRtQbl3TAd', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(238, 'Mozaharul Islam', 'seyam1872014@gmail.com', '$2y$10$7wG3X/Fb0g5gWPv/k7gDl.oxa8j3MmAMIO0j8Zts2lRfkoZmcbXoq', 680, 1, 0, 0, 0, 'mozaharul-islam_seyamuntacom', 'https://seyamunta.com', '1615124352', 'Dhaka Bangladesh', NULL, 'XCHVXE1DJBLX7VMX', '05oqIrZAX2ij3151HINBrVYawj70X6eO', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(239, 'Rashid Ahmed', 'rashidbagha@gmail.com', '$2y$10$nB0.P9e.oXJ0z2ukuvujhOYqWnQuxIPPpfuTIIVTYNwGP.c2uJT9e', 679, 4, 0, 0, 0, 'rashid-ahmed_timeyshopcom', 'https://timeyshop.com/', '1601555568', 'Dhaka, Bangladesh', NULL, 'CKPDJJ1FNNZ7T8JP', 'Ys5DdhaS8sMayEZKlCAAbjktPKiu8ATc', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(240, 'Md.Ariful Islam', 'arifulislamferoz550@gmail.com', '$2y$10$Szfr05JKZlhmeQ08vwvAM.cGnfbf.EQj4JymmoB55DXkZgMzkE/6a', 678, 4, 0, 0, 0, 'mdariful-islam_msakondocom', 'https://msakondo.com', '1758615796', 'Dhaka Bangladesh', NULL, '4FWNHLFCIWGFGHLG', 'ePJ8fvgQv9Z95wuV15bhtHUcd4b80Fpj', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(241, 'Mostafia.com', 'mafuzur757@gmail.com', '$2y$10$OgjROBYrxmja1cwlMU.wb.C2BrzPttwR43INK4u1cbu8bvsHew.rS', 676, 4, 0, 0, 0, 'mostafiacom_mostafiacom', 'https://mostafia.com/', '1818670293', 'Dhaka Bangladesh', NULL, 'RZYTODLWSZKTXLNY', '4TlmnlPSVVJZjn1dsIHXz915PUZW0QR8', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(242, 'Md. Asaduzzaman', 'navidza2011@gmail.com', '$2y$10$q2SuB2vs8JHzlg5NyNMJ5erLGiOofMZSUpBsX67tAv83chBmOyS.C', 677, 2, 0, 0, 0, 'md-asaduzzaman_febricghorcom', 'https://febricghor.com/', '1712768036', 'Dhaka Bangladesh', NULL, '1MCK5UHG2RN3WWU9', '9PJyJdwy9ZWpHCQB8xTYBbsVAcJGnMoP', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(243, 'Md. Abdul Ahad', 'ahad887664khan@gmail.com', '$2y$10$fl56TmleHaEroSy5h4IreelsWpp8TwMxv.NwhL77B2F/AJrhXGh4G', 675, 6, 0, 0, 0, 'md-abdul-ahad_maxmart24com', 'https://maxmart24.com', '1712887664', 'Dhaka Bangladesh', NULL, 'EQNGR1QF3ZKFRJQV', '3nx74fGkxS9BzCVkcl2Fmtb0FXSKHSUj', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(244, 'Mumina', 'muniaakter217@gmail.com', '$2y$10$y/gh2rZgQNHehRla/0RLauQBccyJvqz/V26bz7.s405r3MSjrPatO', 674, 2, 0, 0, 0, 'mumina_nettozacom', 'https://nettoza.com/', '1679532183', 'Dhaka Bangladesh', NULL, '9ORJ466EDG9DCRST', '7lJaJdpWIoU1CFfEJOF3fOoGd0eSPGbZ', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(245, 'Muhammad Younus', 'evershopbd24@gmail.com', '$2y$10$p8h/YeJwTp4zlNtucW.29uBnRcq.fNBCGwGDIn2vTm6mxYhAebGg2', 672, 4, 0, 0, 0, 'muhammad-younus_evershopbdcom', 'https://evershopbd.com', '1340797084', 'Dhaka Bangladesh', NULL, 'QUPDHRLFM5NQOMCR', 'ygSwO7ZFRkWJeNgbOuePkIm9SSHeCyMQ', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(246, 'Saiful Islam', 'saif.503507@gmail.com', '$2y$10$LdHUZMNmqA//Y28RiWjPJOblzKMpDIZQvGb6MAWbOTHjYWvVgFsA.', 671, 4, 0, 0, 0, 'saiful-islam_monbuzcom', 'https://monbuz.com', '1886503507', 'Dhaka Bangladesh', NULL, 'OLTMG54SULFNMMEK', 'R05jXoV86bjlwZoIGzySlZpsoA9Kw0d4', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(247, 'ZIHAD HASAN KHAN', 'khanzihad.zk@gmail.com', '$2y$10$wtHyzPnBY84yzDg5gq6L8.jaIzCYXvCIswGKjXyXg/bQqWiiLbZj6', 670, 1, 0, 0, 0, 'zihad-hasan-khan_haativacom', 'https://haativa.com/', '1771907557', 'Dhaka Bangladesh', NULL, 'XARYXDXIBNW22ZB3', 'qDOOsREn0JNe5pbqcmlEwq2OWaIRVBG6', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(248, 'Md Ala Uddin', 'mdalauddin500feni@gmail.com', '$2y$10$xD3u3GHSNKtf5Hff5dVMJ.dXllVjzuEG6H3igsl2XbvqfQS0.AeqG', 650, 2, 0, 0, 0, 'md-ala-uddin_shinybdcom', 'https://shinybd.com/', '1812706569', 'Sohid Sohidullah Kaiser Road, Feni Sadar, Feni', NULL, 'QRQVYRARJERQIGD2', 'fTOiJpiJaYT7PPrkWifEvBo0Z6oIyU6G', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(249, 'abdul gafur', 'youagafur43@gmail.com', '$2y$10$aoJt5vd4PskYtfY0OvUGSux8jF/yrx9Q10E.2bpwqcUYjiKnOIHXi', 668, 4, 0, 0, 0, 'abdul-gafur_kenaapcom', 'https://kenaap.com/', '1727445488', 'Dhaka Bangladesh', NULL, 'YGS6AFKRXAV9R4TH', 'zOeeVqy9rgSpoVNmNcB2IF1glsKvNDCd', 1, '2026-07-28 08:46:13', '2026-07-28 08:46:13'),
(250, 'MD MEHEDI HASAN', 'deenmartshop57@gmail.com', '$2y$10$IU.uG5laIq0zFQSsyln6G..3v1IvrONzjp3LSSW6CCAeGDBYj.SW.', 667, 1, 0, 0, 0, 'md-mehedi-hasan_deenmartshopcom', 'https://deenmartshop.com', '1621528996', 'Dhaka Bangladesh', NULL, 'NUF7UOHGBF1SFSZP', '4JFcTeTaVi0ngRvb4hnPNtTw1eRLjOTn', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(251, 'Ruhel Munsi', 'raiyankabir15@gmail.com', '$2y$10$GQgfhvBQTNwYfP1.g.kZeeg2nlUKo.6BBpdj25tONmY5hXaDvgwLO', 666, 2, 0, 0, 0, 'ruhel-munsi_mazhiicom', 'https://mazhii.com/', '1880723201', 'Dhaka Bangladesh', NULL, 'YTSPKHUOJW9IUNGX', '0dkBrZb0OotCvtp0Uyn2jPV7MJzVSmw1', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(252, 'MD.Arifuzzaman', 'arifboss1987886@gmail.com', '$2y$10$s9nigafsbD5vE6SkeLtyJuGR/nq9vLqnsTkVGuTTczEW5SnOeriFW', 665, 1, 0, 0, 0, 'mdarifuzzaman_sfngmagicmartcom', 'https://sfngmagicmart.com/', '1725081038', 'Dhaka Bangladesh', NULL, '8BWPCER5PFYMRTVN', 'ZZr1SqvT2wgcYYdyiPBp4TvGlKO1Aryj', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(253, 'Shahinoor Islam', 'munshistore17328@gmail.com', '$2y$10$OfIyjR3TTUoAgfBUwSpffeVPLzEjEJFSSQk6IIlszfYsXTKFdCmkm', 664, 4, 0, 0, 0, 'shahinoor-islam_munshistorecom', 'https://munshistore.com/', '1716299700', 'Dhaka Bangladesh', NULL, 'TLRHK4TWX6S61ULP', 'N8fJqQ5HbrcSXASyCr0j3a6m9EFN0Pu6', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(254, 'reyad', 'serviceshebabd@gmail.com', '$2y$10$gaL1KoqkPTB/aatwVvfORuu5RT7VC.fh19UObuJOJsYuJvUIl4c6G', 663, 4, 0, 0, 0, 'reyad_ozyamartcom', 'https://ozyamart.com/', '1954626108', 'Dhaka Bangladesh', NULL, 'ETTB6AJ3CAPW3OB7', 'vUSuIJwIxhn5oJBkPcLGRrbo5CHfoOiM', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(255, 'Md Asaduzzaman', 'asad1414bd@gmail.com', '$2y$10$zrPwwb8mmqPZ0Nygjo87PecspGSxGWwUXuQHdQmDM2nSggfeteHZu', 662, 4, 0, 0, 0, 'md-asaduzzaman_easyaancom', 'https://easyaan.com/', '1709141379', 'Dhaka Bangladesh', NULL, '152NMNNFVMVSN2BC', 'xj94XDKz43CwuphUwL2ZaXi1YSUdLP7H', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(256, 'SHAHIN ALAM', 'wwwshahin719@gmail.com', '$2y$10$Dd5lzj9xxHKt9B.QF/jNPOqO5Y0ia6me4ggIwIjT3.kuQL1AwWfKK', 661, 4, 0, 0, 0, 'shahin-alam_fashiyanacom', 'https://fashiyana.com/', '1942642004', 'Dhaka Bangladesh', NULL, 'FRCUZHOQIXJYRKMO', 'P9kqsnc2BFG08fWBu2A2h4yC0CmtytK6', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(257, 'Md Monir Uddin', 'mdmonirpalash@gmail.com', '$2y$10$rsz/1KgFn2ENRLyZwgzRnOz4M6urShm5OTBcPGzJwIlEkdgbhm6Uy', 659, 4, 0, 0, 0, 'md-monir-uddin_bosemartcom', 'https://bosemart.com/', '1723294091', 'Dhaka, Bangladesh', NULL, 'XKVNGWZFL4HMOIES', 'g24Ch6WXeuYXhS2vZybHEQpm1Pm4rAAL', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(258, 'ABM Kabir Alam', 'masum3068@gmail.com', '$2y$10$mO7yCI3NnSyv3AxSME7uIOIUgXFhRDeVdJlXbRD5qDktzACoc729u', 658, 4, 0, 0, 0, 'abm-kabir-alam_nittoshodaicom', 'https://nittoshodai.com/', '1816557212', 'Dhaka, Bangladesh', NULL, 'VFFTAYHAQLA3MFUY', '4WEZJPU74WAryoPE0EhpjbybUPpxhovI', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(259, 'Tanim Sharif', 'worktanim1@gmail.com', '$2y$10$C1B1ORen4f9Szz..4tKSV.1v3iGj9Yab1PWeFUpDiHrFTZxHi2.F.', 657, 1, 0, 0, 0, 'tanim-sharif_pushpeikacom', 'https://pushpeika.com', '1780200486', 'Dhaka Bangladesh', NULL, 'RUJDZY0TEFSPNWAX', 'tS0nhSON7H3BfqaH9mQIOjq5TzzbndSY', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(260, 'Sabbir Sorder', 'sordarsabbir25@gmail.com', '$2y$10$.ACBQX3770UtuQHbSgdzAuqpb8Y9u79Y/5z88sZXJCTtNb6G9TZYy', 656, 1, 0, 0, 0, 'sabbir-sorder_uniqueldtcom', 'https://uniqueldt.com', '1793683103', 'Dhaka Bangladesh', NULL, 'FOAACSYSY1ZJLCFX', 'bbLOiA9Rju0h9Kmi0XiCa20pqIu1MYQk', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(261, 'Feroz ali', 'ferozahmed112@gmail.com', '$2y$10$Gk8AzISfy2teI.DeDk.PNeoj2ulLwsRF4BIDIRHiX8Z.pRUOdqLsa', 654, 3, 0, 0, 0, 'feroz-ali_goriberbazarcom', 'https://goriberbazar.com/', '1316471023', 'Dhaka Bangladesh', NULL, 'Y5EDFOHZTDYQ5WOE', '28J7F4D5vQiQAuMEj381KTMRSxD5Vjv8', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(262, 'Md. Shaiful Islam', 'shaiful.tex@gmail.com', '$2y$10$oNenlUxrTiVoF7.zUVcnaeYwYX8T7Sd4Hzr9sXX9Nm93rcbu9EmCu', 653, 1, 0, 0, 0, 'md-shaiful-islam_fidyaancom', 'https://fidyaan.com/', '1717513119', 'Dhaka Bangladesh', NULL, 'CRNNWR6P634OTSMX', 'q2AJMCxUkgmW86rhlduyoRphB1RON1iQ', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(263, 'Mizanur Rahman', 'mizanmasood2018@gmail.com', '$2y$10$7rP9KC634VuhBpcXE1DtRuOKmNIKV7iNSLv60PyFaqlEVLzqJ0vMO', 652, 1, 0, 0, 0, 'mizanur-rahman_galaxymallbdcom', 'https://galaxymallbd.com/', '1712654297', 'Dhaka Bangladesh', NULL, 'NARYSZM6D8WSYAIV', 'nXuznkXp7FW8P4k7Kh1th1fIYUMuc5sK', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(264, 'Mobarok Hossain', 'mobarak4900@gmail.com', '$2y$10$tvIXjZYQ6VVY.VLmPLFCqe/KUNUb73ss7zyJvo/0xa0XqxHT.aehu', 651, 1, 0, 0, 0, 'mobarok-hossain_labibshopcom', 'https://labibshop.com', '1821482853', 'Dhaka Bangladesh', NULL, 'EANTFWVYOSSCDW16', '39kSeNdWlkKK5lJmxmA4usXgmaw3JARL', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(265, 'Muhammed Golam sattar', 'getstakg@gmail.com', '$2y$10$Ky5FBJZ6PvWLtyAFPiylTOrrQ5Sd0TGAPvlUalVBntp2mPaUrkHa2', 649, 4, 0, 0, 0, 'muhammed-golam-sattar_getstakgcom', 'https://getstakg.com/', '1842066450', 'Dhaka, Bangladesh', NULL, 'MTRQIGT3VSNQMLAY', 'ohXgoMD5mdGF5O0645O2QFQNzebHCFfc', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(266, 'md ibrahim islam', 'mdibrahimislam1341@gmail.com', '$2y$10$eyvA4VCnI6Inw30NH2jp..rmKztnCLkxpBQ73Oz5ecXkTreaPz4pi', 648, 1, 0, 0, 0, 'md-ibrahim-islam_ssibazarcom', 'https://ssibazar.com/', '1957796747', 'Dhaka Bangladesh', NULL, '8YL90VOEX1VJBV8U', 'IiF3Che0phBCnFShcHKmvxCCWlxvcEPe', 1, '2026-07-28 08:46:14', '2026-07-28 08:46:14'),
(267, 'TAWHIDUL ISLAM', 'sodesimart@gmail.com', '$2y$10$76h40CdNSY6swq7U2.SesOkYpXlFmtudgg3ryn0rLnAgEzEL8URty', 647, 4, 0, 0, 0, 'tawhidul-islam_sodesimartcom', 'https://sodesimart.com/', '1937161956', 'Dhaka, Bangladesh', NULL, 'QKUFBPR58GH0F2GW', 'BMZXZse356D5g2ztYrHqhwUiz8E2YQpu', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(268, 'Mohammad Shariful Islam', 'khidmastore0@gmail.com', '$2y$10$37fsSWgek.aituMzVV8arezr7WhaXl7FgtyfybIPSUOIY.YHdoHta', 646, 1, 0, 0, 0, 'mohammad-shariful-islam_ritajcolectioncom', 'https://ritajcolection.com/', '1753558305', 'Dhaka Bangladesh', NULL, 'J2SIZOCBYSOVS3EQ', '3t1QmU8OWTZ6VNIHsFhoUAyzSSXD8n2A', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(269, 'Akash', 'draftmarket.pro@gmail.com', '$2y$10$oLlE.fAyStK6rodpGtC3eOF98M.vF/wa6QRswt5XtYmK9Fuk0tINa', 645, 1, 0, 0, 0, 'akash_mhbmartcom', 'https://mhbmart.com', '1918182636', 'Dhaka Bangladesh', NULL, 'L4WCDZLAUZUTASK6', 'Zm9DuElEOQCdew2stecaNeDEfcDtfPmk', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(270, 'Atikur Rahman', 'mdatiqurrahman1982@gmail.com', '$2y$10$ugtzeFP.Unu2ovG.vk4UyeXZLaW9VURHDQkx9wqvJchaYjnJyYwNy', 644, 2, 0, 0, 0, 'atikur-rahman_chenabazarcom', 'https://chenabazar.com/', '1714352017', 'Dhaka Bangladesh', NULL, 'CIMXEPP04KNUK6S7', 'vFgRIDAx3XPfbf9tRUQdBdpCfFSUbyQa', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(271, 'Md Robal', 'robal6442@gmail.com', '$2y$10$pH7TI6nQHuZP5ZQ0k675MuaBe6DTJ/CwR71i9xaId5bSpdlTs08vi', 643, 1, 0, 0, 0, 'md-robal_rahimurcom', 'https://rahimur.com/', '1838324642', 'Dhaka Bangladesh', NULL, 'QYCQTB42LYRAIU41', '3W3tkPMBu6Yt58UR4Qu5kqT1GEwdkdcS', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(272, 'Shohel', 'shohelar7262@gmail.com', '$2y$10$ftRsN.LYmQuzHmltC9frqucmQb/lFNVzuY799pKbS8B9OQZfNyGC2', 642, 4, 0, 0, 0, 'shohel_mixybuycom', 'https://mixybuy.com/', '1576964396', 'Dhaka, Bangladesh', NULL, 'DYCWZKNZNNTU2NEO', 'fdD2A66OpfZiuEB6HkPUvzMylZB1wakf', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(273, 'Faruk Hossain', 'faruk836291@gmail.com', '$2y$10$7/bWHaFelp5XmKuCKzL4K.SzgWpUv8M4O1O1/bSAUYrL7eFWjccIq', 641, 1, 0, 0, 0, 'faruk-hossain_hrrhkcom', 'https://hrrhk.com', '1736306400', 'Dhaka Bangladesh', NULL, 'PFNMXJOBD7H3RIYG', '5tWaiv8eSUTe01zInntBk8z7rbIliu2C', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(274, 'md jakir hossan', 'jakir.bangladesh71@gmail.com', '$2y$10$iOCRDlJ0DxesXjrKxcebweLY00nI5epugfZo2JaEUpRhpDp.ZECLi', 640, 4, 0, 0, 0, 'jakire-horsan_priyoshimartcom', 'https://priyoshimart.com/', '1775692426', 'Dhaka, Bangladesh', NULL, 'POVVD9ESCHMEGLWE', 'qiWRlp2sICSEOyWWf6DUh5TrmPd4BysY', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(275, 'Rakib al hasan', 'rakibalh@gmail.com', '$2y$10$JDIudn6FRMZhZTqlqGq3.Ohj816OJk27JdVPT6lDInroEC4APGXfq', 639, 1, 0, 0, 0, 'rakib-al-hasan_seilorycom', 'https://seilory.com/', '1915503514', 'Dhaka Bangladesh', NULL, 'R6KJNHJCBQUIWDBL', 'ZD9N0CXENIHRsCrASWlt7LZhDdzbSpnf', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(276, 'Mohammad Shohel', 'shohel.galfar@gmail.com', '$2y$10$947SYwxvs3P9kZ0mSY6Yp.SDmQPJlO5YDELSf5O8v8pvP3b.nli6K', 638, 2, 0, 0, 0, 'mohammad-shohel_softimartcom', 'https://softimart.com', '1838404272', 'Dhaka Bangladesh', NULL, 'H1YCF00M1FZNMQVB', 'Tu1gP5ZTlOR3MGLIhhOxVV1sPIw3Oghl', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(277, 'Alamin Ahmed', 'alaminahmed05@gmail.com', '$2y$10$yy5Bg489lzyA8gtEgTVqyOc/VF0hxyLz8waJq//DNl.ebsIBQWxgO', 637, 6, 0, 0, 0, 'alamin-ahmed_kroylocom', 'https://kroylo.com', '1985606968', 'Dhaka Bangladesh', NULL, '7XYFDV4BTCCAMGSN', 'CTNx0nyZqBsxUsnkQH3oeuQZr1Gb2Qa4', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(278, 'MD HABIBUR RAHMAN', 'virtualhabib022@gmail.com', '$2y$10$RC8rnPdhnuhJkafcg.Q8VOqE60VkOdS8s/RBTz8HEREEsFmpvuINK', 636, 3, 0, 0, 0, 'md-habibur-rahman_bhelaacom', 'https://bhelaa.com', '1760043770', 'Dhaka Bangladesh', NULL, 'WT8GHZSQYPQTGPDC', 'q6bXP8AFkA474K5UUX0r0boC11uC15Gi', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(279, 'SHALUKLOTA', 'rakabir765@gmail.com', '$2y$10$ZvkbCExfmStxnE9GAhreGeN3ujhOj3bmEc6xw54lIJkknudwGtjQC', 635, 4, 0, 0, 0, 'kabir_shaluklotacom', 'https://shaluklota.com/', '1749674099', 'Dhaka, Bangladesh', NULL, 'TMZSVNTORSZ3Z38Z', 'YfhWyvcHdMs7D3U3U1Xy4AifJTvwNMJ1', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(280, 'Mohammad Forhadul Islam', 'qazifarhad@gmail.com', '$2y$10$DUNu1NFWsjxNyWLg8BxzRuM0rua3K16O0cW8y7SSuKf7UVjnsBQ56', 634, 4, 0, 0, 0, 'mohammad-forhadul-islam_aladamartorg', 'https://aladamart.org/', '1799429803', 'Dhaka, Bangladesh', NULL, 'BDGO6OTRKYYJUFGP', '7CCqkRKuUyvu9q1pQ1RWBzLHl8jN9eZs', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(281, 'Mohammed Junaid', 'junaidbd85@gmail.com', '$2y$10$W4/QIrpe1x2fh5fB7imxaugJmureXsOSVqzy1v4xgcJD9OcJaTXe.', 632, 3, 0, 0, 0, 'mohammed-junaid_insafimartcom', 'https://insafimart.com', '1619128630', 'Dhaka Bangladesh', NULL, 'VJ9C3JKFDEMKIDEY', 'uMwc7chAW2T234AjB9s7wcRay1Q0K7Yg', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(282, 'Abdul Majed', 'majed17804@gmail.com', '$2y$10$H0OBMdUb4LKy2JbBw6TAJuhwGP50BJO94353PX/RdQ.DfpQBASFy2', 631, 1, 0, 0, 0, 'abdul-majed_insafficom', 'https://insaffi.com', '1894317804', 'Dhaka Bangladesh', NULL, 'IDIXUUNROZRPYYKE', '6plCQR2j97t5tN8ktHOBzzeDqLvbS49O', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(283, 'Emrul Kawaes', 'kawaesbusiness92@gmail.com', '$2y$10$/Gujrcx0zTwRVosaJubzneh/PPkhGu2wcMzVsu0L9nydz9TnW1Fxy', 630, 3, 0, 0, 0, 'emrul-kawaes_aajhutcom', 'https://aajhut.com', '1771117262', 'Dhaka Bangladesh', NULL, 'C51X0YUGEEXEUF2D', 'lyCc9xuy2J5xXU4SscmJlzMtGS5whyLm', 1, '2026-07-28 08:46:15', '2026-07-28 08:46:15'),
(284, 'PonnooMart', 'parvez97@gmail.com', '$2y$10$FxcIfDfAXpu96iA6/KdTgeObxkrtmfSP7MPG43JT5erHvlj/P.t5u', 629, 4, 0, 0, 0, 'akramuzzaman_ponnoomartcom', 'https://ponnoomart.com/', '1711459066', 'Dhaka, Bangladesh', NULL, 'DTCKODL4ISS7MOFR', '9S9e7pzijVoxqj4E1eqIQJDYXKXWRWDr', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(285, 'Mohammad Yahya dulal', 'yahyadulal@gmail.com', '$2y$10$VN5U7ZbMVIUoJUAdMt/TgugWR/6lyNjtIOA/s6aO6NQdrUFDXwUMm', 628, 4, 0, 0, 0, 'mohammad-yahya-dulal_limasbazarcom', 'https://limasbazar.com/', '1706173954', 'Dhaka, Bangladesh', NULL, 'BYEJBIJ4TQ7VUCIG', 'AGYeWEoN2Qr50V5mHdnmCCD2B8kjjnbI', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(286, 'Najrul Islam', 'najrul.islamm2026@gmail.com', '$2y$10$y0H07HwFXUi0sSiKKsLK8OywlcoTNPsY0FOueJpgjBtQMlVYwfkFq', 627, 2, 0, 0, 0, 'najrul-islam_fasniocom', 'https://fasnio.com', '1805548482', 'Dhaka Bangladesh', NULL, 'NADJJVVDT7KI2FBB', 'YxmJtFKLLjdebv6iQG5e3rM9DC8OHJn6', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(287, 'Alam Hossain', 'dev.alam886@gmail.com', '$2y$10$EqqMbCqWpJjl/Py8Q5cI7.4z7EorFBoOSTXsLHqpIsQDvnEBzaBb6', 608, 6, 0, 0, 0, 'alam-hossain_wwwsopnaloycom', 'https://www.sopnaloy.com', '1925375672', 'Sector 4, Road 12 , Uttara Dhaka', NULL, 'UR1BXRJFJDBQOVIU', 'WWfIsSxcVqkWmuoWtdmyDqZLjYIVmQ5U', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(288, 'ALTAF HOSSIAN', 'clothssr@gmail.com', '$2y$10$15pX7lQ9vkB7c/mTzC24Aew06Ag2xhOQr2k5fA/gMBwpPiYLbznv2', 626, 1, 0, 0, 0, 'altaf-hossian_srclothscom', 'https://srcloths.com/', '1684814411', 'Dhaka Bangladesh', NULL, 'SIZYWTABNNDN7AWF', 'SrJlkySiMaM7n05xj3jV6TW9NwEGrHDB', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(289, 'Md. Shafiqul Islam', 'mshofiq226@gmail.com', '$2y$10$iA4n6kVwVKfP9/4quE3MVeDkAVKVDTUt6OrIG5tYSrnKS0.98lvVi', 625, 4, 0, 0, 0, 'md-shafiqul-islam_electroomartcom', 'https://electroomart.com/', '1704714716', 'Dhaka, Bangladesh', NULL, '7LOEXGXJXKUIEX8V', 'yShh0L8joixiJjk4HAIdi6XQaMQ5cgVE', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(290, 'BELAL HOSSAIN', 'bh4563066@gmail.com', '$2y$10$uXcHKahU0RIw2linDN7cZuoefpZrog7d7G3kORihUoZAJTknqyoIe', 624, 1, 0, 0, 0, 'belal-hossain_fariabcom', 'https://fariab.com/', '1762115369', 'Dhaka Bangladesh', NULL, '7VJPBVWCZXGXC5HV', 'iIrl8SPnRDwKrr484ZCsCWTSEkG9C1iq', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(291, 'MD. ALTAF HUSAIN', 'altafhusain21@gmail.com', '$2y$10$Y6dq/ooXSC572IIbhtW70eTEnDLJLAdlv.cIbm8JiTWBHViqQSgHe', 623, 4, 0, 0, 0, 'md-altaf-husain_preyobazarcom', 'https://preyobazar.com/', '1715672798', 'Dhaka, Bangladesh', NULL, 'GKFUOUSO6ES5IMJW', 'WVRbWryX20uUZSMKluGyopMWSJVXwxe7', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(292, 'basargelary.com', 'mohammadshofiulbasar@gmail.com', '$2y$10$a4X2LHafXVJ9uqqbmXAPZeYclnl3NP0F67DyDo/p59bNfieKvIXrW', 622, 4, 0, 0, 0, 'mohammad-shofiul-basar_basargelarycom', 'https://basargelary.com/', '1868140489', 'Dhaka, Bangladesh', NULL, 'IZ7SQLSTXF6TZOUO', 'AM6cxsqvK5m8tPbBfD15hjqKgrvNzw0j', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(293, 'Samsul Hossain', 'samsul708657@gmail.com', '$2y$10$pD2wlPBvvk1Fw9BR2Q6YyeLq6v5DrwIHpxt0So6/lDiqxb.kPzJyK', 621, 4, 0, 0, 0, 'samsul-hossain_mittozacom', 'https://mittoza.com/', '1610958830', 'Dhaka, Bangladesh', NULL, 'UM6IJKNAKGLPRLDW', 'YgsSvG09OkKjUOGaHPnmN6c8HHnyFtya', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(294, 'Mohammed Jabed', 'litonsarker2269@gmail.com', '$2y$10$4cmemUhL8.FcL39Oxwct8.24E/V4WqmHnITIIxmD4kRFBJw7IgJxa', 620, 4, 0, 0, 0, 'mohammed-jabed_shimonmodestycom', 'https://shimonmodesty.com/', '1979539640', 'Dhaka, Bangladesh', NULL, 'LG3DCZ4DGCVJYW3T', 'SWk9Li7540mSRKhiwI0VOfxkYl4pKkCD', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(295, 'Mohammed Jabed', 'hossenjabed1991@gmail.com', '$2y$10$cznXdWXwzys2AWhWNMCMnOvpwiiS9R8TIu.EcmXRl2SATfPcczfg2', 619, 4, 0, 0, 0, 'mohammed-jabed_saveco24com', 'https://saveco24.com/', '1818480583', 'Dhaka, Bangladesh', NULL, 'P8KQATYLC1FDIUTP', 'RAZQvyh1n3YQKPLIAJHvKhrMwQwyfZAh', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(296, 'Wakil Ahmed', 'wakilahmed87@gmail.com', '$2y$10$0ik4lHPFkrAiYgmJi7dE5.ITMX6dkVY31KVP2479Ni6MMPqeazoCe', 618, 4, 0, 0, 0, 'wakil-ahmed_hypzoocom', 'https://hypzoo.com/', '1719122034', 'Dhaka, Bangladesh', NULL, 'UMUAVAPMXZCNDAZV', 'hzHOxGbXDTeqr3xnc9GgEo5OwlXWjyLX', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(297, 'Shamim Ahmed', 'sa385293@gmail.com', '$2y$10$6f6SqQDMpqqPiMu5NwVF.OAdkh/6OZ7eyByq8Kdn2enFGZeQAeyM6', 617, 6, 0, 0, 0, 'shamim-ahmed_zilvomartcom', 'https://zilvomart.com', '1939529749', 'Dhaka Bangladesh', NULL, 'Y3WDVPIWMTHLLUWT', '8c4zlEjcFzX3jfDbIZf0fJtdnu82u4Ah', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(298, 'Sohel Sakar', 'nivaloybd@gmail.com', '$2y$10$.HeAL./zeeVeQU7/7kz.CuO0WekyZLDk5nBPXjwwo5Zh8qi4cQgDK', 616, 4, 0, 0, 0, 'sohel-sakar_nivaloycom', 'https://nivaloy.com/', '1624101877', 'Dhaka, Bangladesh', NULL, 'ZA08TOANKHPTRT6H', 'kkBVj4syy5rnmulPqMWRbEwbJocWAVZe', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(299, 'Md Mosabbir Hossain Sharaj', 'hossainsrj@gmail.com', '$2y$10$Xa3pAizg7rMwJUW1gyJrn.nHtUI5Ww.JoqafFw.V/b.4iu9qMC8sS', 615, 4, 0, 0, 0, 'md-mosabbir-hossain-sharaj_shomahaarcom', 'https://shomahaar.com/', '1813910110', 'Dhaka, Bangladesh', NULL, 'USVBMMPJBSSW03PW', 'DMzcyx7XzQIbc83OJMRyL5vY9MBBiwv4', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(300, 'Md. Shariful Islam', 'sharifulsheltech@gmail.com', '$2y$10$42hhVGuxaUM9vA.3nfjrruKwCMMemaHHPOnOdW7dWxHOyNuC8/Gs.', 614, 4, 0, 0, 0, 'md-shariful-islam_baarakahmartcom', 'https://baarakahmart.com/', '1303790480', 'Dhaka, Bangladesh', NULL, '5EWXAJUWLZY1V5N4', 'qgokBgHHPoqvOgo2ZR5lTop5U8sw5p8E', 1, '2026-07-28 08:46:16', '2026-07-28 08:46:16'),
(301, 'Mohammad Sahed', 'mohammadsahed577@gmail.com', '$2y$10$Hy7pPQ2oEBstKacEoqoeyuz1Xgq1lkgugkW85GI1bpEnd/UIfkDFC', 613, 4, 0, 0, 0, 'mohammad-sahed_sellpoxcom', 'https://sellpox.com/', '1945378553', 'Dhaka, Bangladesh', NULL, 'SITXKOT0XBYS47MK', '2DOD7ohF9RId0DA3p2WjpISZbsiCdMg9', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(302, 'reallmart', 'zedr96@gmail.com', '$2y$10$IuWbCli.XAoz86HyfuO0dO5PJiU4q3yY9t4PZRzCuunoNbECCAaAa', 612, 4, 0, 0, 0, 'mohammad-ziaur-rahman_reallmartcom', 'https://reallmart.com/', '1711072076', 'Dhaka, Bangladesh', NULL, 'L2DZ8UIFHNUE3QPQ', 'iVvQMJYVKjuPt98nzdAmOlnErhemcHbj', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(303, 'Mizanur Rahman', 'mrahman.bravat@gmail.com', '$2y$10$J3byDZZVPIYt36h0atznzO5wAmuiyKGIw0V6..sgfvQ4SpjSCIonG', 611, 4, 0, 0, 0, 'mizanur-rahman_priyohaatcom', 'https://priyohaat.com/', '1758556655', 'Dhaka, Bangladesh', NULL, '4ZHYBUMVVY0YNHP9', 'gfJyQmFEgXvNPOhmm5rNasorsUjuVN0B', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(304, 'Md Abdul Matin', 'matinqc@gmail.com', '$2y$10$UAK0OwAmxQkc.d6JuwsscOchxsuH2Qh1XwrxUpKC93Besv5rGKeIC', 610, 4, 0, 0, 0, 'md-abdul-matin_nittozacom', 'https://nittoza.com/', '1626843640', 'Dhaka, Bangladesh', NULL, 'G88LXMENUA4ODUQK', 'uFzgRInUmuIAyPM1Fdu7FtrBaC3Qo6dQ', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(305, 'ZIAR HOSSEAN', 'ziarhossean@gmail.com', '$2y$10$LO1asLSxs0RmEpATd.vwIu86Wls9Y9U7JSpDOCe3HNDpvVoj2.EHO', 607, 6, 0, 0, 0, 'ziar-hossean_rujrujcom', 'https://rujruj.com', '1704892713', 'Dhaka Bangladesh', NULL, '1B0BUGE0I8OIHR1S', 'JFvB58UX1x3LnHphCmjvRrkxUXAksi77', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(306, 'Md. Miraz Gazi', 'mirazgazi@gmail.com', '$2y$10$n37vlbX9X66peXoHx3Nkfun7pmTtjWuLN/nGpaPxSi1I4.6hCuUHq', 606, 4, 0, 0, 0, 'md-miraz-gazi_miniloycom', 'https://miniloy.com/', '1680935663', 'Dhaka, Bangladesh', NULL, 'ZQQGHYLUUX6IQ6HS', 'R0YRnnsyHmtpl7xajQPz7Rw7Fuck7qw9', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(307, 'Md Johirul Khan', 'khandairy77@gmail.com', '$2y$10$ZE8nIdKpOCy2MI3eAZjRyeRkyVg1AvP105zug1Xf/BEXE/ZfBDxvS', 605, 4, 0, 0, 0, 'md-johirul-khan_priyoloycom', 'https://priyoloy.com/', '1855886633', 'Dhaka, Bangladesh', NULL, '4CEXTIOY4PV4P2UX', 'ItUVHqXIKdB0J5Sarw6VlBIQbLVxaroe', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(308, 'Md. Rabbi', 'nababiyan@gmail.com', '$2y$10$.X6c9g1.PLksyahOmdtmQ.6Ix01oDKuzNnJ8DcyfnUHoNU8ZSSFca', 602, 1, 0, 0, 0, 'md-rabbi_nababiyancom', 'https://nababiyan.com/', '1710475238', 'Dhaka Bangladesh', NULL, 'ID5YPA5WQAQDWBBF', 'HNDHuQcxnK7I9KqQrtQTkdVRvwjIlaQ9', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(309, 'Md Mehedi Hasan Pervez', 'mehedihasanparvez5@gmail.com', '$2y$10$QFkIz9/uDfmmW1f4nF5pNOfYCQQ6jVESIla8g43i/J338HlPwhdr2', 601, 4, 0, 0, 0, 'md-mehedi-hasan-pervez_eqovalycom', 'https://eqovaly.com/', '1755211287', 'Dhaka, Bangladesh', NULL, 'VVWSDCPEFYXLQNWU', 'EhZje3rA2dAVwtbnzzRtaqnEThP6qFrF', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(310, 'Kamrujjaman Siddik', 'globalhalalstore@gmail.com', '$2y$10$XeDGYGufkKRNWZm9w3aJbOPe.4PgLiG1Zi8EbOaJe3E1y7LbK7cG6', 600, 4, 0, 0, 0, 'kamrujjaman-siddik_insafibazarcom', 'https://insafibazar.com/', '1771469577', 'Dhaka, Bangladesh', NULL, 'JKSBF4MLDPUWTWZE', 'jXY4VRcGpi0jbfhTh5LBg5LiIT3UdzQu', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(311, 'GOLAM RABBANI', 'rabbanihstu@gmail.com', '$2y$10$60am/qSdU8ZBM750tvFZUe4inCCAW0jbhjLXCB4Rfuq9kQ3HSeJ6i', 599, 4, 0, 0, 0, 'golam-rabbani_tuhfhacom', 'https://tuhfha.com/', '1521575924', 'Dhaka, Bangladesh', NULL, 'BXGVUENQX9QDWJTV', 'Z8Ea2SEb6aLWkhC9h9XRI5N3iJX06N5P', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17');
INSERT INTO `dropshippers` (`id`, `name`, `email`, `password`, `dropshipper_id`, `package_id`, `total_deposit`, `total_credit`, `total_withdraw`, `user_name`, `domain_name`, `phone`, `address`, `image`, `app_key`, `app_secret`, `is_approved`, `created_at`, `updated_at`) VALUES
(312, 'ʏᴏᴜꜱᴜꜰ ᴄʜᴏᴡᴅʜᴜʀʏ', 'usufchowdhuru1979@gmail.com', '$2y$10$Zvegm6QLymL1lIGD1EBaT./OButgZy.MQjuu3nxEagMJIeLjNAzii', 597, 4, 0, 0, 0, 'yousuf-chowdhury_kidsfacom', 'https://kidsfa.com/', '1856234076', 'Dhaka, Bangladesh', NULL, '7QUIY7STAIJK1RQU', 'IeODelby59mPi1Y1JX19U1K1iWs6BXzG', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(313, 'Mosarrof Hossain', 'tantaj863@gmail.com', '$2y$10$ftyUbNIPsKZe/TV43H4PnOKIWIxD/4oFovavfSpwY.5S9wEZKhw0S', 596, 1, 0, 0, 0, 'mosarrof-hossain_erivolycom', 'https://erivoly.com/', '1710567584', 'Dhaka, Bangladesh', NULL, '14WSOXOPLHSML35L', 'CRW9wJrHLRQTySTceY1G1T2bzbQm91lF', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(314, 'Md yusuf', 'md.yusuf505181@gmail.com', '$2y$10$xgriU5MHLybQupvXG6v.5e9ZaB8pMBtS98xPmBb73d5oqN/ZacDTO', 595, 4, 0, 0, 0, 'md-yusuf_topllocom', 'https://topllo.com/', '1861505181', 'Dhaka, Bangladesh', NULL, 'JIZVZRJOWWP8LWZS', 'k6A7DpHd7PhSBUns8rspI5zBKVpsQSG9', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(315, 'Md Shah Alam', 'salom4964@gmail.com', '$2y$10$lGRBboL18zhUEcCYQKbrtOCCJ28Njm1uO11kKVyFqyOzbslYMvhQe', 594, 6, 0, 0, 0, 'md-shah-alam_raishashopcom', 'https://raishashop.com/', '1707323989', 'Dhaka, Bangladesh', NULL, '4A4GZABE0MVPHHJB', 'rwPOHlcIbzdb2VEwhsi8iLTCB3gibQmP', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(316, 'Mustafizur Rahman', 'mustafizurr6@gmail.com', '$2y$10$kvUbmFVprzKtv9WGy99RZ.ZFVe7nz0KJHU7KKkz4fIyJEbt5Wj5Fu', 591, 4, 0, 0, 0, 'mustafizur-rahman_topchoosecom', 'https://topchoose.com/', '1743928260', 'Dhaka, Bangladesh', NULL, 'U53GSYWC6KN2NWCY', '19mA2BnYoU5RDlcUDS2jrMCh4W7lXfSn', 1, '2026-07-28 08:46:17', '2026-07-28 08:46:17'),
(317, 'Shahinur Rahman', 'shahin351273@gmail.com', '$2y$10$25cCreZJkMnFcD3qf.S9qO4beGqgNMr7zcQIoBWhZtH1PIWKX5zYG', 590, 4, 0, 0, 0, 'shahinur-rahman_prioloycom', 'https://prioloy.com/', '1772102373', 'Dhaka, Bangladesh', NULL, 'MFLRXOHFN5K92VE9', 'xDS0NCR3eZmtL9459RhN3eSMEHWAC9mM', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(318, 'Md Al Amin', 'itzalamin12@gmail.com', '$2y$10$p28EOLFpFB1ravOio4ijEOp970zR.6QX1spP.joWuY/Y72gwEbX1.', 589, 4, 0, 0, 0, 'md-al-amin_zaaribacom', 'https://zaariba.com/', '1740759103', 'Dhaka, Bangladesh', NULL, 'GFCMZIMIYCPGCCAR', 'Sw7NFAyDO0FCZnH2KjVjRyn9c9MVgcEL', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(319, 'Md Ziaul Ahsan Shaikh', 'familydokanxyz@gmail.com', '$2y$10$jCpGljkLOEjvUCjUvTI8iO0aIbhN4ngff0XQnu9U7sHhdPWYBeERe', 588, 4, 0, 0, 0, 'md-ziaul-ahsan-shaikh_hayaloycom', 'https://hayaloy.com/', '1814657692', 'Dhaka, Bangladesh', NULL, 'TMXTZ00XFAKM1JTM', 'zFuUd8ZfTRXYUdTmAHEGNAlZMUKNFIxZ', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(320, 'Kamal Hossain', 'kamalhossain40023@gmail.com', '$2y$10$bLSWhcfVF5uwqNfykyLE2.8o4V0b9K06vElgFgVDvUxdgfs6P7AYu', 587, 4, 0, 0, 0, 'kamal-hossain_novaloycom', 'https://novaloy.com/', '1813869925', 'Dhaka, Bangladesh', NULL, '0YUCRY1PYPT4JUYV', 'QJid5t0rCfEfZf4TbrwK2Hret2NkL3JF', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(321, 'Md. Hasanuzzaman', 'iqhaduo@gmail.com', '$2y$10$r7BHxzHNpJQEVPNFXbDuGOV2u0Eopf6QTtspEriurlg/UGgNMXlZm', 586, 4, 0, 0, 0, 'md-hasanuzzaman_ezshopzcom', 'https://ezshopz.com/', '1711370460', 'Dhaka, Bangladesh', NULL, '6F7CSGQV0JSHAIYM', 'i3p75yt2IkXOxoGkK8TDKn30k1gGPXS2', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(322, 'Rashid Mohammad Harun', 'rmharun01@gmail.com', '$2y$10$ptaEfrxwiFo5UxR1.dteEuDpMxNFgigW3EelRRhrWuaD7ITpDRirC', 585, 4, 0, 0, 0, 'rashid-mohammad-harun_smartbdbazaarcom', 'https://smartbdbazaar.com/', '1715347867', 'Dhaka, Bangladesh', NULL, 'LA2PPP47XK0VYXW0', 'uIwA4I8TFoRFhN24ylxQ3oymFbGiIOsg', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(323, 'Zakaria', 'habibur385385@gmail.com', '$2y$10$74hfSbWX3HqEiAmWdrCelO3zTBvM/3WjLUy.9NHOdw52fCV8kupD6', 584, 2, 0, 0, 0, 'zakaria_wafiloycom', 'https://wafiloy.com/', '1826061464', 'Dhaka Bangladesh', NULL, 'EFIOAGKAG86DQL54', 'cZzefdu5ZQWmV8wjTrsSwksRQK5ushBR', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(324, 'MD Nasir uddin', 'nnasiruddin872@gmail.com', '$2y$10$WVgEf.57XF9kl0EqLhfkxOabzyhtb6BEIwoiodlvo9SLEHcQdIjkK', 583, 1, 0, 0, 0, 'md-nasir-uddin_kaserbazarcom', 'https://kaserbazar.com/', '1761807029', 'Dhaka Bangladesh', NULL, 'IG4BM1JP2CEHUPRZ', 'njNyD3n3BHNJElaaCwVU2IoXWQEg0RYP', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(325, 'MD. Atikur Rahman', 'atikbillah1997@gmail.com', '$2y$10$W04uc4StgXhluDeL4EpUteELLO/xUiXT8UoS6z0Q18ghwWKWaghxW', 581, 4, 0, 0, 0, 'md-atikur-rahman_insafemartcom', 'https://insafemart.com/', '1300060440', 'Dhaka, Bangladesh', NULL, 'RPO0SRY2GXHX0TVN', 'ZOaJ9nnXmQdOcc0WUwof6BXNCIy6yX5J', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(326, 'Mamun Rana', 'mamun1993gpr@gmail.com', '$2y$10$82GbI79g40DKRWLQtC5bXOdib6tj1aUenDooRxRA9n.LMHkqe1AZC', 580, 4, 0, 0, 0, 'mamun-rana_al-falahsmartshopcom', 'https://al-falahsmartshop.com/', '1988510670', 'Dhaka, Bangladesh', NULL, 'GAKC2QSE3Y9LF5JZ', 'oaKPC2ECPvWvvSrrImb6qarvjejjUcEN', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(327, 'Joseph Alam', 'josephalam61@gmail.com', '$2y$10$DFPqdxJhJPxQnQMfg6LwTef92A8INpdBLVz6VcYo1AJtgElLrmI6G', 579, 2, 0, 0, 0, 'joseph-alam_droploorcom', 'https://droploor.com/', '1314990631', 'Dhaka Bangladesh', NULL, 'WTNKDUCWGLPQNWNR', 'umcQf3ILt8lwoaFlLvUcQZTiaXJErW2u', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(328, 'SAZZADUL AMBIA', 'mdsazzad1122@gmail.com', '$2y$10$RPkedHAv.sSeXu/DuwWQ.eX8.uoXyd4xGTObCtxTDnWV3qbODTya6', 578, 1, 0, 0, 0, 'sazzadul-ambia_gogovalycom', 'https://gogovaly.com/', '1779878155', 'Dhaka Bangladesh', NULL, 'VLGBFCUYGBHFUOU4', 'vC18ddBoGhh9cDYLPMb6a4f9Tp1y3Kg8', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(329, 'Shakil Raz', 'shakilcse9@gmail.com', '$2y$10$bP.HybUm3SIJfLfAw7zOe.901ImB6RpFN.zE0vKlZ94JCtLg/l92m', 577, 4, 0, 0, 0, 'shakil-raz_razvalycom', 'https://razvaly.com/', '1717976307', 'Dhaka, Bangladesh', NULL, 'U9QWGQPPDYHKVBPY', 'IGOYXbGT1RF8eJBXd79dInsnJpplOIZU', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(330, 'GM JAKIR', 'gmzakir381@gmail.com', '$2y$10$kDe5jDUTHOESs3Vm5oPBJuUFZqolgxd0T4V4k6AbeFRgb4Gjbq8Aa', 576, 4, 0, 0, 0, 'gm-jakir_jarijacom', 'https://jarija.com/', '1748990343', 'Dhaka, Bangladesh', NULL, '3GI98LGFEYRVZLCK', 'WTVgj4AkpA0nztv7vWC362tbcwPd0n4S', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(331, 'Emon Shaikh', 'emonborun@gmail.com', '$2y$10$GvUoeJpYeDwiaVP6vpmxmOObn9XJcrUQAOwce4up6foCXc70tQMlK', 575, 4, 0, 0, 0, 'emon-shaikh_evoloycom', 'https://evoloy.com/', '1677744050', 'Dhaka, Bangladesh', NULL, 'I9BM1CO3P23GO631', '4ZnQHcmGvWk2wGaMyFQTJ6fi50iUvwab', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(332, 'Liton miah', 'nexploo866@gmail.com', '$2y$10$WpbGw0VQfmRTS73OvAbCQeW5Q6Q3APu9Z/f/QEYsBMLg4JASzj3xK', 574, 4, 0, 0, 0, 'liton-miah_nexploocom', 'https://nexploo.com/', '1835954262', 'Dhaka, Bangladesh', NULL, 'FOQ56PKZG8Y7NCKK', 'yQYBYOcYRvEvSVEplXAQM2aq81gUAKXO', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(333, 'Sanowar', 'mdsanowar087@gmail.com', '$2y$10$iHQJZUqPsVS4EiQvNI1pv.42yNXSSYdUAqAoJv4sW6/lxXHVS87XK', 573, 4, 0, 0, 0, 'sanowar_obosorecom', 'https://obosore.com/', '1785750926', 'Dhaka, Bangladesh', NULL, 'AVKNZUJE5LPEAHPM', '5KbC2oUD5tueGeTrOycosi4faKLeSHfU', 1, '2026-07-28 08:46:18', '2026-07-28 08:46:18'),
(334, 'Md Sumon Hossain', 'mohd.rashidul.hassan@gmail.com', '$2y$10$Y7aBp0AskhPmuKv.1nEaHuFfbvN45/h.D51h46Q5M7lcOe2VNOB/S', 572, 4, 0, 0, 0, 'md-sumon-hossain_oimiyoncom', 'https://oimiyon.com/', '1631268694', 'Dhaka, Bangladesh', NULL, 'GVVY34IALMOEY6L3', 'sEr81j7FbzJJSVd3N9c4Rh5rLTRcZ43o', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(335, 'MD EACIN ARAFAT', 'yasinarafat664559@gmail.com', '$2y$10$vnif8fFT/Q9PrH2cnKIar.3OoBrCtv3QpXoKpNnAJfldFdTBBvUdy', 571, 4, 0, 0, 0, 'md-eacin-arafat_ershop24com', 'https://ershop24.com/', '1964664559', 'Dhaka, Bangladesh', NULL, 'WXNFG89Z8SMA5DUW', 'Rsv8d2YlYbRbC3lN2GNDcRtBZLrKYsbU', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(336, 'Abdur Rahman', 'ramanabdur9@gmail.com', '$2y$10$gvk5CLjqxqCMmBq7VTOzXutX54WaXkaUls4JKUjmEQuyNbhM1rkt6', 570, 4, 0, 0, 0, 'abdur-rahman_amarshoppingbdcom', 'https://amarshoppingbd.com/', '1518352887', 'Dhaka, Bangladesh', NULL, '7BTPYUUSB9BIULFF', 'ClSMDW8PWKYOCzOIfmqzNHLSOoOJndmG', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(337, 'Md Abul Kalam', 'urban.unity1972@gmail.com', '$2y$10$2.td/cowycRlVV9jKw7vi.ICOPiFeKqrPvCniSz2CAvHC31rIynPi', 569, 4, 0, 0, 0, 'md-abul-kalam_urbanunitybdcom', 'https://urbanunitybd.com/', '1766787275', 'Dhaka, Bangladesh', NULL, 'Q0CA9EYA05PBPFHU', 'cpUDbyYb5uK4blPrLhlrNM7vi0QqROJD', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(338, 'Mohammad Jinnah', 'jinnah930@gmail.com', '$2y$10$gBn2ORJ0L00hFwfqoddfMOZB/2vWhyAgKuiDvfWjY1IVP124B2bCW', 568, 4, 0, 0, 0, 'mohammad-jinnah_haatbarcom', 'https://haatbar.com/', '1916413311', 'Dhaka, Bangladesh', NULL, '65CBTH7DCC19FLBY', 'fwPfZaInVJZbxraXPcuaQ76L8D07HrSo', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(339, 'Emon mia', 'emonmia4090@gmail.com', '$2y$10$gVluSCafXAX5JCLDOfsAs.MFHBB9IDJJJnYg/cQpLnHc0tjXmuiZq', 566, 3, 0, 0, 0, 'emon-mia_byhappinescom', 'https://byhappines.com', '1409049900', 'Dhaka Bangladesh', NULL, 'Q9GWO3CN3H9YKQIB', 'HLCcPCugQpFKrnoaUafPNojNqTCABUNF', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(340, 'MD.Ziaul Karim', 'ziaul.ark@gmail.com', '$2y$10$QKfc16Kcmyke2RIh6rjBBeSCRuLSU/Kpb7fMvbI.du.tRDWDUzRZS', 565, 1, 0, 0, 0, 'mdziaul-karim_cartloycom', 'https://cartloy.com/', '1795691573', 'Dhaka Bangladesh', NULL, '40VPLKC2I7XOGWAQ', 'hmoJaHg9XbJumz1klJ9VbVWlZqtS5FTV', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(341, 'Mehedi Hasan', 'mehedibctg@gmail.com', '$2y$10$kLd0Q3Edt5PNVRBSIdcWhuwCfkE4oAE8O.FU/QHEraoIW89PNUyUC', 564, 4, 0, 0, 0, 'mehedi-hasan_amadershoppcom', 'https://amadershopp.com/', '1688801672', 'Dhaka, Bangladesh', NULL, 'TW2KMUTFS5ORZ7XD', 'zsZF9c6DOK3CY5cx8GTZ6Tx4tikYfYSg', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(342, 'MD.Rased', 'mdrasedsaki50@gmail.com', '$2y$10$YeiS44P/04sVFOnxmu6BU./9Z25PVNaPgz5ZEEk6YObh0ARtUu6uO', 563, 1, 0, 0, 0, 'mdrased_inaysahcom', 'https://inaysah.com', '1707375893', 'Dhaka Bangladesh', NULL, '6DSXNHTOOQWEOGTH', '42e9CeFzvsdnegy6OfcnOWWP5shbu1m7', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(343, 'Nir Choice Shop', 'dhimandevnath2050@gmail.com', '$2y$10$LIgUhY1I7FVt9lslEs2Hn.tq1JUTlALvwlf/Lhuba08W5Uz1VTHR2', 562, 6, 0, 0, 0, 'dhiman-devnath_nirchoiceshop', 'https://nirchoice.shop', '1748518566', 'Jashore Sador', NULL, 'VJMEIPZJQS83VAL3', 'XUfRVbPl7umX3AC7fpcnTYHA4p0aTNc5', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(344, 'Suleman Ahmed', 'mdsulemanahmedofficial@gmail.com', '$2y$10$VUJ1BX4OrWGEpD1CLP1J4ehB7svWKiMaa3mcr.KN2phCFLzxh/anC', 561, 4, 0, 0, 0, 'suleman-ahmed_pickamartcom', 'https://pickamart.com/', '1736035043', 'Dhaka, Bangladesh', NULL, 'QCAMJIWWNS2AFLAX', '9Om7Q1YpWaQyo3O8lEa33a25rmKzTwTD', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(345, 'MD SHUJAN MIA', 'shadheenshop71@gmail.com', '$2y$10$6pbEnkQd9Mu0Apx0d5ByeeBKtSA13e3yrZvMWKI3GzldSFClQZSE2', 560, 6, 0, 0, 0, 'md-shujan-mia_wwwshadheenshopcom', 'http://www.shadheenshop.com', '1830705080', 'Block C, Mirpur1 Dhaka', NULL, 'MLLJBCLZ6RFNW7RW', 'lSXoBgL6fdCaM0vTfmOfdDgWrpTDFgq1', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(346, 'RIAJ AZAM', 'riajazam782@gmail.com', '$2y$10$ZOV6xSqnrwtHFN902ZYREufL7dlq1XpL0uyT29PCFCDlER5xhupiq', 502, 4, 0, 0, 0, 'riaj-azam_stepforwardcompany', 'https://stepfroward.com/', '1326728604', 'Dhaka, Bangladesh', NULL, 'JAPJYH5ZXTISLFF8', 'tZQRicxmWYOxPZveKOO5Lw42WQJi94Wp', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:22'),
(347, 'Ahaduzzaman', 'ahaduzzamanadi@gmail.com', '$2y$10$j3vJBn52.1w6FZ6Utf2kJe0SEEsvVpGofsgwIG1o2vb.qqmazRB2G', 558, 1, 0, 0, 0, 'ahaduzzaman_lenofirocom', 'https://lenofiro.com/', '1870508181', 'Dhaka Bangladesh', NULL, 'VNQZCNVPXEB1C6VW', '4NzPywY7zr5K7IYVbkyrKO7EgFmsma42', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(348, 'Md. Sohel Rana', 'sohel24bd@gmail.com', '$2y$10$d3FMGzRpoQw9Xoc2J2GxZexf.YBn8uaY6BU57pWG2H8.84SgvqFb2', 557, 6, 0, 0, 0, 'md-sohel-rana_sonajaducom', 'https://sonajadu.com/', '1960070048', 'Dhaka Bangladesh', NULL, 'MA2JL7HFMDQTCDWT', '9jf9XBzRoslYWAXbBT6h6pOjThkN7xBk', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(349, 'Mahabub Bhuiyan', 'mahabubb636@gmail.com', '$2y$10$nJdntoeBlrmKkjGa21wyd.5Ke/Pis/MF5Yx/XwClg79nBBug93EZO', 556, 4, 0, 0, 0, 'mahabub-bhuiyan_qadrmartcom', 'https://qadrmart.com/', '1912000034', 'Dhaka, Bangladesh', NULL, 'CZ9JMZETE8H83EUM', 'XZXbKgncoHLjvTdGd1wOnqn4MPbhvuii', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(350, 'md Abu Rayhan', 'aburayhan108090@gmail.com', '$2y$10$Gl3ce6Wlgkyl9q0xj4x8fOnwpjgVBjgGlv4wXWTLFRbWIXP53VANS', 555, 1, 0, 0, 0, 'md-abu-rayhan_pasmishalicom', 'https://pasmishali.com/', '1711039978', 'Dhaka Bangladesh', NULL, 'L159LJ3KGEME04E3', 'SKPPTMEyo9xrdSNwaeK2Tven48ehdFYu', 1, '2026-07-28 08:46:19', '2026-07-28 08:46:19'),
(351, 'MD Jahid Hasan', 'mdjahidhasanb90@gmail.com', '$2y$10$l26HkAbJCTVssqdmLFZX8.ZWejhy.Y.4ijoz8Z0th48/D8.y46B56', 554, 1, 0, 0, 0, 'md-jahid-hasan_khatikinocom', 'https://khatikino.com/', '1616254020', 'Dhaka Bangladesh', NULL, 'CUXZWN29MJIG8P60', 'FAkixRffzfU39XPbpBxy2h2L5lEjVX2J', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(352, 'Md Ali Hossain', 'asiatravelbd@gmail.com', '$2y$10$KUDDqwpBvCb4UHqQDRj/3.BX67L5clAesWYD2ExBm2oLuy0.sA/9i', 553, 4, 0, 0, 0, 'md-ali-hossain_barakaeshopcom', 'https://barakaeshop.com/', '1843281010', 'Dhaka, Bangladesh', NULL, 'TVTU0XWGXRKGW1DI', 'FKY5hnoTNneQ7xjTAr98zNniriOFQk3n', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(353, 'Yeamin Chowdhury', 'lilifawear@gmail.com', '$2y$10$w4OyoM/r.pV.P.BcT43OFuIcUvBN6eNPpFXOf0R4.C/LEbdXCB41y', 290, 4, 0, 0, 0, 'yeamin-chowdhury_lilifaworldcom', 'https://lilifawear.com/', '1304721561', 'Dhaka, Bangladesh', NULL, 'RL7RSGB3U3KT2D7B', 'yaVCWpv23kDAfdefeG29ZH8sTOIHdTKA', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:34'),
(354, 'Nafiul', '24kinie@gmail.com', '$2y$10$ZHvuBzzWL19vvGPdGBmHWex.14893.81/H4mKmZGjZMsasEpnkX9C', 549, 4, 0, 0, 0, 'nafiul_24kinicom', 'https://24kini.com/', '1618664968', 'Dhaka Bangladesh', NULL, 'NPYUM9VVQ3YZRD3K', 'Xe1EC375aOsEiBPZzvty3zHtwgcNfP67', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(355, 'AFM Nurur Rahman', 'nr.bachchu@gmail.com', '$2y$10$dO054/tnLsXSe1BnkoGmruXpHsUzmmF54mOp.X4Q/Fy2MC3d4U5du', 548, 1, 0, 0, 0, 'afm-nurur-rahman_nuurcollectioncom', 'https://nuurcollection.com/', '1715405323', 'Dhaka Bangladesh', NULL, 'T4ISXAQGVQ7BSCJX', 'wgoT0fakEykNPEwzzoenvzVAY5KOqmjh', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(356, 'Nur Mohammad', 'alnur.mart2026@gmail.com', '$2y$10$4/38WbJmcRflR90favsyj.V/3MOHHzb8Z.EjJ6jd4CvP5duxTMryW', 547, 4, 0, 0, 0, 'nur-mohammad_shopannoorcom', 'https://shopannoor.com/', '1834133360', 'Dhaka, Bangladesh', NULL, 'ZRWMDXTHBEFSHAYY', '4SIlOV0ryWzt3mFoa06x2JbNb66G1eJB', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(357, 'Maksudur Rahman Shahariar', 'mshaharir124@gmail.com', '$2y$10$pJFrhbrX59g2f0Eqes4LHuG7pMus1P6/6/sVh5LCbNX.Ma8RX9K7K', 546, 4, 0, 0, 0, 'maksudur-rahman-shahariar_selectionhuntcom', 'https://selectionhunt.com/', '1521231511', 'Dhaka, Bangladesh', NULL, 'EHD53LQFJZAEFPYP', 'PG1oEFuiKayjoPhGVlyPJjB2U49nieUn', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(358, 'MD ABUL BASHAR', 'pq1793@gmail.com', '$2y$10$oHhhTCrY.Edfz8o0rVD6n.Wb4DRbvtPCkgYf1xj7gRUxdZBC0knRC', 545, 1, 0, 0, 0, 'md-abul-bashar_flyingshoppcom', 'https://flyingshopp.com/', '1712092496', 'Dhaka Bangladesh', NULL, 'R2RK60R3ZC2OLUL8', 'iWvk1RW1UB1L1DJrEcA4DxbOvL1Cc5Ff', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(359, 'Liton Nandi', 'litonnandi757@gmail.com', '$2y$10$GKzLekQ3o3npal5iXJFps.yJ0.CkVPy9Jn6b7nd6i9Yh1tmeiXeqe', 544, 1, 0, 0, 0, 'liton-nandi_alongkkercom', 'https://alongkker.com/', '1818085108', 'Dhaka Bangladesh', NULL, 'AORIFHJ15MGSKPER', 'GM9MKNX9d9YFn8I8v2DOSjmXu6Fu209I', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(360, 'shajahan', 'shajahanbd04@gmail.com', '$2y$10$CknskYUvcOmXThQPS7Of0evhei6EC5nO9L/9P7Y9E3bgYu9Gn7tmO', 543, 2, 0, 0, 0, 'shajahan_apanmaxcom', 'https://apanmax.com/', '1811118983', 'Dhaka Bangladesh', NULL, 'Z252WFBJM8SHV1OM', 'YRX1RUPosIvem7rv4zzfd5etXgwqAUNn', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(361, 'Selim Ahammed', 'selimahammed37@gmail.com', '$2y$10$yUba7sEDbToUT.le3J10sOtR4LJXOK8IUETUeFGIi22CjZY/4A4P6', 542, 1, 0, 0, 0, 'selim-ahammed_sellvomartcom', 'https://sellvomart.com/', '1722877187', 'Dhaka Bangladesh', NULL, 'ABCE4OZRGLZMRSBD', '4ZjEL2wksoXUqCLUxI5wIfY8ulg8iKEg', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(362, 'Md. Al Imran', 'alimranmb97@gmail.com', '$2y$10$2ui4kZZa5icfoxQGAYYnQeJa9wkUA4nNTjlzwa5njrAztN.YoZqDW', 541, 4, 0, 0, 0, 'md-al-imran_aramsemartcom', 'https://aramsemart.com/', '1781489026', 'Dhaka, Bangladesh', NULL, 'JQ3VMNYKVFMC4BNH', 'O3k2rCMySTf3dChedzaire64VLH9Nfqy', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(363, 'Farid alam', 'faridalam0079@gmail.com', '$2y$10$p/YVKRVw10wFhcrTxErDkOrMf93TAReQOoZ2r6qrP857yR9f4Rn3C', 540, 1, 0, 0, 0, 'farid-alam_taqwaloycom', 'https://taqwaloy.com/', '1819271186', 'Dhaka Bangladesh', NULL, 'MATMZJPGLDOG1EQC', 'WX3Sak7e6hphsJIQxsTSClDGVH8Uw7uR', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(364, 'Shafayet Ibne Amin', 'shanjishusband@gmail.com', '$2y$10$we.yWsRtQzOUL0a.3r4uAOTjyt1daFqlhk4PfkAdc.NJYgV7rUMeq', 539, 2, 0, 0, 0, 'shafayet-ibne-amin_shafayet360com', 'https://shafayet360.com', '1865611797', 'Dhaka Bangladesh', NULL, 'HTJMC8TVJN9SDNKS', 'mRjm27baK32S4H3N5Ypgt7N88fpd6K52', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(365, 'Mohammad Rahmatullah', 'me8146037@gmail.com', '$2y$10$YoodGPMGDu9gh4z4.Gay7eh.XbcIHjrCkEv2bqPBbhNv2T9ZVvX0.', 538, 2, 0, 0, 0, 'mohammad-rahmatullah_oneummahbazarcom', 'https://oneummahbazar.com/', '1731602866', 'Dhaka Bangladesh', NULL, '7RALWVHCSCSBMSJX', 'Sk10327NFaFvGVgyhUe0KY7UYdHFNykk', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(366, 'MRH MUKUL', 'starmrh2@gmail.com', '$2y$10$jl0oVFXg2HeEXXSsoJIKmuiHi7S58qGCr4oQyJ06neUFkSj0l1T2O', 537, 1, 0, 0, 0, 'mrh-mukul_starmrhcom', 'https://starmrh.com/', '1778955413', 'Dhaka Bangladesh', NULL, 'BQWTBZZGPT9XKRYQ', 'mbMhucRcaP2pMNB02wOsuwIwvKkvxEX6', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(367, 'A S M Nayim Khan', 'nayimkh@gmail.com', '$2y$10$8PqzEStkJWdiAs0A5XVFL.jUlJiMn5gqRPYX1LD19ECTVjNcfHBCq', 536, 1, 0, 0, 0, 'a-s-m-nayim-khan_clickkmartcom', 'https://clickkmart.com/', '1410666776', 'Dhaka Bangladesh', NULL, 'ZI1IE03WCPRCGCEE', 'iWGxp0NrUJH8zpIbp64W6j82jj8QezSO', 1, '2026-07-28 08:46:20', '2026-07-28 08:46:20'),
(368, 'Md Yousuf Parvez', 'epickobd@gmail.com', '$2y$10$4idsj/xGmKxRBud0ybzIyuzGTslWAI0XPeG2ImlIc84VQOf/5c9Wm', 535, 1, 0, 0, 0, 'md-yousuf-parvez_epickoocom', 'https://epickoo.com/', '1305743174', 'Dhaka Bangladesh', NULL, 'WVXRAHGU4E91DKLI', 'keH1chetmrSHwMTfRzcmxmIo2wwZdb6a', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(369, 'md Abdul malek', 'electronicswasif@gmail.com', '$2y$10$Gqwz8seQ7E5DuEY4WD7HF.2KwfND25IaQCXkRFG66pVeJWx24WOae', 534, 1, 0, 0, 0, 'md-abdul-malek_nexshoopcom', 'https://nexshoop.com', '1711365168', 'Dhaka Bangladesh', NULL, '2QUHYHSOKVJLQEUB', 'LvSl2nNapu9wz0nxG0X4MDTUxUufEONf', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(370, 'MOKTER HOSSAIN', 'mdmokterhossainsorkar7174@gmail.com', '$2y$10$SQgI7FGLD6Z/twQcwIt0puBuohFBAC185zuS9Q68KsF4ZkuEXRqPC', 533, 4, 0, 0, 0, 'mokter-hossain_reveenuecom', 'https://reveenue.com/', '1889560136', 'Dhaka, Bangladesh', NULL, 'C9JFBVII79BGQBEO', '02rQPCNY2jsIHDCS9ikF7lVB8YdpSAYj', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(371, 'AZIZ', 'khanaziz3221@gmail.com', '$2y$10$WEk/plxwAiurl8PNp/7HAefD4Ol8gzPKed8lDW4nTpcDEy59yF3HS', 532, 4, 0, 0, 0, 'aziz_takwalacom', 'https://takwala.com/', '1606815642', 'Dhaka, Bangladesh', NULL, '0Z4KQNFHMC2MWE7Z', 'UDglppibkcUSbU1AFvRnGT1EAOz2Rk26', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(372, 'Ahmed Reza', 'terrabd5@gmail.com', '$2y$10$B5m9rWC6qwZzXfQzwQRoPOeOzP5bXCX3lUMSPKJ/tZfm79Gpy6hdi', 531, 4, 0, 0, 0, 'ahmed-reza_terrabdcom', 'https://terrabd.com/', '1609291466', 'Dhaka, Bangladesh', NULL, 'YC3CS92ODNINJRFD', '7BP3ot9fEa8aBRbnvnCADtaz4ssqS6jx', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(373, 'Rakibul Islam', 'rakibulislam417756@gmail.com', '$2y$10$Nq52HMzG7mxw.qzmmqCKoeFLpn11WeueZV2u6RmrAvau.rDLxj6ra', 530, 6, 0, 0, 0, 'rakibul-islam_erazmartcom', 'https://erazmart.com/', '1882700030', 'Dhaka Bangladesh', NULL, 'MRVOGA9RCC2O47G9', 'qWo3K1LzxXNWZ0j5JElWAdjbbtcIMqmt', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(374, 'Md Imran', 'imranahsanul2003@gmail.com', '$2y$10$szSWq1yQD0b00uoH0nW51.VMrWbsXpHDm59XmaQUAoFV8JYfMuXHe', 528, 4, 0, 0, 0, 'md-imran_pochondohobecom', 'https://pochondohobe.com/', '1705041631', 'Dhaka, Bangladesh', NULL, 'GNB51NC4L9BVVNZJ', 'L00HyOwZ7c3ktgsnz11zja04p59K5Xlr', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(375, 'Anando', 'yeasarsuccessbd@gmail.com', '$2y$10$NWqKj.dFy6bwUF.24atxzOzzOGRsl3rsxcYImsN0/xIJv/tWKbJpa', 527, 4, 0, 0, 0, 'anando_kinboecom', 'https://kinboe.com/', '1758855446', 'Dhaka, Bangladesh', NULL, '3NZSLT08IGKSREC7', '8UftGuiCSa25I8GjoWbHWmh9FfwagEcU', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(376, 'AHAD MOLLAH', 'mollahmart87@gmail.com', '$2y$10$zp4oeaV5BP3lPbU3oZNopOvTqlpS8urCpujASPTlgSgTTwrnNcd22', 525, 4, 0, 0, 0, 'ahad-mollah_mollarmartcom', 'https://mollarmart.com/', '1410041971', 'Dhaka, Bangladesh', NULL, 'DHLANVI9RERVCK6I', 'jQU9TkPuVurJxTez0JzPGp9bOYZRTJR3', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(377, 'Mohammad Farooq Anam', 'mfanamd1346@gmail.com', '$2y$10$OK7ssxNBkZ/IAPoS9mgX7eay9FTFfBRpwc/tr4oDJ1PtyQtK3X1ta', 524, 6, 0, 0, 0, 'mohammad-farooq-anam_haatfycom', 'https://haatfy.com/', '1972601651', 'Dhaka Bangladesh', NULL, 'HSPMWPNLRVM5HQJC', 'H7awunpKNlGLFI96kAO6SCyf3hlWQVcg', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(378, 'Rubel mahamod', 'rubelmahamod35@gmail.com', '$2y$10$4wKP8YBOMmoKFYQk12avHeReQOci5HkBT0NrsgvpN/xXA.UIfnPee', 523, 1, 0, 0, 0, 'rubel-mahamod_safiamartcom', 'https://safiamart.com', '7306852345', 'Dhaka Bangladesh', NULL, 'SHIE1NHWSGYTNGMX', '1dGM0eMVwQc6H83JCKLZyGCXAkJkMeUN', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(379, 'ali imam', 'aliemamreza6@gmail.com', '$2y$10$zMJPfgaptenZ8yAqZtTMS.5PzbNlpzPHOD/Z98aJRg4E7bRF0KXJO', 522, 1, 0, 0, 0, 'ali-imam_dressyworldcom', 'https://dressyworld.com', '1765247727', 'Dhaka Bangladesh', NULL, 'DIZVVQ1HX23BMOYZ', '1wF1SX7PKmNNzBM1Xis0eajCf0HxbXoq', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(380, 'Md Mehedi Hassan', 'mehedihassan81220@gmail.com', '$2y$10$r4JwRI0exkMngU5n3OFzl../jI6PEQ5n/4Q51L5H61pr2KvcRxkV6', 519, 1, 0, 0, 0, 'md-mehedi-hassan_innuricom', 'https://innuri.com/', '1632729390', 'Dhaka Bangladesh', NULL, '1CB6H2X0KSCYDP2G', '6R9WMoG4NtYLsIFAKabYyDQw51IPYLyN', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(381, 'Md Abdus Salam', 'taqwala666@gmail.com', '$2y$10$1nYMj2q3I92Lo5U6tQgGvO6eF/TuEIAr6NzszAQZLrUUTwzMYqh/K', 518, 4, 0, 0, 0, 'md-abdus-salam_taqwalacom', 'https://taqwala.com/', '1719415666', 'Dhaka Bangladesh', NULL, 'MLTH84AGWKXRQJVH', 'OpvHkVcjYXUWJ31jUX2eYjtkkVYh3iQP', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(382, 'Md. Mahbubur Rahman', 'info@dorinmart.com', '$2y$10$b0.VFrlx/Wvg.DUbvzUEOu/n6kVnMu2r9P/i.6Cen1o0eMeSJMqqK', 517, 6, 0, 0, 0, 'md-mahbubur-rahman_dorinmartcom', 'https://dorinmart.com', '1715048362', 'Dhaka Bangladesh', NULL, 'RF37PDAKQOGA158P', 'XSJZ6oHCISKnxPZHkX0xSf8jFLZCp77N', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(383, 'MD ABDULLAH AL NAHID', 'nexua.shop14@gmail.com', '$2y$10$Ra4kPkQ8W1uEaYerfEh8F.cPRoLnhtXDTcPb4zSxEnGv/Y6uzxu7K', 515, 6, 0, 0, 0, 'md-abdullah-al-nahid_nexuashop', 'https://nexua.shop/', '1326863506', 'Dhaka Bangladesh', NULL, 'ALLFUQOIIIFJOVUS', 'IREdRMec2mw67KXHGhuQXVS2i77lOdsN', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(384, 'juned ahmed', 'junedbd95@gmail.com', '$2y$10$SgxxK4eOyq6fo0WJeGKTMeQCp8JFpB66eXS/xXs2VoSTgSgBcd/V.', 514, 1, 0, 0, 0, 'juned-ahmed_resunnahcom', 'https://resunnah.com', '1339715172', 'Dhaka Bangladesh', NULL, 'BGDIXCSP6XCZWC6C', 'MYZHRJNG8KLpnQRXX490AotnDDNxkQF3', 1, '2026-07-28 08:46:21', '2026-07-28 08:46:21'),
(385, 'Md Saidur Rahman Tohin', 'siyamtuhin@gmail.com', '$2y$10$EhANGNyAAzz65W9ipmYoiOZWLQXyJ8e4MaRiLm.ZFtkl3buB7SHMy', 513, 4, 0, 0, 0, 'md-saidur-rahman-tohin_mytrollymartcom', 'https://mytrollymart.com/', '1722146061', 'Dhaka Bangladesh', NULL, '3CSAOKXZTXPPM7TV', 'YCT75ZsOC366vmM1tRjekL2u4Xld9Mic', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(386, 'nuriyana.com', 'uoebazar@gmail.com', '$2y$10$zEKMvY5PsRliuOa5XO12.eiDXf0xS/OuSfB0FBCDNDzD4tK1aG2Cm', 512, 4, 0, 0, 0, 'nuriyanacom_nuriyanacom', 'https://nuriyana.com/', '1890051609', 'Dhaka Bangladesh', NULL, 'EXUYKT64P6T7KMK0', 'LZ4i1ejos6lGAfrjRZyWQPMPNFn2IZ0P', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(387, 'Nasir Uddin', 'choicepointbd99@gmail.com', '$2y$10$jgbmjB4uCRhCj4rS4kp/yO2UkDydkEPL0dl.jyUwwgAh0pxmttTfW', 496, 4, 0, 0, 0, 'nasir-uddin_choicepointbdcom', 'https://choicepointbd.com/', '1581567890', 'Dhaka, Bangladesh', NULL, 'FVQEF9BX7FD5QFVQ', '51q5wcu2Wcm8hRNtK0WHOhs5T2PuEhlb', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(388, 'CHANDAN KUMAR BHOWAL', 'sales.ckb1@gmail.com', '$2y$10$GxTtULlf76llw67hCBbrBOJLunebaylMolKPYhoUN7cNDIATkLPhi', 451, 1, 0, 0, 0, 'chandan-kumar-bhowal_shopbarisitecom', 'https://shopbarisite.com', '1859909877', 'Dhaka, Bangladesh', NULL, 'MGGTJYA2N8C1DATD', '0J2eF4HzgSTAzzt2gUfuJNegTRjCaE26', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(389, 'Muhammad Bashar', 'tazpointmarketplace@gmail.com', '$2y$10$8cCwXO9hPbnRO34OO2o13uRJgpgR1uokGM100UeQb83smIUcYpl2y', 511, 6, 0, 0, 0, 'muhammad-bashar_tazpointscom', 'https://tazpoints.com', '1881495264', 'Dhaka Bangladesh', NULL, '1DTNIN4B5TSZVDNU', 'H1XR94XACDIP7fvSLMvR5iINgdzeNkNw', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(390, 'Md Abdus Salam', 'abdussalam729381@gmail.com', '$2y$10$BEgftwRrIrRiMDrBfCOW1uNsX9HPtFmVCMBIYZud1pac9Axf0czF.', 510, 4, 0, 0, 0, 'md-abdus-salam_barakabizzcom', 'https://barakabizz.com/', '1740729381', 'Dhaka, Bangladesh', NULL, 'HCC3OQKR6APC1ZNX', 'OrPzzU49fGl4b3q8B01eXycr3lFr4jyU', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(391, 'Mohammad Jihad uddin', 'mdjihaduddin2451@gmail.com', '$2y$10$JrJvTswSIJ6mQHIHAc.GEOoStYq6sLE0TgY6Ozxtt27ti1YOY9nMa', 509, 4, 0, 0, 0, 'mohammad-jihad-uddin_genzmarttcom', 'https://genzmartt.com/', '1619784422', 'Dhaka, Bangladesh', NULL, 'R11AWOKFMACPFCVX', 'bk4J1JorjmCEAuQR7PRFhSdrkIMNSvat', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(392, 'Nasif Ahmed', 'nasif.phq@gmail.com', '$2y$10$usDGB1.W6c.qfo/B0Hp4xeuPlXrhprzTgoA2V5k6.O/OAv6mhclri', 508, 1, 0, 0, 0, 'nasif-ahmed_somoymartcom', 'https://somoymart.com/', '1817101679', 'Dhaka Bangladesh', NULL, '2NKPSDGHBKNHZY6J', 'qV2smaTV8GwYNK4kDt8OhoQvIm9xqVlq', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(393, 'Muhammad Abdul Muqit', 'abhijatmart@gmail.com', '$2y$10$xfpw680P/85tj.fHrDOtgOS6rgeqmava3dpdVVCHjiL4KtzHaSGFi', 507, 4, 0, 0, 0, 'muhammad-abdul-muqit_abhijatmartcom', 'https://abhijatmart.com/', '1726381728', 'Dhaka, Bangladesh', NULL, 'AOXKVKI8VQHTQJ33', 'KrI1JWGHoSzBU3XWEdTcUJVRSywviYYN', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(394, 'Blaise', 'blaise.collins.costa@gmail.com', '$2y$10$mK/OHL02ahhPNlzIDnlh5OhH060HZAULNussTxMziGHl2rknvUQlq', 506, 4, 0, 0, 0, 'blaise_al-amanahemporiumcom', 'https://al-amanahemporium.com/', '1741176027', 'Dhaka, Bangladesh', NULL, 'C78RCF093WGSFSE1', 'WyJXdKLKcUW5bjSzo8IyhG9IuPYWo2Z3', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(395, 'IMRUL KAYES', 'insafiiglobal@gmail.com', '$2y$10$kmIi1.MOXCYkagCvS39BOu/2TscPnQC90mtSO1UbfkNXC37jalO9G', 505, 4, 0, 0, 0, 'imrul-kayes_insafiicom', 'https://insafii.com/', '1780355459', 'Dhaka, Bangladesh', NULL, 'UIGWJ8JJQJZ4KSWS', '3MRsQ1krorkKx3VwAsG1IV6Ik6g6l2d6', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(396, 'Tuhin', 'freelancertohin102@gmail.com', '$2y$10$ceaZADKDJV8TjrT..O1z.udn11DtDBkM/E4bky3Z1DQdsW3DkrqGK', 504, 1, 0, 0, 0, 'tuhin_assunnahfashioncom', 'https://assunnahfashion.com/', '1620345596', 'Dhaka Bangladesh', NULL, 'TKBO6BUS2Z33J94K', 'INSPt1iRwwYhDHn7iRNbLTiAfKgnx4KE', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(397, 'Amirul Islam', 'amin12.ct@gmail.com', '$2y$10$drHmI5PXHSdBOqaMUo7gzenY5oGvMa77YJ6VsZ1Nh97NqPLeyIt7i', 503, 4, 0, 0, 0, 'amirul-islam_haqqmartcom', 'https://haqqmart.com/', '1968575287', 'Dhaka, Bangladesh', NULL, 'EAQBMU2TWMA2UJ7I', 'zdtfC5bHeyv6axzyX7Lrxk68PTdO4dNF', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(398, 'Md.Shahjalal', 'jalalphl@gmail.com', '$2y$10$Lz9/TkysKOHw5d5aFxJ/8.e7BMMtJqQFaE4ZqSy1Nb2iugRdg/qhe', 501, 4, 0, 0, 0, 'mdshahjalal_preyomartcom', 'https://preyomart.com/', '1967373737', 'Dhaka, Bangladesh', NULL, 'HBIYOKCXAQWIITNP', 'iE1Yka62gpPF1o70ry87pt00zKrhxVdX', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(399, 'Salman Ahmed', 'salman6575ahmed@gmail.com', '$2y$10$uKL/IA4L4iQLPrVv3zBZWeU72qxmFP/TH6eHY/6IxBHE7VTPOjyVi', 500, 4, 0, 0, 0, 'salman-ahmed_familyloycom', 'https://familyloy.com/', '1314460143', 'Dhaka, Bangladesh', NULL, '5YKAV4A5VEICO62Z', 'ZYcIyMXKM5I1OvCPYkCFHMiw4OaFZsR9', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(400, 'Sobar Bazarbd', 'sobarbazarbd1@gmail.com', '$2y$10$E0n..c2XMqwEqolScmHTs.xNKrGj/Xpju4GwisfQQWG0LaK38wQg6', 492, 6, 0, 0, 0, 'sobar-bazarbd_wwwsobarbazarbdcom', 'https://www.sobarbazarbd.com/', '1713332003', 'Muktijoddha K S Tower, Sector-12, Uttara, Dhaka', NULL, 'JY8JCOC7JIHBVTTT', 'kBJWKmHzCcsqUyjqNbmmcmSBohy7Bwt9', 1, '2026-07-28 08:46:22', '2026-07-28 08:46:22'),
(401, 'Marazul Sardar', 'sardertrends@gmail.com', '$2y$10$lj4jlpMeQy0EkJkSF.xOt.a3Xr8k1KScK5M8cNZHbn.a9GujH7RVW', 499, 3, 0, 0, 0, 'marazul-sardar_sarowfacom', 'http://sarowfa.com/', '1772119253', 'Dhaka Bangladesh', NULL, 'NC6GASANYWSOZ7AS', 'VRnQRkNrK1whmSv9mQi6hhxMDNMvMFtf', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(402, 'Marjanul Hoque', 'marjanulh23@gmail.com', '$2y$10$VoZxUhRnildT6QwngIpNXeAUspC1TPyjRd.4Hyv9AAy1La4ruaiJC', 497, 4, 0, 0, 0, 'marjanul-hoque_jumorocom', 'https://jumoro.com/', '1760167502', 'Dhaka, Bangladesh', NULL, 'SBJZAJBLPTLNIRK0', 'qFNCXS1BHgBrLCFZP5qmN41MoLuh5rXh', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(403, 'Ruhul Amin Biswas', 'afnanmartb@gmail.com', '$2y$10$z0Kb/DR3dWfM7NksOK1H4O.z776/0GO44nQfZLsAnM2wZghbxcaTO', 495, 4, 0, 0, 0, 'ruhul-amin-biswas_afnaloycom', 'https://afnaloy.com/', '1825538375', 'Dhaka, Bangladesh', NULL, 'A6RTU9QIO7ITP656', 'SLR6h8InWnLFN7WqT9nNUjRLIbVnKCsS', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(404, 'Labib Ahmed', 'lbkhan2345z@gmail.com', '$2y$10$pzScRjpvIRrsouVstOPDaOrC3hOEeH3YueiEMf5FSQMsQsw14hlku', 494, 1, 0, 0, 0, 'labib-ahmed_zeenviacom', 'https://zeenvia.com/', '1747017331', 'Dhaka Bangladesh', NULL, 'U0CILK4RDRQPAA5I', 'hMw5kplEydSCya4c2ZrRZBQBsC3KECJz', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(405, 'Mohammad Golam Sabur', 'golamsaburfcma@gmail.com', '$2y$10$6KWzb9B12WBiQQVJuV4Gxeimt22QXqaBh73G3ep/zODZnIyoQYg0y', 493, 4, 0, 0, 0, 'mohammad-golam-sabur_rupushimartcom', 'https://rupushimart.com/', '1766333861', 'Dhaka, Bangladesh', NULL, 'YCC5AKV5AAXXM5CX', '51JimYhBMZNeW6ClbkmQyA30emJ4Czvj', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(406, 'Md. Tofawel Ahammed', 'tofaweltuhin501@gmail.com', '$2y$10$j8BIf3LEYKE3o7dOZH2lDOtdsuRcmFDShQy58arMz0ocWdGSYBMq2', 491, 1, 0, 0, 0, 'md-tofawel-ahammed_arosimartcom', 'https://arosimart.com', '1571715713', 'Dhaka Bangladesh', NULL, 'WPOJOM8BEDXXMMKO', 'PZNsald35EktM83J9bcJ5Lkrfp2Ik0Iw', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(407, 'Aayat Sania', 'sumaiyaaktersanaia3@gmail.com', '$2y$10$p3nSUcGhBQJ6j.wLlqLWKus1xrL6CM6HaLBxvL.iBjchWpHcfwhLK', 490, 1, 0, 0, 0, 'aayat-sania_insaloycom', 'https://insaloy.com/', '1777108801', 'Dhaka Bangladesh', NULL, 'UDLIWIEWRAZWPN8Y', 'ct2yvd8lL3sTg4dgjV2It7C9Vpz6hGQr', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(408, 'Anowar', 'anowarrasel3@gmail.com', '$2y$10$AXG5ulIMsuLXvHV4bhDW9OXnzU/8CctZWE4iWiv8tstNMlOzH.Buq', 489, 1, 0, 0, 0, 'anowar_muntazatcom', 'https://muntazat.com', '1880633940', 'Dhaka Bangladesh', NULL, 'AGFQU98XTROSQW2A', 'Jzz6ZLcHkJcg325pXvksUDZADKTixgDx', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(409, 'Shamim Ara Nitu', 'nitubuft@gmail.com', '$2y$10$wfdsVjVDRLe2Ar411Vw4..NIfNYTkYT/WVeUB.MaLt3b09a5ZFO.6', 488, 4, 0, 0, 0, 'shamim-ara-nitu_crysanthemumbdcom', 'https://crysanthemumbd.com/', '1727656059', 'Dhaka, Bangladesh', NULL, '3S2IF5JK6ZREDLPB', 'xC0o8FvRvyMeleICRZpqx0eS10ovTHdy', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(410, 'Md Mosiur Rahman', 'uniqezone26@gmail.com', '$2y$10$HjAlEbusK1nmHpkbjZHfXOwZ995cJZsY0.EqzLpGtw/kHUnmS8wPK', 487, 1, 0, 0, 0, 'md-mosiur-rahman_uniqezonecom', 'http://uniqezone.com', '1859004047', 'Dhaka Bangladesh', NULL, 'B4QIX5DFHQXP7BBE', '4dryJyQ18iDEg5sn88KjU6Ri4BXYwTf4', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(411, 'Akbar hossain', 'hossain58bd@gmail.com', '$2y$10$V5Wq6g22lfxmpZJdMHiOWOXJz7UycgGWzQLV.41lc548d3CRCPQyK', 486, 2, 0, 0, 0, 'akbar-hossain_realymartcom', 'https://realymart.com/', '1770447753', 'Dhaka Bangladesh', NULL, 'X2RRBRB58RHU9G2D', 'bwnWkHVpn3Md20Isnmvb58a5dpVkcYSJ', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(412, 'Md. Shafiq', 'shafiquerahmanbd@gmail.com', '$2y$10$lIgEBbwx2DVG4zpvaCABE.tLdZxwFvbZbkpC9RM/SRJwPhZXl/1me', 485, 1, 0, 0, 0, 'md-shafiq_aloormartcom', 'https://aloormart.com/', '1713032875', 'Dhaka Bangladesh', NULL, 'Y2CYLYIGC2W2PQMN', 'Rf8byFmAjHWZYbexhRnN5Z4UPgUna5xo', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(413, 'Mosaddekul Islam', 'morctg@gmail.com', '$2y$10$12ED3IY1FQT4e8yzRD9TfuBZmz.5udJH5d.1ivs77Y1Klr5i0Mcpi', 484, 4, 0, 0, 0, 'mosaddekul-islam_festivmartcom', 'https://festivmart.com/', '1811537326', 'Dhaka, Bangladesh', NULL, 'T2ZXPNKYYDFGNOAP', '4ijN4PBMdSonManqbOAPsvSv3wqbB5Dy', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(414, 'MD RAFIQUL ISLAM', 'rafiqahmed017@gmail.com', '$2y$10$Ht0pspV/GMlLAFtvTD1YouKcv6bd9JGlnhHYX6ctjR3zwvv31zG9O', 483, 1, 0, 0, 0, 'md-rafiqul-islam_seilorshopcom', 'https://seilorshop.com', '1745876414', 'Dhaka Bangladesh', NULL, '5SYLGT9P1HWWIB79', 'REdSCKnaVv6fHfI1dElXTfWTIoHsSeAy', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(415, 'Clothi', 'clothibd@gmail.com', '$2y$10$Edy5gCHq3C.t97rz4QgqI.erljpZ6MA/q5EHyPTpFVcjQjORX5I92', 482, 4, 0, 0, 0, 'clothi_bindaashcom', 'https://bindaash.com/', '1712155870', 'Dhaka, Bangladesh', NULL, 'YJLVRJRGGFDRQGF6', 'Ns6PjR16HsC65F1YTZ2vSzPNx5qr1IUA', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(416, 'MD.MANIK HOSSAIN', 'mdmanikhossain310@gmail.com', '$2y$10$1XSR0nJ6vFUCmP7pbPEWG.edi/G5BWv31UoszYNVw1ioFRLZYKEs.', 481, 4, 0, 0, 0, 'mdmanik-hossain_nittohaatcom', 'https://nittohaat.com/', '1910643382', 'Dhaka, Bangladesh', NULL, 'RMYVJESJLTX4YQMH', 'K8QN1wLoTIu2paS4cUkJx9uxhcMlzuGG', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(417, 'Abdur Rahman', 'hello@rahat.info.bd', '$2y$10$ITGuNVMzoP2qQqCXlquQzuuzLISwTtVLriiFT.uECbtPi9XD0I1sW', 480, 1, 0, 0, 0, 'abdur-rahman_waafiqcom', 'https://waafiq.com', '1317005566', 'Dhaka Bangladesh', NULL, 'YIZUHXRMLDVOAA8C', 'pxCX5Y1iYAh11IioVekTypzsUIvzlKwW', 1, '2026-07-28 08:46:23', '2026-07-28 08:46:23'),
(418, 'Hasanul Islam', 'naimul.islam9050@gmail.com', '$2y$10$7PoqQik1Bs6HQhrbzM5Zp.pYnluG3/2s3DNPCej8vvkvxG0KoNZyC', 479, 4, 0, 0, 0, 'hasanul-islam_shopyzacom', 'https://shopyza.com/', '1635737735', 'Dhaka, Bangladesh', NULL, 'KVBJC0VVROHY83OC', 'OqZPSrSIcZKOJbe8RH7cXRwkvhib7qZX', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(419, 'Md Rejaul islam', 'reajulislam301097@gmail.com', '$2y$10$qa7nTZAL29hm.YMjNC3NveQxc6RdBdEL2WX66h4BjR3Tf.J0lA/ye', 478, 4, 0, 0, 0, 'md-rejaul-islam_amirxrcom', 'https://amirxr.com/', '1611132852', 'Dhaka, Bangladesh', NULL, 'QNOLYA7JKI9GCDTV', 'Nr130RTDiG0zzFG52vzEZAMU8I9qIzYQ', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(420, 'Md. Imran Ali', 'imran111333@gmail.com', '$2y$10$TeqseN.AXAGnQSv7OAF7HumgLMSn9OabLaU7bQgoSJuyhMal3usb6', 477, 4, 0, 0, 0, 'md-imran-ali_happybuy-eacom', 'https://happybuy-ea.com/', '1746667773', 'Dhaka, Bangladesh', NULL, 'EYQFUE5RKH9FCOAY', 'C9EHsRvfMk0n5oQ6TyaDkYLDneZGawHO', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(421, 'Habib', 'habibrajabc@gmail.com', '$2y$10$sDPbG0ssR5KfY5rMOZOJ.uXDt87KRrhti6xm30tDL0CqY03DBIAXG', 476, 1, 0, 0, 0, 'habib_onlinemart24com', 'https://onlinemart24.com', '1709873052', 'Dhaka Bangladesh', NULL, 'FANT28GOIC02XCQE', 'JZg7Ahtr7xSPmtuc7ypActyxF4UOwx3F', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(422, 'Nayem Hossain', 'zaynmart66@gmail.com', '$2y$10$PSxQef9dcuZX8qTNoBDMreRW7VHBASAMisZG/JnOClHsc7Q0a6rQe', 475, 4, 0, 0, 0, 'nayem-hossain_sadiqqmartcom', 'https://sadiqqmart.com/', '1608665724', 'Dhaka, Bangladesh', NULL, 'NZQ7EF6MREYT6EBU', 'awZjpjf389lqeIldMEpfdyqwmxz970pQ', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(423, 'Muntaser Mohammad Aseef', 'faabricia.official@gmail.com', '$2y$10$TvkIKU6VziZSmQkMkr6qremLdecDYGIiBdzgxgOBLleOUCvzYJg4e', 474, 4, 0, 0, 0, 'muntaser-mohammad-aseef_faabriciacom', 'https://faabricia.com/', '1759469948', 'Dhaka, Bangladesh', NULL, 'QAK5TCQJXENNWWTL', 'NAxkypkuCLdpGccMbVZQynrax38VuQ7F', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(424, 'Sayed Ashraf Ahmed', 'sayedahmed0813@gmail.com', '$2y$10$7TuZ51ywqwpOU2.T7aRHu.97mkbRIaVoN36Wip5YcRGiJG0xaSM7y', 473, 4, 0, 0, 0, 'sayed-ashraf-ahmed_wearifybdcom', 'https://wearifybd.com/', '1351999891', 'Dhaka, Bangladesh', NULL, 'LF2ZVUH9YY2DOME5', 'NaBOv4iBHwz9hkbZbZP5Bjh6yumMG1Ra', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(425, 'Nargis Akter', 'nargisjahan.neha@gmail.com', '$2y$10$D88oGjt7AWUVA7u81kIyc.837dzF6kAvT6aAl8bgtQ5QvZTRQWzvm', 472, 1, 0, 0, 0, 'nargis-akter_insafiyacom', 'https://insafiya.com', '1773569538', 'Dhaka Bangladesh', NULL, 'BS9N0IUI1YSEBMSF', 'pz4Fj6efICczg8EQl7zjiGP9Cshs57me', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(426, 'Md Masum Billah', 'msbillah004@gmail.com', '$2y$10$rmgffnf3LmiMYXA9E4Mjw.mzfNGw8drJZefzD6r2YZLkm.j6h.zlu', 470, 1, 0, 0, 0, 'md-masum-billah_bazarloocom', 'https://bazarloo.com/', '1754106911', 'Dhaka Bangladesh', NULL, 'XNCHDOQXGNIZK9RR', 'CyqB9R7XtKCdjIXZz0xxBxKMqZ9WxH2s', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(427, 'Md Akash Bishas', 'biswasbuy86@gmail.com', '$2y$10$IGsiL6qHN/E6W4AwZAXGmOlYSa2.XDCtdMNoutlMtbtZP7bJKflrK', 471, 4, 0, 0, 0, 'md-akash-bishas_biswasbuycom', 'https://biswasbuy.com/', '1703253536', 'Dhaka, Bangladesh', NULL, '06ACRUIUSZXUNICE', 'qpF61A9YlKQKrvz7FY87Xou2AeN4Liwh', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(428, 'Zahed Hossen', 'zahedhossen535@gmail.com', '$2y$10$qlyPgHPQROL8Ykux/Q/o/OrLJc24TwB5r1ow.ic4iKKKs5DA7PiaO', 469, 3, 0, 0, 0, 'zahed-hossen_zarexshopcom', 'https://zarexshop.com', '1812989185', 'Dhaka Bangladesh', NULL, '687DAXPRTOI2XTYR', 'uYiFv75NITr11a9dRb0J2CNBIhOYHifN', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(429, 'Razib ali', 'rajibali1219@gmail.com', '$2y$10$E4SVt5whCT1it4yX6.At3u0/9K8orIUkAUofdJFSAaZbrxiU77CBy', 468, 3, 0, 0, 0, 'razib-ali_zynormartcom', 'https://zynormart.com/', '1784175021', 'Dhaka Bangladesh', NULL, 'UUBWNI5IP3OFX2DK', '6p6lf84KpLqNraC8Z3UpK23xLvtGi2cN', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(430, 'Baharihat', 'baharihat26@gmail.com', '$2y$10$0Y1jP8GyuRpjudw5zf6uxu8bLmambyt7cTxDL.prYoc4BcgwRjOjK', 467, 1, 0, 0, 0, 'baharihat_baharihatcom', 'https://baharihat.com/', '1917300300', 'Dhaka Bangladesh', NULL, 'JLXAFE9DKAR8UREN', 'bD1i5dJCz5LxEtdJAxKNuHfEKVfEFf4I', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(431, 'Farhana Najneen', 'trustedfashionova@gmail.com', '$2y$10$U4vtzrwtxb2kLXlM.5mp1.GL9Srh7jyVBgTI.oypfdUwaILkEfPim', 466, 4, 0, 0, 0, 'farhana-najneen_trustedshoppcom', 'https://trustedshopp.com/', '1870907700', 'Dhaka, Bangladesh', NULL, 'EOIOUTPO34GBBPYU', 'k2LJXb0ynARtY5vrcREewvahDV1lJD45', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(432, 'Abdus Salam', 'salamsanto2011@gmail.com', '$2y$10$DWISBTXcf7fO3.kwMF/anOglV1ad/DjxNi3t2wGE3DlY5iYm3Xs/a', 465, 4, 0, 0, 0, 'abdus-salam_clothfyacom', 'https://clothfya.com/', '1706845956', 'Dhaka Bangladesh', NULL, '42ZZ31YOSMY4N8U1', 'fABSSNHcS8PnHpI5MZEmB76Gm9fRQ0th', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(433, 'Abu Taleb', 'abu.rtwts@gmail.com', '$2y$10$ldj7DragwBooQ3I6ULXJCu4ZWnmR0oeNP/4NeKgNmqmiq28z8X.7q', 464, 3, 0, 0, 0, 'abu-taleb_evaloyacom', 'https://evaloya.com/', '1718098833', 'Dhaka Bangladesh', NULL, 'QE21XGVTC2RQ0CXM', '5Fr5yqxvTVDqHF7eES1zMUkudSYXsZw1', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(434, 'Abu Nayem', 'naeem043@gmail.com', '$2y$10$/Zd6vouACPiw75rcYNIOoeoNW3TAxus9BrNgfhd..jEbMiuawE/g6', 463, 1, 0, 0, 0, 'abu-nayem_choosylanecom', 'https://choosylane.com/', '1991953820', 'Dhaka Bangladesh', NULL, 'CBQ6GPRRMV7EUKCO', 'shpjXeJBweH8KbweRLAkBs6octv4i0s0', 1, '2026-07-28 08:46:24', '2026-07-28 08:46:24'),
(435, 'Md Didarul Alam Murad', 'mddidarulalammurad@gmail.com', '$2y$10$e/lls.C7IvdvcqJ49nd9J.0TWvZwf5Q26SqR0JqPdLklHNmx8nmNS', 462, 4, 0, 0, 0, 'md-didarul-alam-murad_nabazzcom', 'https://nabazz.com/', '1744181596', 'Dhaka, Bangladesh', NULL, 'DCKKFJJTJ3QGF4M2', '8FxxoD2cTwEFbHU5LwiR0ucO7QoPaTjC', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(436, 'Abdullah Mohammad Tareq', 'tareqabdullah2@gmail.com', '$2y$10$TxmZhQ/mHhzryYeljSCXWeuo5BhzZ9gh3PwNuFmNbGaju/x9e0Miq', 461, 4, 0, 0, 0, 'abdullah-mohammad-tareq_darazymartcom', 'https://darazymart.com/', '1894602250', 'Dhaka, Bangladesh', NULL, 'PV3AFA0FYF3R0VEM', 'tDPIl7w3hjGzy0X7Gv7Fod6935Ecbuo1', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(437, 'Mohammad atik', 'mohammadatik143s@gmail.com', '$2y$10$UHW16uMayyX4vDSKk8ux9OkkP1VKqkFrR.QIfdZ9xnjvYP66iDxRW', 460, 4, 0, 0, 0, 'mohammad-atik_sk-shopscom', 'https://sk-shops.com/', '1830980319', 'Dhaka, Bangladesh', NULL, '9ZNPBNZY3BSF0UNV', 'Nzt3NkKMPXRfJqyUAZQ3K2SFRWbwxPyC', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(438, 'Habib', 'mahabibhussain192@gmail.com', '$2y$10$Hnl1Nvw5akQIVkhfPTL3x.OPIkvG4eJyEM8qtyVt2d7RBZInzXBY.', 459, 4, 0, 0, 0, 'habib_niyamthcom', 'https://niyamth.com/', '1330788796', 'Dhaka, Bangladesh', NULL, 'HBXPPZBRMNTL86SP', 'E4vZTOqbDcxITa6VZo3tcmPWRiv88pol', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(439, 'Abdul Awal', 'awala3272@gmail.com', '$2y$10$XQLi.YqL7IXdjpaboHr0we.PfKisTFT9MUKCh0yDsrueVbGiRoMyW', 458, 4, 0, 0, 0, 'abdul-awal_insaffiacom', 'https://insaffia.com/', '1879113819', 'Dhaka, Bangladesh', NULL, 'JM5XJHTZQCABYXEI', 'c0KxlJYQTf1t8jQi1KgkWgvr9JXebgso', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(440, 'Ala Uddin Sumon', 'alauddinsumon219@gmail.com', '$2y$10$efRfYMTQzqEwTkfgG9sa6OsuJHBeTDjqGEKhnhVFJIrHauP/O76zq', 457, 4, 0, 0, 0, 'ala-uddin-sumon_shodeshmartcom', 'https://shodeshmart.com/', '1976590075', 'Dhaka, Bangladesh', NULL, 'V4SGWNCVU1ITVVOW', 'XVccQ41SYmZIVMqPHA13zqj8C8FjP6oS', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(441, 'Md. Abdus Salam', 'abdussalamrcs1988@gmail.com', '$2y$10$b81fXWMBR5Tyrr4ALZi/keQZr.SZl0ePgZDek6BRgi9OaPpU4sD0m', 455, 4, 0, 0, 0, 'md-abdus-salam_fidaversecom', 'https://fidaverse.com/', '1868371500', 'Dhaka, Bangladesh', NULL, 'V3O9QQLFGDMSMZ46', 'M0s3cGSIoTmEJGp9ST26S87QlQdbg9uL', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(442, 'Hridoy Khan', 'yallahabibifashion@gmail.com', '$2y$10$q4LHHwHhUvtusOMZaB0DwuXGGn/gJiQWPGzQf40UfipVKLCHrcN.q', 454, 4, 0, 0, 0, 'hridoy-khan_yallahabibifashioncom', 'https://yallahabibifashion.com/', '1315847058', 'Dhaka, Bangladesh', NULL, 'YQVB6XQWUETYBKFM', 'VYXFiCfhZGRDgRDEeuio2VSHIjlpbjGs', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(443, 'MD Tarikul', 'mirdhamart66@gmail.com', '$2y$10$/qGw59DV/93tRUf/E4tslO3PRN4iW38FRypMP9r/bRyp/nCBd5HSO', 453, 4, 0, 0, 0, 'md-tarikul_mirdhamartcom', 'https://mirdhamart.com/', '1922857966', 'Dhaka, Bangladesh', NULL, 'NRNN4M70RMX8GGW7', 'YE2KvL8a7fRE7WwA6aN3yuKcXPfjPZ9b', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(444, 'মোঃ হুমায়ুন কবির', 'homayonkobirm170@gmail.com', '$2y$10$lkDj9.RhlHZYVLQmCNehfOKdcSuy8TUZr.Hv30QmtVcTJEsZ0Kpuq', 452, 4, 0, 0, 0, 'mo-humazun-kbir_ahesaniacom', 'https://ahesania.com/', '1885488417', 'Dhaka, Bangladesh', NULL, '5SYANHKHXHUO2KLM', 't9Lio94g8XI7xtRKVstE2lFNX4wvhVt0', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(445, 'NURUNNOBI', 'nurunnobi49@gmail.com', '$2y$10$wJrAv4sigE82j22/8.nuz.KVVk2sTy9RpAfxkSC3JsICbWvfsUehi', 450, 1, 0, 0, 0, 'nurunnobi_nurwalacom', 'https://nurwala.com/', '1872439379', 'Dhaka Bangladesh', NULL, 'LAHRUMBR6D5KVDVA', '7urN2jRcNHU6rjuSIDmZ86ej7NZoM12K', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(446, 'Md Al amin', 'alaminmiahdhaka00@gmail.com', '$2y$10$SDb3PyiGfRc8.aBXGDD5OOrj4Iji5qYaCiniGygnbpK4mZsmvFnte', 449, 4, 0, 0, 0, 'md-al-amin_hoolmartcom', 'https://hoolmart.com/', '1724059331', 'Dhaka, Bangladesh', NULL, 'SRVCYJRY6LDOXIWM', 'b2AlwYwBXXyIqikU7C56D5shxERXwMOC', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(447, 'MD. AL AMIN', 'alaminhadidm@gmail.com', '$2y$10$wGR.Azhi2mcqmnE8tdJVM.UeqinAkwDBe6IAozzdbbO6VfOW0LCe2', 448, 4, 0, 0, 0, 'md-al-amin_eilbacom', 'https://eilba.com/', '1742623650', 'Dhaka, Bangladesh', NULL, 'JYGOS2OJDT5DAAGI', 'h5F99m5vXyEgYJKkWuFsEUrPqK9ryhP1', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(448, 'MD. KEFAYAT ULLAH', 'hmkefayatullah175@gmail.com', '$2y$10$sgSSNAgd3ycCbPl0GeZxhujanFgDlCuB/SJQQcr5XLFhXlfdIDET6', 447, 1, 0, 0, 0, 'md-kefayat-ullah_sawvacom', 'https://sawva.com/', '1754807763', 'Dhaka Bangladesh', NULL, 'KA43XHLSPX6RR9AK', 'QaVWVSOaQZ3ll7MWRWn8QsBqA2PTyb1d', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(449, 'Sohel Rana', 'sohelrana8457@gmail.com', '$2y$10$P9Ldzsmba03VdMR1LOnKFe.QCOPA6rv8Y67IOO/Qay7Boflw.Xy/K', 446, 4, 0, 0, 0, 'sohel-rana_noorbzcom', 'https://noorbz.com/', '1745463628', 'Dhaka, Bangladesh', NULL, '1FTII2MCYGWCHIDD', 'fFaerHiNty2yTbYL46wX074vYZzBsIJA', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(450, 'Md Jafar Hossain', 'mdjafarhossainmazumdar@gmail.com', '$2y$10$TuwFoJKnCmqqZ8zql.jBxOl3h8pr6quPoLeDMo2uPss3Ub/uUOnSG', 445, 4, 0, 0, 0, 'md-jafar-hossain_oriomartcom', 'https://oriomart.com/', '1844936098', 'Dhaka, Bangladesh', NULL, 'RSPIEOH4BGYAOZ3G', '7Kz1AsDmf5QMOgQagjSgOtzyDrLJS27U', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(451, 'MOHON MIR', 'asmzone10@gmail.com', '$2y$10$GvssAExqJtvwp79tzKAmauWvEnjvHTneEipg/byVajF3XKdtCWFIa', 444, 1, 0, 0, 0, 'mohon-mir_asmzonecom', 'https://asmzone.com/', '1735316745', 'Dhaka Bangladesh', NULL, 'GING40QIZ4QKXVI7', 'GiZUJoBaBPflioYCHDLVEvgo15bVCvBM', 1, '2026-07-28 08:46:25', '2026-07-28 08:46:25'),
(452, 'Nazmul Hasan', 'kafilrbd7@gmail.com', '$2y$10$HzRTcDg/BMAvLIyqkFvFruTiufwUU.CRNUmLkwXqRrGmbrE.MlEZW', 443, 4, 0, 0, 0, 'nazmul-hasan_taakwacom', 'https://taakwa.com/', '1334631624', 'Dhaka, Bangladesh', NULL, 'WDJJJXVKXB83BVFP', 'CCIfx9kfuyqtXNUYp35VvKJLp1ELZxic', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(453, 'S M Tauhidul Islam', 'smtislam84@gmail.com', '$2y$10$giHSHueuP6dtovLJAr8CLOpDc3syaxs3oxLpvvGXvoIPUaZRW3Ez.', 442, 4, 0, 0, 0, 's-m-tauhidul-islam_tawafincom', 'https://tawafin.com/', '1926662574', 'Dhaka, Bangladesh', NULL, 'WVCLQQ9RAFITEUAQ', 'cJcEFRXZnbSLoIleWiP7uh8aLscZAgoW', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(454, 'Jahan Noor Rashid', 'jahanx.bd@gmail.com', '$2y$10$MgiQj6ylXKmie5I1P0yP7ODc2gkSGXSN6KkSB.uVjknbQOmkQE8fG', 441, 4, 0, 0, 0, 'jahan-noor-rashid_jahanxcom', 'https://jahanx.com/', '1715190202', 'Dhaka, Bangladesh', NULL, 'GIWYQLSJMHMRRTWC', 'Jn6FDKYaVnUhvhr1APwqa12BLPnMFCE5', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(455, 'MD.RASEL MIA', 'dsbmart24@gmail.com', '$2y$10$4R4FGAWnPM4jmVeyVnNRqOP9Ej/UaHN5/DNTU/NQOiO7pOWw9iQnS', 440, 4, 0, 0, 0, 'mdrasel-mia_dsbmartcom', 'https://dsbmart.com/', '1746621730', 'Dhaka, Bangladesh', NULL, 'K6V3WYSJZWKONLDK', 'mspxr2zIpkU5SbOBaBNwcLphY9aL5PuV', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(456, 'FATEMA ROKSANA', 'fatema.roksana88@gmail.com', '$2y$10$fVDtGtBZAleUm1qClgPr4OzhjVu4/3nqi3eeedyo5iFFlT4WcaeNq', 439, 4, 0, 0, 0, 'fatema-roksana_mehekiicom', 'https://mehekii.com/', '1770241115', 'Dhaka, Bangladesh', NULL, 'KMNS129BVDHRIILW', 'QeuS5XN9wxcBkts0wWt1KMcGHdsOXdP2', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(457, 'Abdul Momin', 'abdulmomin11984@gmail.com', '$2y$10$qwhaFwx0okonyw1KcVV2x.Vr/ui2pxfhPQOVyjGz0dNEJvKEuVn5y', 438, 4, 0, 0, 0, 'abdul-momin_insarfcom', 'https://insarf.com/', '1846861007', 'Dhaka, Bangladesh', NULL, '4ZEKR5OCY6RHCZBL', '1vM3OIQLERudKWkQzwFAUblHP0iTfZb3', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(458, 'Md Nasir Uddin', 'nasiruddinb85@gmail.com', '$2y$10$Jgn.5FwlRjWJB4Emk8DL6eCR8x3pbFTdQa1QyPxlpmDRhw0YQR1eW', 437, 4, 0, 0, 0, 'md-nasir-uddin_prottoymartcom', 'https://prottoymart.com/', '1713992355', 'Dhaka, Bangladesh', NULL, 'Y76ZO8HQANOBM4OE', 'IcTTnzxutthPaJYyuUtTgVdHru2HzFnC', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(459, 'Md.Ahasan Habib', 'mainurk34@gmail.com', '$2y$10$lr4X0fsiz1WiXQUZLJfNn.Kucbjk9IpCaTMXPMDfHqcjFYSTX/XHW', 436, 4, 0, 0, 0, 'mdahasan-habib_sellmarttcom', 'https://sellmartt.com/', '1318401032', 'Dhaka, Bangladesh', NULL, '5LNOTP26DXJZ7BMG', 'otamOBvaPkEJSRwJV6UoN098tF0TUHFz', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(460, 'Umme Salma', 'mspurnima703@gmail.com', '$2y$10$/.RGkeMJ0SMFnkjC72OaOeNF/e1paga73NYDrrnIO719n2Qelsfiu', 435, 4, 0, 0, 0, 'umme-salma_soulgetcom', 'https://soulget.com/', '1616286658', 'Dhaka, Bangladesh', NULL, 'CRSRT9SC2MS4OSJN', 'SwS66Ia5vxUqvQ871xPqRoA2KfvUFyQ0', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(461, 'Md Zeaur Rahman', 'zeaurpcml@gmail.com', '$2y$10$xBU7IR1BZY.y2jDJIAOgMOtRUm7j72eWd4FQjQQKG09eOzjX1auie', 432, 4, 0, 0, 0, 'md-zeaur-rahman_nobabzcom', 'https://majario.com/', '1773868130', 'Dhaka, Bangladesh', NULL, '9RCYONCTOBNFWPOO', 'XnnYIB7P8ojpCW0SVCoopTqlN31gVZ4g', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26');
INSERT INTO `dropshippers` (`id`, `name`, `email`, `password`, `dropshipper_id`, `package_id`, `total_deposit`, `total_credit`, `total_withdraw`, `user_name`, `domain_name`, `phone`, `address`, `image`, `app_key`, `app_secret`, `is_approved`, `created_at`, `updated_at`) VALUES
(462, 'Md. Masud Rana', 'rana.masud7471@gmail.com', '$2y$10$WOFq6zWixnQ4i/2inZq6Pu9DN4tp2GPVfQhTR97oPHn5qWP86BBFu', 433, 4, 0, 0, 0, 'md-masud-rana_majariocom', 'https://majario.com/', '1745034404', 'Dhaka, Bangladesh', NULL, 'MY7G9LAO2AYRTYUG', 'aeyhuITVBg0u2ecgbErD6aKleUw2oTpJ', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(463, 'Md Enamul Hasan', 'enamulhasansuman@gmail.com', '$2y$10$4gtMo8i8MRZ8jTJL/lA1d.XEFYke/LyMiYkhTjXh.LUIU3pVJnhtS', 430, 4, 0, 0, 0, 'md-enamul-hasan_tzvalycom', 'https://tzvaly.com/', '1713631020', 'Dhaka, Bangladesh', NULL, 'U2EDONFSXMW6VYAD', 'jdDxQYfWVu2o5tFuF2RwRuGlym6cu8Kx', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(464, 'Md Habibur Rahman', 'habibweb904@gmail.com', '$2y$10$yaZ8ByRto/8wSBeVgWLhYe8O9RynXMAEeJBjH4/ukxJartrhBeeJq', 429, 4, 0, 0, 0, 'md-habibur-rahman_jakjomokcom', 'https://jakjomok.com/', '1954340913', 'Dhaka, Bangladesh', NULL, 'CKMPL2PDMVQAYFZF', '3JnGZwDsfZtegeVHwAYMez7jLMj7cMqZ', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(465, 'Alal Hossain', 'alal43968@gmail.com', '$2y$10$BZg1GRjWqRN1mXVPzd6.3O3/WNq343y/33/UsSSfPY5uWojxPtQim', 428, 4, 0, 0, 0, 'alal-hossain_ummatishopcom', 'https://ummatishop.com/', '1757220274', 'Dhaka, Bangladesh', NULL, 'FVIOBGRMEWLUTESA', 'RDwSbj2hlANDZXIN0D5RNXMeZ6QiiIFp', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(466, 'Md Nur alam(mohon)', 'nooremartosm@gmail.com', '$2y$10$KqMJW99WlYzdR0h.4qyYhe.1OZRU/.eK920XR6zwgg.C0agOPHT5O', 426, 6, 0, 0, 0, 'md-nur-alammohon_noor-e-martcom', 'https://noor-e-mart.com/', '1765087475', 'Dhaka Bangladesh', NULL, 'EE6T72R7ARDSF0WF', 'RYFRVSddHQaTYXyJPX0yRZmjMAxNh4sf', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(467, 'Delwar Hossain', 'maxdelwar@gmail.com', '$2y$10$DWEBe2GyUqTgbKMs5YpG8e96IwCA8HMccT1WbUD9IK16onSVrLVse', 415, 6, 0, 0, 0, 'delwar-hossain_easyanacom', 'https://easyana.com/', '1722037479', 'House# Saodagor Monjil, Block# D, Road# 25, Uposhahor', NULL, 'XJCAPYSRCUKMBK8M', 'GyALiUfEzSPx0695kKhtIZPYexF7Dea6', 1, '2026-07-28 08:46:26', '2026-07-28 08:46:26'),
(468, 'Mohammed Enamul Haque', 'meh404@gmail.com', '$2y$10$gxh2fHtmgYtYBXka8WYrFuFdMEVLTvJohe6XL/OylbEp5xpVtE6bS', 425, 4, 0, 0, 0, 'mohammed-enamul-haque_kidsyacom', 'https://kidsya.com/', '1715774787', 'Dhaka, Bangladesh', NULL, 'GDUIEMHNL0KFS1PG', 'Vsnrw0YA426a9jF01lxWYK5gFCJsixnA', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(469, 'MD Kutubuzzaman', 'kutubuzzaman253@gmail.com', '$2y$10$cc456kGKl1/0t8qvKhVqJeS4Ghaxyp4VQrKOKY1B3eKVd1aW/7LnS', 422, 6, 0, 0, 0, 'md-kutubuzzaman_choicemartshop', 'https://choicemart.shop', '1716291491', 'Dhaka Bangladesh', NULL, 'XFTDYBGELEXR7POA', 'f4vEIYdrqlIRdoUolpgJ90IZspowHt2M', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(470, 'Md Nurul Amzad', 'amohammadnurul3@gmail.com', '$2y$10$G8/rSWwch1PW3FgnmfWaS.pNA01RA8ChZP9P1fxz7uim7vf3dIOcK', 421, 6, 0, 0, 0, 'md-nurul-amzad_sizzlekitchenbdcom', 'https://sizzlekitchenbd.com/', '1575681300', 'Dhaka Bangladesh', NULL, 'KA7LWS4ESC4GGKVU', 'RmcPtM1YWdXn5GPDtLehaVMCYnF6o5Xb', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(471, 'Afif Safwan', 'mdafifsafwan234@gmail.com', '$2y$10$CJRSLp3w3bWBc0jyF4yoCO7dPeu2WSRZ86BGXOlbe/Kf3rp.YniJO', 420, 6, 0, 0, 0, 'afif-safwan_ponnobinducom', 'https://ponnobindu.com/', '1737173984', 'Dhaka Bangladesh', NULL, 'Z3JNUU1S8CT5HLLY', 'lkQLQewYRIWhRNT7toA3P4ZzUkMmW1Aa', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(472, 'md atiqur rahman', 'kichaodotcom@gmail.com', '$2y$10$1bQBTVuORkdTqingxe13eenl.8PPkDwjMgzgYa/1i52v6W4DS8JDO', 419, 6, 0, 0, 0, 'md-atiqur-rahman_kichaoocom', 'https://kichaoo.com', '1727367721', 'Dhaka Bangladesh', NULL, 'IQ9SQNGTO2BQCO2C', 'NrRf7LANriwd4L1HlNdesyTwnA3Calaj', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(473, 'Abu toha', 'abutuha861@gmail.com', '$2y$10$R09oCN57uWOciAGV8ibyru6g1hkudzzXyrj1xlUqFDMVXLRwO9A5O', 418, 1, 0, 0, 0, 'abu-toha_sajzencom', 'https://sajzen.com/', '1779593899', 'Dhaka Bangladesh', NULL, 'JV9KVZRZLUJEZBQQ', 'g3WNb1PeLe2jDP0Mf02KXjQjXAxmBz9s', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(474, 'Abdul Latif Tower', 'info.aznabi@gmail.com', '$2y$10$2pMR1ez5WkFP36JYENMU0uyi53PK/C83VF6d9g68cTtP/zQ1OdHzm', 417, 4, 0, 0, 0, 'abdul-latif-tower_aznabicom', 'https://aznabi.com/', '1805516959', 'Bypass Laksam-3570 Cumilla-Bangladesh', NULL, 'BIDOHLCGMKCOVDGU', 't0la6VQqEwLw5rWWKlkOftP9QQ7OtmHX', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(475, 'abdullah al salim', 'abdullahals1968@gmail.com', '$2y$10$M8v5IDIAspOQV6D/IsTNSuZHTc/Mxvy8CDfekcXLdLex3sgtxUf5u', 416, 4, 0, 0, 0, 'abdullah-al-salim_hayaloycom', 'https://hayaloy.com/', '1305653980', 'Dhaka Bangladesh', NULL, 'W4RCZU24OCVWUNSK', '3MHxzTipvWqAdhwQXojREWu8p5BkxBps', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(476, 'Md Mahmudur Rahman', 'Babor0507@gmail.com', '$2y$10$RZVY6PQkpPXxZ02UqFweyOCico0fULuDu1dh/700b8hvSbu5MYvhO', 414, 3, 0, 0, 0, 'md-mahmudur-rahman_bikroyecom', 'https://bikroye.com/', '1719453492', 'Dhaka Bangladesh', NULL, 'FCV7FMBZQIFAIXC3', 'YX3vc5xcyPo7QjnPfvlsxkbwz91qwPDk', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(477, 'Md Bellal Hosen', 'bellalhosen@gmail.com', '$2y$10$nsqhImRjeLwNHbRI.fckLO/Db..XT/HzsvQEDpYav.ijNO0tUvvXS', 413, 1, 0, 0, 0, 'md-bellal-hosen_islamicdemandcom', 'https://islamicdemand.com/', '1731599479', 'Dhaka Bangladesh', NULL, 'YHVINF1XSYWR0IOU', '8RCAkrjbwUCrjh1i47b7Yk8rs3PVhEhc', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(478, 'Md Ansar', 'mdansar777000@gmail.com', '$2y$10$GXUrcJHLpFPEYiAM/bL2l.3HZvbIgHetcTg2zo.kV0uldUHsqBV0y', 412, 4, 0, 0, 0, 'md-ansar_halaloycom', 'https://halaloy.com/', '1738157594', 'Dhaka, Bangladesh', NULL, 'P7YMIPRSDQZJKT4T', 'CP9SPM4Kv2Nga4R4sU7xovBjC1NkPjE0', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(479, 'Sabrina Jahan Nadia', 'nadiajahan2118@gmail.com', '$2y$10$l8MT6KqDqM6gdVPOSwzk4.24GhnkScqXTvohYWgDw5uJSNPvRf3Hi', 411, 1, 0, 0, 0, 'sabrina-jahan-nadia_elegantdycom', 'https://elegantdy.com/', '1721992118', 'Dhaka Bangladesh', NULL, 'FQQ7QLDLVFHRWAMS', 'FGjcw4eYyZB0NMFKSHTuRj43u9lptbMR', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(480, 'Ariyan Aamir', 'ariyanaamir07@gmail.com', '$2y$10$vrj9LIF53MRCrIfiqmEmHOfel3gp6hbKumJSPP/eiQR3MA.fMuNeW', 410, 1, 0, 0, 0, 'ariyan-aamir_dorzabdcom', 'https://dorzabd.com', '1672115722', 'Dhaka Bangladesh', NULL, 'NIQPHJ4SR7ZHUALS', 'aUn6q6yOz10vLYRv16GebuSWSqtYuAYP', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(481, 'Rejaul Karim Nihon', 'rknihon12@gmail.com', '$2y$10$iaYiVsCxgWzTCvwb70sbg.aRDQRazd0Ve8QRC.7kAaZcn1uF4UWi.', 409, 6, 0, 0, 0, 'rejaul-karim-nihon_novafabricom', 'https://novafabri.com', '1626794342', 'Dhaka Bangladesh', NULL, 'PUKTHIGKDICIIORD', 'G5z8CmEMJjDpCHZ0vFVkXhI01jJ9UkRt', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(482, 'Md Hasan Munsi', 'hassanmunsi1745@gmail.com', '$2y$10$DFrj/BT9jskkuTN8Ve87V./Rbp7I2BQs1yF4LWt9j/eobFWWDv7cu', 408, 4, 0, 0, 0, 'md-hasan-munshi_hassarhcom', 'https://hassarh.com/', '1313164616', 'Dhaka, Bangladesh', NULL, 'IQCCXJUVRVXZH8A7', 'GUGIcohCbYhMlPcDzlnDsAdm6WY5yByX', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(483, 'Ibrahim', 'ibrahim80bd@gmail.com', '$2y$10$EBzJ7KiV0wNbRATLa3YKauDSYj7UUJcb6AylQ9n1H8H5/MM8NFlJi', 407, 6, 0, 0, 0, 'ibrahim_haqbizcom', 'https://haqbiz.com', '1714130744', 'Dhaka Bangladesh', NULL, 'M3JJNFOCNQT9FR1Y', '5acDlJtlLTfRR8LPjEHuaWGIfT7SWkih', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(484, 'Mohammad Ruhulamin', 'engr.ruhulamin123@gmail.com', '$2y$10$HsbX0cqhMnXr/0aUNPP2YOjLmXX4Pz28ozM0CITuB6SP7DDWt83Vi', 406, 1, 0, 0, 0, 'mohammad-ruhulamin_easyvaicom', 'https://easyvai.com', '1796774990', 'Dhaka Bangladesh', NULL, 'LWUJEYAGBIRAFTUM', 'j9mvolw8AMJyAWJll03IBQakhkwnk6Rt', 1, '2026-07-28 08:46:27', '2026-07-28 08:46:27'),
(485, 'Dibashis Gain', 'dibashisgain10@gmail.com', '$2y$10$17FAoNA2N.jpGFIutBTSweMT4MnzLDh60ZKBLnJfnFsczydYZU4Z2', 405, 4, 0, 0, 0, 'dibashis-gain_eboloycom', 'https://eboloy.com/', '1316256841', 'Dhaka, Bangladesh', NULL, 'MBOSLVJA1YP1TVPL', '7zqlDdPX2rB24e6D4Bg3tMeIdAeMPoJm', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(486, 'Mohammad Ruhulamin', 'mdobaidullahi165@gmail.com', '$2y$10$k4U3eCSeOYnQHmhZeJYuQupaCd/6J4GjiUjtBM63NpsD75z4Moo4m', 404, 4, 0, 0, 0, 'mohammad-ruhulamin_hhofashioncom', 'https://hhofashion.com/', '1811841585', 'Dhaka, Bangladesh', NULL, 'DTZTBBSDF5MDACCI', 'ryETLQDoqAzsQAVh4caPnrraAbYR7HSq', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(487, 'Meskat', 'mdmaskat48@gmail.com', '$2y$10$ce30jadjZRw1Xn4BB9XxZO.zoRJpdzHMjCPcJmYnSGY1lk.7kEz7q', 403, 1, 0, 0, 0, 'meskat_bividbazarcom', 'https://bividbazar.com/', '1839683136', 'Dhaka Bangladesh', NULL, 'V7AGQ8K3Q1ZAZMWY', 'gYuPKxtS2HklvivMHV9xx4FlI6a7B4ib', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(488, 'Sazzadul Alam Sohag', 'ajmayin2025@gmail.com', '$2y$10$QVlKbRYhx4V0eKmMzbCYkul4aQf1xGPrLcI/z9aIrTdMae0eP5Yhu', 402, 4, 0, 0, 0, 'sazzadul-alam-sohag_ajmayincom', 'https://ajmayin.com/', '1612561694', 'Dhaka, Bangladesh', NULL, 'LJACOM0N82EOEBGS', 'sTMsQOn2PTmXyVLRR1JISEpWiNkTgsvF', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(489, 'Mohua Khatun', 'mohuak397@gmail.com', '$2y$10$zZGfzr.daeTDecDTceLBSOkPVBCJJZa/IK41rZlHBWBITjCFcsgDW', 401, 4, 0, 0, 0, 'mohua-khatun_nittosajcom', 'https://nittosaj.com/', '1959146612', 'Dhaka, Bangladesh', NULL, 'XGTWVKVCX0VVUFQI', 'DJ6ICxeigZ6A0e6joGbEOb3FlrWlnFQ6', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(490, 'Hasanuzzaman Bipul', 'mhbipulbiswas@gmail.com', '$2y$10$xrGud1DF3oHHJHD19eah4.uCmjXTPb3NGkkArRX9PhwSDCL0K2g/W', 400, 1, 0, 0, 0, 'hasanuzzaman-bipul_priyolycom', 'https://priyoly.com', '1703797299', 'Dhaka Bangladesh', NULL, 'UPG0KWYEJDRLJA1I', 'hl5eJiAnZTtMBvyflOFRKZyQfst3oQ34', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(491, 'Md Kamal Hossain', 'kamalhossainnabodhara@gmail.com', '$2y$10$sdyhOuIs6Z2E8k6Z7PZB/eXPKpwSYJh04C8g0teQinmwjXyU0dvmy', 361, 1, 0, 0, 0, 'md-kamal-hossain_newmarkatcom', 'https://newmarkat.com', '1400621555', 'Vhaluka Mymensingh', NULL, 'P0VRB9OSEPHYOIDQ', 'r3QY2c86vfJGZRxjViDaZBTIC424Lakm', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(492, 'Par Monjurul Haque', 'talktomonjurul@gmail.com', '$2y$10$MRHXEpUo6EphzJgTjrrr8eXbYdakJ2hHG1dJnnlzt.i.CugF25DpK', 399, 1, 0, 0, 0, 'par-monjurul-haque_haqwearcom', 'https://haqwear.com/', '1729886644', 'Dhaka Bangladesh', NULL, 'LF45ZLWE9QI2UI8N', 'p2jdgsAkUivEnwFs2b4eTHryZpNpPum4', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(493, 'Md.Soriful Islam', 'sorifulislamtotul1986@gmail.com', '$2y$10$onU4y3Qqd3zAQJmyt0jerOP7ytpoLWr5xAJfOn4843ll0DYAFt9FW', 398, 4, 0, 0, 0, 'mdsoriful-islam_fexloocom', 'https://fexloo.com/', '1917931963', 'Dhaka, Bangladesh', NULL, 'OBZ1OFUACKMOOKIG', 'XGTHQJBRWanr98Br4TxNyBj3GkxiJMPv', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(494, 'Saiful Islam', 'saiful.me19@gmail.com', '$2y$10$woRKNJT3ibH9zB2k85WnPOTqKJlNjpHZ5nT5.RtrijsiRThfWhPFy', 397, 4, 0, 0, 0, 'saiful-islam_vibehulcom', 'https://vibehul.com/', '1345838195', 'Dhaka, Bangladesh', NULL, 'WAASS46LHUBDTDDG', 'FkQnOSGIMrJFuNZLLBFpPYzDlZ8O9Qp4', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(495, 'Lam-e- afrose', 'lamiawasa@gmail.com', '$2y$10$k4p0SKCXjucBJbA6kWqMvuqEWPU0IvrdqfjFpYLPxo./key8CVfHm', 396, 3, 0, 0, 0, 'lam-e-afrose_buylamcom', 'https://buylam.com', '1734660861', 'Dhaka Bangladesh', NULL, 'JHIFYWG5XJNVTMPZ', 'BFH2EUjBsNgkGb4UXC2sKqv5s6COePgH', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(496, 'Md. Rafiqul Islam', 'rafiq6f@gmail.com', '$2y$10$yRr39pNBVrcQNwmlTyPVLuUaBhTSqgdinqoVkh4FbP7NjxvZyB1LO', 395, 1, 0, 0, 0, 'md-rafiqul-islam_martloocom', 'https://martloo.com', '1757345424', 'Dhaka Bangladesh', NULL, 'CBA3TFIQFFOCZQS6', 'pXxFq0BenECxIldCPVix251UbCbWnJVD', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(497, 'Rashed Hasan', 'rashedbinsalam@gmail.com', '$2y$10$GbP0h.Pvf6ilCc/UbiclfOBAQrGUHdTAfqVYkF2wyrWMZcnFhRtx6', 394, 4, 0, 0, 0, 'rashed-hasan_nittoghorcom', 'https://nittoghor.com/', '1782366068', 'Dhaka, Bangladesh', NULL, 'TFDE3PQG70VC7TR9', 'wc3rmzLf2GdLjTO2RayMJpwQJ94rCYO7', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(498, 'Md Shakib Ahmed', 'mdsakibahmed012004@gmail.com', '$2y$10$WuhadfpHfiQjot0qxb6yaecGvvbf3UxuTwvvUgSACVUi87uPo22ye', 393, 1, 0, 0, 0, 'md-shakib-ahmed_ummahutcom', 'https://ummahut.com', '1304218868', 'Dhaka Bangladesh', NULL, '6UBQAYX1SM59YM37', 'b8pFlLcZeyxDdOG6X60v5itlqSFjN14A', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(499, 'zakir hossen dally', 'zakird78@gmail.com', '$2y$10$BKkCtgDpvFmricY5FFhZzehhLE/4Rbb1VLuIy9.Bb/IPI16EtAVYy', 392, 4, 0, 0, 0, 'zakir-hossen-dally_unimuslimcom', 'https://unimuslim.com/', '1813679304', 'Dhaka, Bangladesh', NULL, 'DD21AVVTXSTRBPLV', 'Ix14o12f8ZCho1XDlr5hWCfpnHhKYKSN', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(500, 'Said Ahmad', 'anasmasrura@gmail.com', '$2y$10$tF9dWEOMov6ZZRz8DHkwXunVe1aQL0GcPiRunIwueW6z76I4z95M2', 391, 2, 0, 0, 0, 'said-ahmad_denaizcom', 'https://denaiz.com/', '1929349070', 'Dhaka Bangladesh', NULL, 'MWYXWY9WWJRMRROR', 'kxXvXCUybOhUNtZHl38y5IZRw0MzvCgx', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(501, 'Tamzidul Islam', 'tamzidd1571@gmail.com', '$2y$10$NrT7ZxKr8G.vK1Rv45tKxuKUKy7pHlLAlaBzsTSCHR4p6E7P1Eu32', 390, 4, 0, 0, 0, 'tamzidul-islam_shopletbdcom', 'https://shopletbd.com/', '1303089032', 'Dhaka, Bangladesh', NULL, 'SCCTFEBCEW3PEWOP', 'RB6Mcqox7DyGe3KY6ejmO0aszf00ZLh5', 1, '2026-07-28 08:46:28', '2026-07-28 08:46:28'),
(502, 'Muhammed Maidul', 'tomaidul@gmail.com', '$2y$10$TZQI.t.ozMp017jTs6Q7ZeI/nj/Bb/ckAgUyUz3jIoVpJWA3SjaEq', 389, 4, 0, 0, 0, 'muhammed-maidul_wannajcom', 'https://wannaj.com/', '1712960940', 'Dhaka, Bangladesh', NULL, '4PIC8ZPPV3GMIG8K', 'J0SPZnSW0zkLK6UdbnMOIRAD9sYdUAfB', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(503, 'TARIQUR RAHMAN', 'tariq270884@gmail.com', '$2y$10$4MiFr9p.3tiu/Daamp.4KuCTCze0d9Qnns/QM6qQB/y8z3pm85pIC', 387, 2, 0, 0, 0, 'tariqur-rahman_sajaboocom', 'https://sajaboo.com', '1406946455', 'Dhaka Bangladesh', NULL, '3NKH78OX1FHFHGGJ', 'aokIP5vyfLGW1wDr4bL7t2jcetFp0Tjs', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(504, 'Bappi', 'abdulwahedrr@gmail.com', '$2y$10$4AaHuLvDuR5SBcN4yt0WteKxyrI7/e9O36awRvfOZYYMiFkF8AmXC', 386, 4, 0, 0, 0, 'bappi_rukaiyazcom', 'https://rukaiyaz.com/', '1792445204', 'Dhaka, Bangladesh', NULL, 'NQMGDC14YASHLENP', 'UDoTUMKX93zjHRUqiMgyya4x1yFuM1fD', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(505, 'Md. Mashiur Rahman', 'ebuyzo247@gmail.com', '$2y$10$NptNZcDfBBne/jSoHRknkeuy4rXaiph429QtsRbdut3YVVAUQY9j.', 385, 4, 0, 0, 0, 'md-mashiur-rahman_ebuyzocom', 'https://ebuyzo.com/', '1314557100', 'Dhaka, Bangladesh', NULL, '63SC0WJ8ZDQAJFBW', 'SRlgGW1pKqiohrma83jqXwPGWMi7Mc9N', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(506, 'Khaledur Rahman', 'khaledurrahman0@gmail.com', '$2y$10$haGhDDA3D.NeYz6S50JmDOl4YucmGD.qspbqY4bDrY6L.KTMIsTcG', 384, 2, 0, 0, 0, 'khaledur-rahman_inbilocom', 'https://inbilo.com/', '1911833895', 'Dhaka Bangladesh', NULL, 'YTEEQDLEJXJVCRH6', 'z5lGAUkGLEo7B73TP0FDw9nlDTf8tAsf', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(507, 'mohammad shamol', 'shamol2525@gmail.com', '$2y$10$82iJIJ1LF64C34FrIXRqlOJCXbg/xsTdwSKru..o.NhuImifgbiLG', 382, 1, 0, 0, 0, 'mohammad-shamol_ronginvabnacom', 'https://ronginvabna.com/', '1934116127', 'Dhaka Bangladesh', NULL, 'HV9YVNZVVE3EBDNB', 'UXoKaGktgBlnoxZGQopTP4UsaT1ozi0j', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(508, 'SHAHIN AHMED', 'shahinahmed7800@gmail.com', '$2y$10$6ZJAYNwHtvgOSM5CBzI7q.Ngc/wbWyb4K5wcCDfdKHaCBYI6vADvS', 379, 4, 0, 0, 0, 'shahin-ahmed_figgmartcom', 'https://figgmart.com/', '1882500084', 'Dhaka, Bangladesh', NULL, 'QGP6JLR727NBHQK1', 'j2XmerKolScQglZRY26aiiusi2fxshDj', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(509, 'Mohammad Mobassir Hossain', 'mobassirbd@gmail.com', '$2y$10$5aU69idISXfXR9lZmiclx.6SNW47aLr1si3Wj6m3nt9jIIxqCyFla', 378, 4, 0, 0, 0, 'mohammad-mobassir-hossain_mobaloycom', 'https://mobaloy.com/', '1818185464', 'Dhaka, Bangladesh', NULL, 'LDZH1HEF2V59YE7G', 'FNBX5P3QzramuRkpvJqcyDaaPXONN4kT', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(510, 'Maruf Ahmad', 'marufahmadriyad@gmail.com', '$2y$10$CsWLe1jl.ni9larDdzh1IuGicweZ55j.1mDR.bmxD.jegl0wuDtcC', 377, 1, 0, 0, 0, 'maruf-ahmad_moshtareecom', 'https://moshtaree.com', '1726806516', 'Dhaka Bangladesh', NULL, 'OIY9OFCOWHXXUFTO', 'QaPbroqKQxUAkS4xPygE1mQXNoBldImE', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(511, 'iftekharul masud', 'iftekharul1977masud@gmail.com', '$2y$10$kspBWg44RX.OFxlB08AXPO5vQ2diYifHQaVsBgJRh6QsdyFaP2kJu', 376, 2, 0, 0, 0, 'iftekharul-masud_drovlocom', 'https://drovlo.com', '1819454594', 'Dhaka Bangladesh', NULL, 'TLBDUM5LSQP7OL5L', 'jFGEETx3WLZGQCubLwOBbRSmD8spPTSO', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(512, 'M Tajul Islam Taj', 'tajulislamtajj@gmail.com', '$2y$10$fFzBNoZ57luy0eQd/4488eSK5adHqkaWgw7M8/kllAsFfGr.oht7.', 375, 4, 0, 0, 0, 'm-tajul-islam-taj_ruchighorcom', 'https://ruchighor.com/', '1966943934', 'Dhaka, Bangladesh', NULL, 'TQHVMHDFILYAYFGE', 'LLvp7pwZ8yudYdMXaOAndd5qMXXS2SXX', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(513, 'Md. Khurshid Alam', 'sagor.live247@gmail.com', '$2y$10$.HAUy.jPZKsoVffztyz.ieaQdgwUYDdGBCTB6sbSuyJYeI/UT7Jba', 374, 4, 0, 0, 0, 'md-khurshid-alam_looxskycom', 'https://looxsky.com/', '1751312409', 'Dhaka, Bangladesh', NULL, '0BAB3IRDWJTPQRIQ', '57yp23VBrDWNVPQliNKIbpHHYli8duhz', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(514, 'MD Alanur', 'hatbzar085@gmail.com', '$2y$10$Ga2iKcgAp/5FSYu6pAsCC.CIY6czv6/Mh/zd/RvGWmjbiGpD/zEoa', 373, 4, 0, 0, 0, 'md-alanur_hatbzrcom', 'https://hatbzr.com/', '1718295611', 'Dhaka, Bangladesh', NULL, 'XZATRHUOSNCYCESG', 'Tfrf8ibubmh5HXZRNRnyY9WJCqYdcMro', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(515, 'Abdul Gaffa', 'abdul.bduk@gmail.com', '$2y$10$bG9LQsoHzaM9jRkRKdUMZ.dyeMh8Dq8fmZdhoNEK.r3tXVkz3cXXm', 372, 4, 0, 0, 0, 'abdul-gaffa_afiadreamcom', 'https://afiadream.com/', '1787020783', 'Dhaka Bangladesh', NULL, '3AYL43PAG8OYGUXI', 'GhcsdNOSnaCEhXI6kb0oz6ovzBCkSedj', 1, '2026-07-28 08:46:29', '2026-07-30 06:24:23'),
(516, 'Joynal Abedin', 'abedin6165@gmail.com', '$2y$10$HA1.wf9xQPzY5/gijCUxYesJePGhfba4e.TfNCptwu882hxP2KBJG', 371, 4, 0, 0, 0, 'joynal-abedin_zjaancom', 'https://zjaan.com', '1712486165', 'Dhaka Bangladesh', NULL, 'E7TJPAF9BXPPYAPV', 'QM6CKxQtbGCmRxYP3n3EG9uI4ojClCeX', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(517, 'Md.Habibur Rahman', 'hsrahman1993@gmail.com', '$2y$10$5wma1dnaEmy12z0YVgpJWOgg.fRXjFl2UVYOLVeH6oUxaly5.PPKe', 370, 4, 0, 0, 0, 'mdhabibur-rahman_seilormartcom', 'https://seilormart.com', '1878761646', 'Dhaka Bangladesh', NULL, 'FE5AR2BBFWQXWGPZ', 't22gp7v6B946yOk6WWESzbRYhA7pYU7q', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(518, 'Md Shahriar Hossain', 'shahriarhossainemon@gmail.com', '$2y$10$YdKh24RyXBBx.ErS5J2rBe19Dkz5gGv8Zp7jXcw6O/t9dl5o7J7cm', 369, 4, 0, 0, 0, 'md-shahriar-hossain_shahzabiancom', 'https://shahzabian.com/', '1764342567', 'Dhaka Bangladesh', NULL, 'BJMGALS190MA97UP', 'NcUEJ8fQVZGcFY0PvvQepzD97p5QUzMs', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(519, 'wayes haque', 'wayes.haque@gmail.com', '$2y$10$OsAmEio3r4AB0616V.rMZ.KM6jXly1d0ux2w4BNXK/PFSoe04V1wu', 368, 4, 0, 0, 0, 'wayes-haque_drimdropcom', 'https://drimdrop.com/', '1819210381', 'Dhaka Bangladesh', NULL, '5FK9UMRYBZOUAQNR', 'ErxLVYthRDsUubJHVLynHbdBLDS9T5xV', 1, '2026-07-28 08:46:29', '2026-07-28 08:46:29'),
(520, 'Md.Nur Mohammad', 'nurmahammad40@gmail.com', '$2y$10$hAPNXk6uLQWnKiLvkssXjOepZSBSGrbQkR7rRNzW1zItDfZq/gEmG', 367, 2, 0, 0, 0, 'mdnur-mohammad_nnmartnet', 'https://nnmart.net/', '1676144453', 'Dhaka Bangladesh', NULL, 'YGE1JCYFG2ZVDRTC', 'uHL3Ghn2PZmksyNcgtoxcW3G7OIIrwfP', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(521, 'Md Nazmul Hossain', 'sutroocom@gmail.com', '$2y$10$JihaGx.qcEoA7mNVeKFNB.mxaeBvAeeB6f3Y.jYQUKTjKoxVxl1qW', 366, 1, 0, 0, 0, 'md-nazmul-hossain_sutroocom', 'https://sutroo.com/', '1675430090', 'Dhaka Bangladesh', NULL, 'NBCOQ9GNPOGTEYTK', 'JKvuo48Twr6uVvj5APmwmyJULdFqJgHC', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(522, 'Md Faruk Hossain', 'hossainfaruk611@gmail.com', '$2y$10$uKG2fT.SliHFGY7OhevbduSMpc3gqNE8IAHr0qWqf1oE9bITs1zaO', 365, 2, 0, 0, 0, 'md-faruk-hossain_kroyozcom', 'https://kroyoz.com/', '1914376686', 'Dhaka Bangladesh', NULL, '6I84PSYXBKR2FANW', 'PVSFMqwapHzRIRZ0SwW4mcYhrImx5bNH', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(523, 'Rakibul hasan', 'tasnimrh@gmail.com', '$2y$10$TCNalGuyNb2ge70hFX0sX.nJ1hodyClg1sA4mGii5A7EIqRxsws8q', 364, 1, 0, 0, 0, 'rakibul-hasan_dhakasellercom', 'https://dhakaseller.com/', '1799904917', 'Dhaka Bangladesh', NULL, 'CN3UO7RBPIWGZS1G', 'D5VwK4O7e0U1EFLtqMKUjNgH43tAQEGe', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(524, 'Usama Kamal', 'mdmostufakamal4545@gmail.com', '$2y$10$RQokNPDlt4EyKWLW8jHmt.BEpLjEwkPjvsOOTJuuKYmJvhjJGFuYC', 335, 1, 0, 0, 0, 'usama-kamal_priyoshopingcom', 'https://priyoshoping.com', '1868107668', 'Nababpur,chandina,cumilla', NULL, 'RK9MXHM0TAEXWQWB', 'yOMaEJkewLHaQqfJhCPamC7CsuTqkXGg', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(525, 'Elias Ali', 'eliasrc5@gmail.com', '$2y$10$ZDt/3igDASYDGGsIL0mjseJBgDlciG3XgG1RMiRW9DUUoUO.msytm', 363, 1, 0, 0, 0, 'elias-ali_fabryiccom', 'https://fabryic.com/', '1863512792', 'Dhaka Bangladesh', NULL, 'XE8QVOHLGOB5Z7XG', 'JlrBTai0Ty7SnKMZ0cDwtZSXCGDQFmf9', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(526, 'Nurul Hoque', 'mdsujon6704@gmail.com', '$2y$10$XArxFgvGgyYeyUh2ckDDTu4cacf7D4EFACDeXNB5izQV3rEBisQDa', 362, 2, 0, 0, 0, 'nurul-hoque_falakshopcom', 'https://falakshop.com/', '1814124564', 'Dhaka Bangladesh', NULL, 'G3ALPLGQJ9HKQCDJ', 'lEvRr8KBLdLDWM0OquTMc74fUSfXqDgc', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(527, 'Mohammad Alamgir Hossain', 'alamgirz1979@gmail.com', '$2y$10$DcL4dELSKlaGrmdxF7lg9O3UoPrNAoAE1CfptTmLCDygokSgs6hZu', 360, 4, 0, 0, 0, 'mohammad-alamgir-hossain_myhutzcom', 'https://myhutz.com/', '1998992424', 'Dhaka, Bangladesh', NULL, 'DJ5TW0YVRSFUAOB1', 'IoVLv6EgTY8Okj11V5KouVTq3st9nYE8', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(528, 'MD ABU NAYEM', 'nayemspokenenglish@gmail.com', '$2y$10$0ciaP39gHagKBFQsUuiHw.SoOJKM0yC8TfEcFZamxUDEFsNjvc0BO', 359, 4, 0, 0, 0, 'md-abu-nayem_hidayahscom', 'https://hidayahs.com/', '1700518828', 'Dhaka, Bangladesh', NULL, 'IQPXPBOA6J1VGB70', 'yk9lFsz87AJ2OyOg8VJnOleNEU33XRG5', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(529, 'MST MAHMUDA AKTER', 'moni.alif14@gmail.com', '$2y$10$RrIyQAngi3SetA.xybRtJeChZtV1jmDnt/uJru0stiiY5pty8UpQm', 358, 4, 0, 0, 0, 'mst-mahmuda-akter_alhammcom', 'https://alhamm.com/', '1770780797', 'Dhaka, Bangladesh', NULL, 'EFSJQDXNLUNPHUFS', 'DWOdpjF89EJrbFyEVXL35zH6f7QxeWpb', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(530, 'Abdul based', 'mohammadbased2024@gmail.com', '$2y$10$.DGfGpnblH5UABkAO/M35eK6ZrctAHiZlyGy4S4NGDDunFAMH3e7e', 357, 4, 0, 0, 0, 'abdul-based_faydaahcom', 'https://faydaah.com/', '1711373172', 'Dhaka, Bangladesh', NULL, 'AJ0G0915WHGKM4WW', 'Hr7Yg5dwC8iStPxSsXogQmDxxPju1CzR', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(531, 'Mahmuda Faiz', 'mahmudai220@gmail.com', '$2y$10$5.iWyuEWSgTbsWTPk6LQj.1VgEuBVa8pE1IiBL6P0ZLIXtoMW.uRy', 356, 4, 0, 0, 0, 'mahmuda-faiz_nosabacom', 'https://nosaba.com/', '1977884317', 'Dhaka, Bangladesh', NULL, 'M1BP0PMF6ZQ7L85B', 'T5Johrv6qzun57x30sNYLTPRTaehjTC1', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(532, 'Md. Mahmudul Islam', 'munnauiu@gmail.com', '$2y$10$xtArNPM3vo8HGnQwjt3c2.8On/vM9dzwslNSZasZbThyBimLzmpoW', 355, 4, 0, 0, 0, 'md-mahmudul-islam_shoptupcom', 'https://shoptup.com/', '1670928334', 'Dhaka Bangladesh', NULL, 'HMMHVCABMYGY7TEL', '76KJr4MOeMLz0wzOskzoka5Qhuu9xfRo', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(533, 'Easin Mia', 'easinmia92@gmail.com', '$2y$10$39y6tEgziwofHpgy849j6.DSHsCKBLOe/c6COQkLoxL85d3dp8Z4O', 354, 4, 0, 0, 0, 'easin-mia_hikmaghorcom', 'https://hikmaghor.com/', '1725695407', 'Dhaka, Bangladesh', NULL, 'J9610SPIRKHPVLD5', 'ZhJQZDrgWHLLJelxa2lsswa89P3p2N73', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(534, 'Nurunnahar Khanam', 'nurunanita1811@gmail.com', '$2y$10$i9BUY1wsKY.d/R/RC1a5B.HGK/DFDM74qSUC0uqpS9V2Evh35yity', 353, 4, 0, 0, 0, 'nurunnahar-khanam_artizanmartcom', 'https://artizanmart.com/', '1677600893', 'Dhaka, Bangladesh', NULL, 'RU5IVMFHOOLZ4YQK', 'DrLTndJ8q85IcJuy5YlBaiC6MNlPwdYG', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(535, 'S M S Rasel', 'info.expedu@gmail.com', '$2y$10$M0cBqdO1OF.aOq6/Exk/qu9xYqSA3ylF6LjIFKY9fnkYb3co9pwWC', 352, 4, 0, 0, 0, 's-m-s-rasel_zayrosscom', 'https://zayross.com/', '1305841167', 'Dhaka, Bangladesh', NULL, '3WIUIWEMZBAREYB2', 'wSRzItJxgxvhk2LfVGREfXfrpIg8qdNv', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(536, 'MD. ASHRAFUL ISLAM', 'islam.mdashraful@gmail.com', '$2y$10$FH2aJ8JHuAYwjBJdS8wPCe6M6F7K6lCUznq0.mJDdViHBJpxe4yNu', 351, 4, 0, 0, 0, 'md-ashraful-islam_pamphletplccom', 'https://pamphletplc.com/', '1717769928', 'Dhaka, Bangladesh', NULL, 'IDQRLVPJRQH2E5LM', 'TS9sG0fhl4WbIIEbm2T9J6A5v1xq0fPV', 1, '2026-07-28 08:46:30', '2026-07-28 08:46:30'),
(537, 'Md.Obaidullah', 'obaidul362@gmail.com', '$2y$10$VoTi1XcL6mUKwwHsQN39MucvNQsRPHqXeCRmMqvrBvPeyrBQ/PlS2', 350, 4, 0, 0, 0, 'mdobaidullah_nowabeecom', 'https://nowabee.com/', '1723741115', 'Dhaka, Bangladesh', NULL, 'V5YRWBON94H8HPZD', 'alanVKJ5h0P2GSreAwatPtZJUv1TYpCd', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(538, 'Raihan Uddain (Uzzal)', 'alizzu69@gmail.com', '$2y$10$3MFzZqCCh5QzUo36W7GWEuTVowQkwLoAD09AWjhPgQC.rxjbvO5zW', 349, 4, 0, 0, 0, 'raihan-uddain-uzzal_alizzucom', 'https://alizzu.com/', '1311840883', 'Dhaka, Bangladesh', NULL, 'PGWWPM95RLE6XWCI', 'FTccvMoH0atufUuBZ4QgY5K10CbIYWl0', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(539, 'ABDUR ROUF', 'abdurrouf44475@gmail.com', '$2y$10$oSM540D5RUSdpVNsNTb0a.NvsTa53LeaBIdnTkaymXlUX8Mgd5cz6', 348, 4, 0, 0, 0, 'abdur-rouf_rosayelcom', 'https://rosayel.com/', '1835835274', 'Dhaka, Bangladesh', NULL, 'K6AN4IJDFSYWY5SN', '2p5LMNJaj4Haf7E3jPW1kfddCFuUIBA5', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(540, 'Md Miraz Hossen', 'mdmirazhossen990499@gmail.com', '$2y$10$F78Xz5oykw95uLDC6w94/.iTVvEWgp.Iqh8TJspiwfu1t19EmfHrS', 347, 1, 0, 0, 0, 'md-miraz-hossen_foreverssigncom', 'https://foreverssign.com/', '1775429697', 'Dhaka Bangladesh', NULL, 'ARWILVOXXNPG6LWG', 'BGaZWUP8dLCb28Tx3dX8bSJa9rIZ1pGT', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(541, 'mawlana morshed alam', 'morshedalam01012000@gmail.com', '$2y$10$wafDracLYG1h1ncFjdYdLut.Q1jAuxygYNidj8ub3rm2/aaEI9osu', 346, 2, 0, 0, 0, 'mawlana-morshed-alam_fagriwalacom', 'https://fagriwala.com/', '1944014920', 'Dhaka Bangladesh', NULL, 'BCO5T7ONJIWUEWFV', 'WeeoYYuwVHMt0BqMwOlelZO8KMmrqG5L', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(542, 'Farhana Alam', 'alamgirbh1983@gmail.com', '$2y$10$SH.axnZm3fR7h/g9ZCIBQuKCRKqObBuuhuuIFH8z1b2gaa7j3PcQS', 345, 4, 0, 0, 0, 'farhana-alam_styelxacom', 'https://styelxa.com/', '1898812270', 'Dhaka Bangladesh', NULL, 'E15XDHOV3NDFNJ2D', 'kOPCoFToU5FgThequCpvkGJtQplXEJAR', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(543, 'Showkat Islam Shohag', 'shohagislamsukat@gmail.com', '$2y$10$FPkRjZF3o7ejrdaMUGX.Wu9tIqefMvHXcnl5DiPHm/poKixWnbEO2', 344, 4, 0, 0, 0, 'showkat-islam-shohag_zirvomartcom', 'https://zirvomart.com/', '1309511285', 'Dhaka, Bangladesh', NULL, 'W2QRFHZFA24CYTAT', 'ssaVTEob5lPbRTeLW68bfNkUO2VKpEwE', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(544, 'Papiya Akter', 'papialsiam890@gmail.com', '$2y$10$x1FUUz9qm/iLsWEgXsBxCuCpHs5kelhBL3/aZeqj/vNW1u4SpLuRm', 343, 4, 0, 0, 0, 'papiya-akter_borobharicom', 'https://borobhari.com/', '1757894289', 'Dhaka Bangladesh', NULL, '1U8WRA1ACJPGRWPM', 'aWebd9u2yQMY9aM1IBU7WKuT9Pw1cEoA', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(545, 'KHAIRUL SIKDER', 'sikderkhairul816@gmail.com', '$2y$10$XAJTmk9FUUhlhuKPP42lAeQDAVpY07qIrWEPuIjQxI3ccWdOVjdQe', 342, 1, 0, 0, 0, 'khairul-sikder_shopnoloycom', 'https://shopnoloy.com/', '1711185961', 'Dhaka Bangladesh', NULL, 'XIUQNPV5UNYW6WUO', 'ngpQtzXvRaiIPbldgdWgrEd5BrTEpkDZ', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(546, 'Kawser Ahmad', 'fabirize@gmail.com', '$2y$10$cdGdsm/r2RbvCa5O.PCrv.TUlZmw1tV6j8hXQEUh4lPHYyuYA3ZMK', 341, 4, 0, 0, 0, 'kawser-ahmad_fabirizecom', 'https://fabirize.com/', '1813802340', 'Dhaka, Bangladesh', NULL, 'SYGSDNIFTK56WOAI', 'e1BzgR2GkGDhIZL75ezzIf5sfQlXEuMp', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(547, 'Omar Faruk', 'faruk.dhgroup@gmail.com', '$2y$10$rF.09UXl/c35eEUPO2rRAOr/kROZcjBNiRB16jX4hyrZusPdJA95S', 340, 4, 0, 0, 0, 'omar-faruk_shifamacom', 'https://shifama.com/', '1927740466', 'Dhaka, Bangladesh', NULL, 'RETKNT3DUDCZVYAN', 'ENtFdRbNYWkciApgR6FlwOnnEI4Q2NmL', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(548, 'MD. ARIFUL ISLAM', 'arifulislam853@gmail.com', '$2y$10$Q5odkfNcbZzrSEATlKbT8OvjjWc2bPz.cUDpCtINzFc/nxv3sjBSm', 339, 4, 0, 0, 0, 'md-ariful-islam_shonchocom', 'https://shoncho.com/', '1715978862', 'Dhaka, Bangladesh', NULL, 'GPQMEHNKGMSQ1EPP', 'x3PRS4hOBeavM6ADRwLvUZHEIvnEVesa', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(549, 'Md. Mahmudul Hasan', 'infomafzan@gmail.com', '$2y$10$npHMTV6tpvrF1QcfFi5v.e5TgzLhWd.n6/oGbkAxlgcd/8D02hjzm', 338, 4, 0, 0, 0, 'md-mahmudul-hasan_mafzancom', 'https://mafzan.com/', '1631638566', 'Dhaka, Bangladesh', NULL, 'M3HIEDHHZAOJII4I', 'aT9yuFagmQ5Q4xYWfI1GDeMDSB4LjetJ', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(550, 'MD. LOBAN MIA', 'mdloban70@gmail.com', '$2y$10$29ikZoks9Ctt9h0aN5dqmOxKkyyl3uM3KV9CavwBJAGbror1jb48e', 337, 4, 0, 0, 0, 'md-loban-mia_ponnozzcom', 'https://ponnozz.com/', '1745942611', 'Dhaka, Bangladesh', NULL, 'F7GHR0TYWFGLTPND', 'w8BSJeJaX9B7Ui46I5ap6vTzo6rgdNSl', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(551, 'MD SHAHIDUL ISLAM KHAN', 'sikhaa1968@gmail.com', '$2y$10$gyGaDP1ucfnmnhFXLCFTIO8r6GmvG3Sa1FjO3GZVubJapCrWV0oh2', 336, 4, 0, 0, 0, 'md-shahidul-islam-khan_proyozcom', 'https://proyoz.com/', '1975808259', 'Dhaka, Bangladesh', NULL, 'QS6KTHQ6XJEEWYW7', 'JeK4QrNxHOQtVDEcIvyrTaugVVqpX40k', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(552, 'Ariful Islam', 'sonarobin030@gmail.com', '$2y$10$CGrw.9vAVNlM38z6MkSQ1ObGR3McPxXj8PL63ko7sjaZtod5hhvIK', 334, 4, 0, 0, 0, 'ariful-islam_arafshopcom', 'https://arafshop.com/', '1942635629', 'Dhaka Bangladesh', NULL, 'NWWGQEV2S5CQDP5W', 'Pcgh7wpw8r4O53NJa3nVYJndGIsOYi0w', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(553, 'Md. Abdur Rouf', 'abdurrouf638@gmail.com', '$2y$10$5iPDwixgRfnx46feYqZp8e9iM76plpxmcLVJwgNP8dftGIo6KJZ/a', 333, 1, 0, 0, 0, 'md-abdur-rouf_noorexycom', 'https://noorexy.com/', '1714838490', 'Dhaka Bangladesh', NULL, 'Z9TAXCVDV5UNSKXM', 'WZkXM9sddwCDom2EIx2iqGJJ9dshuI9z', 1, '2026-07-28 08:46:31', '2026-07-28 08:46:31'),
(554, 'Miraj Mowla Chowdhury', 'mmc000@gmail.com', '$2y$10$7oxcTRIgzNSJdNFLvs6a0usMLEh/D3Pbgncu/lfxn8iqZr.IxIKQq', 331, 4, 0, 0, 0, 'miraj-mowla-chowdhury_proyozocom', 'https://proyozo.com/', '1831164890', 'Dhaka Bangladesh', NULL, 'CMJOI95RFIEK9Z4S', 'ZQodkQeypbeHKUSPrZEMJEPMVnIhjakf', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(555, 'Md Nurul Hoque Bhuiyan Shipon', 'bhuiyan.shipon17@gmail.com', '$2y$10$fq9B9rYSoX7SUM/opf3jYe6npaRCINsbNsiluWQglUENrkb3Fj5DC', 328, 6, 0, 0, 0, 'md-nurul-hoque-bhuiyan-shipon_iranurcom', 'https://iranur.com/', '1918808058', 'Dhaka Bangladesh', NULL, 'AV6ZNHZISKTVPHMJ', 'J2JMXkWhZ94KtFWZmsh0HtCkcNlY26MN', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(556, 'zulker nayen', 'contactsshopmatebd@gmail.com', '$2y$10$.cXO.rYplwoXBxDLfOcM3ek0LzB6On2NauGU4wYpxNDYT26fCvEzu', 329, 6, 0, 0, 0, 'zulker-nayen_shopmatebdcom', 'https://shopmatebd.com/', '1625200200', 'Dhaka Bangladesh', NULL, '428GFCPBRBWM5JD9', 'VVZxhSDuU8WxUI0Nb95WYccEdPrsvXe9', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(557, 'Md Rakibul Hasan', 'mdrakibul83@gmail.com', '$2y$10$P4Gq8XtOhThAQwLCWkT56e0qs1AE5OUoDwVZb2uTkIPX7Bxa3R5IW', 325, 4, 0, 0, 0, 'md-rakibul-hasan_rakiloycom', 'https://rakiloy.com/', '1733248751', 'Dhaka, Bangladesh', NULL, 'B8JMV8EHVATFTOVJ', 'ZNeXfGqVZuzHAhUB6aEAvTcoDH05Symb', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(558, 'Anisur rhaman rana', 'mdrna444@gmail.com', '$2y$10$eABNzzIFDkt9Wcp7bFn4sO95AqxwBQ9RIoz7lG2sp/7C4eD28X8K2', 324, 6, 0, 0, 0, 'anisur-rhaman-rana_febiyacom', 'https://febiya.com', '1841174675', 'Dhaka Bangladesh', NULL, '5PWRTXMR1P37D0U4', 'P2gNvlPgSQNPclb3TeiyDGuQcnIqcdgg', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(559, 'Md. Iqbal Hossain', 'Iqbal.farray@gmail.com', '$2y$10$LnDw6B2IcbHE9WDXTmN0sODMw6MYAiFF8Dvx8xwqSJ0IrPClvJPLG', 323, 2, 0, 0, 0, 'md-iqbal-hossain_waxywearcom', 'https://waxywear.com/', '1731197241', 'Dhaka Bangladesh', NULL, 'V9N9FMFAQSII6XCI', 'zcmOGaNPfuDe3GpGTw6sYghUswj2giZm', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(560, 'Omar Faruqe', 'omarfaruqe406@gmail.com', '$2y$10$45gcVrVafrb6EOmflaemTOqV2ON.l6sjvv1r710XOeSC684qpyMQa', 321, 6, 0, 0, 0, 'omar-faruqe_clickocartcom', 'https://clickocart.com', '1756494411', 'Dhaka Bangladesh', NULL, 'X6ENVENNDF84NVK8', 'PJxpY8go4bc3v2QC7maK4SGspxB0YiqT', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(561, 'mdliakatali', 'mdliakatali917@gmail.com', '$2y$10$gPinQ3yrHXdAIiqq/Yn/BuyCiMuEcsf2L3vLoieFA/7..8CBfV3.i', 212, 3, 0, 0, 0, 'md-liakatali_seelzocom', 'https://seelzo.com', '1811185165', 'Dhaka, Bangladesh', NULL, 'EEOFXMHJZZUDNKOQ', 'r7r1tQBtQ5vxPcjp0ecGmnsTjf1J9X1b', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:36'),
(562, 'Kazi Adil Ahmed', 'kazishab88@gmail.com', '$2y$10$lWP7X0Oz5Noxbl962m58WucRA4oEqQnnOmzxpjX3Wt9pGSbJ/esSu', 320, 1, 0, 0, 0, 'kazi-adil-ahmed_famiwearcom', 'https://famiwear.com/', '1766809226', 'Dhaka Bangladesh', NULL, 'PEKQDFLL66J6384B', 'Mfz1JI29CGDksyqldePq5kbKKIfUelO5', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(563, 'Kamal hossain', 'kamal380v@gmail.com', '$2y$10$Lb2YH16rsrfBw9AAooKJNO4Hw4iFpKrd2ITtrSUZdFiCjQEQbsDGi', 319, 4, 0, 0, 0, 'kamal-hossain_gulfyacom', 'https://gulfya.com/', '1635394253', 'Dhaka, Bangladesh', NULL, 'AZIWX6MOW5US9LY8', 'ZSr7mz6Hi5qz4QyiAKG6S1BN5eXxhqxN', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(564, 'MD.NURUL ISLAM', 'nurul.fabriaz@gmail.com', '$2y$10$PeiC7yDvLPsM19lAAVEbV.9IRakRj0nqLR5dwbmI817WoBwZhcT8m', 318, 4, 0, 0, 0, 'mdnurul-islam_fabriazcom', 'https://fabriaz.com/', '1886208098', 'Dhaka, Bangladesh', NULL, 'UVJHLSEPJLUZTIH3', 'bn8m7rq4FPhaQhWl33R6KyGqjkpX3OLS', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(565, 'Md.Tipu Sultan', 'tipusultan.bd30@gmail.com', '$2y$10$UjplRkqFp4F7xckR4r2lDurS17e2k8x.V7VwLHylLICToMsFf8fuK', 317, 4, 0, 0, 0, 'mdtipu-sultan_zolltupcom', 'https://zolltup.com/', '1315221122', 'Dhaka, Bangladesh', NULL, 'DGR1FXUIW3DPXBNV', 'fAz4cLX7hOWSQIQsbZQBDNzyz55qNC8v', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(566, 'Fahmida Khatun', 'fahmidazh@gmail.com', '$2y$10$fZyBxLMTft.fYmn232LdFeI4c6301QQMyr2oZ.vnaQE.dUMCG1T12', 316, 4, 0, 0, 0, 'fahmida-khatun_annifacom', 'https://annifa.com/', '1719533611', 'Dhaka, Bangladesh', NULL, 'AQCDSWUBVQLKGJTQ', 'dt8Xx1DyTAVTzulA3ZqveeT04BtpHf6S', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(567, 'Saiful Islam', 'techbreze96@gmail.com', '$2y$10$SqSu/nuQN1T/xW16AvZSqeqhAVa57If/FHnbgK5COLq6sYs/VEdM2', 315, 6, 0, 0, 0, 'saiful-islam_sakinabazarcom', 'https://sakinabazar.com/', '1717299996', 'Dhaka Bangladesh', NULL, '6PC6YWQZ3MNUQAY3', 'lrMkzR7pGdb6VvmznTRxuJKfRCF5BlT8', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(568, 'Marufa', 'mdtayeb77777@gmail.com', '$2y$10$fYtHvsENTZKDnItl26.2WeD.TJZnPr7dwKUTfgsP/lmF4o8PmSxgm', 314, 3, 0, 0, 0, 'marufa_febzoncom', 'https://febzon.com/', '1783718600', 'Dhaka Bangladesh', NULL, 'POL6GOVMB5ZU96VN', 've9jgSMiKH470OCZ2mLFjAGz5BObIH16', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(569, 'MOHAMMAD KHALID SAIFULLAH', 'khalid0072929@gmail.com', '$2y$10$RkIKXtKRTHJkT2t8gmV1.OdyQ0CfByWpmzpu9dMv5AWMx19jwhoY.', 313, 3, 0, 0, 0, 'mohammad-khalid-saifullah_lohodkcom', 'https://lohodk.com/', '1552554815', 'Dhaka Bangladesh', NULL, 'I3PJWGSISSLARY6N', 'faRASZBE1nkMZN3VSOAgPsgij8IVM19k', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(570, 'Md Rokonuzzaman', 'md707rokon@gmail.com', '$2y$10$UUR2dCZSCsD89po3cKK2eOOJa7L.rpEB1.CGnVKft9WCIobB9/Jva', 312, 3, 0, 0, 0, 'md-rokonuzzaman_sajhoocom', 'https://sajhoo.com/', '1766843604', 'Dhaka Bangladesh', NULL, 'NKYNFWQL9UMN4I42', 'HDklvPJPqu12B49OS4UWAOkT8Mnr7rQt', 1, '2026-07-28 08:46:32', '2026-07-28 08:46:32'),
(571, 'Md.Jasim uddin', 'jasim250897@gmail.com', '$2y$10$ZAr8iB8gJXSqfJb3CnMjVuCv8pjPCp6SYVkMLMRFdkaHQ0Dt8GduC', 311, 4, 0, 0, 0, 'mdjasim-uddin_drobmartcom', 'https://drobmart.com/', '1915282683', 'Dhaka, Bangladesh', NULL, 'ZX8FJPEJVTGXN675', 'guc2o63apwQzyItR2fevrDrj3B7KnXpk', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(572, 'Mehedi masud', 'munnabhai9k@gmail.com', '$2y$10$G23p.Ze.zpaU/PSLy8uYKO46Qpv2k8hvQePKJgi15sZTPnUSBbivS', 310, 1, 0, 0, 0, 'mehedi-masud_drobshopcom', 'https://drobshop.com/', '1905029020', 'Dhaka Bangladesh', NULL, 'TAL9QUI9U7DMHYIW', 'Iad7qeDwo4Df4WpC0raxlJ2JzbFsQttJ', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(573, 'Abul Basar', 'abulbasarsg775@gmail.com', '$2y$10$.O4vjEN46/MPumTGU4CAdOYKVfhDvwrjh8beZsPXMfJStada4yz9S', 309, 4, 0, 0, 0, 'abul-basar_nexillycom', 'https://nexilly.com/', '1322550224', 'Dhaka, Bangladesh', NULL, 'UDUREY3VBMOXRLLL', 'SY3HTmJO3uGAkxUpSlTPRFjQnFSjzgQ1', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(574, 'Solim', 'justinsolom@gmail.com', '$2y$10$MhwRlGvtgQtbfYkBfwO7Keq8ZmXuheheEfqpXtK2zKkHUkZrpc91O', 308, 6, 0, 0, 0, 'solim_rongtolicom', 'https://rongtoli.com', '1620996387', 'Dhaka Bangladesh', NULL, 'LV88UYDWRJBPU5BI', '7MMYjDNBxIzw1pRBIp2NqbThUxyshgxa', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(575, 'Md Mahfujur Rahman', 'gaffariatalimulislam@gmail.com', '$2y$10$8y2nfzWik2vxke6wG/oWeOcTh.MT/msG7hNmOAggWD0V3MFJTNPKa', 307, 2, 0, 0, 0, 'md-mahfujur-rahman_iconbazzarcom', 'https://iconbazzar.com/', '1818392086', 'Dhaka Bangladesh', NULL, '2XGHOJFBDZOYWTTN', 'RO72e1bADh90UtG1fIHoMvACw6j90yy7', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(576, 'nahid al hasan', 'nalhasan84@gmail.com', '$2y$10$fTSCVNR1oPZ8BquX3SJDVO85kwhblrHuNvU3gjzTA0t.9FbI8fMlK', 306, 4, 0, 0, 0, 'nahid-al-hasan_shadamartcom', 'https://shadamart.com/', '1921212122', 'Dhaka, Bangladesh', NULL, 'LWEMGKGTTPB3LKK9', 'UXiyLRJVzS8gEfTBQX75FeCELnIdJZNT', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(577, 'M K Imam Uddin', 'imamuddin67@gmail.com', '$2y$10$FJ4GotnVZSU5MYh2n3Jr1eeOFUKWdzfkUs6ave9ewJf5lyVUbRSLS', 305, 4, 0, 0, 0, 'm-k-imam-uddin_fintbdcom', 'https://fintbd.com/', '1810267460', 'Dhaka, Bangladesh', NULL, 'NCIE3GVZV2QLDDDN', 'QnNzE1RmWhpD7Elj7j73Zg1Ek2RFSgJC', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(578, 'sabbir hossin', 'sabbirahamed7888@gmail.com', '$2y$10$HLsX7Gohu.yHVyg634Q.kuzJY6rx5hdcdeCqHFC6TqU9hPxd0g3cK', 304, 1, 0, 0, 0, 'sabbir-hossin_sspurecom', 'https://sspure.com', '1313950953', 'Dhaka Bangladesh', NULL, 'RPXG2ZQUPSIDYPVS', 'IRLwZ11sFZcGQkTEwnddCiZlRQOyhFC5', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(579, 'Md. Sojib Ali', 'sojibali054@gmail.com', '$2y$10$Rvbyvb6TUA2s2WttBzpotexJLYaoHRJlSYd22QSKWC74J3yBC7jYO', 303, 1, 0, 0, 0, 'md-sojib-ali_fabrihayacom', 'https://fabrihaya.com', '1778090603', 'Dhaka Bangladesh', NULL, '0UPFH2XY0JIJAHKC', 'tTW3sp8uL5VFMxkMzFFUk6a4ezXoJQX5', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(580, 'Rokib Ahamed tuarek', 'tuarektaluckder@gmail.com', '$2y$10$kXAFI2lsRJFTh6CoW.9Sbe0oHYRjgMMsS/ItE/IhuxBK6eIYwCWum', 302, 4, 0, 0, 0, 'rokib-ahamed-tuarek_rishanonlineshopcom', 'https://rishanonlineshop.com/', '1909342023', 'Dhaka, Bangladesh', NULL, 'ZCPBNHVZADOMLMWA', 'lGebTBksRuvxMCnpCUFBtLJehJW54xcc', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(581, 'Mohammad mizanur Rahman', 'md.mithu019@gmail.com', '$2y$10$PI15xoshYCrGXeR1MCyyhu2O0DcQHAzqxKB0//E6yMrl93s3RUlcy', 301, 4, 0, 0, 0, 'mohammad-mizanur-rahman_haatnestcom', 'https://haatnest.com/', '1911198795', 'Dhaka, Bangladesh', NULL, '4FNUBFS92TEYURJY', 'mWmP6sX41ed0kPfy3DiqgGZ7McsWq7dj', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(582, 'Md.Mosharraf Hossain', 'mosharraf.rmgm@gmail.com', '$2y$10$zcZx94tcYlaBrOYjGjMJYOb0qZd/Pp8DdKtctSzuLUkv6l8NcqMXO', 300, 4, 0, 0, 0, 'mdmosharraf-hossain_novuskingcom', 'https://novusking.com/', '1734234234', 'Dhaka, Bangladesh', NULL, 'H3CHO5GF1N1ZU7I1', '9v38Ah9HTTDlpFGQYcZlkG9NR0PqLnuD', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(583, 'SHARIFUL Islam', 'sharif192islam@gmail.com', '$2y$10$c9ck1SgBV/E9/4icLAHmguoLcFojBVPLwNknemHJymWA5Q8wI6nPW', 299, 4, 0, 0, 0, 'shariful-islam_laghbecom', 'https://laghbe.com/', '1889032042', 'Dhaka, Bangladesh', NULL, 'SUEMVNRGQ6JZRVKE', 'Nglu4tzo89ERb8wTzAgD0w1CWVsGbxt0', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(584, 'Md riyaz uddin', 'joshimuddinmd344@gmail.com', '$2y$10$K8eO7s8aP/CtbmQW8Br7NuD.Y8t3vWh1aKk6kl59LSu47FFwZ.24i', 298, 4, 0, 0, 0, 'md-riyaz-uddin_ittadibazzarcom', 'https://ittadibazzar.com/', '1734430152', 'Dhaka, Bangladesh', NULL, '9FN9WJF3SCCYXARN', '242u6acr1eAYXA5q8WeGDBkgor3Y31co', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(585, 'Saiful Alom', 'itssaifulalom570@gmail.com', '$2y$10$GB92wUof7GC4Ca/c/52to.fn3JBlup1vj0KtRcgWDi/n/8xZ4n7CW', 297, 1, 0, 0, 0, 'saiful-alom_noorletkidscom', 'https://noorletkids.com/', '1625582544', 'Dhaka Bangladesh', NULL, 'GESKDHB5NY0KVDCF', '9ptiwFunJxPdqTYfGg1efEIGVpUfkxaV', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(586, 'Omar Faruq', 'anmomarfaruq@gmail.com', '$2y$10$eMNzR02Vx2EI4ahKu5hhZec6mXy/89qf6rAPzexSJDpb83/a.Wty2', 296, 4, 0, 0, 0, 'omar-faruq_amenamartcom', 'https://amenamart.com/', '1840092010', 'Dhaka, Bangladesh', NULL, 'VP98AR0Y30GVANGK', '8ghoWGAfytyqkdb1bVM7RsVcKeh2f9dh', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(587, 'Jobayer Hasan Jito', 'jahidm3286@gmail.Com', '$2y$10$yHuadydAzUoQnFfQ8Mzlf.uP9BC.yelC5BYA6w8lenSUcoPAsISWC', 295, 4, 0, 0, 0, 'jabayer-hasan-jito_ponnoloycom', 'https://ponnoloy.com/', '1962330459', 'Dhaka, Bangladesh', NULL, 'AE6VP5O3ZDAH6TAN', 'LMAMdbSdNbF3xqF5StrzDmS2hVGhKsRJ', 1, '2026-07-28 08:46:33', '2026-07-28 08:46:33'),
(588, 'Tamim Hasan', 'tamzidhasan94@gmail.com', '$2y$10$X6fkzbYdb3zayU8bfKCSY.guvq64M3dJw1xEPkBVeIbaXNj2YVWp.', 294, 1, 0, 0, 0, 'tamim-hasan_hayazaacom', 'https://hayazaa.com', '1308871288', 'Dhaka Bangladesh', NULL, 'A1YOIDEB8YJPEJLC', 'boN9uuICVhSesZstF652cSk7aZGeF6my', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(589, 'md osman goni khan', 'mdosmangonikhan53@gmail.com', '$2y$10$szeQrqgHSUQIF/62asc3V.izg6LckNtzHyqVCSaStpcWQ8s/m2CuK', 293, 4, 0, 0, 0, 'md-osman-goni-khan_giveloocom', 'https://giveloo.com/', '1791493706', 'Dhaka, Bangladesh', NULL, 'AZZXPBCXX9DWM3KV', 'bwIyA8Q9kzh3YI8GELWGBPBQ1Bip183D', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(590, 'MD AHSAN KABIR', 'ahsansq86@gmail.com', '$2y$10$6a3pw4N3X3q8bifLfb9pneYMbtVJ6H8LMMOh05QLRSboc3EiPSOWa', 292, 4, 0, 0, 0, 'md-ahsan-kabir_avabazarcom', 'https://avabazar.com/', '1311472409', 'Dhaka, Bangladesh', NULL, 'K9YXGFPBNUQP7FRM', 'mVrrl9A23RIvbQroLCh4FznknOLZocWH', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(591, 'Mamun', 'nexyeabd@gmail.com', '$2y$10$mzQ1Ga4wvlfytB6FpR6ZbOoqd5c6afKXsMuPwR6v1rDKKWR./72c.', 291, 4, 0, 0, 0, 'mamun_nexyeacom', 'https://nexyea.com/', '1316681535', 'Dhaka, Bangladesh', NULL, 'WDJYVZOGWQJBEJ2Y', 'nv0oADZIuNP3SVHm9t3ospgOQsDK4Um8', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(592, 'Md Razu ahmed', 'mdsayedur99@gmail.com', '$2y$10$pRUWS6WpZSnRbWeO/bhmquuhTfFimPCCbPLt.O9W9/8VfQ8/MvN8S', 289, 4, 0, 0, 0, 'md-razu-ahmed_ramartbdcom', 'https://ramartbd.com/', '1782354536', 'Dhaka, Bangladesh', NULL, '9YOY9M62FLJEYYUD', 'jGGKzLULpEHma17SIu3ZUliFFwYKuu7w', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(593, 'Tonima afrin', 'tonimaafrin89@gmail.com', '$2y$10$jilKbD6QTTUTInZxkjuJgOjFET5XC5XzKIrhLdRySV/z7waKpQEV2', 288, 2, 0, 0, 0, 'tonima-afrin_mehrushcom', 'https://mehrush.com/', '1706005910', 'Dhaka Bangladesh', NULL, '39MCSLEY0338PB8B', 'ysum4Pvy0odnKYPRHSKZiXLN87WZYcmg', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(594, 'Mohammed Ata Uddin', 'ata01uddin@gmail.com', '$2y$10$sAs/SYsKjoolCksdPUOEP.aQy4ZEeNxPHb0IbXKKaRHhFPxToPGJu', 287, 4, 0, 0, 0, 'mohammed-ata-uddin_happiyancom', 'https://happiyan.com/', '1557780571', 'Dhaka, Bangladesh', NULL, '1NKPEP2ZPIV0FZKY', 'IJVVoDnCW1idtAoxnVuIF419ov3XBOfi', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(595, 'Abu Shayed Sabuj', 'abushayedmajumder@gmail.com', '$2y$10$QTdwcwoPw.vk8WWE0g.HvOIdU3UVMoQb2ymMKVuXf.JH4nhblzDfu', 286, 2, 0, 0, 0, 'abu-shayed-sabuj_trendymuslimcom', 'https://trendymuslim.com/', '1612875937', 'Dhaka Bangladesh', NULL, 'RGCPHDDT1DFZM6VE', 'UxSotBHZzwTX2aZHkRm9cAxBs7s0mm0q', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(596, 'Tahmidur Rohaman', 'tahmidurrohman360@gmail.com', '$2y$10$yQyybC42bn/6pEF6Y7TS1.iGqlLHYsXyuTauLZReJIj9QfPS10SQ2', 285, 2, 0, 0, 0, 'tahmidur-rohaman_kifayahmartcom', 'https://kifayahmart.com/', '1747707627', 'Dhaka Bangladesh', NULL, '9FJSCABKNDDN0UZB', 'aipqKEwDC92PDOc2pTgFmkIKOxSiVyzv', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(597, 'Md Riaz', 'riazrahman03@gmail.com', '$2y$10$Ori/xrDeoZqm8lQcB8NeZONteNq2AbZmqY6Q72rgxjLxFHGPFU8vW', 284, 4, 0, 0, 0, 'md-riaz_astharbajarcom', 'https://astharbajar.com/', '1736363553', 'Dhaka, Bangladesh', NULL, '9JOO6ZEQO6GDB4Z2', 'Hd3Nkdu6cKCKw00fmSMVyQxTfqi83tB3', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(598, 'Tanvir Rahman Tamim', 'tamim20rahman19@gmail.com', '$2y$10$XuPlkZ/rggZyT7X9mtupMukK2ef1obVJAq.9tY7ANf/1OsutByZa6', 282, 2, 0, 0, 0, 'tanvir-rahman-tamim_rivoloocom', 'https://rivoloo.com/', '1762540641', 'Dhaka Bangladesh', NULL, 'L4NGFVW7DCBHTRFQ', 'NKiNHmPq1tg1DM7Pb1ke9rNf0KwfVjUh', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(599, 'Md Rakib', 'rakibwearbd@gmail.com', '$2y$10$nLfzxdGZPEy6IGcSHX1pkOELfkGDC5csSo5TJsGdmAVZrpAIWBiF.', 283, 4, 0, 0, 0, 'md-rakib_rakibwearcom', 'https://rakibwear.com/', '1614217541', 'Dhaka, Bangladesh', NULL, 'ULF3FMKHJKKBLOJ5', 'FURzsDfZb8CKSsmZ6JoF7CYIr2VtVWRJ', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(600, 'S. M. Washim Kabir', 'washim28021979@gmail.com', '$2y$10$vx/.Sekkt0gfgngrKtZcteYTzkhk4u4hhDImohWA14nb4QkylVl0.', 281, 4, 0, 0, 0, 's-m-washim-kabir_ezyhaatcom', 'https://ezyhaat.com/', '1703581829', 'Dhaka, Bangladesh', NULL, 'ZSXIZWXGR9JPNDQU', 'S1Aw9vjnCVIP6FBbKuHr22Tadf0QpUcL', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(601, 'Md.Nahid Hasan Sarker', 'nahidhasan.eng85@gmail.com', '$2y$10$Rr3tbH/Bd0vTLNSeJjg57.5EjJL4IkB9HQZdmkQ3TpOTAwOJO8Que', 280, 4, 0, 0, 0, 'mdnahid-hasan-sarker_fabriwearcom', 'https://fabriwear.com/', '1711292144', 'Dhaka, Bangladesh', NULL, 'I14CCKMLA1ZAWUPZ', 'L6g6Uno1DxzVH4zdedfNlNgV3HxsKDKh', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(602, 'Ahasun ullah', 'mdahasun692@gmail.com', '$2y$10$5AXWvSwTJX83VyTLAjP4auFzxPVahyAjvOTlBKBpChpCj8amoY6EG', 279, 1, 0, 0, 0, 'ahasun-ullah_uttombazarcom', 'https://uttombazar.com/', '1787860334', 'Dhaka Bangladesh', NULL, 'NHNPVIUYAEL100QB', 'dpmLnsgJEIbpHJfN5NQQWGPqvqpvJTNY', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(603, 'Md. Jahangir Alam', 'jahangiralam00744@gmail.com', '$2y$10$1Gtn.EJC5GihB8hjyO8MReC9Lan00muyPpIZiD6jG/fta4K1TrsDm', 278, 4, 0, 0, 0, 'md-jahangir-alam_mahnoormartcom', 'https://mahnoormart.com/', '1935166900', 'Dhaka, Bangladesh', NULL, 'FJRP7WSJ3VUPEWJC', 'JBrwM5eEZe4d5gn8nsoRFGnnbDz6G7QV', 1, '2026-07-28 08:46:34', '2026-07-28 08:46:34'),
(604, 'Mohammad shariful shah', 'roney.yeh@gmail.com', '$2y$10$/oTWiGrtVJ7L92x/lLw8Zu43JB8YkZNZt9XIDtc4zw44UW5XktxnS', 277, 4, 0, 0, 0, 'mohammad-shariful-shah_feshazcom', 'https://feshaz.com/', '1716026371', 'Dhaka, Bangladesh', NULL, 'BL5GS7B3KNXOFD6P', 'RmUoPk2HDQsHD0BspgJukGNLeZdPY2bT', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(605, 'Anamul Hoque Saimun', 'diptomart22@gmail.com', '$2y$10$PKwQ3zgXsvd1QrhaxnGZGe9uuQg7dAblpDk0pkZK./957/J2GssFm', 276, 1, 0, 0, 0, 'anamul-hoque-saimun_diptomartcom', 'https://diptomart.com', '1303246277', 'Dhaka Bangladesh', NULL, 'E7R6EF74AWRLBG3X', 'Ejaa1Z4CsJTwOClemdW48qsm2NZq8yYG', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(606, 'Md Ruhel Ahmed', 'fashroxstore@gmail.com', '$2y$10$NwQvzZrmBEOybMiPjR1pq.qbzSKpmyzbFe9Ae1MuTNiNYijOjVWeS', 271, 1, 0, 0, 0, 'md-ruhel-ahmed_musliancom', 'https://muslian.com', '1302538109', 'Dhaka Bangladesh', NULL, 'NGPTUZ47P3AMP2OL', '33VhcglvfflZwNnUI7UTSwzkjgvgYV5L', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(607, 'Md. Abdur Rouf', 'rouf49140@gmail.com', '$2y$10$yeYYhD8ciqCk4hzzrGBL8.lYhvOiPFXag7hWPKGtH3b4nAC5sJFWy', 275, 4, 0, 0, 0, 'md-abdur-rouf_falvaacom', 'https://falvaa.com/', '1755448706', 'Dhaka, Bangladesh', NULL, 'ZWQK5GVIQYQVEHGL', '7yGefP8Q3jXnMo61Rya86AgIm145zX1r', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(608, 'Mahfuza Afroza', 'mahfuzaafroza@gmail.com', '$2y$10$v/yJk5vKDZ1YacppxSQSFeOgA06CAW8VyrN5gGPWCe4.fc58fW2aW', 274, 4, 0, 0, 0, 'mahfuza-afroza_zunuszencom', 'https://zunuszen.com/', '1717488427', 'Dhaka, Bangladesh', NULL, '4LMZYQWP0GR93Y9Z', 'a4Ex2yGOxYfWqadNVZ9ba7s2ZXyEjVal', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(609, 'Monirul Islam', 'm1islam1330@gmail.com', '$2y$10$mCPQ6RDcWlAiZ20DIya5qut77NERP.vwS4/o7XXxtTbgXfn0faEPS', 273, 4, 0, 0, 0, 'monirul-islam_fabroexcom', 'https://fabroex.com/', '1330814140', 'Dhaka, Bangladesh', NULL, 'PAUSAGFKYQ6JUOCU', 'lfc3wzDcVAZtC51PI9vnhWvq118ocM1g', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(610, 'Mahmud', 'nahiyanmahmud12@gmail.com', '$2y$10$RhowLCKv43/wn3oVE8VbTO9z9pQXG.grx9Rd0Jehk3VGbO9BMxNyi', 272, 4, 0, 0, 0, 'mahmud_musakkelcom', 'https://musakkel.com/', '1917998085', 'Dhaka, Bangladesh', NULL, 'HUU3YA3AOMAU47QS', 'gtJQ6bZ2l9BVhsr1TWbYxLeHTxQe4rya', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35');
INSERT INTO `dropshippers` (`id`, `name`, `email`, `password`, `dropshipper_id`, `package_id`, `total_deposit`, `total_credit`, `total_withdraw`, `user_name`, `domain_name`, `phone`, `address`, `image`, `app_key`, `app_secret`, `is_approved`, `created_at`, `updated_at`) VALUES
(611, 'Romjan Hossain', 'hromjan676@gmail.com', '$2y$10$Aq2It6Cy3I5Eaq8fDUve5urNqg.xq7eCQd3J086gsExlW3NzCmyYC', 270, 4, 0, 0, 0, 'romjan-hossain_febrycocom', 'https://febryco.com/', '1610154794', 'Dhaka, Bangladesh', NULL, 'PHIQJGEKNDFY9HQJ', 'nYAopAJGInYNMqeSxHdZEpfjrWT01PRO', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(612, 'Md. Belal Hossain', 'smbelalhossain928@gmail.com', '$2y$10$qlt7gob4fl1w/3OGcox2S.s1WLo8d59nH.XTmoE60l6TBFlSDmMLG', 269, 1, 0, 0, 0, 'md-belal-hossain_bsmartbdcom', 'https://bsmartbd.com', '1316115674', 'Dhaka Bangladesh', NULL, 'MEALFWNQZWHKSEAX', 'qZkj6KxDuYEoEwD5K2BleVet9WJWm4tz', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(613, 'Abdullah Al Mamun', 'aamabdullah80@gmail.com', '$2y$10$KMRAIaaxfMve1gRAvieUEeI/Jf2Zl.9e.sPHbB8YOidVhBzgimFzO', 268, 4, 0, 0, 0, 'abdullah-al-mamun_drovmartcom', 'https://drovmart.com/', '1765263047', 'Dhaka, Bangladesh', NULL, 'TR1GOKGZU97CDJYD', 'Y8HLCQn1YdbMCZ8Pf7VVULEIUWuG3rYN', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(614, 'Najmul hasan', 'hasan756180@gmail.com', '$2y$10$dZYLe7qjXzCzwipWI.b1ceLgwaJxPvCg1e0bTlm1a16MttUaE9xTG', 267, 4, 0, 0, 0, 'najmul-hasan_orimiocom', 'https://orimio.com/', '1622662483', 'Dhaka, Bangladesh', NULL, 'KSQ9PNVXGQOJYUIS', 'IxZ1nRw2flExRjNyP79sW9q911CqZuag', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(615, 'Md Jamal uddin', 'hijabbazaralam@gmail.com', '$2y$10$BwYeVUMrSyJBsbfzslOeTOKuJz4jmEm8af4WL.1i4LmOjnf6O9Uj2', 266, 1, 0, 0, 0, 'md-jamal-uddin_hijabbazarbdcom', 'https://hijabbazarbd.com/', '1635412235', 'Dhaka Bangladesh', NULL, '1ARREMEW6QFVEZCR', 'q1AepvFGwnga1rLcMspN3qTupF344XvK', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(616, 'Ismail Hossain', 'hossainbismail68@gmail.com', '$2y$10$imUu0q49CFu4dj62pq5kdud0PsogJPWXp6wFEak1MwheRGf5N.o7G', 265, 1, 0, 0, 0, 'ismail-hossain_martuvacom', 'https://martuva.com/', '1763055577', 'Dhaka Bangladesh', NULL, 'YIVCKUREKDJ95L5M', 'VHGOvuUERll6iijdqbPKS6U7qIL1wvMi', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(617, 'Muslim Bazar', 'muslimbazar4@gmail.com', '$2y$10$7ciSSwDKjovvrAsdAiLN8eFzkgw/N1Dvvo7Wxhs/wpL7/V0jWYW22', 264, 4, 0, 0, 0, 'muslim-bazar_muslimghorcom', 'https://muslimghor.com/', '1622566262', 'Dhaka Bangladesh', NULL, 'Z9FRGAGXKTTISMHY', 'gkvM7aCAddYeaMDeImtGW5x2NIg0wSQ2', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(618, 'Md. Shahidul Haque', 'shahidulroney@gmail.com', '$2y$10$KQrFtxc1nm8WN7bNXHCiR.NjHp3llysvCr7ABiv3jZU0kL9pfRi0m', 263, 4, 0, 0, 0, 'md-shahidul-haque_smkineticstylecom', 'https://smkineticstyle.com/', '1711935564', 'Dhaka, Bangladesh', NULL, '1GSK78ZKR0RPE2GE', 'gmDw8rrqLJMoW576gxY1hHSXGTFIwPet', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(619, 'JEWEL HOWLADER', 'jewelhowlader017@gmail.com', '$2y$10$OmRw8jXDeNlCkQD16XpNJeZPcYgY/tLcSVJHVzbCQAts9nCODmI3i', 261, 4, 0, 0, 0, 'jewel-howlader_ellinmartcom', 'https://ellinmart.com/', '1714134230', 'Dhaka Bangladesh', NULL, 'OOQHQJTM4B0JGT8Q', 'JN4fjAKvBU7xsl29GhtzOWrmtjXT2hAa', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(620, 'Sumaiya Shop', 'sumaiyashop24@gmail.com', '$2y$10$U9IdOTvDtnqwLHo6mB3fFeIC0DvD/TGecyk2bNwqBIsAWYk3ho4uO', 260, 1, 0, 0, 0, 'sumaiya-shop_sumaiyashopcom', 'https://sumaiyashop.com', '1672891900', 'Dhaka Bangladesh', NULL, 'MFCPZHNCFESCI04M', 'jj556dDnE75Xagq34G4QjXgGzIhggVzU', 1, '2026-07-28 08:46:35', '2026-07-28 08:46:35'),
(621, 'Md Mamun Rashid', 'mtv25052002@gmail.com', '$2y$10$TMacXpEaz3nigOXmYVgR5e2Fr3QlY9v75aEtfYwnPsPn1ejIpG4vW', 258, 4, 0, 0, 0, 'md-mamun-rashid_drapmartcom', 'https://drapmart.com/', '1715123170', 'Dhaka, Bangladesh', NULL, 'I8TJP6K3LG8GGWGZ', '7pHu2W7864yc86Rvpd4UzUDlhAQP7dqG', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(622, 'Md Azad Uddin', 'iftiyah@gmail.com', '$2y$10$2hgufoZYjSENTUFKZMzoz.LhJV1aGEekQlSLNATkEOVyTuyQsDv4e', 259, 4, 0, 0, 0, 'md-azad-uddin_iftiyahcom', 'https://iftiyah.com/', '1731691662', 'Dhaka, Bangladesh', NULL, 'TRBH1PVIYQLIW3FW', 'AkRgHePGHkoOIpPOhWNwOWkYDDhaYMJ7', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(623, 'Md Tariqul Islam', 'qa.tariqulislam@gmail.com', '$2y$10$QydlfwKDees0bXG7lRdxwuqz5KsgYnx9VJ8KI9d81QqdwRQ5wU1O.', 257, 4, 0, 0, 0, 'md-tariqul-islam_pabyloncom', 'https://pabylon.com/', '1751657386', 'Dhaka, Bangladesh', NULL, '8FO5CZRLH5W8EBNY', 'odO4n6kUoTrCK2B242gXW3Rwno1cv37w', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(624, 'MD SAIFUL ISLAM', 'rahatsaiful065@gmail.com', '$2y$10$D3QmcOjPtR.ZlN8Qq1BYguxhqAxtZms.kEaWx2cEvIwMfcwu/YwNu', 255, 2, 0, 0, 0, 'md-saiful-islam_sunnamartcom', 'https://sunnamart.com', '1855670242', 'Dhaka Bangladesh', NULL, 'URGVGPFFSO6KVZUD', '5i88URCJGoJwokEGzJJ9yDFUaqAy8kuK', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(625, 'Md Farid Ahamed', 'info.hafsu@gmail.com', '$2y$10$5KXG/wteaxOEVEKZZ8U8q.gPONNAvAJcfpw76aRBodUJMdynLWRwS', 254, 4, 0, 0, 0, 'md_farid_ahamed_hafsucom', 'https://hafsu.com/', '1720200980', 'Dhaka, Bangladesh', NULL, 'GUA8RR8Q5HSHLNTS', 'hyUchUa8YR4onODiCt1JW72pztGlpVZN', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(626, 'Md.Ashraful Islam Jony', 'jinatshop.com@gmail.com', '$2y$10$Q7c80Mmy2xrX5TRX/vDMvOkud.eJYw3dda52yUui5qf0TMd/14.v.', 253, 4, 0, 0, 0, 'mdashraful-islam-jony_jinatshopcom', 'https://jinatshop.com/', '1518932669', 'Dhaka, Bangladesh', NULL, 'MVCXWI7HOUJMRGCN', 'GoSRZq9FlFi39CzHEzkYXg9uD8kte3YX', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(627, 'Mokhlesur Rahman.', 'paponrcl89@gmail.com', '$2y$10$I1mLl4QMJFSIUc3luuMqaODl2JO5ZWjDSt2vVKo1Krugzht2SeHYy', 252, 4, 0, 0, 0, 'mokhlesur-rahman_sajdamartcom', 'https://sajdamart.com', '1824568810', 'Dhaka, Bangladesh', NULL, 'HLAAOZQ55MLZ77TR', 'h5L6lktazBXZFf9bPWoqblRLL54tJ1pp', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(628, 'Mamun', 'mamunarman008@gmail.com', '$2y$10$Iq0zA0OhotkRTalvDTEBIegqZ/.cgZCW0cEjXrWLjbqfR2gzg.gXi', 206, 6, 0, 0, 0, 'mamun_ecolmartcom', 'https://ecolmart.com', '1744991811', 'Dhaka, Bangladesh', NULL, 'T6HACVFGNGVZOOU3', 'iYBPHfmc6hGDPVDFmnzXWwNFOSd3HFUv', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(629, 'Mahadi Hasan', 'mahadironju9@gmail.com', '$2y$10$YtTOtQyZwcwb2ilOep5my.GUPc3f/Mg2Yfrd9aBdowVJDCdSszHj.', 227, 3, 0, 0, 0, 'mahadi-hasan_farryawolacom', 'https://farryawola.com', '1824643715', 'Dhaka, Bangladesh', NULL, 'J3RIFMWVHSONYPEW', 'bB3h5vo1zjxFQ7MHTkLKpVoWo6Yl88Li', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(630, 'Mustak Muzahid', 'mustaksm43@gmail.com', '$2y$10$T/IHqYTU.vVxu/XgStlmD.XgJLtPQeEjLvYgXQtGSB.8lctLFg6ue', 251, 1, 0, 0, 0, 'mustak-muzahid_easyloycom', 'https://easyloy.com/', '1811265241', 'Dhaka Bangladesh', NULL, 'AZERKWR7SIHGUYQX', 'MeWss7vCaTQqMPDvEd6PXuoSeGTZez3L', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(631, 'Rubel', 'rubel.sayedah@gmail.com', '$2y$10$Dx9KCouWMdfHmyXhPx8Gw.brtgkwY5GhJpmCaOQhA1Wlu.J6j7t6e', 250, 4, 0, 0, 0, 'rubel_keenarcom', 'https://keenar.com/', '1747181455', 'Dhaka, Bangladesh', NULL, 'MGY1JG1WDTCZVDAS', 'K3xNbLdtdewLZHJcNXsERMfUEUN5NpVk', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(632, 'Md. Khademul Islam', 'alkhademshop@gmail.com', '$2y$10$lPu9pDQpNNh6olPVUXJPVuG3kHReMdhlZeB.6sCqzlW59X1lsL9aK', 249, 4, 0, 0, 0, 'md-khademul-islam_al-khademshopcom', 'https://al-khademshop.com/', '1741593776', 'Dhaka, Bangladesh', NULL, '9ITMBS7OQ4BLV7OW', 'tsExeFXG22bZ8gLiR0VbyogKj9tTqJvo', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(633, 'Rahadul Islam', 'nizerbazar@gmail.com', '$2y$10$EaZWKUFMgoqDbLdC21Jj3OH9ffuHfMO5I4I0M.YdneO/cm1qYSV.i', 248, 4, 0, 0, 0, 'rahadul-islam_nizerbazarcom', 'https://nizerbazar.com/', '1745106606', 'Dhaka, Bangladesh', NULL, 'DTSVTFJMGFX3LYB2', 'hXyGl5chSl2y7WgcUYf5wtsw3DJzA0SV', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(634, 'Hossain Ahmad', 'ansarimizi4@gmail.com', '$2y$10$OX1MzL1qDH/fCDootSJoW.fJNsEfVdk/BdHmZu6jg4x4gx33vq/6a', 247, 1, 0, 0, 0, 'hossain-ahmad_tawhidiancom', 'https://tawhidian.com', '1806164129', 'Dhaka Bangladesh', NULL, 'CIZJ4VW7S50YKZ8W', 'sBmFpWRojvcUJ3JPn35VYNlZe34pHUhM', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(635, 'Mehedi Hasan', 'chonchole2025@gmail.com', '$2y$10$AsgPl4cP9G8mn/UFln3PSuqZlkCRihJT0vEqxN3VqaBS11J85PBZW', 246, 4, 0, 0, 0, 'mehedi-hasan_ohiluxcom', 'https://ohilux.com/', '1798689818', 'Dhaka, Bangladesh', NULL, 'ESWZOCBO7C5CQWTK', 'l5DK2WrxiA4FkUT4Z7fEjY4C1qlxaMyp', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(636, 'Rayhan', 'mdrayhanislam018822@gmail.com', '$2y$10$5XMj/OQwLN5/N3.J0PL4P.ZEcNd8OdwEzMKbPfNCHsa5tqI6ImAWK', 245, 4, 0, 0, 0, 'rayhan_rnbazarcom', 'https://rnbazar.com/', '1882274373', 'Dhaka, Bangladesh', NULL, 'NVJBRPVQQEHMJMXP', 'IP5HVBZjkCBDdsPSVZIlZPFCO4QD2Vxh', 1, '2026-07-28 08:46:36', '2026-07-28 08:46:36'),
(637, 'Md. Nazmul Alam', 'mdnazmulalam51@gmail.com', '$2y$10$pEFposJu7rQ9toO9woUzyeVhc0MXHR4maFr5Q518HhhCVtOED5h4i', 225, 1, 0, 0, 0, 'md-nazmul-alam_priomakecom', 'https://priomake.com', '1929399677', 'Dhaka, Bangladesh', NULL, 'YMSPWOLCLFR6RB2J', '5h1s12SWyCVsvw4g652nYUiSEQjeu3Pe', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(638, 'Kaosar Ahmed', 'kaosarmaruf@gmail.com', '$2y$10$2lFC5wmLYJUXOjmvNYCTtubCiH7Ti75IuaNm/FcxgL6HetjkkDOZy', 191, 4, 0, 0, 0, 'kaosar-ahmed_primakecom', 'https://primake.com', '7497885938', '4, Louise Road, E154NW', NULL, 'WITRONDIQMRZ5GYN', 'hFEqIFAKNfDtd63CdKyeGEfnEyWbf9Bk', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(639, 'Abu hanif', 'abuhanifsg08@gmail.com', '$2y$10$FB1bEKAQT/wTfI8.kT2LN.LOeC2k.k.Me6yRgixqo0hUEZwVGxQnW', 244, 4, 0, 0, 0, 'abu-hanif_inoneecom', 'https://inonee.com/', '1726430043', 'Dhaka, Bangladesh', NULL, 'ODBBQNZ0GXKEG1OG', 'B68n9v9I5T3kZktaQ76hafGfqS0EPtME', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(640, 'Sajjad Hossain', 'sajuhossain@gmail.com', '$2y$10$bPMHGsla2OKdMKVP59CCS.ncZfoqww5ifOQpU9tFenTOEj.2Z/DC6', 203, 4, 0, 0, 0, 'sajjad-hossain_golfrateshopcom', 'https://golfrateshop.com', '1793447206', 'Dhaka, Bangladesh', NULL, 'ALIK08UL0O3QOVEG', 'eaginyE2roYyO9zfJNpzNfI1mUVcvdE0', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(641, 'Shohel rana', 'ranashohel8224@gmail.com', '$2y$10$OP3ebEISicyKhaiwHAb.S.UJpDKWWf6EhBZ62b2qxfgm8ARMgTNgi', 204, 4, 0, 0, 0, 'shohel-rana_febrizcom', 'https://febriz.com', '1866584744', 'Dhaka, Bangladesh', NULL, '6WQIJBYVB5TVK6AN', 'SjWkRG5eW1QTVGFgTBGL2y0qwvn1verz', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(642, 'Md. Anwar Hossain', 'mdanwarbinsuyeb@gmail.com', '$2y$10$6QJt2ofRcIUgs.fQ0lrysOaXe9.9UNm0zS4HW3yYjR1Q1H5aa4ncy', 214, 1, 0, 0, 0, 'md-anwar-hossain_shopbarycom', 'https://shopbary.com', '1721429185', 'Dhaka, Bangladesh', NULL, 'RU5J4WZLOMLQ7DX5', 'Way2BZcNaG1TP7Q5xqsB3QXHuxh5VvRw', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(643, 'MD. ARIF HOSSEN', 'mdarifhossen2032@gmail.com', '$2y$10$CBeSx7zzfyDmuvnQNjbR/u9vljf2AYUidaomov/Lr8fZDKVE4JI6m', 228, 2, 0, 0, 0, 'md-arif-hossen_islamichutcom', 'https://islamichut.com/', '1853532097', 'Dhaka, Bangladesh', NULL, 'L1WZQCIFGL0ND2FG', 'BW3yzGGico52xJ46KY4kp2TT235eeTyo', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(644, 'Md. Mostagir Hossain', 'mostagir373@gmail.com', '$2y$10$ivwyas.Gv61p3Ox/jjKq/u/JyvSOkTo.fnTRg6HkJOrjxA6kEdJiO', 243, 2, 0, 0, 0, 'md-mostagir-hossain_liyarahcom', 'https://liyarah.com/', '1719422887', 'Dhaka Bangladesh', NULL, '5EMTUWBIVMCDTGIY', 'Ioclwf9XAllcYYwsUMlMlM8QQyY7yjGB', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(645, 'Afroza Ashraf', 'afzdr73@gmail.com', '$2y$10$6ajLFqDAgoezK5U5GkAyK.alXwIGkkCQnvh6JvYGCecccAY68rRE6', 200, 4, 0, 0, 0, 'afroza-ashraf_flixomartcom', 'https://flixomart.com', '1712123706', 'Dhaka, Bangladesh', NULL, '947P0SVI0TCVUMRV', 'enuWONzeSo2TSAg6Jhj7c1073aDDN10i', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(646, 'Robiullah', 'mrkrabiul20@gmail.com', '$2y$10$rUEi53onsReK8i805bviS.8FQXh34CFuJaTvJczBBvgJd4zJ0Tynm', 235, 4, 0, 0, 0, 'robiullah_afwanshopcom', 'https://afwanshop.com', '1775770305', 'Dhaka, Bangladesh', NULL, 'ZFZQOCHRLAV1QTFI', 'A5pXUqWMhUgBh9lpRMUl2YvLPouNoDze', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(647, 'Mohammad Tofazzal Hossain', 'hossainm2110@gmail.com', '$2y$10$3MkMslL0ChpexWrMrK7pTO9uoOtFJR8lggFGFq1XaM4wemoz0gPAy', 205, 4, 0, 0, 0, 'mohammad-tofazzal-hossain_luzainscom', 'https://luzains.com', '1675886646', 'Dhaka, Bangladesh', NULL, '3FVG422CCSE8KV8K', '2THDc98Tel1nLQO2a4bM9KDJ4yCiw75U', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(648, 'Mohammad kaikobad ali', 'novixobd@gmail.com', '$2y$10$KfLLNHyrmVZW.yp4yu88f.5H2w6VoXIT0DjQk0rjyA3Wljmuy9hvm', 242, 2, 0, 0, 0, 'mohammad-kaikobad-ali_sabeehawearcom', 'https://sabeehawear.com/', '1861555425', 'Dhaka Bangladesh', NULL, 'KIFYTIOADBN0KSGO', 'PDifungPmI5aQuf3ceC66swLqB0knkFQ', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(649, 'Mahadi Hasan Faysal', 'mhfaysal106@gmail.com', '$2y$10$8wFQbB/j1zZWtfoqKgm4muoy3gYwxcArwBFtaRBTqEKP.V1Cs.Zk2', 231, 4, 0, 0, 0, 'mahadi-hasan-faysal_munzarincom', 'https://munzarin.com', '1799535183', 'Dhaka, Bangladesh', NULL, 'RYTWPR0GSYOXMKSB', 'rNbhFFX9imqlYzY3FnoEVzzhFbtltvcM', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(650, 'Md Jahidul Hossain', 'md.jahidul.cs@gmail.com', '$2y$10$4jdhKmUi2rRZB8OD6vRMfuApMBhZCJ0L915nL7Tm8K/d4pC4Kt6r2', 208, 4, 0, 0, 0, 'md-jahidul-hossain_babufycom', 'https://babufy.com', '1675737232', 'Dhaka, Bangladesh', NULL, 'XSXB1HIBHDQYGAM5', 'zM8TyJfnSqiLjUDe9fXBdmJm8HIxNaLd', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(651, 'Jubaer Methun', 'jubaer.methun109@gmail.com', '$2y$10$fN3/pVVPMK8XN1lDHvzKaeVSWEkxSROC.1Rn3aLN2/kakO29vMqEy', 209, 4, 0, 0, 0, 'jubaer-methun_mohabazarcom', 'https://mohabazar.com', '1918982094', 'Dhaka, Bangladesh', NULL, 'P3ILXU9ZP02SJYPH', '0deSyjjgxqOmxoO2JP5mwlnn2s8lG3M9', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(652, 'Md Rayhan', 'hridoyraihan76@gmail.com', '$2y$10$nOYqjb/PAKFeOvgX8XBR/OwHJtreUwDg9mpCg1iJOfZJaLDtAyi5G', 226, 2, 0, 0, 0, 'md-rayhan_babyzprocom', 'https://babyzpro.com', '1971726322', 'Dhaka, Bangladesh', NULL, 'O07SNMPDSLTIRR2F', 'MMTHfQD3dAlbxBNr1pqg1ebnVS0sZgwI', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(653, 'MD. Farhad Reza', 'farhathossain588@gmail.com', '$2y$10$VO7UmYUmyqYzhwDwjgAKJO0chXIT44ZlBOfJXcg2gMxLGW/2STGsa', 241, 4, 0, 0, 0, 'md-farhad-reza_tenumartcom', 'https://tenumart.com/', '1304463008', 'Dhaka, Bangladesh', NULL, 'IAV55LCANRMSRIPT', 'tGE8izVFyjC5nLr3Te6Ksmqe3UkMH9z7', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(654, 'Md Ruhul Amin', 'ruhulmatubbor79@gmail.com', '$2y$10$LaAMQq/XpG1gxuSQPb5.g.sxWH4CIqgAPLdExgP4m5C9FhrNOEohW', 240, 4, 0, 0, 0, 'md-ruhul-amin_clozlyucom', 'https://clozlyu.com/', '1734403170', 'Dhaka, Bangladesh', NULL, 'MLFTPZCQFYIYBSP0', 'Bp3KG29bnaGUEQoeg7mJeTeO6wtuFaGy', 1, '2026-07-28 08:46:37', '2026-07-28 08:46:37'),
(655, 'Saleh Ahmed Talukder', 'talukdersew@gmail.com', '$2y$10$uJpctxZ/Rd/JFkHovzSk4O31HhzGN.z9YycVKnEpsRDKcGx8RY/fe', 210, 4, 0, 0, 0, 'saleh-ahmed-talukder_bebsaricom', 'https://bebsari.com', '1720333618', 'Dhaka, Bangladesh', NULL, 'WSTU0Q3AX8Z6LKNK', 'ZqnaIliBMw5uh6hUkdULIz0VexJWgOuT', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(656, 'Mohammad imam', 'kapramart10@gmail.com', '$2y$10$eXvN37/a8B4oMN9.k.FYOeVF0kEccySxoBaOjnEAmE1NduF.g.dbS', 239, 2, 0, 0, 0, 'mohammad-imam_kapramartcom', 'https://kapramart.com/', '1312129126', 'Dhaka Bangladesh', NULL, 'G7MHPT6MMLYI0NBG', 't06ELYyxJwGxXeNyKYDi0c9ba9gtmOTr', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(657, 'Shahabuddin Pathan', 'sp.acc.itp@gmail.com', '$2y$10$r1srdfOS0a7Il4CAorYVue9ssxgOUN3R8vMEfRrr6AgwWClBydot6', 211, 4, 0, 0, 0, 'shahabuddin-pathan_innfeelycom', 'https://innfeely.com', '1709298972', 'Dhaka, Bangladesh', NULL, 'YBRK9GQOTTRNZTD6', 'FYdVsJYr8stytX6okE1vn46N5nkNaml7', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(658, 'shariful hassan khan pathan', 'sharifulpathan@gmail.com', '$2y$10$cUwt7LLEeWHM2QiHL05viOJyHc291WE7K1n49zPFJQu8dx6pUC7XG', 213, 4, 0, 0, 0, 'shariful-hassan-khan-pathan_sofolmartcom', 'https://sofolmart.com', '1715372237', 'Dhaka, Bangladesh', NULL, 'QC4H68HA5QKFA2MZ', 'HPQVvFrAv7IUeKoCG2Sx4Dn15SkIOIYQ', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(659, 'MD kawsur hossain', 'kawsur1988@gmail.com', '$2y$10$oa5lFY1stHl5rC6eb2D2ieLtz9KRwlzS0VEfxO8XTMqfpjBGJ2F1W', 202, 2, 0, 0, 0, 'md-kawsur-hossain_jovaidacom', 'https://jovaida.com', '1747218631', 'Dhaka, Bangladesh', NULL, 'F2ZGKXLVHWOBDIQ4', 'WVnza1IvpqUVsZBhW9Ci2vRUlBC7vL3Z', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(660, 'Monnaf ali', 'monnafail7780@gmail.com', '$2y$10$nUay/6s1kqqL7A/F6Pc0fuk.eV.Fy4w21jfYU1oYnB0sfb0q9CMxe', 216, 4, 0, 0, 0, 'monnaf-ali_hijabancom', 'https://hijaban.com', '1781359306', 'Dhaka, Bangladesh', NULL, 'UEJXWBYCHYSAKZAE', '4MQ4AAsno0kYPNjzZ0J5x4L0OxciXgjU', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(661, 'Moddasser Billa', 'bazarahmart@gamil.com', '$2y$10$/00LtHiw/ZEdUCv39RImJOO3WOMB965ElIBEBm7UQE2fJrx71tgC2', 217, 4, 0, 0, 0, 'moddasser-billa_bazarahmartcom', 'https://bazarahmart.com', '1612884821', 'Dhaka, Bangladesh', NULL, 'YMJQZLJW8ZAINGES', 'py0JDSzs4IEK1tsxX0ZAs9yIEtFjDaaQ', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(662, 'md razzak hossain', 'razzakh294@gmail.com', '$2y$10$CHg.Mx3sZhWE6EBRSbiX8OCX/XOmDyQSS7XxKQ5fjGNVQ9JNh4GfS', 198, 4, 0, 0, 0, 'md-razzak-hossain_magicbazar24com', 'https://magicbazar24.com', '1887555542', 'Dhaka, Bangladesh', NULL, '1R4FEH0390IWLPNN', 'Q6oHrCu3vzjFIrY2RI9si59zCeZdjTPD', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(663, 'Mahbub Alam', 'mohammadshishir01@gmail.com', '$2y$10$D5WHJLnctuvrE81lk7MwnO4nyyEZCJygJf74at2LZ0w2vHzz95c0G', 218, 4, 0, 0, 0, 'mahbub-alam_mahviocom', 'https://mahvio.com', '1731278775', 'Dhaka, Bangladesh', NULL, 'X66ULUHXUVSEKHEU', 'e57pQRrKAR6Qfy4onaFjhsl6tjPEHyiD', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(664, 'Zahirul Hasan Khan', 'zahirul.ericsson@gmail.com', '$2y$10$NsiGPkYcjk5SBucsq1NaN.w2f22FJy6HHYaqC2BzXJ6YWMouipv8O', 219, 4, 0, 0, 0, 'zahirul-hasan-khan_luizeycom', 'https://luizey.com', '1616538865', 'Dhaka, Bangladesh', NULL, '1ZRQ4Y3F5NAQBTT7', 'R29nQmZuPoFNi9pn13XGrwzyjdhDsSiP', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(665, 'MD HARUNUR RASHID', 'mh5917563@gmail.com', '$2y$10$RgOWTy.rlO2A.sEDRjKyWuL9VL29PRLWFWP/vrK8NG8HY6K7f2Wdi', 238, 4, 0, 0, 0, 'md-harunur-rashid_mlookzcom', 'https://mlookz.com', '1792628992', 'Dhaka Bangladesh', NULL, 'YN0ZOBUPFSHNJ6EQ', 'TT4JTYhUTpOHtKgW3x62GWnV6fhrhqzY', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(666, 'md.husain ratan', 'zarabazerbd@gmail.com', '$2y$10$AWeiiurEy0QnZihHXnX4FuycEJEaFqnGCQVHY4nkehv6sbPmFm0WK', 215, 4, 0, 0, 0, 'mdhusain-ratan_tarazmartcom', 'https://tarazmart.com', '1999187666', 'Dhaka, Bangladesh', NULL, 'HI3MEP7ESZJ9U45B', 'lvOljTuKojSSdApeYWFjuypLa9L1dKMQ', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(667, 'si foysal', 'sellvian247@gmail.com', '$2y$10$xp58eTkHkqjzBA3EXxGCpuS6Z.IBsaqIKtUGk5VpEKZJG6XkFOZHy', 220, 4, 0, 0, 0, 'si-foysal_sellviancom', 'https://sellvian.com', '1869646545', 'Dhaka, Bangladesh', NULL, 'TCB9QVVVYICZJYHN', 's0r0P3UObRvXknMW2q9fgPBYS5qCSu2s', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(668, 'md ismaeel hossain', 'mdismaeelhossain@gmail.com', '$2y$10$K/JiNYKBqe.bEGeOPZF.kOuBP3RLEk8pxnyfpaxtKF1ihCpcJQWGS', 196, 4, 0, 0, 0, 'md-ismaeel-hossain_wwwifranmartcom', 'https://www.ifranmart.com', '1737794602', 'Dhaka, Bangladesh', NULL, 'M5TRPVGGUL73YRER', 'g2bkUMpIRTPBy8TlWxVMdLZF1ojLDv4W', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(669, 'Abdur Rashid', 'abdurrashid132358@gmail.com', '$2y$10$KuzkDG16VKL6fXhxLVpafe0Otlk3RY1gIPj1v0i5Bm1u0I9b19p4q', 221, 4, 0, 0, 0, 'abdur-rashid_fabryoncom', 'https://fabryon.com/', '1737619875', 'Dhaka, Bangladesh', NULL, 'HASRGBPFBR6QIUWG', 'L37MTZFCgrEeLeg8l1xOCLzGxGqgspW6', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(670, 'Shovon Ali', 'febrikus.t@gmail.com', '$2y$10$N8wzyLpbCTYW1Kihrjdp8uOnP6P5aHSnw8DjcAelUzSxacG2Pux9u', 222, 4, 0, 0, 0, 'shovon-ali_febrikuscom', 'https://febrikus.com', '1993982594', 'Dhaka, Bangladesh', NULL, 'N4FT6GRMEM3HDDPO', 'Ri0ZLj6gKrz9NWWEniXxfyQWBcfpHpgx', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(671, 'Shamim', 'bongobzr@gmail.com', '$2y$10$oJyCtKN16X2/lOvj4yOblO8BOTvrBUDAzM3HsQPXPbHY9QoLPYoum', 237, 4, 0, 0, 0, 'shamim_bonggohatcom', 'https://bonggohat.com', '1303588142', 'Dhaka, Bangladesh', NULL, 'G1ZMJODYF7RAEMVU', 'c8OCTRq56Q6PHTs1Mr0s3vaID7cL7lBl', 1, '2026-07-28 08:46:38', '2026-07-28 08:46:38'),
(672, 'Mohammad Habibur Rahman', 'habib604466@gmail.com', '$2y$10$s64v1CcYAkcb7gMjmtOZtuMZEUjHWo.RfC86oGYHZ7zdzvzMev/Za', 224, 4, 0, 0, 0, 'mohammad-habibur-rahman_meseemcom', 'https://meseem.com', '1724604466', 'Dhaka, Bangladesh', NULL, 'IH1JUQW5Y0VZMDYZ', 'Jk70D2P0gCnmx9GVOlnUrBg8vGE204mq', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(673, 'Zahirul Islam Chowdhury', 'chowdhury4217@gmail.com', '$2y$10$B2qQUCHf80WXTHJk9cEouuw.R76j3fWBcew3aNuIHfFbSXY1jmqX6', 229, 4, 0, 0, 0, 'zahirul-islam-chowdhury_selviaacom', 'https://selviaa.com', '1823288437', 'Dhaka, Bangladesh', NULL, 'DXNVWPSCGUR1PROH', 'FkNgYEIgpedOuXMMOkQXvlrAlnAdKCf3', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(674, 'Mohammad M Alam', 'mazharul.limra@gmail.com', '$2y$10$.Ny4fVGZyZC8hxVK2nDWuut5QMn198j1qWS.xCQvbuJGq88PjdLY6', 199, 4, 0, 0, 0, 'mohammad-m-alam_gomunacom', 'https://gomuna.com/', '1347761279', 'Dhaka, Bangladesh', NULL, 'X2T5Q554NYR8JFW0', 'AviqOmqPfu5gPMhXYzbLFE4zuOIttesM', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(675, 'Ridoy Sarkar', 'ridoysarker999@gmai.com', '$2y$10$gc2NCN0nOgLy9Aq9aiubfurOYHgIAx0qq6WPArM27A2GWuTFETi7S', 232, 4, 0, 0, 0, 'ridoy-sarkar_lumirozcom', 'https://lumiroz.com', '1722750990', 'Dhaka, Bangladesh', NULL, 'XLTVQZULEYJLSAWK', 'YQTwFhnpVsCmih4kyHl4Uzz6525ryHCp', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(676, 'Md Nurunnabi', 'hellonurunnabibd@gmail.com', '$2y$10$kyfgmhwVlLXDsEWmUenNf.xBr61Zcp4VhDZzTCnXeoGeUJVthhCJq', 233, 4, 0, 0, 0, 'md-nurunnabi_neexshopcom', 'https://neexshop.com', '1754697632', 'Dhaka, Bangladesh', NULL, 'FOFC3AGLE0K9BSJX', 's0sRpcDLPXt9dl1nCqHluXOVae7r6lGY', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(677, 'Manirul Islam', 'atmlikhan7in7@gmail.com', '$2y$10$Sn2JnOlV1L1mJAf3bcw2o.WHjbcxC4sTlRRXuv/eh.RtPuDticW5W', 234, 4, 0, 0, 0, 'manirul-islam_ilebascom', 'https://ilebas.com', '1710421972', 'Dhaka, Bangladesh', NULL, 'TGMPL9TOV7L7C4ME', '34KllYd0Wa1fBkcLt0cV4aLRjOdSntnv', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(678, 'shafikul islam', 'shafikulislambd2@gmail.com', '$2y$10$hk8KUHvWeuMcOEvEvceQ/eVbv4ynwylOWMvQAa5egiuyxhQWV29f.', 194, 4, 0, 0, 0, 'shafikul-islam_saiyedacom', 'https://saiyeda.com', '1812382513', 'Dhaka, Bangladesh', NULL, 'DE0AVIXTNGPUAL2S', 'd0ZStTdHZ8QekLHWzMMmebvV6BTOjxRR', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(679, 'MD rasel', 'mdraselahmed0176@gmail.com', '$2y$10$JGoppUkxTADQ.eGj0EW38uNBtt22kEEnKd1Y7Nqv9BA0/qoO7r0FS', 172, 1, 0, 0, 0, 'md-rasel_goromshopcom', 'https://goromshop.com', '1765002733', 'Dhaka, Bangladesh', NULL, 'LRZRCRIOSHULTBBQ', 'EMBcJ0w9lBxfjkiwNr8Malt3p7v6fsuj', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(680, 'Tanvir Ahmed', 'junayedahmad909@gmail.com', '$2y$10$TzlhDV1snhl2GmEhSl9Sb.GJ.lL9AXxDrzDAzXV0os4bGvltC6eU2', 190, 3, 0, 0, 0, 'tanvir-ahmed_azwaaracom', 'https://azwaara.com', '1319085812', 'Dhaka Bangladesh', NULL, 'EHNWWDKTIW08TQ75', 'fdoRB8KQr4mH2BSGZG0mfzJBfnPSh6Zg', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(681, 'Md. Asraf', 'asrafcpam@gmail.com', '$2y$10$XGtpdEXVfnE.DaNQYD8XVOdEOhaFZTgRjMN31CuyAXQtuGUBaVrey', 189, 1, 0, 0, 0, 'md-asraf_fatamiyacom', 'https://fatamiya.com', '1676739677', 'Dhaka Bangladesh', NULL, 'POZBSPRXBPQ0AECS', 'QNaMqBsZBfxwxxQgDChNLu5wKgztoztP', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(682, 'Kabir Bhuiyan', 'abukiron222@gmail.com', '$2y$10$nK3QMdI.gRPbR0E7qGtRn.6u5RysruxdYnBaBSIgo8NnihBfpPZuS', 188, 6, 0, 0, 0, 'kabir-bhuiyan_bhuiyashopcom', 'https://bhuiyashop.com/', '1892566534', 'Dhaka Bangladesh', NULL, 'YELZYQLNQNLHEVVF', 'XvaSFq2ch8NLEb19jhNMF1hfgOWIhINH', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(683, 'Md Amzad Hossain', 'mdamzadhossain7876@gmail.com', '$2y$10$y8d5qY.CLcqp/Vdpqvd/X.LcH7J9ktWh.p5y7v7yOAOrl6dp6QXU2', 187, 6, 0, 0, 0, 'md-amzad-hossain_choiezzcom', 'https://choiezz.com', '1729667849', 'Dhaka Bangladesh', NULL, 'MP30RNGSD8QGBMY4', 'alZVAX8mdLuYaoJBErQZnkqVDaZQjsTv', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(684, 'Mohammed Eyahia', 'Eyahiatech2000@gmail.com', '$2y$10$HthwgdUeobcWUHMbBnfeD.PzmhJylT3R6HxWhK0PNDFuxhhLieNUK', 186, 4, 0, 0, 0, 'mohammed-eyahia_hamoraacom', 'https://hamoraa.com', '1799030194', 'Dhaka Bangladesh', NULL, '855ER9GY87FKU502', '2sfUKeqCQwpA6MqPGrbRrKhCK3mieU7C', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(685, 'Anika Khatun', 'mdzohirrayhan.nachol@gmail.com', '$2y$10$E1kjWlFSthpnMD4TavlaEe3LSDxlN99eCfEH9Bmrm5qjwpsT57Mae', 185, 6, 0, 0, 0, 'anika-khatun_trastedmartcom', 'https://trastedmart.com/', '1739544791', 'Dhaka Bangladesh', NULL, 'PPLRDJQXVILLJ2U2', 'IuazhMkhf8Xbpd9eB4iBdyA2UTYHV1y0', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(686, 'Kudrat-E-Khuda', 'kudratekhuda2000@gmail.com', '$2y$10$J57ZKZfJbHwngHhOcLLipOmDZ1OGldPJYpdzcrIQJjSmOBvF5jiXe', 184, 6, 0, 0, 0, 'kudrat-e-khuda_mennminicom', 'https://mennmini.com', '1712557339', 'Dhaka Bangladesh', NULL, 'B5WVOACLLAMQCSFV', '98Rr4u54P0V5dfibm0DUKGiZoG6qRNLl', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(687, 'Sharmin Akther', 'globalmart.xyz@gmail.com', '$2y$10$pKckUTYWkTxCIG1NrfRDaeV.CFEBsVplMBPsdFXykkMsSJRIKSzji', 183, 6, 0, 0, 0, 'sharmin-akther_globalmartxyz', 'https://globalmart.xyz', '1611395148', 'Dhaka Bangladesh', NULL, 'CS9QWX1GOEQZ06T3', 'XTjlDJqmG5Bo6UDX5sPnVhNC3v9nVoHJ', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(688, 'Ruhul Amin', 'ruhulmb711@gmail.com', '$2y$10$M7u7GDgUqqxq4uJQJNyhMOJGB2AACTt3aes/qiEUMgcKZ5S71i5VS', 182, 1, 0, 0, 0, 'ruhul-amin_rijmacom', 'https://rijma.com', '1611086925', 'Dhaka Bangladesh', NULL, 'QRLNBIQK43PPDJKN', 'xNBVy8aD4vJSB5v36f5OkgksZOi2c5vh', 1, '2026-07-28 08:46:39', '2026-07-28 08:46:39'),
(689, 'Ismail hossain', 'ismaelhose1986@gmail.com', '$2y$10$XmKMwe/lRnkGCTyeAfIf8eTLh8KEYc47CVJF917ZQ.RF.ar42eRB6', 181, 4, 0, 0, 0, 'ismail-hossain_kidsyancom', 'https://kidsyan.com/', '1887745511', 'Dhaka Bangladesh', NULL, 'PBSWYZDI7VLEXJJZ', 'WhfUt6eScq4ytON68oh2prvosTlhl8Lt', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(690, 'Md Abdul Awal', 'abdulawalbd0@gmail.com', '$2y$10$llVrW23p.yLmOteecMaWuugrQ7C0QeScaKYYF4UyA1xMkv.nozyc2', 180, 4, 0, 0, 0, 'md-abdul-awal_hijabiyancom', 'https://hijabiyan.com', '1793062202', 'Dhaka Bangladesh', NULL, 'WTKMCP07WXI8RAPV', 'mswWqJEwd5KDTmJfS983PbCgmVr25e1c', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(691, 'Sadek Hossain', 'Mdsadek755@gmail.com', '$2y$10$kMrJxw0fHRlzkQcYOAo2u.bKCao1VWZDfVnCITmPHYR4FJzDYla8G', 179, 4, 0, 0, 0, 'sadek-hossain_priyobeecom', 'https://priyobee.com/', '1920771988', 'Dhaka Bangladesh', NULL, '9QJ2AIO2VPEYLQPZ', 'daMRhkAHhywlmpZZTuSlakOzu2DLI02R', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(692, 'MD SHAWON AHMED', 'msaon90@gmail.com', '$2y$10$4nWj7vYGq0BcziwuqRlSUOWvC2umgw8bFVyhh46qufP4oeCV3F2/.', 174, 1, 0, 0, 0, 'md-shawon-ahmed_dropomartcom', 'https://dropomart.com', '1770206351', 'Dhaka, Bangladesh', NULL, '6AJTZSE4VMZOOFGD', 'hFydPR4vnBxyW2ToyfQk6MKRbFJ8gkH9', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(693, 'mufti kazi salahuddin', 'darejannat1996@gmail.com', '$2y$10$8psc1bNsfW/Uauseu8RQ0eXd.G5IX7uw/usB.SoN22CykpawzNjle', 178, 1, 0, 0, 0, 'mufti-kazi-salahuddin_darejannatbdcom', 'https://darejannatbd.com/', '1854136722', 'Dhaka Bangladesh', NULL, 'UMJ3GVTMSBZJJNQH', 'H4wWK3kBVL5zIlNl1xPGZ5gx9Qyj7pof', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(694, 'Emran Hossain Emon', 'martnest08@gmail.com', '$2y$10$Nd1fD5vzU6F6NwxZetRtgOnLIHQu.b39MAS/w8H84.IssTkuWh/sy', 171, 1, 0, 0, 0, 'emran-hossain-emon_nasemartcom', 'https://nasemart.com/', '1843261760', 'Dhaka, Bangladesh', NULL, 'PGAENISCPM8AEIXY', 'BjdjR5VxuOMEz4zvKOzyZSbCTKZVWKbi', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(695, 'Md Tareq Hasan', 'bikroyamart@gmail.com', '$2y$10$AfKz8O9oAZYACUzj1SH5huk727mgtwnVUpLf6T3MZqAgZxgLYjXIa', 177, 4, 0, 0, 0, 'md-tareq-hasan_bikroyamartcom', 'https://bikroyamart.com/', '1855056838', 'Dhaka Bangladesh', NULL, 'M2KLBADXTWXUZ3YU', 'qoTFdiULUsWSW4YGnGf8SeOGA1YOcsh4', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(696, 'Md Anuar Hossain', 'anuarhossainllc@gmail.com', '$2y$10$0Bye/iDKyH2eV.iOvdnXXuT1XHAXYF8SEJu3K3IOYqYtdr3hfliz.', 170, 1, 0, 0, 0, 'md-anuar-hossain_sharinmartcom', 'https://sharinmart.com/', '1950261567', 'Dhaka, Bangladesh', NULL, 'B71NOII0NWC31QTI', 't5GkFUuu75eLCZBoPL7vooiQ2VsulEhX', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(697, 'Mohammad Shahin Abdullah', 'shahinabdullah9811@gmail.com', '$2y$10$hUs0nExYgwzBr/I1UULUnebBc8ENtLVeQoLsJqCmCQCVWsraEhCNK', 169, 1, 0, 0, 0, 'mohammad-shahin-abdullah_miazirhaatcom', 'https://miazirhaat.com/', '1686660571', 'Dhaka, Bangladesh', NULL, 'AA2DHV8W3EZ8SKLT', 'hCls2WsYyX91deJ0k4nZUBTQVJynRKFe', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(698, 'Pias Mustakin', 'Pias24mustakin@gmail.com', '$2y$10$WvIt9sLpX6.JMmvWcEYEmOvCqP2b9aFYnxPvS.wZDvrpxwrlu1wD6', 168, 3, 0, 0, 0, 'pias-mustakin_poxmartcom', 'https://poxmart.com/', '1779331818', 'Dhaka, Bangladesh', NULL, 'Y2F4LE5H4GFIM0KG', 'gJwwuGd8ZZHOB10Njy4Rui6J0fB2bJn4', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(699, 'Shakil Ahamed', 'pmshakil32@gmail.com', '$2y$10$D6tfSczrdRt/MsEKtc/9t.XxIczba1whg/CzKmvg1ApeWXpf94me.', 167, 1, 0, 0, 0, 'shakil-ahamed_modhuricom', 'https://modhuri.com/', '1773294306', 'Dhaka, Bangladesh', NULL, 'GGFODCXUSBNW1LVI', 'kkf9oWN1tEhg3i243APP4k10WgqxpPDP', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(700, 'MD. ABDUR RAZZAK', 'abdurrazzakjr@gmail.com', '$2y$10$yRw.kIUZHpjWqOKerJUo1.nogkOi5nxf6OZFj6.GMiez71JFi9CdG', 166, 4, 0, 0, 0, 'md-abdur-razzak_wwwluxarzocom', 'https://www.luxarzo.com', '1836848018', 'Dhaka, Bangladesh', NULL, 'KLHZ0SFYLSHS4T9W', 'eBS8uDu9JPosb7SWCA2f3bwukdsyVXQV', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(701, 'Nayem', 'alanayem94@gmail.com', '$2y$10$WUDMQTG7ozbv6rnT9FKc6.qy0rZS31eIYDtzAZLnmG1BFwohkDE6m', 165, 1, 0, 0, 0, 'nayem_tstfamilycom', 'https://tstfamily.com/', '1840163292', 'Dhaka, Bangladesh', NULL, 'CKFEZ9CCQOILR9K8', 'aG7UNL8d1iRJeW0op2bq83ShTwLdAPO8', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(702, 'Md Eynul Hoque', 'asashopbd@gmail.com', '$2y$10$l7cddgzuXJghLp71mWX9juftE5tUAp/1YLp0Esdnm2TLNpmpmwI96', 176, 6, 0, 0, 0, 'md-eynul-hoque_asashopbdcom', 'https://asashopbd.com/', '1755362776', 'Dhaka Bangladesh', NULL, 'HXHNS2SFKZDQBYRB', '1oLX3Co9MfHv2QTUbcjsCzjSyrpyBlyI', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(703, 'Sk Tanvir Hasan', 'sktanvirhasan7890@gmail.com', '$2y$10$riDIVZRHQSeJXQu76OHlueUICU42nL4Fmfps0aHq27a/YsSwg/mzu', 164, 4, 0, 0, 0, 'sk-tanvir-hasan_selzeencom', 'https://selzeen.com/', '1839313609', 'Dhaka, Bangladesh', NULL, '5ZWJA6RH4ZAHNLHX', 'mw57BWONVtaJOAtzRolSmNBQV4xhrVIA', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(704, 'Md Amin ulla', 'mdaminu932@gmail.com', '$2y$10$Py3BYiy7hXqdlfx0/ozRxebi/A.7rwpItu6DWRyzYsD4kQI2WIRmm', 163, 4, 0, 0, 0, 'md-amin-ulla_giveshoopcom', 'https://giveshoop.com/', '1818085823', 'Dhaka, Bangladesh', NULL, 'LTRMXHVA2XQSHMSR', '0kMtOq6DX4X6X4RHUNEPfaov6as7KZmg', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(705, 'Muhammad Al-Amin', 'alamin1995kalkini@gmail.com', '$2y$10$DDgupSSnjWCNcLJbxCI30.77IhjhPuIO/t5.p5j1SzM.QrFUsT9C.', 175, 4, 0, 0, 0, 'muhammad-al-amin_baiaahcom', 'https://baiaah.com', '1918379961', 'Dhaka, Bangladesh', NULL, 'OUS2KQMWFXRG1N6E', 'GwTSqgqfdYNkqjBSUIROccsVxJfdjTUs', 1, '2026-07-28 08:46:40', '2026-07-28 08:46:40'),
(706, 'Md Jaman', 'jstube360web@gmail.com', '$2y$10$z9x8gZHwa0nUlaMPBMP9POOl9bLR16vSH0cg/bL0U398XeF8o/D2a', 162, 1, 0, 0, 0, 'md-jaman_nurayatcom', 'https://nurayat.com/', '1776666558', 'Dhaka, Bangladesh', NULL, 'KJDUSAC9SVZ7U1YB', 'x766VkxyTbqxNOyPrQETt4z754R7QoLA', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(707, 'Surajit Kumar Pal', 'surajitkumarpal.sp@gmail.com', '$2y$10$niPe/RNF4byVP8RfdyYS7eQaQfAFcKqJZB3S/q0eb.JL9/PAqeTf2', 161, 4, 0, 0, 0, 'surajit-kumar-pal_ramposecom', 'https://rampose.com/', '1731521919', 'Dhaka, Bangladesh', NULL, 'UMFRQUUWTEFY70BZ', 'B6xKnwYSdUglU9LibpCQWznDY8UiiWTu', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(708, 'Mohibour Rahman', 'mohibourrahman5@gmail.com', '$2y$10$ddYWYI2cMWp3aarpkajB.ezIexHEK3kDZWJfXwKyNMIWDRKq8lJkW', 160, 4, 0, 0, 0, 'mohibour-rahman_nessmartcom', 'https://nessmart.com/', '1865882413', 'Dhaka, Bangladesh', NULL, 'MUSM1DIIHPQG7ITD', 'b9KWZedDstz78M2KA7hqWvBBpofiBR7S', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(709, 'Sheikh Ahmad', 'sheikhjebu@gmail.com', '$2y$10$NZA04dJvoRqZHsTNUasqW.Y4vQlizffR5qyuNpyzh4jprWjqJStMW', 159, 1, 0, 0, 0, 'sheikh-ahmad_bikroyacom', 'https://bikroya.com', '1868322935', 'Dhaka Bangladesh', NULL, 'PUSQ3VSEXRMXUHVA', 'zzf4g4EQc5vMJPYBcRaopkbD9z4IjnpO', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(710, 'Mushahid Miah', 'mushahidali873@gmail.com', '$2y$10$Mme0gOP/E2SCniKVortsT.fDzTQz6G30aqTGB1iycBCAc39SAOAre', 158, 1, 0, 0, 0, 'mushahid-miah_ghorerhubcom', 'https://ghorerhub.com/', '1601594593', 'Dhaka Bangladesh', NULL, 'VIIZXONNRW7RN19T', 'Ya1qRtF6tBdWd5otQfJ2vvTt56mODcZ9', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(711, 'Ismail Hossain', 'hossainismai85@gmail.com', '$2y$10$hyfXdDgtwdZadCuGFQeekurS42xFLil5f0qkY17RyecVNMSy/6fhO', 157, 2, 0, 0, 0, 'ismail-hossain_hajarbdcom', 'https://hajarbd.com/', '1306662666', 'Dhaka Bangladesh', NULL, 'MH0NDO4NAW9KWUME', 'bMh6XC0r6gi6EOeQvvt7irkS4v2Uk824', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(712, 'md ikramul haque milon', 'happiyanbd@gmail.com', '$2y$10$GCUdI5fnwfwp10xq7f.WNul./K0lYOail6V4zFnomZwbNPAp1JjcS', 156, 3, 0, 0, 0, 'md-ikramul-haque-milon_happiyancom', 'https://happiyan.com', '1777175320', 'Dhaka Bangladesh', NULL, 'J0I2O8MHDQQB8WGJ', 'CbyoMgz6DSa2ryCchuvsx7HNs5t55yCG', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(713, 'Nobiul Alam', 'nobiulalam@gmail.com', '$2y$10$mRaPTKLITQFp1n89S.ULZeY7eWF4B4QexEL/OW13TNSAONkWbGA/e', 155, 1, 0, 0, 0, 'nobiul-alam_aabruacom', 'https://aabrua.com', '1726176500', 'Dhaka Bangladesh', NULL, 'LG4EHTZ54UPX98VV', '0v5SXBDtS7WKRPD8N4xnhYBZx27JkI3W', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(714, 'Shakil Hossain', 'shakilkhan1913@gmail.com', '$2y$10$rmgzdN8xtXDOPQRHWQhBWuunKA5AqPlo7ait54//UgnK23gyScDwy', 154, 1, 0, 0, 0, 'shakil-hossain_bazgorcom', 'https://bazgor.com/', '1885564494', 'Dhaka Bangladesh', NULL, 'D4OFDLUKIBCKEVHZ', 'xvKzSI5XQxLHikL54arbKlSDY2F2ltwX', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(715, 'Sahir ali', 'syedsahirali70@gmail.com', '$2y$10$TrTZ7MJh171IfcdJpo7UWuwvx17dWLipEYKE8oUfp6BhysX9056DS', 153, 1, 0, 0, 0, 'sahir-ali_layaanmartcom', 'https://layaanmart.com/', '1941450873', 'Dhaka Bangladesh', NULL, 'UZ1TYYAZ0SPOO7DN', 'csfLVNSvnbZN5tUTAzYHMcWWLUJrlpiB', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(716, 'Md Fahim Islam', 'fahim850189@gmail.com', '$2y$10$6zGIw2FOXasjOBm8qmbVNeHxS/jq3Iz1BeBVkuUoxlb7FSNsdwD7u', 152, 1, 0, 0, 0, 'md-fahim-islam_trayavocom', 'https://trayavo.com/', '1938026211', 'Dhaka Bangladesh', NULL, 'MNYBD11DGUUPSZZD', '7igL25CmkqPGlNIfAPXHy2N82JSQrol5', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(717, 'MD. Ibrahim', 'ibrahimconcord@gmail.com', '$2y$10$n887yOsLGi.jFy1aWR1lWOWNIJYBy5x/pS4BwHyultPJviVpzNXme', 151, 4, 0, 0, 0, 'md-ibrahim_nooriyancom', 'https://nooriyan.com/', '1911493087', 'Dhaka Bangladesh', NULL, 'DDHA0TNYHYAOELA5', 'KxYZsLUR6hNfIkFUTRMJJt72TUQxityB', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(718, 'Md. Zabed Hussain', 'zabedcyberdyne@gmail.com', '$2y$10$WZskWWinvwmS7aTRYksH4.S4.GaNUjMapCB3UVcUTCvFvEDNrf7wG', 150, 4, 0, 0, 0, 'md-zabed-hussain_easymarticom', 'https://easymarti.com/', '1719374604', 'Dhaka Bangladesh', NULL, '2YETP6XT0BSAAMB9', 'J43yuVGqsiRCFcMo3WO2lpLxCZjtc0Wk', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(719, 'SAHDATH HOSSAIN', 'sahadah2025@gmail.com', '$2y$10$jHOCRRoA932gUYF2aMuZSepvOxFgDDRI3oUCEROJj669A5TM3bEAy', 149, 4, 0, 0, 0, 'sahdath-hossain_sahadahcom', 'https://sahadah.com/', '1715264524', 'Dhaka Bangladesh', NULL, 'M3NJHDSNLXSS0ILY', 'zETxRL4A1wpOZVaHSTp26TeNmOjJ6aFN', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(720, 'Mohammad Mizanur Rahman', 'mmrahmanwarrior@gmail.com', '$2y$10$ZUzbDWYe.x3Ys4URxg7Mq.osoPmrFHIJgjxC22qUJ6Ukn76mfdOSO', 148, 4, 0, 0, 0, 'mohammad-mizanur-rahman_laywadecom', 'https://laywade.com', '1711317380', 'Dhaka Bangladesh', NULL, 'SZNHGBWMODNSWM3A', 'O06JjH37qesG3TdcycKNU5pBPLnvy1aj', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(721, 'MD ANISUR RAHMAN', 'anisurfrost139@gmail.com', '$2y$10$KULke.5Oevql8r44vs.9duspwrvlHErz/iwahA9a8rj/8FLunMV06', 147, 2, 0, 0, 0, 'md-anisur-rahman_azlarycom', 'https://azlary.com', '1715378567', 'Dhaka Bangladesh', NULL, '7YUQ0DT1MGQIXVHY', 'kLsvAJ96aulj8pXoMz2gsGjMQg8P0PQi', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(722, 'Yousuf Asraf', 'noavaly@gmail.com', '$2y$10$p6A9BNCcvUDH8H2DiLT1qOkVWBx/yUOr3/djFPDx6fz3yK4tN1Az6', 125, 1, 0, 0, 0, 'yousuf-asraf_noavalycom', 'http://Noavaly.com', '1847121272', 'Korimpur, Chowmuhani, Begumgonj, Noakhali', NULL, 'HAPMWR9DL691SSAC', 'PbtunBMKnbHE6CjgI9ASQ7neY9C6da17', 1, '2026-07-28 08:46:41', '2026-07-28 08:46:41'),
(723, 'Md. Murad Islam', 'mdmuradi633@gmail.com', '$2y$10$n7vE4m6jBN9keTh8va9mq.9A.wUiC748rEziljjX2v7nNauY2CoCS', 146, 2, 0, 0, 0, 'md-murad-islam_minaramartcom', 'https://minaramart.com', '1799554158', 'Dhaka Bangladesh', NULL, 'L0ITST5LH6E2HB7J', 'sURNZfElCi1SaXqlkkiQVoMB4T4U3SNg', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(724, 'abu bokkor siddique', 'ashiktasfik@gmail.com', '$2y$10$xEGLYn3AijK7ci3RxxGr4eZUUVuxLzzHQhiW.asf/FHta1IGudBfu', 145, 4, 0, 0, 0, 'abu-bokkor-siddique_happiyazcom', 'https://happiyaz.com/', '1750366180', 'Dhaka Bangladesh', NULL, 'FGA9LIZJIJYVJPOJ', '2qDTLDn6QD2KvYjM3Q8KYAtzhT11N41w', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(725, 'FOKRUL ISLAM', 'HAFIZMDFOKRULISLAM1994@GMAIL.COM', '$2y$10$FraqjSIw/LzV3jrqHeOYQuE0CeZOd1uFY8eHc5Pt5VHedaeShvgGi', 144, 4, 0, 0, 0, 'fokrul-islam_taybabazarcom', 'https://taybabazar.com/', '1786366086', 'Dhaka Bangladesh', NULL, 'ZOEAGXBITCDP358P', 'UgnRagH1cNtYHpCWCkwTWnOOT2z3d2l3', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(726, 'MD.Nurul Absar', 'nurul.absarbm@gmail.com', '$2y$10$Ekcuy8lGBxWu9mvZQewj7OYEPDiRqW4ui0BKLjNZrqDxlvc1QxZR.', 143, 2, 0, 0, 0, 'mdnurul-absar_taqdirmartcom', 'https://taqdirmart.com', '1304405960', 'Dhaka Bangladesh', NULL, 'IFVBIGAJS9Q96KSS', 'JJYeO9Lkmi67a3K1XvAzssSMnW8RTYnH', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(727, 'Shadhin Mondol', 'Shadhin34mondol@gmail.com', '$2y$10$HANl/1HOI1GkyLTqphDzdOY1a60loR/Xhqh9YXnALfUs.PXRfmjGK', 142, 3, 0, 0, 0, 'shadhin-mondol_laberbazarcom', 'https://laberbazar.com/', '1757919529', 'Dhaka Bangladesh', NULL, 'DLU3A7LTOPGYFHKI', 'IskPtKqV7rmKvMcdgcg2e6pKATZSTW1G', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(728, 'Md. Shojeb Rana', 'shojebrana26737@gmail.com', '$2y$10$1HSaezJ0zeyx25geyJP7v.bkuQE.9UVQ1cVyMQoHvL6XMHVZ9RbRu', 141, 4, 0, 0, 0, 'md-shojeb-rana_nesscartcom', 'https://nesscart.com/', '1303168866', 'Dhaka Bangladesh', NULL, 'RN4WVSOTOZNHEFVF', 'Xue5zTWrdPXqWktBF8DQPOLm3Sj5DFA8', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(729, 'Tawhidul Islam', 'mdtawhidbsl150@gmail.com', '$2y$10$9R4Ki85X8T4ETkE71Pau7e3aSs3ecCiVxNi.ENBR8wCXAsjZ5h15a', 140, 1, 0, 0, 0, 'tawhidul-islam_revalmartcom', 'https://revalmart.com/', '1782402699', 'Dhaka Bangladesh', NULL, 'K2XIPYCJYP6GDMBY', 'F4CwsIVAXZ8V9cQ4RCD8EiG9m4cP8aof', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(730, 'Md Monir Hossain', 'edrazcom120@gmail.com', '$2y$10$sy0Rem19gIR/PfZMVDggve3L1KSccW1aA6bN7oSEGydVtyB9BGaLW', 139, 4, 0, 0, 0, 'md-monir-hossain_edrazcom', 'https://edraz.com', '1748444476', 'Dhaka Bangladesh', NULL, 'CJ45JPDOELAIN3JC', 'ycIvdnlVtMbIRbu3ZqNrO8p4ZbABRdXy', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(731, 'Md Rakibul Hasan Raj', 'trustedshopbd0@gmail.com', '$2y$10$Th2A19WqGhAP7LKXW3xkl.8hndrrTPg0APiw1ACE9jmB9.HlmAXWa', 138, 1, 0, 0, 0, 'md-rakibul-hasan-raj_tsbbazarcom', 'https://tsbbazar.com', '1860200914', 'Dhaka Bangladesh', NULL, 'SNASQSLXPGCFSXHJ', 'dWQMmiLRQVzi8RnEoAW4ZIM9Z07ftWR0', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(732, 'Mohammad Ismail hossain', 'jorurot24@gmail.com', '$2y$10$zVzlKFF3qESMX.GfZ9nGpewDbYAuMtrhw3X255wXPYXJQ/pqc/w2m', 137, 4, 0, 0, 0, 'mohammad-ismail-hossain_jorurotcom', 'https://jorurot.com', '1949822772', 'Dhaka Bangladesh', NULL, '7ZYZL3WN4DIEUPO7', 'Yi0yOmvV7W5lSFmBqWuwfGBUU66iuHZo', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(733, 'Md. Rakibuzzaman', 'mzaman12484@gmail.com', '$2y$10$Iu4PwqBFOxXB7FycbSlUfePHy9mjEVbWG8KbvHbSrXOzTH0tuSXSC', 136, 2, 0, 0, 0, 'md-rakibuzzaman_clothszcom', 'https://clothsz.com', '1708555048', 'Dhaka Bangladesh', NULL, 'ZV8UOVVNMZOTQWVB', 'kHPRDdkAz0C4TbxLDuVjRLnAotOqKpox', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(734, 'MD ASADUZZAMAN', 'asadmath56@gmail.com', '$2y$10$bSHGMjrFUzY/rGvrVffcRu0NrgzTBmQRSL6kcW7eNXG3M414aW90S', 135, 1, 0, 0, 0, 'md-asaduzzaman_monakmartcom', 'https://monakmart.com', '1571778489', 'Dhaka Bangladesh', NULL, 'LUI49AL5P1V2POKF', 'sVXiS4PsLFXCvlmTVBtHBUv1Ti0UHCom', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(735, 'Md Jahin Miah', 'mdjahinmiah@gmail.com', '$2y$10$7eqTwZHw8TRwC/wFdugUx.HapGmFqEphBZCnRiAIQXxHB.0AylUGW', 134, 4, 0, 0, 0, 'md-jahin-miah_natunmartcom', 'https://natunmart.com', '1786960823', 'Dhaka Bangladesh', NULL, 'XHP234LFLDMUGERI', 'O7lYMlg12pUAdx5DnmUDQrSSxwnoa8tp', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(736, 'Kazi Md Tamim', 'faithlyshop1@gmail.com', '$2y$10$aFY2nGd7.GN4VcM3qXQTje8rU7b9kkBwbf/71py3HRRL1aIQtCTy.', 133, 1, 0, 0, 0, 'kazi-md-tamim_faithlyshopcom', 'https://faithlyshop.com', '1611681103', 'Dhaka Bangladesh', NULL, 'ZJQBPN0V3IDGFAZM', 'NIlkJq469hIf8oehIPTRuakFLDIEABH4', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(737, 'Raju Ahmed', 'im.raju9980@gmail.com', '$2y$10$NberFyKMfzPcYvF8xsZ3SOTmo/U1izmP4v5nMn202GihsTZz75kTC', 132, 4, 0, 0, 0, 'raju-ahmed_drooplarcom', 'https://drooplar.com', '1819977276', 'Dhaka Bangladesh', NULL, 'AGT8RYXZLCXPNFOL', 'oKNkcmF9BCLb2gaXOsxNDN6uanub8dXg', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(738, 'MD MAHBUBUR RAHMAN', 'mahbub21kmr@gmail.com', '$2y$10$LD3puWygfLzKot7s0Nt6mugUmSYA2gIFzR.VeQ3fSB95teCFpXHbi', 131, 4, 0, 0, 0, 'md-mahbubur-rahman_jissfaircom', 'https://jissfair.com', '1834707172', 'Dhaka Bangladesh', NULL, '7CYVA7FWCDVKDU4N', 'fnzJ9JL4Cvz5uA71Z6bCy6e5kdQeKmLD', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(739, 'Soied Ahammed', 'soiedahammed98@gmail.com', '$2y$10$S6VwTOEcv9RNPwSFpTZPce5SyVvKpsOonwwbk4w.kZcMiZk.uZQWW', 130, 1, 0, 0, 0, 'soied-ahammed_flixfashioncom', 'https://flixfashion.com', '1619496718', 'Dhaka Bangladesh', NULL, 'COYE6WUYT6IDUVJH', 'ZYjnNVOffCrbKeF03eF0hlLOMMRcO4xQ', 1, '2026-07-28 08:46:42', '2026-07-28 08:46:42'),
(740, 'Mominul huque', 'mominsultani100@gmail.com', '$2y$10$P8Xl9p4MjMHIn5Qbwdh3aeXnqAQgTzqXzq5ZE47g1BxF18TxAfsSW', 129, 4, 0, 0, 0, 'mominul-huque_sajedbdcom', 'https://sajedbd.com', '1799737116', 'Dhaka Bangladesh', NULL, 'B2MTDHQDN6JWA5JD', 'fuERZEcyYPj9MC7BIZR4of0qGvlFQtdg', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(741, 'Md.Tarequl Islam', 'tarikul8243@gmail.com', '$2y$10$KSjEPFBIbI1rAD5NhHpCTuRhVKd0neG6FTlzBA3FKtIIHPMv/L7MG', 128, 4, 0, 0, 0, 'mdtarequl-islam_nurzoncom', 'https://nurzon.com/', '1736453739', 'Dhaka Bangladesh', NULL, 'ISCUN3VCGI9UBNVJ', 'FMHCd3Y3da6iB7eEiY60wSP4C6tvbADq', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(742, 'Md emdadul haque', 'emdadul690@gmail.com', '$2y$10$.yiKiGkfSOkYcdbCifN1t.UVECQ512xywxgOblTBucTjg8HsFuUyW', 127, 4, 0, 0, 0, 'md-emdadul-haque_raishalcom', 'https://raishal.com', '1922357885', 'Dhaka Bangladesh', NULL, 'HGQE1BJ1LYDHR6HR', 'OxEUYXu0iI3KWuLhaTynkELqh51qkLMr', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(743, 'Jubaer', 'miajubaer79@gmail.com', '$2y$10$L1Pe5M2R.6MKw5NEtYruX.zIfcw4Iu0RKHyQmfLPW0D.8t28QrT5O', 126, 3, 0, 0, 0, 'jubaer_jayanshopcom', 'https://jayanshop.com/', '1765672258', 'Dhaka Bangladesh', NULL, 'ZZR4PF2ZWIFWV9ZZ', 'ZSFhPY8A7UOvjacsfzQvKWQFfdbYhzUm', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(744, 'Md Sohel Rayhan', 'mdsohelrayhan111c@gmail.com', '$2y$10$yn7AaDd5toS3gOJXc1vxpuF2C/v9vyGM/7kIJnvqYTbpFZRIH/SSu', 123, 1, 0, 0, 0, 'md-sohel-rayhan_pranerbazarcom', 'https://pranerbazar.com/', '1626954826', 'Dhaka Bangladesh', NULL, 'CR7SUB8SCOBOYYE2', 'cyr6MqJ1ZyfCFhIdTauIUstVGGLZyZxO', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(745, 'Md Jewel', 'moniruzzamanjewel0007@gmail.com', '$2y$10$gZqNG..A.UBqZ2JtqXSgGuKOHGrQChlrQZZGKIXyA9pOuwNjQDKQK', 122, 6, 0, 0, 0, 'md-jewel_tazahatcom', 'https://tazahat.com/', '1712446196', 'Dhaka Bangladesh', NULL, 'TI3SKSPYPTJMIL1G', 'STk9nXOBHmby3i1JXvr4ESoni0eFDQxG', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(746, 'A K M Mohiuddin', 'akmmohiuddinxenrtd@gmail.com', '$2y$10$PYrpIdjCrl5GAvbxV59qC.RgNDlwRAWLC10wlXXcBvfeD7ZOl2AsW', 121, 6, 0, 0, 0, 'a-k-m-mohiuddin_wwwbikolposhop', 'https://www.bikolpo.shop/', '1712033678', 'Dhaka Bangladesh', NULL, 'VPNIELNVGYXBMXLF', 'xoQDmR5hQHRTPPDetnoNx6WcObla2VPL', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(747, 'Md. Rezaul Karim', 'rezabqn@gmail.com', '$2y$10$/m7sw4z5YlD3xwy5VTCTve7Oc.YolFFiTUIT13b5DPwepLSBlv4PS', 120, 4, 0, 0, 0, 'md-rezaul-karim_labbaeqcom', 'https://labbaeq.com/', '1911950114', 'Dhaka Bangladesh', NULL, 'B23DVODMEWTCPYTR', 'EPZak2VhAO056MsqhlyGhG27De1a991C', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(748, 'Noor Muhammad', 'noormohammad2271@gmail.com', '$2y$10$1E3fo6NYJ6qlPBHi87WVv.04oMyFQEF1.0KozkKZWhHv87Z9FurPm', 119, 4, 0, 0, 0, 'noor-muhammad_luxfiacom', 'https://luxfia.com/', '1610771245', 'Dhaka Bangladesh', NULL, '5LO3GOY0CHRYUAXX', 'GHAfKlwzTVzIStRaz829oU4euskLfaUM', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(749, 'Mohidul islam', 'mohidul.islam5604@gmail.com', '$2y$10$C9mTRFLO0rjH7.6aHMw6W.FnldKGot7e/bA2EFa0fs65WuudCI4Zm', 118, 4, 0, 0, 0, 'mohidul-islam_horhameshacom', 'https://horhamesha.com/', '1924915580', 'Dhaka Bangladesh', NULL, 'GYMAKWDK9GESCYMX', '4WqOE4oJT6JLuZSvadpuRLNn2Z8iBjYA', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(750, 'MD.YOUSUF BHUIYAN', 'mdyousuf.dce@gmail.com', '$2y$10$jCwniTmkwhDxsrRPplYlUesUC08vj0RFCurhqkuyLUJkDQLG.fzha', 117, 2, 0, 0, 0, 'mdyousuf-bhuiyan_suqnestcom', 'https://suqnest.com/', '1861166472', 'Dhaka Bangladesh', NULL, 'OO3TPKFYE3E60OFM', 'XmbdTrPEGuAkv4OnzaHAPFF2oCqZrukL', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(751, 'Md. Sayedur Rahman', 'sayed650@gmail.com', '$2y$10$xG5RqByMyVugLs59/wKoj.4nuxBL5x0B5AZ7gkHjH.AkmkXlrK4ne', 116, 2, 0, 0, 0, 'md-sayedur-rahman_tazowacom', 'https://tazowa.com/', '1913480452', 'Dhaka Bangladesh', NULL, 'QADQ79UZSEOU6YFC', 'xJRfqJlzPTN5fD7jUT0CuJ4iSAL9Oe83', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(752, 'Rafiqul Islam', 'rafiqulsarkarbd@gmail.com', '$2y$10$oeGuOTwsNsuGogo9hQ3wZe58dKzl2sUDL2zuo7DLBEERvRzYmgGLG', 115, 2, 0, 0, 0, 'rafiqul-islam_rafarosecom', 'https://rafarose.com/', '1710850034', 'Dhaka Bangladesh', NULL, 'RJZ5QUWMFPGTFIZB', 'mhX598yp0UmaREYvtjBwzbyRNF5SoUbd', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(753, 'Md Barat Ali', 'baratali2513@gmail.com', '$2y$10$YNtCfCb7IcdWeNjkIBOT6u4uoXVtA0idUXyZ0ZzPDTzKVGEaiw3xq', 114, 2, 0, 0, 0, 'md-barat-ali_trandozcom', 'https://trandoz.com/', '1860751784', 'Dhaka Bangladesh', NULL, '4DDABX1XZSZ3TJCJ', '2vDwIV72qTGjvzw5GponI3tMJi7wWqNX', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(754, 'MUHAIMIN AHMED NADIM', 'ds.ahmed.new@gmail.com', '$2y$10$UvHZ0KeSoG3DT76zMeVkYOWxrJLSytqZTq0cZNnxX/48eXgZSzgt6', 113, 1, 0, 0, 0, 'muhaimin-ahmed-nadim_lookshoopcom', 'https://lookshoop.com/', '1756016641', 'Dhaka Bangladesh', NULL, 'DDADKPKCIMTUROHM', 'sjAkwfryESwz75UR1JHIZbkCuNZ6ZwxN', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(755, 'Eshrat Jahan', 'eshratjahanmarketer550@gmail.com', '$2y$10$ePULb478IQpRNR6u4a.5FuKJ1UJKytrWkg7MXW0XoTfcYHWmu/0o.', 112, 1, 0, 0, 0, 'eshrat-jahan_fabrinshopcom', 'https://fabrinshop.com/', '1616488922', 'Dhaka Bangladesh', NULL, 'YHV1G5JFBL8BVPFL', '0vBewizJRYN5ZOVmeodHCfWoYMN4YtCJ', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(756, 'MOHAMMAD MAHMUDUL HASAN', 'mahmudh5474@gmail.com', '$2y$10$H3V1.1DtPT0Zxsua./2mpewclpTUvJ5gnuPJnGZNg4BnBMQqdDKAi', 111, 1, 0, 0, 0, 'mohammad-mahmudul-hasan_uposhmcom', 'https://uposhm.com/', '96657185274', 'Dhaka Bangladesh', NULL, 'ZRJYTJ4ONRMGPFYB', 'qeLBNeMpeBIMygpDFT3FNtbbVDSNnYcP', 1, '2026-07-28 08:46:43', '2026-07-28 08:46:43'),
(757, 'Md Monirujjaman', 'mdmonirs19801@gmail.com', '$2y$10$m4FNbUwEKvewYpDQZ5jYm.Py5Edm0YEAOEEYgmhDNrgLO3Agn8i.i', 110, 1, 0, 0, 0, 'md-monirujjaman_flysopcom', 'https://flysop.com/', '1404896134', 'Dhaka Bangladesh', NULL, 'UZ8BFCPL1GYGI9CX', 'fcXPJLByDRO0AzBGQLDiI8KKCYiqKKIo', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(758, 'Syed Rajib Al Rashed', 'syedrajibalrashed@gmail.com', '$2y$10$FIFOEToh9D382MHZvjjra.d..gNZt/UNIeJqHUHfDCeDo3aDpayru', 109, 1, 0, 0, 0, 'syed-rajib-al-rashed_haat365com', 'https://haat365.com/', '1610001702', 'Dhaka Bangladesh', NULL, 'AZEJK2UULVNO1PAE', 'loLQSo4GMEHD1u9qAd7GWpESeAI0iO3H', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(759, 'Md Rofiqul Islam', 'islammdrofiqulgm@gmail.com', '$2y$10$spcVFTd2lNnzPi0n7V9Exu0xXamp/G2SwmnW1LAXsSkZNALyu7ZWW', 108, 3, 0, 0, 0, 'md-rofiqul-islam_eshopdeshcom', 'https://eshopdesh.com/', '1732709151', 'Dhaka Bangladesh', NULL, 'WEFHKHAD7INMB7U3', 'NIz5sePcqYuo1dAxlHlHL5Fv0nRswgMP', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44');
INSERT INTO `dropshippers` (`id`, `name`, `email`, `password`, `dropshipper_id`, `package_id`, `total_deposit`, `total_credit`, `total_withdraw`, `user_name`, `domain_name`, `phone`, `address`, `image`, `app_key`, `app_secret`, `is_approved`, `created_at`, `updated_at`) VALUES
(760, 'Tofazzal Bhuiyan', 'btofazzal556@gmail.com', '$2y$10$Gucg2KNHVADwWFCpOWJU6uivyWQxvAWHSFNPmVn4IzpK6DDYlCCjW', 107, 3, 0, 0, 0, 'tofazzal-bhuiyan_tawfaacom', 'https://tawfaa.com/', '1308422616', 'Dhaka Bangladesh', NULL, 'VUMECKIBQ1X0UNIH', 'uy0A0VlK9LETNAIbWiJU8pzcaetvdSzM', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(761, 'Shakil Mahmud', 'shakilsimanto2017@gmail.com', '$2y$10$LkeMmmvuehg5BKcsfJta2.gOILlyYcCYWxrQKGmUN6Twtziebxj6y', 106, 3, 0, 0, 0, 'shakil-mahmud_manjeelcom', 'https://manjeel.com/', '1763763321', 'Dhaka Bangladesh', NULL, 'PBP30XBU9ASEHYLR', '8j8UCdGpifgHVjiTNj7NnmqX0xl6TMuH', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(762, 'MOHAMMED SAYKAT', 'msbbazaar@gmail.com', '$2y$10$PGH/6sDfw/Y821skKV3dBeH3.lD7kXnAor3Cw5ud3Z0D/cPpKkbTy', 105, 4, 0, 0, 0, 'mohammed-saykat_msbbazaarcom', 'https://msbbazaar.com/', '97156789006', 'Dhaka Bangladesh', NULL, 'EZHVSOU40RIFG7TH', 'Is1gUtMWzecilNuozLpJM0blBYBX8lW0', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(763, 'Mohammad Jubayer', 'mdjodayer337@gmail.com', '$2y$10$gLtbka/iiJx6Z5kiJfS9vOzAb8PJsnilRmtjs3VN0bVPvh0VK2RcG', 104, 4, 0, 0, 0, 'mohammad-jubayer_lackmacom', 'https://lackma.com/', '1844863930', 'Dhaka Bangladesh', NULL, 'FQ1YPGYICXQEDBQI', 'Vj8iZ7ZTq0WKThZIaY2KppLHdQklHwni', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(764, 'Nur Nahiyan', 'nahiyan241@gmail.com', '$2y$10$mkem97JKhnvsUsaa.7nlY.5UWKrGHA.s8KCzqssgi1kQhTqlUQnJG', 103, 4, 0, 0, 0, 'nur-nahiyan_sellduckcom', 'https://sellduck.com/', '1601001203', 'Dhaka Bangladesh', NULL, 'P8RZH7I5SRQHODMA', 'BRJBvUsULKnkyh87OWr0mFzk19nzhxnF', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(765, 'Md Rafiqul Islam', 'khadimul.quranbd@gmail.com', '$2y$10$A/XY1COksP4KcfoJswDZW.MUuyOcmdqk4aToPjCGZIklXZ2ldqRg2', 102, 4, 0, 0, 0, 'md-rafiqul-islam_tubawearcom', 'https://tubawear.com/', '1765135890', 'Dhaka Bangladesh', NULL, 'Z8EG9TH9MNOWRCLF', 'vCWnEjXXzP3yNzXaUaqIH2nJ3IWwOe3t', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(766, 'Md. Mukhlesur Rahman', 'mukhlesurr52@gmail.com', '$2y$10$sNddDVkfsAybJh5IzQVjB.8z9.i30dTQ7fAx4cdcUIpG22PVJDfBO', 100, 4, 0, 0, 0, 'md-mukhlesur-rahman_fabooracom', 'https://faboora.com/', '1726472072', 'Dhaka Bangladesh', NULL, 'ZVMDFA0KLZYBRXQF', '8IFmEVq6aBMovVcWzdVIPf1bndebIMuu', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(767, 'Ab.aziz', 'abazizsorkar63@gmail.com', '$2y$10$MIhZFT1g2cnOJMYlrZPkC.IStGb6meh8TPJY28WqqBo5GafSdyGg6', 99, 4, 0, 0, 0, 'abaziz_dropermancom', 'https://droperman.com/', '1825863899', 'Dhaka Bangladesh', NULL, 'RKGV7HGDU8RKNV2Q', 'BwjVReBjo55STscLRuLQkt705l4wK7LS', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(768, 'Murtuza joni', 'zamjony24@gmail.com', '$2y$10$PB7CEzJ5iTKPaZtEHC3O9ux5Sxso6b4ymgFQXiSaxnvsIHab9l3Qe', 98, 4, 0, 0, 0, 'murtuza-joni_mayabiyancom', 'https://mayabiyan.com/', '1789591862', 'Dhaka Bangladesh', NULL, 'OYPETRPNKWWRLHUF', 'qiJor53sjmCK8PBjfGGuAQ4n0IFRvoL2', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(769, 'ZAHIDUL ISLAM', 'mastercomputer1992@gmail.com', '$2y$10$KXWG74C07jsF7qblxHp9TOFpIWBkmYTgXBEDKWY8x8gwYlNcZtY0m', 97, 4, 0, 0, 0, 'zahidul-islam_ikrammartcom', 'https://ikrammart.com/', '1727144987', 'Dhaka Bangladesh', NULL, 'OE8TV4V3PEMUOHI8', 'aXnEnk5OJHEOWS06HtBMxadTCnZvRLhK', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(770, 'Md. Nadir Hasan', 'ruchirazworld@gmail.com', '$2y$10$osX/FUbYOmFf3mQlTfM9r.wlvVTWNqm.U7RQdEXunkSoXC2QCRkGW', 96, 4, 0, 0, 0, 'md-nadir-hasan_ruchirazcom', 'https://ruchiraz.com/', '1722389948', 'Dhaka Bangladesh', NULL, 'FJKOGXBCTJDPRESM', 'jhJEs3oi6DBD0Rll9nsT1OofDG85chfS', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(771, 'MD SABUJ MIAH', 'mohammadsabuj158@gmail.com', '$2y$10$jWgnu349og3WziMp6jZVqeodc1HqVjgL6/m33WpeJYdqBBwqbhC/i', 95, 4, 0, 0, 0, 'md-sabuj-miah_jadrozcom', 'https://jadroz.com/', '96650175846', 'Dhaka Bangladesh', NULL, 'IAJF6AC1D2VSUTKD', 'eKl2luTvI0MQgIl6nVZtBpnHzg5MvuPh', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(772, 'MD.Shaharir Ahamed', 'mdshahariarahamed47@gmail.com', '$2y$10$scyDdm9RlgUVWMZWoFls4.sIq.5GFzu8j5yBE1R5mW12eFp2MfBs.', 94, 4, 0, 0, 0, 'mdshaharir-ahamed_eynikcom', 'https://eyneek.com/', '1521738144', 'Dhaka Bangladesh', NULL, 'VBK4IRC97GONGRBJ', 'ZEnRRdd5j8mh60uDAEaNNFxivRLm9LXR', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(773, 'Mojammal Hoque', 'mojammalhoqueb27@gmail.com', '$2y$10$yaEpxYJvlOTuEvV92UoRm.ZLRK3x8T4LU3THVWzJPXC8uFku3HmB.', 93, 4, 0, 0, 0, 'mojammal-hoque_sototazcom', 'https://sototaz.com/', '1738974241', 'Dhaka Bangladesh', NULL, 'B0LKEIAVNQENCGQS', 'dSEDHQx5cipIMMOswDxog9z1CbpDMKG9', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(774, 'Md Habilullah sarkar', 'Fahaviyacom@gmail.com', '$2y$10$w6T2ZmkgWkKULoRBk0/I..uJyWZSiK0iC0fKX115bD4o.uqL0jpQC', 92, 4, 0, 0, 0, 'md-habilullah-sarkar_fahaviyacom', 'https://fahaviya.com/', '1711521478', 'Dhaka Bangladesh', NULL, 'T8ZM46ROY8GZKG7V', 'yqcKzxz87gWAYE3iDjXNptXoS8KRMo82', 1, '2026-07-28 08:46:44', '2026-07-28 08:46:44'),
(775, 'Milon Roy', 'roymilon581@gmail.com', '$2y$10$YbBPCXUQcRbIYM4FHfaaCOiFRtlAgK9gfbWYSVg5rpM.7ru9u8sw.', 91, 4, 0, 0, 0, 'milon-roy_tuviyancom', 'https://tuviyan.com/', '1774516025', 'Dhaka Bangladesh', NULL, 'WFQXHCY8EEZMMHXP', 'i2U4Cg2qFIB1HYrB7Db703HQ4tiOi9hC', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(776, 'MD Jakir Hossain', 'h.m.jakir1234@gmail.com', '$2y$10$z5st8DBOBxEVVfUd79pp3.FF3Hw4lrUuZOFm35VRqNafle7Uj2F.W', 90, 4, 0, 0, 0, 'md-jakir-hossain_wafiyancom', 'https://wafiyan.com', '1735676012', 'Dhaka Bangladesh', NULL, 'KL4YNHEL7YQWSWON', 'bUJEuuvqoPF37batQStmOQLV3IMlFlqS', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(777, 'MD. Noman', 'nomanroman44@gmail.com', '$2y$10$FxTZg5aPxECEGUvq11hsNOGRfVy.df4svzWRtLQfqHP2yN/pd5SZ.', 89, 4, 0, 0, 0, 'md-noman_lntraaderscom', 'https://lntraaders.com', '1916433997', 'Dhaka Bangladesh', NULL, 'XDZ3OA7LYOZP2JXY', 'TrempF9Jjmxzh2QQrkLwcFVW0XXaFl27', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(778, 'MD.Nurnobi Antor', 'ahmedantor205@gmail.com', '$2y$10$dTjaIs.Ha4t0dOAW.NV7AeAoK9C6VYQkESPB57lsCFzL8jjp8JWw.', 88, 4, 0, 0, 0, 'mdnurnobi-antor_khimaricom', 'https://khimari.com/', '1748496833', 'Dhaka Bangladesh', NULL, 'S5FDYDMGZTMG9DIV', 'IZqO5Ds9PPTjvUvN3Z5Vn6agP20wfLqN', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(779, 'MD Rahmatulla', 'mrahmatullahstu@gmail.com', '$2y$10$IoxGBTSGdKS24ASkd9AcqekNQisHQd8Fi/BVk8mG.ztu97WNtndru', 86, 4, 0, 0, 0, 'md-rahmatulla_ahjabcom', 'https://ahjab.com', '1733555725', 'Dhaka Bangladesh', NULL, 'WUCVJIQKFGO5IOZC', 'iKfHkfg6ZPoyvjrH37dCueTnCcQK2iWI', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(780, 'Robiul Mia', 'robiulmiab140@gmail.com', '$2y$10$OETFdNoMKeKpbKZaTOgwPehTQ5Hbjchj0ewTkl.veY4DpgK6VCVz2', 85, 4, 0, 0, 0, 'robiul-mia_fashniocom', 'https://fashnio.com', '1785497954', 'Dhaka Bangladesh', NULL, 'RCB4Y9YRTWEW9FPF', 'ttpqBODxH8jSiWVuek31de75HKIjYEio', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(781, 'Mohammad Mahabubur Rahma', 'mdmahabuburr89@gmail.com', '$2y$10$gcIOUKcJPQJtRGKTQia4iu4rAmCRH4BPwjBaz94Vxj.mruG4XUhN.', 84, 4, 0, 0, 0, 'mohammad-mahabubur-rahma_fabcucom', 'https://fabcu.com/', '1712108618', 'Dhaka Bangladesh', NULL, 'WENLSQYSDBDWD2Z1', 'MuLKZrq1O5cvaBvnjvJmGx1iNpAIyLZn', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(782, 'MD.ROKON HAWLADAR', 'rokonhawladar24@gmail.com', '$2y$10$A6OeuFHitgmekIIN4T0YiefL6bk2B9mVE889dkrqArnOsoNgQiwrS', 83, 4, 0, 0, 0, 'mdrokon-hawladar_vinnostorecom', 'https://vinnostore.com', '1768786647', 'Dhaka Bangladesh', NULL, 'QEDZ10VDQLMNVTV6', '1ewrKy6qtq6BXAKQ31SIuOmUkQNIbZhV', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(783, 'Mahmud Al Hasan Shakib', 'mahmudalhasan2960@gmail.com', '$2y$10$qPVy3CkgJy6nrJaiwImdbu3/4sy.e9MGL/DRRAf9esi1QmeIKeRda', 53, 4, 0, 0, 0, 'mahmud-al-hasan-shakib_masemartcom', 'https://masemart.com/', '1774421298', 'House - 10/M, Tolarbagh R/A, Mirpur- 01, Dhaka, Bangladesh', NULL, 'LM00BW6OMOFEHOPS', '0U5EkGfXMkzt6YWgcXrqzgfdZ3c1tGmk', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(784, 'Hasan Ali', 'hasanalihasanali11111@gmail.com', '$2y$10$SO11JKUUJtKjjzHk8hiDlezdE5YVV41pOFynwARSLviqxFlITrhXe', 81, 4, 0, 0, 0, 'hasan-ali_reftoocom', 'https://reftoo.com', '1823199795', 'Dhaka Bangladesh', NULL, 'LPXFSKLSFGVGDRYQ', 'YaB1Z2YfR1nFubYR73DnfJ7y5TQfCXsx', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(785, 'Md rakibul hasan', 'rakibhasan47447@gmail.com', '$2y$10$JPDI3V/X4PjkbxwHJnBSLe8jJott/ktaWjdqLDx9Bg4NSAB3UG6B2', 80, 3, 0, 0, 0, 'md-rakibul-hasan_rakiyancom', 'https://rakiyan.com', '1722887691', 'Dhaka Bangladesh', NULL, 'CQDFNAKXN112JJZB', '5YiXcHOsotKOVjgtyzJrjvzAjSNSwhI6', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(786, 'Kazi Eiamin khan', 'eiaminkhan629@gmail.com', '$2y$10$Tb3.59ocpyt4/pZGC0TKBuYIg15xB8DPP.f0DOG8WMXZrQp/Y22/a', 79, 3, 0, 0, 0, 'kazi-eiamin-khan_wafinarcom', 'https://wafinar.com/', '1864282317', 'Dhaka Bangladesh', NULL, 'XCZJOJRXZGMBZYWU', 'vjPvIRFzA7Fjjs1HMjRwrjxsBFKzQyXv', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(787, 'Sohanur Rahman Sohag', 'sohanurrahmansohag06@gmail.com', '$2y$10$yoMPNHPwjyIlz9hHSk5uOurNHB3NF0byQFKdi3jdR4zS3hHg9Ve5q', 78, 3, 0, 0, 0, 'sohanur-rahman-sohag_bongonestcom', 'https://bongonest.com', '1634581287', 'Dhaka Bangladesh', NULL, 'MXWNRDYRR8I6APMJ', 'uJCsXfX4WffpfoLLKr1QsZSusntMjzle', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(788, 'Md Liton Sardar', 'mlscaata@gmail.com', '$2y$10$xIJcozcrp0M3hrnGQKytI.384I4nkOTPPEDOMWBE/wjDkEvjlBxy.', 77, 4, 0, 0, 0, 'md-liton-sardar_daraziancom', 'https://darazian.com', '1937384868', 'Dhaka Bangladesh', NULL, 'CSMXTFIHFWMC4IMU', 'roGgubeqWNUDaFNlNXXNIQMM0sRQr6UT', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(789, 'Gufran Habib', 'gufranhabib19@gmail.com', '$2y$10$S8JNcpKbrkYdG3NlmcUmVe7t0frQJUwTdUCu1D0QJr72lcsC6U9pW', 76, 1, 0, 0, 0, 'gufran-habib_gufranshopcom', 'https://gufranshop.com', '1894590981', 'Dhaka Bangladesh', NULL, 'EBSPITCZQ0HTHGOW', 'pfYR6zsQ5sx40wOLGjdEtHj39DsQunui', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(790, 'Ahamadul Haque', 'mahfuz724@gmail.com', '$2y$10$KYZjK2YzICQLlJfLgwBXyO4AUg3eXtBAMhHp1Ea.bm74U9JFhKPCC', 75, 1, 0, 0, 0, 'ahamadul-haque_shopoliobdcom', 'https://shopoliobd.com/', '1755557358', 'Dhaka Bangladesh', NULL, 'YCS6XENZNNUHZ6LZ', 'KNgQ5ecTvun8A5Og818TFuKQ3v2ofEjA', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(791, 'Muhammad Akramul Hoque', 'makramulhoque1985@gmail.com', '$2y$10$D7ev/Q3MV/rmD7t/tFfwVuPExeSe1i6F8BgZ0whRoJb.mHF0OiYd.', 74, 2, 0, 0, 0, 'muhammad-akramul-hoque_swpnerbazarcom', 'https://swpnerbazar.com/', '1818153540', 'Dhaka Bangladesh', NULL, 'UWNOETHXJGTDZSVS', 'UxQJRBVYwWE3TSpsnZ003j8E53tPy0wP', 1, '2026-07-28 08:46:45', '2026-07-28 08:46:45'),
(792, 'Mohammad Minhaj', 'minhajgreenarrow@gmail.com', '$2y$10$gTfXYxYDqdBmYwkXdIAu8u5dQL0U7Ha/RAZCQXTV3iDyHiL4R6raa', 73, 2, 0, 0, 0, 'mohammad-minhaj_luxivaacom', 'https://luxivaa.com', '1620551110', 'Dhaka Bangladesh', NULL, 'Z2BAC4LUCA76TSZX', 'oeF5tGL3FnZHBKR93Rj0qksYXrNWuOIl', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(793, 'Shuvo Zaman', 'admin@gmail.com', '$2y$10$l1A8T4.faVvP8Mb7vH.gpeyBinz19D/63wLbb6uRXEtj8k.Ac5z8K', 72, 4, 0, 0, 0, 'shuvo-zaman_obilashicom', 'https://obilashi.com', '1719776510', 'Dhaka Bangladesh', NULL, 'GGBSBKZFPQ183RF8', 'taJdMY8MWEfhL75DTb3oF4Ps0uk6RSmy', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(794, 'Md Shariful Islam', '128.shorif@gmail.com', '$2y$10$Nwukbl9Zlw5jvSdWRC3ZQeJXXyq.sgSHQkshxqn30GntBwN/uJz3S', 71, 4, 0, 0, 0, 'md-shariful-islam_gadgetiyancom', 'https://gadgetiyan.com', '1723748025', 'Dhaka Bangladesh', NULL, 'VSZAWTZTZ6YFZJNX', 'IvD5eZYeRGLcm7ps2SWypfqJLJX4u0Cl', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(795, 'Zakir Hossen', 'monij1192@gmail.com', '$2y$10$9p2BohgQ59Opo6wW5e/Trukk1S5dfq.nbfVEJ0jOL0.EAWgY6ohwy', 70, 3, 0, 0, 0, 'zakir-hossen_rongbilashcom', 'https://rongbilash.com', '1344146192', 'Dhaka Bangladesh', NULL, '3SXFPUFYEQSHXWTO', 'TT2Ldkxu4ivFUSQPsxPsk9FwWp9LVW0h', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(796, 'Aariyan Hasan', 'aariyanhasan0@gmail.com', '$2y$10$ZL3G0rsEPYjwyomDVEfI/.g59bWU0npsPmQhOfoVJFI1KLqecQ2Eu', 69, 3, 0, 0, 0, 'aariyan-hasan_ariyanmallcom', 'https://ariyanmall.com', '1645771193', 'Dhaka Bangladesh', NULL, '3LMVONIR87T22GYO', 'F0YAHtADiigfuE1gG0Gb5XvAQJutJHsK', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(797, 'Spriha Debi', 'prantispriha3002@gmail.com', '$2y$10$8.A8M7YcgVrnOcObENjAQ.hnxR6oHiJyrfWVOMHEvg1l1mibh79tu', 68, 3, 0, 0, 0, 'spriha-debi_trusttadcom', 'https://trusttad.com', '1886809799', 'Dhaka Bangladesh', NULL, 'WROZPRL4F4U8DIJY', 'h1KQnY6jeEjVmkwpjSrgjR2BZiL6QAiJ', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(798, 'Md. Masud Raihan', 'masudraihan@gmail.com', '$2y$10$9kKjJkGZ/AF.Y8L0FNFkXOSWCUGzY.O5grgxV6UIGSFjzaOLMhDou', 55, 4, 0, 0, 0, 'md-masud-raihan_mahanarcom', 'https://mahanar.com/', '1858866520', 'Vatkandi Uttar Para, Bogura Sadar, Bogura.', NULL, '4JJT0EQTT7PQFR5H', '2QQcFLrIzBLJe1JAkLOW4lycvHBkIw2L', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(799, 'Nahid Islam', 'nahidislamshawn@gmail.com', '$2y$10$COHgklorEW0zYe898J9tr.G9R9RAUx8TDeAIarevvnb7S5Ln8fDLa', 67, 4, 0, 0, 0, 'nahid-islam_fabriyancom', 'https://fabriyan.com', '1812247800', 'Dhaka Bangladesh', NULL, '1Y1FXENI7IHP91CI', 'O8RO7crKxDKQAV2S6YBJnRilr0k1KJkA', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(800, 'Soman Ahmmed', 'somanahmmed83@gmail.com', '$2y$10$MmkJA50SZh3VRo17QZPlo.XiHJInAKnppc/Jq4f9JZQVHm7ei5SuW', 66, 1, 0, 0, 0, 'soman-ahmmed_najipacom', 'https://najipa.com', '1748668529', 'Dhaka Bangladesh', NULL, '46HRIHDDBFCO8BWM', 'T1xzxZgpPj5Rl00Mlt5x5SzGS6zjfXlv', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(801, 'Masud Rana', 'rajibshubarna@gmail.com', '$2y$10$zdNVpduW13AK8qtlQlNjkuwi/qtbX16I.9LJg5skJ4LKUAUsuYYxi', 65, 4, 0, 0, 0, 'masud-rana_shafiyancom', 'https://shafiyan.com', '1711907876', 'Dhaka Bangladesh', NULL, 'DD7OVH9AX6STF1IF', 'gRrcms8XmpO4V4fNcnrh5WTeBduhXwNb', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(802, 'Md Shah Wali Ullah', 'waliullahku16@gmail.com', '$2y$10$Tj6HS4CcAcw1mYAhzedmc.euIGm0NE123eT0Ye.GMu92D4DMQ1cZy', 64, 4, 0, 0, 0, 'md-shah-wali-ullah_halalivacom', 'https://halaliva.com/', '1723843057', 'Dhaka Bangladesh', NULL, '5UUQ0NSLNG9SSN1S', 'YI00ZwuPVq7uvtzxRGHiYZDRnAEUktol', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(803, 'Easin Arafat', 'azqonaccall@gmail.com', '$2y$10$sdHmwPRG9xrqt49crXUR/Oo/hHisE0Ea1J5BId/geATNT5K2EjtUu', 63, 1, 0, 0, 0, 'easin-arafat_azqoncom', 'https://azqon.com/', '1902536032', 'Dhaka Bangladesh', NULL, 'EC6DE3KRXIIPRM37', 'Z4AvRjyFudy4TX5eMkInGho9yGUa1age', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(804, 'Juber Ahmad', 'juberahmad4542@gmail.com', '$2y$10$w04M5sst9rtDTGXccNc6VuiE3mCyZ0yfL.c2VhNNttoY1r9hI4Yga', 62, 1, 0, 0, 0, 'juber-ahmad_jubbozcom', 'https://jubboz.com/', '1739454842', 'Dhaka Bangladesh', NULL, 'EPL67MLQIQ12TXXF', 'vwRroBlf6X807R6MhovTLMVSqq4rRbGU', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(805, 'Al Mamun', 'al281729@gmail.com', '$2y$10$5Ukdr/CcvI6BwaPc17PjTOJvCvzZ163xlOcS02i7QhUXhw/k5edbC', 61, 1, 0, 0, 0, 'al-mamun_kottozcom', 'https://kottoz.com/', '1761935293', 'Dhaka Bangladesh', NULL, 'KXTPIGSOU8WJXHX7', 'hL1XwV53I2J538oXFb4QG4CK0VEGsI4M', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(806, 'Md. Ayub Hossain', 'ayubhossain9239@gmail.com', '$2y$10$0/0gUBYopNt3ky7rO1KWN.iNlTK9pr9mUxFF.uyADsI/CYKjOaodG', 60, 1, 0, 0, 0, 'md-ayub-hossain_ayrutamartcom', 'https://ayrutamart.com', '1738675598', 'Dhaka Bangladesh', NULL, 'HPGESQELAZIWFUC9', 'oXPEALPUNzr8zpBum9dCRIN5r1THKUO9', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(807, 'Shofikul Islam', 'shofik.tuhin0011@gmail.com', '$2y$10$tLnuHJrnbYqar.K7MCTd2OKaqFWmsz.Jd7WVbdDKzfuNZojDkzvgG', 59, 1, 0, 0, 0, 'shofikul-islam_kinaroocom', 'https://kinaroo.com', '1745680790', 'Dhaka Bangladesh', NULL, 'UZUQCZ3EKNUX0QQS', '0OyFrFCWyEMV1RZqHdrY4r4xhFw2QAiy', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(808, 'Arfin manik', 'manikhossen574@gmail.com', '$2y$10$jxDb0l3gmvdOXc89lFfqn.ao//eAgZV/KeRlS.bgwgldsDO7aaL8e', 58, 4, 0, 0, 0, 'arfin-manik_wafilovecom', 'https://wafilove.com', '1757931834', 'Dhaka Bangladesh', NULL, 'TYYXYEQRFWP4NTM5', 'rtWwfBwmhKckNoiPHCO0muAEQBp1FP3b', 1, '2026-07-28 08:46:46', '2026-07-28 08:46:46'),
(809, 'Abdul Aziz', 'hukaziz633@gmail.com', '$2y$10$2OdCYbGgtLsTTSvWdfMB1u0dJEtHsuS0WuQTsGIcw6yvIgxt0jL4m', 57, 4, 0, 0, 0, 'abdul-aziz_amanotbazarbdcom', 'https://amanotbazarbd.com/', '1915078179', 'Dhaka Bangladesh', NULL, 'PV6BUCVRIRISTQBU', 'CA5d3WaNLVLA6IeM0seibfgUHM0R5psy', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(810, 'Md Khyrul Islam', 'mkhyrul643@gmail.com', '$2y$10$Az7m5mestxH7FtH46jq/LO2BBxOp.Bl.IqItcdMowjIkR31Frkpa2', 56, 4, 0, 0, 0, 'md-khyrul-islam_khosbucom', 'https://khosbu.com', '1718426814', 'Dhaka Bangladesh', NULL, '5IYKYHTYFYMFQYEX', 'XR4kF1V0Zr0wmKizlYO0aT2nWtimsfOl', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(811, 'Abusayed', 'abusayed168984@gmail.com', '$2y$10$Fkqw3G13toCb85wnaAPR9e7Cxrfj7u4Cxt3Ud.L0db58Qq4yMi8aG', 54, 4, 0, 0, 0, 'abusayed_nilkeencom', 'https://nilkeen.com', '1804603875', 'Dhaka Bangladesh', NULL, 'RJ8HSXY4EOKOKXZZ', 'kox9V5UaFn1mu5PpJWE3mhByoOo8lW2P', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(812, 'Md Ziarul huq', 'hijabini.com@gmail.com', '$2y$10$toNnP3C.moOdXwBTBAKZMOBcJN39uxDI/XItwkx1fwYxi8yj3YRUa', 51, 3, 0, 0, 0, 'md-ziarul-huq_hijabinicom', 'https://hijabini.com', '1744723549', 'Dhaka Bangladesh', NULL, 'MULDAOHQR8HOFTUP', 'LkYCKgVV3SSnNIgo9gdiUyBonIKTlat0', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(813, 'MD ALL EMRAN', 'emrankhandoker57@gmail.com', '$2y$10$3xEFWKxP3xrHeQCE309.NeMr76e6Gk5YUv6jK7hGCSSkKGlZrlOye', 50, 2, 0, 0, 0, 'md-all-emran_kmr-martcom', 'https://kmr-mart.com', '1405340542', 'Dhaka Bangladesh', NULL, 'PETBGTEKFC4RY8L1', 'oq0tMI59wjTcfqw1l4qagAW1HvoKTPbW', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(814, 'MD. Osman Goni', 'osman2016bd@gmail.com', '$2y$10$F6K5aFP0fDavnqZchjfFHeeFoKPvRrNdb/eLU3UfNro.2v2uYidY6', 49, 4, 0, 0, 0, 'md-osman-goni_shineymartcom', 'https://shineymart.com', '1743290282', 'Dhaka Bangladesh', NULL, 'YUGAUAM767P4T5Q1', '9amXRzZkgBEF4E8LUTLw8HKZUSYblMDE', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(815, 'Xulhas Shekh', 'zulhas790@gmail.com', '$2y$10$NEAGnyIUtcnhrfM98K6D9eIF75VIahHdNEjJV0aMQq//mMwzCCbt2', 48, 1, 0, 0, 0, 'xulhas-shekh_marjitocom', 'https://marjito.com/', '1518659714', 'Dhaka Bangladesh', NULL, 'FUDUSNYQNVRX1FWK', 'd1TtMgX1JLW5HuFlw02HdmPBJwpmSafl', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(816, 'MD Shihab Hossain Fahim', 'fahimshihab32@gmail.com', '$2y$10$ldLjasrAomTtzI2fg7Ob6eXWKiEF9yALuET6dDTH/V1PaUF7a/w.m', 47, 1, 0, 0, 0, 'md-shihab-hossain-fahim_topnixocom', 'https://topnixo.com', '1990445907', 'Dhaka Bangladesh', NULL, 'GZCGOF0ORJLJKXPD', 'vaK4nFLpyAXucnun0cnGnWKZmf4Q6MRs', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(817, 'Mohammad Amirul Islam', 'mdamirulislam224082@gmail.com', '$2y$10$yqvWeKXj9dHhjJX.hJ0/KOuXITa7EQZp3BRef8oIFmtVdwoHkxdxm', 46, 4, 0, 0, 0, 'mohammad-amirul-islam_azlaarcom', 'https://azlaar.com/', '1617224082', 'Dhaka Bangladesh', NULL, 'BPORDJQYBBPW0KUE', '7C4n02M526hePJb1BjQNOpkWppdkf3In', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(818, 'Jobayer Islam', 'mdjobayerislam01733@gmail.com', '$2y$10$R/o0v2B0w5KC7o1LFi.RTOFsI0zzvbzmfoYzT5A/zgVYyoNgbk2Ci', 44, 4, 0, 0, 0, 'jobayer-islam_libasiyancom', 'https://libasiyan.com', '1689036970', 'Dhaka Bangladesh', NULL, 'G4SV7J6UAXCKFKBT', 'LQQO8FAZwypZK32yTosdyjzEDmUKD9mY', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(819, 'Md.Bokul Hossain', 'hossainbokul88@gmail.com', '$2y$10$Vlzu8ObTUyARCHR4QbX7cu4TXnwk7M9A9ih2UMnrn4N3u/by6IJ.W', 43, 4, 0, 0, 0, 'mdbokul-hossain_vorosarbazarcom', 'https://vorosarbazar.com/', '1644705577', 'Dhaka Bangladesh', NULL, 'OEJUSRGYUYCUSTLU', 'pYdXJYtuoiKgVgcKX8vnq0EdDnJjxQC8', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(820, 'Nafis Fuad', 'nafisdae@gmail.com', '$2y$10$lWKmfLXZxYwn3XSeeZu45.LpqWHeydGibYN/NQUyZaW8Ezz.NusS6', 42, 1, 0, 0, 0, 'nafis-fuad_toopmarkcom', 'https://toopmark.com/', '1302223490', 'Dhaka Bangladesh', NULL, 'ZK658HMATG9US3TP', 'gyVQ55Mbn0jelFKdXsypbLrB4bv7rciG', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(821, 'Ishak', 'ishakhaider2021@gmail.com', '$2y$10$Y.ktQLXbd8ThMgrNirRiI.VchZsY0CKIegYSkbsS/VbBBy6FrtJki', 41, 3, 0, 0, 0, 'ishak_adilamartcom', 'https://adilamart.com/', '1620302611', 'Dhaka Bangladesh', NULL, 'ZZZWFYHPHXNPEZKO', 'i6qwm6Md9E3Af0N0Vg2kieWjFbloJqT5', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(822, 'Al Mahmud', 'almahmud8096@gmail.com', '$2y$10$MhfTdmvWxpi3EguTP/xadOi84titWjVC7XcQ7qnbNt5TttUvw0f0S', 40, 1, 0, 0, 0, 'al-mahmud_ittadighorcom', 'https://ittadighor.com/', '1845728096', 'Dhaka Bangladesh', NULL, 'NOKMHIB3EREHSKN9', 'cNmvoVKYiPLvmrPHET1ytyRwyDRjVi1F', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(823, 'Md. Nezamul Islam', 'nezamul871@gmail.com', '$2y$10$hSxpujn.ToNl6sA0RC0V6.ytlLIrgvCS0e/1IM3Y06lpYLn3leFVS', 39, 4, 0, 0, 0, 'md-nezamul-islam_zarixcocom', 'https://zarixco.com/', '1917479871', 'Dhaka Bangladesh', NULL, 'RZW72KP5FDF9C7SD', '8TLtcY8UhPKDOEUQq9LtzrHOnCcGKXSL', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(824, 'Muhammad Kawsar', 'hoorrin0@gmail.com', '$2y$10$JB.1tzGqzel3z0dlLWur3uMWPYGH7qfqyf0Ndgachs1wkrbV3Fera', 38, 1, 0, 0, 0, 'muhammad-kawsar_wwwhoorrincom', 'https://www.hoorrin.com/', '1638916547', 'Dhaka Bangladesh', NULL, 'ZGH8BTL6XPGV7MOS', '5RQKBq3OvITl9KrZIeLvFmowU6Sf6LxA', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(825, 'Md Rabiul Islam', 'robi.yscs@gmail.com', '$2y$10$7bCfqOrEB0aQZfdEoRw7F.bz.St6iNSnUxa1xHKcnlCyBXuRCoyqm', 37, 1, 0, 0, 0, 'md-rabiul-islam_khususunnahcom', 'https://khususunnah.com/', '1745211963', 'Dhaka Bangladesh', NULL, 'LMDNQHHID85SNUV4', '54P7C5eUQQdbTl4w8s0wIdq9fzaaOLjI', 1, '2026-07-28 08:46:47', '2026-07-28 08:46:47'),
(826, 'Rana Ahmed', 'ibrahim1291r@gmail.com', '$2y$10$5q8q89CLDV4DukneQeqgfuJ.u8cOQ7vyY6QouAQQHyYU/z7eh1MJa', 35, 4, 0, 0, 0, 'rana-ahmed_safwaniccom', 'https://safwanic.com', '1611638836', 'Dhaka Bangladesh', NULL, 'MTSUYBTZMQN3V3GD', 'Yx01r40zk5S9LBJVlf3c5bXKfxD8G0lX', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(827, 'Sk Ashiq Iqbal', 'pandeshi.business@gmail.com', '$2y$10$XS.0RP/oczYx6guma7G4veFpU.iUxEdOau034kzVFdV43phlCZlOy', 34, 4, 0, 0, 0, 'sk-ashiq-iqbal_pandeshicom', 'https://pandeshi.com', '1784609991', 'Dhaka Bangladesh', NULL, 'QL4VT8WEB1K3ML0M', 'CDbpwhBXOyrxC6rZmW66XDGpYfdHeJOQ', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(828, 'Bazlur Rahman Saddam', 'mdmazlur003@gmail.Com', '$2y$10$AnAU5tEi0kFTDEcboXoizue6tPfzjTeqt9X/jhr5I7i2uzN0PORda', 33, 4, 0, 0, 0, 'bazlur-rahman-saddam_israshopbdcom', 'https://israshopbd.com', '1804418632', 'Dhaka Bangladesh', NULL, 'FOICV0L4TLWC9I5D', 'H8aK0Rf4DUOL1oMN3oW63tduAGAgsocM', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(829, 'Md. Saifur Rahaman', 'mdsaifurrahaman393@gmail.com', '$2y$10$yi3X2uqPw0B.CK/nafOC8Oevzc65NTu7ldOiJbazJdR1dB52NcIBS', 32, 2, 0, 0, 0, 'md-saifur-rahaman_mowaazcom', 'https://mowaaz.com', '1622176708', 'Dhaka Bangladesh', NULL, 'C2B27JFKKLR4KU4Y', 'iP4OQGdnS7sZGuGHBMyqd0wBu7Gmn1tb', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(830, 'Arman', 'mdarmanali0700@gmail.com', '$2y$10$zYWFg7NXNMlwvTGujJq.eOcMtIFTX.Q7NONEM4zwXJJhyo/jORsTK', 31, 4, 0, 0, 0, 'arman_sohojlobbocom', 'https://gearmart.shop', '1567919657', 'Dhaka Bangladesh', NULL, 'JVIVLOWFV848QQFE', 'vq42EPd9yIkumHbf2B7jmprB2VcQLKb1', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(831, 'Mohammad Asir Ali', 'asirali112017@gmail.com', '$2y$10$6/OwUOmBaiGlhp2T3JmleepSUd2manM5lwwb0kyReIYuOO8/FnpJK', 30, 2, 0, 0, 0, 'mohammad-asir-ali_saqlainbdcom', 'https://saqlainbd.com/', '1856974370', 'Dhaka Bangladesh', NULL, 'VT6PLFW7P0VE4EZO', 'WtxqNQUs0IIIeqpyfIteWx1C5bDv3RXE', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(832, 'Abul Bashar Muhammad Masum', 'masum09se17@gmail.com', '$2y$10$1yv69IfTZK.fBtZ6qXuGR.VRccTXq8VpurrtchfEgacZjA5aDahWy', 29, 1, 0, 0, 0, 'abul-bashar-muhammad-masum_niyombazarcom', 'https://niyombazar.com', '1822662786', 'Dhaka Bangladesh', NULL, 'RTPWU05CGR1AIPNH', '9T4ByLYaf5qxz1RC1Eh5kbYrJN5iYXje', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(833, 'Shreejanul haque khan', 'shreejanfahim@gmail.com', '$2y$10$kZQ4p9jS0Mrpr/8uE8B9luXZhyjCGz4eb/xkSlmT5Y5tZqomdqBJO', 27, 4, 0, 0, 0, 'shreejanul-haque-khan_seanjeencom', 'https://seanjeen.com', '1799074605', 'Dhaka Bangladesh', NULL, 'JFOZA9I4CBPQS34N', 'vRdmEXazJCBsB9kz8s7ezlcxVuk8hz5J', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(834, 'Arman', 'webdeveloper.arman247@gmail.com', '$2y$10$lfsLFAEu3CJu6r5WBmGwgudxKYg0oB2B4C9DH/cksnyaVVe0BBgmu', 28, 4, 0, 0, 0, 'arman_armancom', 'https://arman.com', '1751395365', 'Dhaka Bangladesh', NULL, 'WIDMJM1ME1QSGFNB', 'eYlL4TcifheZ0NwBobnM4WP1mW8BEaUj', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(835, 'Md.Mohsin', 'mdmohsinuddin66@gmail.com', '$2y$10$7fwFMzMzYlV6iqECvkI0jOk8lYPmAcgKKCwO76ubEd1REn1zOCsDK', 26, 1, 0, 0, 0, 'mdmohsin_ayarazcom', 'https://ayaraz.com/', '1614255116', 'Dhaka Bangladesh', NULL, 'B2LPYRQRYDQW8ENJ', 'QjoJ1CUPtcPU1DkLCMMdC6rZbMkyJ3iX', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(836, 'MD Rayhan Islam', 'rayhanislam9799@gmail.com', '$2y$10$JDspqZnsMrh6IsVdOfC7KOGxsR/wlPVHrbGr2nZ8dV10EJLm3eo7S', 25, 3, 0, 0, 0, 'md-rayhan-islam_raxmartcom', 'https://raxmart.com', '1521577157', 'Dhaka Bangladesh', NULL, 'LHVLCGSVPFVLGMZR', 'WNBwNqu3yJ6O2cgWSRl1S8P7jQ9tFnik', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(837, 'Md Akif', 'mdtasnim592@gmail.com', '$2y$10$heHiQN8S.vyFVR/d3aI8FuDQ83vnQQlArzQQuhg4Q3BhHqy2YXDX.', 24, 4, 0, 0, 0, 'md-akif_assarahcom', 'https://assarah.com', '1759028649', 'Dhaka Bangladesh', NULL, 'TED0X80P4TXF76ST', 'ZgwZfVzAmzFChT1mCi5I5n6IwVG1pNDa', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(838, 'Sabina Akhter', 'sabina.akter239757@gmail.com', '$2y$10$ImJkbo0lXO7A/c/QIJ/1g.BRJ/IEL4Cz2S136oujn1i14qOmAZ8D.', 23, 4, 0, 0, 0, 'sabina-akhter_suktarashopcom', 'https://suktarashop.com', '1647239757', 'Dhaka Bangladesh', NULL, 'LQUMJFD5PJH25SUX', 'TUtzfnFC4ge51PcMQleGOX9etsujCggO', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(839, 'Pabittro chandra shil', 'pobittroshil100@gmail.com', '$2y$10$131xFHvyk3vG6BYGcjaHues0rIgn5oW.sJqkX5QmoK6VuSsYS/yrO', 22, 3, 0, 0, 0, 'pabittro-chandra-shil_blinvocom', 'https://blinvo.com', '1744857117', 'Dhaka Bangladesh', NULL, 'DZ0EUB59JQT7EQIU', 'RaG149HtSM6Fl0xEzRa9xTOwF39Xi21Z', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(840, 'MD Jony Mia', 'yesiamjony@gmail.com', '$2y$10$VuW97qv6R2Cy/WWO02K5IOLQtNctH4alklwDK/sbexTm5iImGUSr2', 21, 2, 0, 0, 0, 'md-jony-mia_nababiancom', 'https://nababian.com', '1606140211', 'Dhaka Bangladesh', NULL, 'HOC0GOQZEKYFLM1N', 'lzZy0k3C2AOoLwkA5SCYoiGTAsr9pcL2', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(841, 'Samrat Hossain Rohit', 'shrohit104@gmail.com', '$2y$10$U/TBtmrPxdiSssnePMhaIe.c7I67KVYKbyYD9T/FLZpOhwmjFMXS2', 20, 2, 0, 0, 0, 'samrat-hossain-rohit_ramleencom', 'https://ramleen.com', '1711671174', 'Dhaka Bangladesh', NULL, 'ZEBD94XXXFJ0U93X', 'XxLC2FO3RNPIcpMj0mwkRlyyF0KRy1B8', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(842, 'Md.Ariful Islam Chowdhury', 'arifkpi10@gmail.com', '$2y$10$WAJ7BHHL8LuU6KNl61HjsupUVOYVaMzPCX/QIsbqeuk9Pr9A95Y2m', 19, 4, 0, 0, 0, 'mdariful-islam-chowdhury_ummahsigncom', 'https://ummahsign.com/', '1717021417', 'Dhaka Bangladesh', NULL, 'KORG8QVPNC8YO118', 'jjdFqk15DYxQsMGeb5sCBy0aiLDmgQY7', 1, '2026-07-28 08:46:48', '2026-07-28 08:46:48'),
(843, 'Web Care', 'webcareit363@gmail.com', '$2y$10$j8Ghz8PU2o02MH/TOUprtOxxWI9m6CQGEkzoXcUmlzi9eqnU1Y/SS', 18, 4, 0, 0, 0, 'web-care_armanalibdcom', 'https://armanalibd.com', '1716898475', 'Dhaka Bangladesh', NULL, '4QMVWXXHB6HYRXN5', 'hGkwrsfwhfNdvBUOhRZ7oytMP919Xzzm', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(844, 'Salam Imran (Abdus Salam Patwary)', 'abdussalampatwary@gmail.com', '$2y$10$f5TNNri2NcQMKMD24JPFoe9qz3tiMU7DjMBUbRzxtw.nl.U7VhC0q', 17, 4, 0, 0, 0, 'salam-imran-abdus-salam-patwary_hasanahbdcom', 'http://hasanahbd.com/', '1911783082', 'Dhaka Bangladesh', NULL, 'ZVIQOAIWBRO9T6DK', '7Gw0UUoH3yQCjGwSFfPPU7otsEnSFMdj', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(845, 'MD MEHEDI HASAN', 'mehedimi0119@gmail.com', '$2y$10$DyUCOunc.y.Lcp.2IcPp.O6Pmcy9BvmCzDX/BJjDUv.fTqXf3yT1m', 4, 1, 0, 0, 0, 'md-mehedi-hasan_ilyrahcom', 'https://ilyrah.com', '1307718246', '17 Block J,Road 7, House 17, Banasree', NULL, 'SFE1COUG2TXC33N4', '4jgsptUFF3JtwCGJg2y74AfokkiC4YCh', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(846, 'Md Faruk Khan', 'khansmdfaruk796@gmail.com', '$2y$10$6ewDLQNIRLf5njQY2utUyODFN4Lc.6Vi5zDJJHjDOIX4/UyFi0EcW', 16, 3, 0, 0, 0, 'md-faruk-khan_halaljiboncom', 'https://halaljibon.com/', '1722557302', 'Dhaka Bangladesh', NULL, 'Z5EQ3L3U0TCCNAYR', 'li7rtG1frgWG5PYe56O0dFfG2GVaZdhN', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(847, 'Md Abdur Rahman Khan', 'khanmdabdurrahman29@gmail.com', '$2y$10$YRrA7Zpr/ukx0PgJX1b4IOgSbDtf37QiZ.7.qeTkDax526ny1ZV7y', 15, 3, 0, 0, 0, 'md-abdur-rahman-khan_hijozcom', 'https://hijoz.com', '1908525896', 'Dhaka Bangladesh', NULL, '3Q3CTKWNURYD4HBY', 'i7JC5RPzA31bbLm5sZ4UA6oEQqcnZBEN', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(848, 'Md. Aminul Islam', 'aminul.freelancing.bd@gmail.com', '$2y$10$MEt44rafQdt6ZWVyJknf/OXOnYAOyis/UESqz3oMYZe5IxHuy3pXG', 14, 4, 0, 0, 0, 'md-aminul-islam_khushbushopcom', 'https://khushbushop.com', '1733042602', 'Dhaka Bangladesh', NULL, '16NWPN7X3M9TWBBZ', 'g1Q4sBHasAuk0vqfXKqhLhC4FSuK0HjL', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(849, 'Keya Farhana', 'keya7847@gmail.com', '$2y$10$fb6hkgT5bz/QiSmqwBMM6ejQMDD4msdczQpv13QqKN8QkmZFdKc0K', 13, 4, 0, 0, 0, 'keya-farhana_mazidmartcom', 'http://mazidmart.com/', '1788391697', 'Dhaka Bangladesh', NULL, 'TIUK8SMQ9QS5AMIW', 'lgT208EhDNd8bFJhWSQfqpqPrFvX6vgw', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(850, 'Fardin Ahmed', 'mdfardinahmed202498@gmail.com', '$2y$10$Wh/iT5g332F9KjFArn3N1eff6tR6zPvZo0MnGTqnVoXoTeg/wnBbq', 12, 1, 0, 0, 0, 'fardin-ahmed_fashlexcom', 'http://fashlex.com/', '1738894033', 'Dhaka Bangladesh', NULL, 'IQ3DXZNP6GDSCCIS', 'bqbLZwDykLzkwoUgwJXWFH1JNgMccgfw', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(851, 'Arman Sarder', 'armansarder94@gmail.com', '$2y$10$0LP2KjH.UNdiAMM5F6TLtOdb4kJ6sTvubm5nA2sk/aE1xZDQ9KTJa', 11, 1, 0, 0, 0, 'arman-sarder_wwwsana-wearcom', 'https://www.sana-wear.com', '1779986467', 'Dhaka Bangladesh', NULL, '7I6UIDENUSKHW0X0', 'SMhlQQM509HTJ7HL7JiMmYIX34xB650r', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(852, 'Md Nasim Ahmed', 'iamnasim019@gmail.com', '$2y$10$U8iBjLEU0ZNStp48uh9jCe4OEM67/pjxlz3PIwoa1AdHD.h404jK2', 10, 1, 0, 0, 0, 'md-nasim-ahmed_lalabibcom', 'https://lalabib.com/', '1913563992', 'Dhaka Bangladesh', NULL, 'TVBQHSXFINTEHFOE', '7lixVvJ2QbRC6V36g6g8iu3fUcAHGBu1', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(853, 'Moudud Ahmed Shojib', 'moududahmed189@gmail.com', '$2y$10$l5Ewr1Job8BPVGXamFw7EeY63d7qyaKTL4Kdrzy0it/mg1jDYCEBa', 6, 3, 0, 0, 0, 'moudud-ahmed-shojib_halaliyancom', 'https://halaliyan.com', '1711926823', 'Dhaka Bangladesh', NULL, 'KQIRAMR1ZARZ6P39', 'HsPsPnJSG9cBBjvWIK7bV96aonqGYmsA', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(854, 'Masemart', 'admin@droploo.com', '$2y$10$jUIYOtbm0Ai/vJA50wsLae5zcumgQoCGcOdzSWvTNVyqQ8zIIhqEq', 3, 1, 0, 0, 0, 'masemart_domain', 'droploo.com', '1751395365', 'Ipsam nihil magna vo', NULL, 'GDZ47ZXPDNPPCOJZ', 'K9OWjL8BdiqyFpeaTM2nUzwnarFWdWDU', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49'),
(855, 'Masemart', 'admin@masemart.com', '$2y$10$8m.Lfs.DM/1pM0nP/1SkMOwopz03x2jZ5vpDG1EEiIWiQJBYUN8im', 2, 1, 0, 0, 0, 'masemart_masemartcom', 'https://masemart.com', '01742351696', 'mirpur', NULL, 'JQFZSTIBVLKFVJVC', '0pZrcdlNIdCRaweJvqG4aRYoHsHXzfhf', 1, '2026-07-28 08:46:49', '2026-07-28 08:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What is dropshipping?', 'Dropshipping is a retail fulfillment method where you sell products without holding inventory. When a customer places an order, you purchase the item from a third-party supplier who ships it directly to the customer. You never handle the product yourself.', '4', 1, '2026-05-02 10:04:09', '2026-07-22 11:57:22'),
(2, 'Is dropshipping still profitable in 2026?', 'Yes, dropshipping can still be profitable in 2026, but it requires effort. Success depends on choosing the right niche, reliable suppliers, effective marketing, and providing great customer service. Margins are typically 20-30%, and competition is high, so branding and optimization are key.', '5', 1, '2026-05-02 10:11:15', '2026-07-22 11:57:22'),
(4, 'Is dropshipping legal?', 'Yes, dropshipping is completely legal worldwide, as long as you follow local e-commerce laws, pay taxes, and avoid selling copyrighted or prohibited items. Register your business if required in your country (e.g., LLC in the US).', '1', 1, '2026-05-02 10:38:54', '2026-07-22 11:57:22'),
(5, 'How do I find reliable suppliers?', 'Use platforms like Spocket, AliExpress (with DSers), CJdropshipping, or Zendrop for vetted suppliers. Look for fast shipping (US/EU warehouses), good reviews, and responsive communication. Test orders yourself before selling.', '2', 1, '2026-05-02 10:39:45', '2026-07-22 11:57:22'),
(6, 'What are the best products to dropship?', 'Focus on evergreen niches like fashion accessories, beauty, home & garden, pet supplies, or trending items with demand but low competition. Use tools like Google Trends, Sell The Trend, or product research apps to find winners. Avoid saturated items like phone cases.', '3', 1, '2026-05-02 10:40:20', '2026-07-22 11:57:22');

-- --------------------------------------------------------

--
-- Table structure for table `import_statuses`
--

CREATE TABLE `import_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_rows` int(11) NOT NULL,
  `processed_rows` int(11) NOT NULL DEFAULT '0',
  `success_rows` int(11) NOT NULL DEFAULT '0',
  `error_rows` int(11) NOT NULL DEFAULT '0',
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'processing',
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomplete_orders`
--

CREATE TABLE `incomplete_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `billing_address` text COLLATE utf8mb4_unicode_ci,
  `subtotal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `temp_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','abandoned','processing','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cart_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `last_activity` timestamp NULL DEFAULT NULL,
  `abandoned_at` timestamp NULL DEFAULT NULL,
  `reminder_count` int(11) NOT NULL DEFAULT '0',
  `last_reminder_sent_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landingpages`
--

CREATE TABLE `landingpages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `testimonials` longtext COLLATE utf8mb4_unicode_ci,
  `faq` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sold_count` int(11) NOT NULL DEFAULT '0',
  `visitor_count` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landingpages`
--

INSERT INTO `landingpages` (`id`, `name`, `slug`, `title`, `sub_title`, `banner_image`, `mobile_banner`, `video_link`, `deadline`, `features`, `description`, `short_description`, `testimonials`, `faq`, `meta_title`, `meta_description`, `meta_image`, `sold_count`, `visitor_count`, `phone`, `email`, `whatsapp`, `copyright_text`, `is_published`, `created_at`, `updated_at`) VALUES
(7, 'Prestige Mini Grinder', 'prestige-mini-grinder', 'দ্রুত ও সহজে মসলা গ্রাইন্ড করুন', 'কমপ্যাক্ট ডিজাইনে শক্তিশালী পারফরম্যান্স, প্রতিদিনের রান্নার জন্য সহজ ও সুবিধাজনক গ্রাইন্ডিং সমাধান।', '6', '6', 'https://www.youtube.com/watch?v=ouUk1k-TEW8', '2026-09-30 15:46:00', '\"[{\\\"icon\\\":\\\"las la-bolt\\\",\\\"title\\\":\\\"Powerful Grinding\\\",\\\"description\\\":\\\"\\\\u09a6\\\\u09cd\\\\u09b0\\\\u09c1\\\\u09a4 \\\\u0993 \\\\u09b8\\\\u09b9\\\\u099c\\\\u09c7 \\\\u09ac\\\\u09bf\\\\u09ad\\\\u09bf\\\\u09a8\\\\u09cd\\\\u09a8 \\\\u09ae\\\\u09b8\\\\u09b2\\\\u09be \\\\u0993 \\\\u09b6\\\\u09c1\\\\u0995\\\\u09a8\\\\u09cb \\\\u0989\\\\u09aa\\\\u0995\\\\u09b0\\\\u09a3 \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1 \\\\u0995\\\\u09b0\\\\u09a4\\\\u09c7 \\\\u09b8\\\\u0995\\\\u09cd\\\\u09b7\\\\u09ae\\\\u0964\\\"},{\\\"icon\\\":\\\"las la-compress-arrows-alt\\\",\\\"title\\\":\\\"Compact Design\\\",\\\"description\\\":\\\"\\\\u099b\\\\u09cb\\\\u099f \\\\u0993 \\\\u0995\\\\u09ae\\\\u09aa\\\\u09cd\\\\u09af\\\\u09be\\\\u0995\\\\u09cd\\\\u099f \\\\u09a1\\\\u09bf\\\\u099c\\\\u09be\\\\u0987\\\\u09a8 \\\\u09b9\\\\u0993\\\\u09df\\\\u09be\\\\u09df \\\\u09b0\\\\u09be\\\\u09a8\\\\u09cd\\\\u09a8\\\\u09be\\\\u0998\\\\u09b0\\\\u09c7 \\\\u09b8\\\\u09b9\\\\u099c\\\\u09c7 \\\\u09b0\\\\u09be\\\\u0996\\\\u09be \\\\u09af\\\\u09be\\\\u09df\\\\u0964\\\"},{\\\"icon\\\":\\\"las la-cog\\\",\\\"title\\\":\\\"Easy to Use\\\",\\\"description\\\":\\\"\\\\u09b8\\\\u09b9\\\\u099c \\\\u0985\\\\u09aa\\\\u09be\\\\u09b0\\\\u09c7\\\\u09b6\\\\u09a8, \\\\u09a6\\\\u09c8\\\\u09a8\\\\u09a8\\\\u09cd\\\\u09a6\\\\u09bf\\\\u09a8 \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0\\\\u09c7\\\\u09b0 \\\\u099c\\\\u09a8\\\\u09cd\\\\u09af \\\\u0985\\\\u09a4\\\\u09cd\\\\u09af\\\\u09a8\\\\u09cd\\\\u09a4 \\\\u09b8\\\\u09c1\\\\u09ac\\\\u09bf\\\\u09a7\\\\u09be\\\\u099c\\\\u09a8\\\\u0995\\\\u0964\\\"},{\\\"icon\\\":\\\"las la-utensils\\\",\\\"title\\\":\\\"Multipurpose Use\\\",\\\"description\\\":\\\"\\\\u09ae\\\\u09b0\\\\u09bf\\\\u099a, \\\\u099c\\\\u09bf\\\\u09b0\\\\u09be, \\\\u0997\\\\u09cb\\\\u09b2\\\\u09ae\\\\u09b0\\\\u09bf\\\\u099a, \\\\u0995\\\\u09ab\\\\u09bf \\\\u09ac\\\\u09bf\\\\u09a8\\\\u09b8\\\\u09b9 \\\\u09ac\\\\u09bf\\\\u09ad\\\\u09bf\\\\u09a8\\\\u09cd\\\\u09a8 \\\\u0989\\\\u09aa\\\\u0995\\\\u09b0\\\\u09a3 \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1 \\\\u0995\\\\u09b0\\\\u09be \\\\u09af\\\\u09be\\\\u09df\\\\u0964\\\"},{\\\"icon\\\":\\\"las la-broom\\\",\\\"title\\\":\\\"Easy to Clean\\\",\\\"description\\\":\\\"\\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0\\\\u09c7\\\\u09b0 \\\\u09aa\\\\u09b0 \\\\u09b8\\\\u09b9\\\\u099c\\\\u09c7\\\\u0987 \\\\u09aa\\\\u09b0\\\\u09bf\\\\u09b7\\\\u09cd\\\\u0995\\\\u09be\\\\u09b0 \\\\u0993 \\\\u09b8\\\\u0982\\\\u09b0\\\\u0995\\\\u09cd\\\\u09b7\\\\u09a3 \\\\u0995\\\\u09b0\\\\u09be \\\\u09af\\\\u09be\\\\u09df\\\\u0964\\\"}]\"', '<h3>Prestige Mini Grinder</h3><p>রান্নাঘরের দৈনন্দিন কাজকে আরও সহজ ও দ্রুত করতে <strong>Prestige Mini Grinder</strong> হতে পারে একটি কার্যকরী সহযোগী। এর কমপ্যাক্ট ও ব্যবহারবান্ধব ডিজাইন অল্প সময়ে বিভিন্ন শুকনো ও মসলা জাতীয় উপকরণ গুঁড়ো করার জন্য উপযোগী।</p><p>এই মিনি গ্রাইন্ডার দিয়ে শুকনো মরিচ, গোলমরিচ, জিরা, ধনে, এলাচ, কফি বিন, বাদামসহ বিভিন্ন উপকরণ প্রয়োজন অনুযায়ী গ্রাইন্ড করা যায়। ছোট আকারের কারণে এটি রান্নাঘরে সহজে রাখা যায় এবং প্রয়োজনের সময় দ্রুত ব্যবহার করা সম্ভব।</p><h3>প্রধান বৈশিষ্ট্য</h3><ul><li><p>কমপ্যাক্ট ও আধুনিক ডিজাইন</p></li><li><p>মসলা ও বিভিন্ন শুকনো উপকরণ দ্রুত গ্রাইন্ড করতে সুবিধাজনক</p></li><li><p>দৈনন্দিন রান্নার কাজে ব্যবহার উপযোগী</p></li><li><p>সহজে ব্যবহার ও পরিষ্কার করা যায়</p></li><li><p>ছোট আকারের কারণে সংরক্ষণে কম জায়গা লাগে</p></li><li><p>বাসা, অফিস বা ছোট রান্নাঘরের জন্য উপযোগী</p></li></ul><h3>যেসব কাজে ব্যবহার করতে পারবেন</h3><p>Prestige Mini Grinder ব্যবহার করে সহজেই শুকনো মসলা, মরিচ, গোলমরিচ, জিরা, ধনে, কফি বিন, বাদাম ও অন্যান্য প্রয়োজনীয় উপকরণ গ্রাইন্ড করতে পারবেন। রান্নার আগে অল্প পরিমাণ মসলা দ্রুত প্রস্তুত করার ক্ষেত্রে এটি বিশেষভাবে সুবিধাজনক।</p><p>আপনার প্রতিদিনের রান্নার প্রস্তুতিকে আরও সহজ, দ্রুত ও ঝামেলামুক্ত করতে <strong>Prestige Mini Grinder</strong> একটি ব্যবহারিক পছন্দ।</p>', 'Prestige Mini Grinder — ছোট ও শক্তিশালী এই গ্রাইন্ডারটি মসলা, শুকনো মরিচ, কফি বিনসহ বিভিন্ন উপকরণ দ্রুত ও সহজে গুঁড়ো করতে উপযোগী। কমপ্যাক্ট ডিজাইনের কারণে রান্নাঘরে ব্যবহার ও সংরক্ষণ দুটোই সুবিধাজনক।', '\"[{\\\"name\\\":\\\"Asif Ul Islam\\\",\\\"position\\\":\\\"Homemaker\\\",\\\"rating\\\":\\\"5\\\",\\\"comment\\\":\\\"\\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1\\\\u09be\\\\u09b0\\\\u099f\\\\u09bf \\\\u0996\\\\u09c1\\\\u09ac\\\\u0987 \\\\u09ad\\\\u09be\\\\u09b2\\\\u09cb\\\\u0964 \\\\u0985\\\\u09b2\\\\u09cd\\\\u09aa \\\\u09b8\\\\u09ae\\\\u09df\\\\u09c7 \\\\u09ae\\\\u09b8\\\\u09b2\\\\u09be \\\\u0997\\\\u09c1\\\\u0981\\\\u09dc\\\\u09cb \\\\u0995\\\\u09b0\\\\u09be \\\\u09af\\\\u09be\\\\u09df \\\\u098f\\\\u09ac\\\\u0982 \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0 \\\\u0995\\\\u09b0\\\\u09be\\\\u0993 \\\\u09b8\\\\u09b9\\\\u099c\\\\u0964\\\"},{\\\"name\\\":\\\"\\\\u09b8\\\\u09c1\\\\u09ae\\\\u09be\\\\u0987\\\\u09df\\\\u09be \\\\u0986\\\\u0995\\\\u09cd\\\\u09a4\\\\u09be\\\\u09b0\\\",\\\"position\\\":\\\"Homemaker\\\",\\\"rating\\\":\\\"5\\\",\\\"comment\\\":\\\"\\\\u099b\\\\u09cb\\\\u099f \\\\u09b8\\\\u09be\\\\u0987\\\\u099c\\\\u09c7\\\\u09b0 \\\\u09b9\\\\u09b2\\\\u09c7\\\\u0993 \\\\u09ac\\\\u09c7\\\\u09b6 \\\\u0995\\\\u09be\\\\u09b0\\\\u09cd\\\\u09af\\\\u0995\\\\u09b0\\\\u0964 \\\\u09b0\\\\u09be\\\\u09a8\\\\u09cd\\\\u09a8\\\\u09be\\\\u0998\\\\u09b0\\\\u09c7 \\\\u0996\\\\u09c1\\\\u09ac \\\\u0995\\\\u09ae \\\\u099c\\\\u09be\\\\u09df\\\\u0997\\\\u09be \\\\u09a8\\\\u09c7\\\\u09df\\\\u0964\\\"},{\\\"name\\\":\\\"\\\\u09a4\\\\u09be\\\\u09a8\\\\u09ad\\\\u09c0\\\\u09b0 \\\\u09b9\\\\u09be\\\\u09b8\\\\u09be\\\\u09a8\\\",\\\"position\\\":\\\"Homemaker\\\",\\\"rating\\\":\\\"5\\\",\\\"comment\\\":\\\"\\\\u09a6\\\\u09c8\\\\u09a8\\\\u09a8\\\\u09cd\\\\u09a6\\\\u09bf\\\\u09a8 \\\\u09b0\\\\u09be\\\\u09a8\\\\u09cd\\\\u09a8\\\\u09be\\\\u09b0 \\\\u099c\\\\u09a8\\\\u09cd\\\\u09af \\\\u09ac\\\\u09c7\\\\u09b6 \\\\u09b8\\\\u09c1\\\\u09ac\\\\u09bf\\\\u09a7\\\\u09be\\\\u099c\\\\u09a8\\\\u0995 \\\\u098f\\\\u0995\\\\u099f\\\\u09bf \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1\\\\u09be\\\\u09b0\\\\u0964 \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0 \\\\u0995\\\\u09b0\\\\u09c7 \\\\u09ad\\\\u09be\\\\u09b2\\\\u09cb \\\\u09b2\\\\u09c7\\\\u0997\\\\u09c7\\\\u099b\\\\u09c7\\\\u0964\\\"},{\\\"name\\\":\\\"\\\\u09a8\\\\u09c1\\\\u09b8\\\\u09b0\\\\u09be\\\\u09a4 \\\\u099c\\\\u09be\\\\u09b9\\\\u09be\\\\u09a8\\\",\\\"position\\\":\\\"Homemaker\\\",\\\"rating\\\":\\\"5\\\",\\\"comment\\\":\\\"\\\\u09ae\\\\u09b8\\\\u09b2\\\\u09be \\\\u0993 \\\\u0985\\\\u09a8\\\\u09cd\\\\u09af\\\\u09be\\\\u09a8\\\\u09cd\\\\u09af \\\\u09b6\\\\u09c1\\\\u0995\\\\u09a8\\\\u09cb \\\\u0989\\\\u09aa\\\\u0995\\\\u09b0\\\\u09a3 \\\\u09a6\\\\u09cd\\\\u09b0\\\\u09c1\\\\u09a4 \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1 \\\\u0995\\\\u09b0\\\\u09a4\\\\u09c7 \\\\u09aa\\\\u09be\\\\u09b0\\\\u099b\\\\u09bf\\\\u0964 \\\\u09aa\\\\u09cd\\\\u09b0\\\\u09cb\\\\u09a1\\\\u09be\\\\u0995\\\\u09cd\\\\u099f\\\\u099f\\\\u09bf \\\\u09ac\\\\u09c7\\\\u09b6 \\\\u09ad\\\\u09be\\\\u09b2\\\\u09cb\\\\u0964\\\"},{\\\"name\\\":\\\"\\\\u0986\\\\u09b0\\\\u09bf\\\\u09ab\\\\u09c1\\\\u09b2 \\\\u0987\\\\u09b8\\\\u09b2\\\\u09be\\\\u09ae\\\",\\\"position\\\":\\\"Homemaker\\\",\\\"rating\\\":\\\"5\\\",\\\"comment\\\":\\\"\\\\u0995\\\\u09ae\\\\u09aa\\\\u09cd\\\\u09af\\\\u09be\\\\u0995\\\\u09cd\\\\u099f \\\\u09a1\\\\u09bf\\\\u099c\\\\u09be\\\\u0987\\\\u09a8 \\\\u098f\\\\u09ac\\\\u0982 \\\\u09b8\\\\u09b9\\\\u099c \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0\\\\u2014\\\\u09a6\\\\u09be\\\\u09ae \\\\u0985\\\\u09a8\\\\u09c1\\\\u09af\\\\u09be\\\\u09df\\\\u09c0 \\\\u0996\\\\u09c1\\\\u09ac \\\\u09ad\\\\u09be\\\\u09b2\\\\u09cb \\\\u098f\\\\u0995\\\\u099f\\\\u09bf \\\\u09aa\\\\u09a3\\\\u09cd\\\\u09af\\\\u0964\\\"},{\\\"name\\\":\\\"\\\\u09a4\\\\u09be\\\\u09a8\\\\u09ad\\\\u09c0\\\\u09b0 \\\\u09b9\\\\u09be\\\\u09b8\\\\u09be\\\\u09a8\\\",\\\"position\\\":\\\"Homemaker\\\",\\\"rating\\\":\\\"4\\\",\\\"comment\\\":\\\"\\\\u099b\\\\u09cb\\\\u099f \\\\u09b8\\\\u09be\\\\u0987\\\\u099c\\\\u09c7\\\\u09b0 \\\\u09b9\\\\u09b2\\\\u09c7\\\\u0993 \\\\u09ac\\\\u09c7\\\\u09b6 \\\\u0995\\\\u09be\\\\u09b0\\\\u09cd\\\\u09af\\\\u0995\\\\u09b0\\\\u0964 \\\\u09b0\\\\u09be\\\\u09a8\\\\u09cd\\\\u09a8\\\\u09be\\\\u0998\\\\u09b0\\\\u09c7 \\\\u0996\\\\u09c1\\\\u09ac \\\\u0995\\\\u09ae \\\\u099c\\\\u09be\\\\u09df\\\\u0997\\\\u09be \\\\u09a8\\\\u09c7\\\\u09df\\\\u0964\\\"}]\"', '\"[{\\\"question\\\":\\\"Prestige Mini Grinder \\\\u09a6\\\\u09bf\\\\u09df\\\\u09c7 \\\\u0995\\\\u09c0 \\\\u0995\\\\u09c0 \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1 \\\\u0995\\\\u09b0\\\\u09be \\\\u09af\\\\u09be\\\\u09df?\\\",\\\"answer\\\":\\\"\\\\u09b6\\\\u09c1\\\\u0995\\\\u09a8\\\\u09cb \\\\u09ae\\\\u09b0\\\\u09bf\\\\u099a, \\\\u099c\\\\u09bf\\\\u09b0\\\\u09be, \\\\u0997\\\\u09cb\\\\u09b2\\\\u09ae\\\\u09b0\\\\u09bf\\\\u099a, \\\\u09a7\\\\u09a8\\\\u09c7, \\\\u0995\\\\u09ab\\\\u09bf \\\\u09ac\\\\u09bf\\\\u09a8, \\\\u09ac\\\\u09be\\\\u09a6\\\\u09be\\\\u09ae\\\\u09b8\\\\u09b9 \\\\u09ac\\\\u09bf\\\\u09ad\\\\u09bf\\\\u09a8\\\\u09cd\\\\u09a8 \\\\u09b6\\\\u09c1\\\\u0995\\\\u09a8\\\\u09cb \\\\u0989\\\\u09aa\\\\u0995\\\\u09b0\\\\u09a3 \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1 \\\\u0995\\\\u09b0\\\\u09be \\\\u09af\\\\u09be\\\\u09df\\\\u0964\\\"},{\\\"question\\\":\\\"\\\\u098f\\\\u099f\\\\u09bf \\\\u0995\\\\u09bf \\\\u09a6\\\\u09c8\\\\u09a8\\\\u09a8\\\\u09cd\\\\u09a6\\\\u09bf\\\\u09a8 \\\\u09b0\\\\u09be\\\\u09a8\\\\u09cd\\\\u09a8\\\\u09be\\\\u09b0 \\\\u099c\\\\u09a8\\\\u09cd\\\\u09af \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0 \\\\u0995\\\\u09b0\\\\u09be \\\\u09af\\\\u09be\\\\u09df?\\\",\\\"answer\\\":\\\"\\\\u09b9\\\\u09cd\\\\u09af\\\\u09be\\\\u0981, \\\\u0985\\\\u09b2\\\\u09cd\\\\u09aa \\\\u09aa\\\\u09b0\\\\u09bf\\\\u09ae\\\\u09be\\\\u09a3 \\\\u09ae\\\\u09b8\\\\u09b2\\\\u09be \\\\u0993 \\\\u09b6\\\\u09c1\\\\u0995\\\\u09a8\\\\u09cb \\\\u0989\\\\u09aa\\\\u0995\\\\u09b0\\\\u09a3 \\\\u09a6\\\\u09cd\\\\u09b0\\\\u09c1\\\\u09a4 \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1 \\\\u0995\\\\u09b0\\\\u09be\\\\u09b0 \\\\u099c\\\\u09a8\\\\u09cd\\\\u09af \\\\u098f\\\\u099f\\\\u09bf \\\\u09a6\\\\u09c8\\\\u09a8\\\\u09a8\\\\u09cd\\\\u09a6\\\\u09bf\\\\u09a8 \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0\\\\u09c7 \\\\u0989\\\\u09aa\\\\u09af\\\\u09cb\\\\u0997\\\\u09c0\\\\u0964\\\"},{\\\"question\\\":\\\"Prestige Mini Grinder \\\\u09aa\\\\u09b0\\\\u09bf\\\\u09b7\\\\u09cd\\\\u0995\\\\u09be\\\\u09b0 \\\\u0995\\\\u09b0\\\\u09be \\\\u0995\\\\u09bf \\\\u09b8\\\\u09b9\\\\u099c?\\\",\\\"answer\\\":\\\"\\\\u09b9\\\\u09cd\\\\u09af\\\\u09be\\\\u0981, \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0\\\\u09c7\\\\u09b0 \\\\u09aa\\\\u09b0 \\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1\\\\u09bf\\\\u0982 \\\\u0985\\\\u0982\\\\u09b6 \\\\u09aa\\\\u09b0\\\\u09bf\\\\u09b7\\\\u09cd\\\\u0995\\\\u09be\\\\u09b0 \\\\u0995\\\\u09b0\\\\u09c7 \\\\u09b8\\\\u09b9\\\\u099c\\\\u09c7\\\\u0987 \\\\u09b8\\\\u0982\\\\u09b0\\\\u0995\\\\u09cd\\\\u09b7\\\\u09a3 \\\\u0995\\\\u09b0\\\\u09be \\\\u09af\\\\u09be\\\\u09df\\\\u0964\\\"},{\\\"question\\\":\\\"\\\\u0997\\\\u09cd\\\\u09b0\\\\u09be\\\\u0987\\\\u09a8\\\\u09cd\\\\u09a1\\\\u09be\\\\u09b0\\\\u099f\\\\u09bf \\\\u0995\\\\u09bf \\\\u09ac\\\\u09c7\\\\u09b6\\\\u09bf \\\\u099c\\\\u09be\\\\u09df\\\\u0997\\\\u09be \\\\u09a8\\\\u09c7\\\\u09df?\\\",\\\"answer\\\":\\\"\\\\u09a8\\\\u09be\\\\u0964 \\\\u098f\\\\u09b0 \\\\u0995\\\\u09ae\\\\u09aa\\\\u09cd\\\\u09af\\\\u09be\\\\u0995\\\\u09cd\\\\u099f \\\\u09a1\\\\u09bf\\\\u099c\\\\u09be\\\\u0987\\\\u09a8\\\\u09c7\\\\u09b0 \\\\u0995\\\\u09be\\\\u09b0\\\\u09a3\\\\u09c7 \\\\u09b0\\\\u09be\\\\u09a8\\\\u09cd\\\\u09a8\\\\u09be\\\\u0998\\\\u09b0\\\\u09c7 \\\\u0996\\\\u09c1\\\\u09ac \\\\u0995\\\\u09ae \\\\u099c\\\\u09be\\\\u09df\\\\u0997\\\\u09be\\\\u09df \\\\u09b0\\\\u09be\\\\u0996\\\\u09be \\\\u09af\\\\u09be\\\\u09df\\\\u0964\\\"},{\\\"question\\\":\\\"Prestige Mini Grinder \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0 \\\\u0995\\\\u09b0\\\\u09be \\\\u0995\\\\u09bf \\\\u09b8\\\\u09b9\\\\u099c?\\\",\\\"answer\\\":\\\"\\\\u09b9\\\\u09cd\\\\u09af\\\\u09be\\\\u0981, \\\\u098f\\\\u09b0 \\\\u09b8\\\\u09b9\\\\u099c \\\\u0985\\\\u09aa\\\\u09be\\\\u09b0\\\\u09c7\\\\u09b6\\\\u09a8 \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b8\\\\u09cd\\\\u09a5\\\\u09be \\\\u09a5\\\\u09be\\\\u0995\\\\u09be\\\\u09df \\\\u09a8\\\\u09a4\\\\u09c1\\\\u09a8 \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0\\\\u0995\\\\u09be\\\\u09b0\\\\u09c0\\\\u09b0\\\\u09be\\\\u0993 \\\\u09b8\\\\u09b9\\\\u099c\\\\u09c7\\\\u0987 \\\\u098f\\\\u099f\\\\u09bf \\\\u09ac\\\\u09cd\\\\u09af\\\\u09ac\\\\u09b9\\\\u09be\\\\u09b0 \\\\u0995\\\\u09b0\\\\u09a4\\\\u09c7 \\\\u09aa\\\\u09be\\\\u09b0\\\\u09ac\\\\u09c7\\\\u09a8\\\\u0964\\\"}]\"', 'Prestige Mini Grinder', 'Prestige Mini Grinder', '11', 18953, 635474, '01833022226', 'webcare.asif@gmail.com', '01833022226', 'webcare', 1, '2026-09-08 09:57:28', '2026-09-09 06:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_products`
--

CREATE TABLE `landing_page_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `landingpage_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `regular_price` decimal(10,2) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_page_products`
--

INSERT INTO `landing_page_products` (`id`, `landingpage_id`, `product_id`, `regular_price`, `discount_price`, `created_at`, `updated_at`) VALUES
(4, 7, 1, 5000.00, 0.00, '2026-09-09 06:24:04', '2026-09-09 06:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2021_06_07_000000_create_payku_transactions_table', 1),
(3, '2021_06_07_000001_create_payku_payments_table', 1),
(4, '2021_12_15_000000_add_new_columns_to_tables', 1),
(5, '2024_01_01_000001_create_users_table', 1),
(6, '2024_01_01_000002_create_uploads_table', 1),
(7, '2024_01_01_000003_create_business_settings_table', 1),
(8, '2024_01_01_000004_create_pages_table', 1),
(9, '2024_01_01_000005_create_page_translations_table', 1),
(10, '2024_01_01_000006_create_roles_table', 1),
(11, '2024_01_01_000007_create_role_translations_table', 1),
(12, '2024_01_01_000008_create_staff_table', 1),
(13, '2024_01_01_000009_create_transactions_table', 1),
(14, '2024_01_01_000010_create_password_resets_table', 1),
(15, '2024_01_01_000011_create_translations_table', 1),
(16, '2024_01_01_000012_create_app_translations_table', 1),
(18, '2024_01_01_000014_create_addons_table', 1),
(19, '2026_04_27_114426_create_visitor_logs_table', 1),
(25, '2026_04_30_152502_create_counters_table', 4),
(27, '2026_05_02_103608_create_videos_table', 6),
(28, '2026_05_02_114838_create_dropshiper_reviews_table', 7),
(31, '2026_05_02_151249_create_faqs_table', 8),
(32, '2026_05_02_165117_create_categories_table', 9),
(33, '2026_05_04_114306_create_contact_messages_table', 10),
(34, '2026_04_30_175143_create_discovers_table', 11),
(35, '2026_04_29_154026_create_blogs_table', 12),
(36, '2026_05_04_154518_create_teams_table', 13),
(38, '2026_05_05_111139_create_sections_table', 15),
(39, '2026_05_06_164540_create_newsletters_table', 16),
(40, '2026_05_10_103545_create_brands_table', 17),
(41, '2026_05_10_112953_create_sub_categories_table', 18),
(42, '2026_05_10_145616_create_colors_table', 19),
(47, '2026_05_11_112436_create_attributes_table', 20),
(48, '2026_05_11_113835_create_attribute_categories_table', 20),
(49, '2026_05_11_113914_create_attribute_values_table', 20),
(65, '2026_05_13_180404_create_products_table', 22),
(66, '2026_05_13_181129_create_product_inventories_table', 22),
(67, '2026_05_13_181442_create_product_varients_table', 22),
(68, '2026_05_13_183308_create_product_prices_table', 22),
(69, '2026_05_14_102427_create_product_seos_table', 22),
(70, '2026_05_14_102922_create_product_taxes_table', 22),
(71, '2026_05_14_103226_create_product_shippings_table', 22),
(72, '2026_05_17_111945_create_coupons_table', 23),
(73, '2026_05_17_112616_create_coupon_usages_table', 23),
(74, '2026_05_17_141236_create_reviews_table', 24),
(77, '2026_05_18_115200_create_carts_table', 26),
(78, '2026_05_18_153104_create_customers_table', 27),
(79, '2026_05_20_104926_create_searches_table', 28),
(80, '2026_05_20_152523_create_compares_table', 29),
(81, '2026_05_21_124338_create_campaigns_table', 30),
(82, '2026_05_21_141624_create_campaign_products_table', 30),
(87, '2026_06_06_125214_create_landingpages_table', 32),
(88, '2026_06_06_151732_create_landing_page_products_table', 32),
(89, '2026_04_30_123034_create_sliders_table', 33),
(91, '2026_06_02_104928_create_orders_table', 34),
(92, '2026_06_02_105547_create_order_details_table', 34),
(93, '2026_06_18_114808_create_jobs_table', 35),
(94, '2026_06_18_115302_create_import_statuses_table', 36),
(95, '2026_06_18_122342_create_product_import_statuses_table', 36),
(96, '2026_06_25_143546_create_incomplete_orders_table', 37),
(97, '2026_05_18_105615_create_wishlists_table', 38),
(98, '2026_07_12_110946_create_shipping_costs_table', 39),
(99, '2026_07_12_123518_create_payment_systems_table', 40),
(100, '2026_07_13_151230_create_section_configs_table', 41),
(101, '2026_05_13_161533_create_dropshippers_table', 42),
(102, '2026_05_04_175304_create_abouts_table', 43),
(103, '2026_08_08_120542_create_vendors_table', 44),
(104, '2026_08_11_151544_create_product_stock_requests_table', 45),
(105, '2026_08_13_150841_create_damage_products_table', 46),
(106, '2026_08_15_151703_create_vendor_order_products_table', 47),
(109, '2026_08_16_104750_create_withdraws_table', 48);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `subscribed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `status`, `subscribed_at`, `created_at`, `updated_at`) VALUES
(1, 'admin@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(3, 'admin1@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(4, 'admin2@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(5, 'admin3@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(6, 'admin4@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(7, 'admin5@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(8, 'admin6@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(9, 'admin7@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(10, 'admin8@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-06 11:03:45'),
(11, 'admin9@mail.com', 1, '2026-05-06 11:03:45', '2026-05-06 11:03:45', '2026-05-19 05:43:35'),
(12, 'newmail@gmail.com', 1, NULL, '2026-07-13 15:16:36', '2026-07-13 15:16:36'),
(13, 'newmail1@gmail.com', 1, NULL, '2026-07-13 15:16:58', '2026-07-13 15:16:58'),
(14, 'newmail12@gmail.com', 1, '2026-07-14 06:44:07', '2026-07-14 06:44:07', '2026-07-14 06:44:07'),
(15, 'admin@droploo.com', 1, '2026-07-26 09:57:23', '2026-07-26 09:57:23', '2026-07-26 09:57:23'),
(16, 'admin@gmail.com', 1, '2026-07-26 09:57:26', '2026-07-26 09:57:26', '2026-07-26 09:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `combined_order_id` bigint(20) DEFAULT NULL,
  `dropshipper_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_id` bigint(20) UNSIGNED DEFAULT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8mb4_unicode_ci,
  `delivery_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manual_payment` tinyint(1) NOT NULL DEFAULT '0',
  `manual_payment_data` longtext COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8mb4_unicode_ci,
  `grand_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status_viewed` tinyint(1) NOT NULL DEFAULT '0',
  `commission_calculated` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `combined_order_id`, `dropshipper_id`, `user_id`, `guest_id`, `seller_id`, `shipping_address`, `delivery_status`, `payment_type`, `manual_payment`, `manual_payment_data`, `payment_status`, `payment_details`, `grand_total`, `shipping_cost`, `coupon_discount`, `discount`, `code`, `tracking_code`, `notes`, `name`, `email_address`, `phone_number`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `shipping_type`, `order_type`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 3, NULL, NULL, 'House 18,Road 3F', 'pending', 'cod', 0, NULL, 'unpaid', NULL, 5060.00, 60.00, 0.00, 0.00, 'ORD-JRGHOVDM-1788862000', NULL, NULL, 'Asif Ul Islam', NULL, '01833022226', 2026, 0, 0, 0, 0, 'flat_rate', 'normal', '2026-09-08 10:06:40', '2026-09-08 10:06:40'),
(2, NULL, NULL, 3, NULL, NULL, 'House 18,Road 3F', 'pending', 'cod', 0, NULL, 'unpaid', NULL, 10120.00, 120.00, 0.00, 0.00, 'ORD-4IQ92PCU-1788862534', NULL, NULL, 'Asif Ul Islam', NULL, '01833022226', 2026, 0, 0, 0, 0, 'flat_rate', 'normal', '2026-09-08 10:15:34', '2026-09-09 04:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_point_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_referral_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `sku`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, NULL, NULL, 5000.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'flat_rate', NULL, NULL, '2026-09-08 10:06:40', '2026-09-08 10:06:40'),
(2, 2, NULL, 1, NULL, NULL, 5000.00, 0.00, 0.00, 2, 'unpaid', 'pending', 'flat_rate', NULL, NULL, '2026-09-08 10:15:34', '2026-09-08 11:35:31');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(100) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `position`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
(1, 'privacy_policy', 8, 'Privacy Policy', 'privacy-policy', '<p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">রিটার্ন ও রিফান্ড পলিসিঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">কোন কোন ক্ষেত্রে রিফান্ড প্রযোজ্য হবেঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। অর্ডার করা পণ্য আমাদের কাছ থেকে ডেলিভারি পাওয়ার পর পণ্যে যদি কোনো ত্রুটি থাকে, ড্যামেজ থাকে অথবা আপনাকে যদি ভুল পণ্য কিংবা অসম্পূর্ণ পণ্য পাঠানো হয় শুধুমাত্র সেই ক্ষেত্রে আমাদের ওয়েবসাইটের রিফান্ড অপশনে যেয়ে ২৪ ঘণ্টার মধ্যে উপযুক্ত প্রমান সহ রিফান্ডের জন্য আবেদন করতে হবে। এর পরে রিফান্ডের জন্য আবেদন করলে তা গ্রহণ করা হবে না।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। আমাদের এখানে পণ্য এক্সচেঞ্জ করার সিস্টেম নেই।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">মিসিং বা হারিয়ে যাওয়া প্রোডাক্ট এর রিফান্ড পলিসি ক্লেইম এর ক্ষেত্রে নির্দেশনাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। গ্রাহক যখন তার ডেলিভারিকৃত প্রোডাক্ট গুলো আনবক্সিং করবে ,তখন তার একটি ভিডিও ফুটেজ সংরক্ষণ করতে হবে।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২ । মিসিং প্রোডাক্টের ক্ষেত্রে ডেলিভারিকৃত প্রোডাক্টের যথাযথ সাইজ /কালার উল্লেখ করে তার মধ্যে থেকে মিসিং প্রোডাক্টের সংখ্যাসহ বিস্তারিত লিখিত এবং ছবিসহ আমাদের জানাতে হবে<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৩। মিসিং প্রোডাক্ট ক্লেইমের ক্ষেত্রে গ্রাহককে অবশ্যই ডেলিভারি হওয়ার ২৪ ঘণ্টার মধ্যে যথাযথ প্রমানগুলো সহ কাস্টমার সাপোর্টে অভিযোগ জানাতে হবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">রিফান্ড করার সময়সীমাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">আপনি সবগুলো শর্ত মেনে রিফান্ডের জন্য আবেদন করার পর আমাদের টিম আপনার সাথে যোগাযোগ করবে। আপনার আবেদনটি যদি আমাদের রিফান্ড পলিসির মধ্যে পরে সেই ক্ষেত্রে আপনার অর্ডার করা পণ্যের মূল্য ৭ কর্ম দিবসের মধ্যে রিফান্ড করা হবে। ক্ষেত্র বিশেষে,আপনার পেমেন্ট মেথডের ওপর ভিত্তি করে রিফান্ড টাইম কম বা বেশি হতে পারে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কোন কোন ক্ষেত্রে রিটার্ন প্রযোজ্য হবেঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">অর্ডার করা পণ্যের সাথে ডেলিভারি করা পণ্যের কালার কিংবা সাইজের মিল না থাকলে সেই পণ্য রিটার্ন করার ক্ষেত্রে আমাদের ওয়েবসাইটের রিটার্ন অপশনে যেয়ে ২৪ ঘণ্টার মধ্যে উপযুক্ত প্রমান সহ রিফান্ডের জন্য আবেদন করতে হবে। এর পরে আবেদন করলে তা আর গ্রহণযোগ্য হবে না। আমাদের টিম আপনার আবেদনটি বিশ্লেষণ করে আপনার সাথে যোগাযোগ করবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কোন কোন ক্ষেত্রে রিটার্ন প্রযোজ্য হবেনাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। রিটার্ন করা পণ্যটি অবশ্যই অব্যবহৃত হতে হবে, কোনো ভাবেই পণ্যটি ধৌত/ব্যবহৃত হওয়া যাবেনা। শুধুমাত্র ফ্যাশন প্রোডাক্টের ক্ষেত্রে তা পরে ট্রায়াল দেয়া যাবে তবে তা কোনো ভাবেই ভাজ ফেলা কিংবা ধোঁয়া যাবে না।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। পণ্যটিতে অবশ্যই অরিজিনাল ট্যাগ, ইউজার ম্যানুয়াল, ওয়ারেন্টি কার্ড এবং সাথে দেয়া সকল এক্সেসরিজ থাকতে হবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কিভাবে রিফান্ড/রিটার্নের জন্য আবেদন করবেন?<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। প্রথমে আপনাকে আপনার একাউন্টে লগিন করুন। তারপর Return Process পেইজে ক্লিক করুন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। অতঃপর সেখানে দেয়া ফর্মটি সঠিক তথ্য দিয়ে ফিল আপ করুন এবং Submit বাটনটিতে ক্লিক করুন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৩। আপনার ঠিকানা যদি ঢাকার মধ্যে হয় সেই ক্ষেত্রে আপনি চাইলে নিজে এসে আমাদের অফিসে পণ্যটি রিটার্ন করে দিতে পারবেন অথবা আমাদের ঠিকানায় কুরিয়ার করে পাঠাতে পারবেন। অন্যদিকে, আপনার ঠিকানা যদি ঢাকার বাইরে হয় সেই ক্ষেত্রে পণ্যটি কুরিয়ার করে আমাদের ঠিকানায় পাঠাতে পারবেন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৪। ঢাকা কিংবা ঢাকার বাইরে থেকে পণ্য পাঠানোর আগে অবশ্যই আমাদেরকে আগে ফোনে অথবা ইমেইল করে জানাতে হবে। উভয় ক্ষেত্রে আপনাকে নিজ খরচে ও নিজ দায়িত্বে পণ্যটি কুরিয়ার করতে হবে। কুরিয়ারে পণ্য হারালে বা নষ্ট হলে তা আমাদের দায়বদ্ধতার বাইরে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">যে কুরিয়ার সার্ভিসসমূহের মাধ্যমে পণ্য রিটার্ন করতে পারবেনঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। ঢাকার ভেতর হলেঃ পাঠাও, রেডেক্স, ই-কুরিয়ার<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। ঢাকার বাহিরে হলেঃ সুন্দরবন কুরিয়ার, এস এ পরিবহন</p>', 'Privacy Policy', 'Privacy Policy page', 'privacy, policy', NULL, '2026-04-29 08:27:41', '2026-07-25 08:22:32'),
(2, 'terms_and_conditions', 9, 'Terms & Conditions', 'terms_and_conditions', '<p>Add your terms and conditions content here.</p>', 'Terms & Conditions', 'Terms and Conditions page', 'terms, conditions', NULL, '2026-04-29 08:27:41', '2026-07-25 08:22:32'),
(3, 'about_us', 2, 'About Us', 'about-us', '<p>Add your about us content here.</p>', 'About Us', 'About Us page', 'about, us', NULL, '2026-04-29 08:27:41', '2026-07-25 08:22:32'),
(4, 'contact_us', 5, 'Contact Us', 'contact-us', '<p>Add your contact us content here.</p>', 'Contact Us', 'Contact Us page', 'contact, us', NULL, '2026-04-29 08:27:41', '2026-07-25 08:22:32'),
(7, 'home', 1, 'Home', 'home', '<p>Add your contact us content here.</p>', 'Home Us', 'Home page', 'Home', NULL, '2026-04-29 08:27:41', '2026-07-25 08:22:32'),
(8, 'custom_page', 3, 'Blog', 'blog', '<p>asdas</p>', 'Duis quo temporibus', 'wdeqwe', 'qweqwe, qweqwe,', '17', '2026-05-06 08:45:52', '2026-07-25 08:22:32'),
(9, 'custom_page', 4, 'Integration', 'integration', '<p>integration</p>', 'integration', 'integration', 'integration', '25', '2026-05-06 09:42:14', '2026-07-25 08:22:32');
INSERT INTO `pages` (`id`, `type`, `position`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
(10, 'return_policy', 6, 'return policy', 'return_policy', '<p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">রিটার্ন ও রিফান্ড পলিসিঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">কোন কোন ক্ষেত্রে রিফান্ড প্রযোজ্য হবেঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। অর্ডার করা পণ্য আমাদের কাছ থেকে ডেলিভারি পাওয়ার পর পণ্যে যদি কোনো ত্রুটি থাকে, ড্যামেজ থাকে অথবা আপনাকে যদি ভুল পণ্য কিংবা অসম্পূর্ণ পণ্য পাঠানো হয় শুধুমাত্র সেই ক্ষেত্রে আমাদের ওয়েবসাইটের রিফান্ড অপশনে যেয়ে ২৪ ঘণ্টার মধ্যে উপযুক্ত প্রমান সহ রিফান্ডের জন্য আবেদন করতে হবে। এর পরে রিফান্ডের জন্য আবেদন করলে তা গ্রহণ করা হবে না।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। আমাদের এখানে পণ্য এক্সচেঞ্জ করার সিস্টেম নেই।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">মিসিং বা হারিয়ে যাওয়া প্রোডাক্ট এর রিফান্ড পলিসি ক্লেইম এর ক্ষেত্রে নির্দেশনাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। গ্রাহক যখন তার ডেলিভারিকৃত প্রোডাক্ট গুলো আনবক্সিং করবে ,তখন তার একটি ভিডিও ফুটেজ সংরক্ষণ করতে হবে।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২ । মিসিং প্রোডাক্টের ক্ষেত্রে ডেলিভারিকৃত প্রোডাক্টের যথাযথ সাইজ /কালার উল্লেখ করে তার মধ্যে থেকে মিসিং প্রোডাক্টের সংখ্যাসহ বিস্তারিত লিখিত এবং ছবিসহ আমাদের জানাতে হবে<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৩। মিসিং প্রোডাক্ট ক্লেইমের ক্ষেত্রে গ্রাহককে অবশ্যই ডেলিভারি হওয়ার ২৪ ঘণ্টার মধ্যে যথাযথ প্রমানগুলো সহ কাস্টমার সাপোর্টে অভিযোগ জানাতে হবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">রিফান্ড করার সময়সীমাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">আপনি সবগুলো শর্ত মেনে রিফান্ডের জন্য আবেদন করার পর আমাদের টিম আপনার সাথে যোগাযোগ করবে। আপনার আবেদনটি যদি আমাদের রিফান্ড পলিসির মধ্যে পরে সেই ক্ষেত্রে আপনার অর্ডার করা পণ্যের মূল্য ৭ কর্ম দিবসের মধ্যে রিফান্ড করা হবে। ক্ষেত্র বিশেষে,আপনার পেমেন্ট মেথডের ওপর ভিত্তি করে রিফান্ড টাইম কম বা বেশি হতে পারে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কোন কোন ক্ষেত্রে রিটার্ন প্রযোজ্য হবেঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">অর্ডার করা পণ্যের সাথে ডেলিভারি করা পণ্যের কালার কিংবা সাইজের মিল না থাকলে সেই পণ্য রিটার্ন করার ক্ষেত্রে আমাদের ওয়েবসাইটের রিটার্ন অপশনে যেয়ে ২৪ ঘণ্টার মধ্যে উপযুক্ত প্রমান সহ রিফান্ডের জন্য আবেদন করতে হবে। এর পরে আবেদন করলে তা আর গ্রহণযোগ্য হবে না। আমাদের টিম আপনার আবেদনটি বিশ্লেষণ করে আপনার সাথে যোগাযোগ করবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কোন কোন ক্ষেত্রে রিটার্ন প্রযোজ্য হবেনাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। রিটার্ন করা পণ্যটি অবশ্যই অব্যবহৃত হতে হবে, কোনো ভাবেই পণ্যটি ধৌত/ব্যবহৃত হওয়া যাবেনা। শুধুমাত্র ফ্যাশন প্রোডাক্টের ক্ষেত্রে তা পরে ট্রায়াল দেয়া যাবে তবে তা কোনো ভাবেই ভাজ ফেলা কিংবা ধোঁয়া যাবে না।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। পণ্যটিতে অবশ্যই অরিজিনাল ট্যাগ, ইউজার ম্যানুয়াল, ওয়ারেন্টি কার্ড এবং সাথে দেয়া সকল এক্সেসরিজ থাকতে হবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কিভাবে রিফান্ড/রিটার্নের জন্য আবেদন করবেন?<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। প্রথমে আপনাকে আপনার একাউন্টে লগিন করুন। তারপর Return Process পেইজে ক্লিক করুন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। অতঃপর সেখানে দেয়া ফর্মটি সঠিক তথ্য দিয়ে ফিল আপ করুন এবং Submit বাটনটিতে ক্লিক করুন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৩। আপনার ঠিকানা যদি ঢাকার মধ্যে হয় সেই ক্ষেত্রে আপনি চাইলে নিজে এসে আমাদের অফিসে পণ্যটি রিটার্ন করে দিতে পারবেন অথবা আমাদের ঠিকানায় কুরিয়ার করে পাঠাতে পারবেন। অন্যদিকে, আপনার ঠিকানা যদি ঢাকার বাইরে হয় সেই ক্ষেত্রে পণ্যটি কুরিয়ার করে আমাদের ঠিকানায় পাঠাতে পারবেন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৪। ঢাকা কিংবা ঢাকার বাইরে থেকে পণ্য পাঠানোর আগে অবশ্যই আমাদেরকে আগে ফোনে অথবা ইমেইল করে জানাতে হবে। উভয় ক্ষেত্রে আপনাকে নিজ খরচে ও নিজ দায়িত্বে পণ্যটি কুরিয়ার করতে হবে। কুরিয়ারে পণ্য হারালে বা নষ্ট হলে তা আমাদের দায়বদ্ধতার বাইরে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">যে কুরিয়ার সার্ভিসসমূহের মাধ্যমে পণ্য রিটার্ন করতে পারবেনঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। ঢাকার ভেতর হলেঃ পাঠাও, রেডেক্স, ই-কুরিয়ার<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। ঢাকার বাহিরে হলেঃ সুন্দরবন কুরিয়ার, এস এ পরিবহন</p>', 'Privacy Policy', 'Privacy Policy page', 'privacy, policy', NULL, '2026-04-29 08:27:41', '2026-07-25 08:22:32');
INSERT INTO `pages` (`id`, `type`, `position`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
(11, 'refund_policy', 7, 'Refund Policy', 'refund_policy', '<p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">রিটার্ন ও রিফান্ড পলিসিঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">কোন কোন ক্ষেত্রে রিফান্ড প্রযোজ্য হবেঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। অর্ডার করা পণ্য আমাদের কাছ থেকে ডেলিভারি পাওয়ার পর পণ্যে যদি কোনো ত্রুটি থাকে, ড্যামেজ থাকে অথবা আপনাকে যদি ভুল পণ্য কিংবা অসম্পূর্ণ পণ্য পাঠানো হয় শুধুমাত্র সেই ক্ষেত্রে আমাদের ওয়েবসাইটের রিফান্ড অপশনে যেয়ে ২৪ ঘণ্টার মধ্যে উপযুক্ত প্রমান সহ রিফান্ডের জন্য আবেদন করতে হবে। এর পরে রিফান্ডের জন্য আবেদন করলে তা গ্রহণ করা হবে না।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। আমাদের এখানে পণ্য এক্সচেঞ্জ করার সিস্টেম নেই।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">মিসিং বা হারিয়ে যাওয়া প্রোডাক্ট এর রিফান্ড পলিসি ক্লেইম এর ক্ষেত্রে নির্দেশনাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। গ্রাহক যখন তার ডেলিভারিকৃত প্রোডাক্ট গুলো আনবক্সিং করবে ,তখন তার একটি ভিডিও ফুটেজ সংরক্ষণ করতে হবে।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২ । মিসিং প্রোডাক্টের ক্ষেত্রে ডেলিভারিকৃত প্রোডাক্টের যথাযথ সাইজ /কালার উল্লেখ করে তার মধ্যে থেকে মিসিং প্রোডাক্টের সংখ্যাসহ বিস্তারিত লিখিত এবং ছবিসহ আমাদের জানাতে হবে<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৩। মিসিং প্রোডাক্ট ক্লেইমের ক্ষেত্রে গ্রাহককে অবশ্যই ডেলিভারি হওয়ার ২৪ ঘণ্টার মধ্যে যথাযথ প্রমানগুলো সহ কাস্টমার সাপোর্টে অভিযোগ জানাতে হবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">রিফান্ড করার সময়সীমাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">আপনি সবগুলো শর্ত মেনে রিফান্ডের জন্য আবেদন করার পর আমাদের টিম আপনার সাথে যোগাযোগ করবে। আপনার আবেদনটি যদি আমাদের রিফান্ড পলিসির মধ্যে পরে সেই ক্ষেত্রে আপনার অর্ডার করা পণ্যের মূল্য ৭ কর্ম দিবসের মধ্যে রিফান্ড করা হবে। ক্ষেত্র বিশেষে,আপনার পেমেন্ট মেথডের ওপর ভিত্তি করে রিফান্ড টাইম কম বা বেশি হতে পারে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কোন কোন ক্ষেত্রে রিটার্ন প্রযোজ্য হবেঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">অর্ডার করা পণ্যের সাথে ডেলিভারি করা পণ্যের কালার কিংবা সাইজের মিল না থাকলে সেই পণ্য রিটার্ন করার ক্ষেত্রে আমাদের ওয়েবসাইটের রিটার্ন অপশনে যেয়ে ২৪ ঘণ্টার মধ্যে উপযুক্ত প্রমান সহ রিফান্ডের জন্য আবেদন করতে হবে। এর পরে আবেদন করলে তা আর গ্রহণযোগ্য হবে না। আমাদের টিম আপনার আবেদনটি বিশ্লেষণ করে আপনার সাথে যোগাযোগ করবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কোন কোন ক্ষেত্রে রিটার্ন প্রযোজ্য হবেনাঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। রিটার্ন করা পণ্যটি অবশ্যই অব্যবহৃত হতে হবে, কোনো ভাবেই পণ্যটি ধৌত/ব্যবহৃত হওয়া যাবেনা। শুধুমাত্র ফ্যাশন প্রোডাক্টের ক্ষেত্রে তা পরে ট্রায়াল দেয়া যাবে তবে তা কোনো ভাবেই ভাজ ফেলা কিংবা ধোঁয়া যাবে না।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। পণ্যটিতে অবশ্যই অরিজিনাল ট্যাগ, ইউজার ম্যানুয়াল, ওয়ারেন্টি কার্ড এবং সাথে দেয়া সকল এক্সেসরিজ থাকতে হবে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">কিভাবে রিফান্ড/রিটার্নের জন্য আবেদন করবেন?<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। প্রথমে আপনাকে আপনার একাউন্টে লগিন করুন। তারপর Return Process পেইজে ক্লিক করুন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। অতঃপর সেখানে দেয়া ফর্মটি সঠিক তথ্য দিয়ে ফিল আপ করুন এবং Submit বাটনটিতে ক্লিক করুন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৩। আপনার ঠিকানা যদি ঢাকার মধ্যে হয় সেই ক্ষেত্রে আপনি চাইলে নিজে এসে আমাদের অফিসে পণ্যটি রিটার্ন করে দিতে পারবেন অথবা আমাদের ঠিকানায় কুরিয়ার করে পাঠাতে পারবেন। অন্যদিকে, আপনার ঠিকানা যদি ঢাকার বাইরে হয় সেই ক্ষেত্রে পণ্যটি কুরিয়ার করে আমাদের ঠিকানায় পাঠাতে পারবেন।<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">৪। ঢাকা কিংবা ঢাকার বাইরে থেকে পণ্য পাঠানোর আগে অবশ্যই আমাদেরকে আগে ফোনে অথবা ইমেইল করে জানাতে হবে। উভয় ক্ষেত্রে আপনাকে নিজ খরচে ও নিজ দায়িত্বে পণ্যটি কুরিয়ার করতে হবে। কুরিয়ারে পণ্য হারালে বা নষ্ট হলে তা আমাদের দায়বদ্ধতার বাইরে।</p><p style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin: 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(246, 247, 249);\">যে কুরিয়ার সার্ভিসসমূহের মাধ্যমে পণ্য রিটার্ন করতে পারবেনঃ<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">১। ঢাকার ভেতর হলেঃ পাঠাও, রেডেক্স, ই-কুরিয়ার<br style=\"box-sizing: inherit; border-width: 0px; border-style: solid; border-color: rgb(229, 231, 235); --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ;\">২। ঢাকার বাহিরে হলেঃ সুন্দরবন কুরিয়ার, এস এ পরিবহন</p>', 'Privacy Policy', 'Privacy Policy page', 'privacy, policy', NULL, '2026-04-29 08:27:41', '2026-07-25 08:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payku_payments`
--

CREATE TABLE `payku_payments` (
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `media` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_4_digits` int(10) UNSIGNED DEFAULT NULL,
  `installments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_parameters` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payku_transactions`
--

CREATE TABLE `payku_transactions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `amount` int(10) UNSIGNED DEFAULT NULL,
  `notified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_systems`
--

CREATE TABLE `payment_systems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_systems`
--

INSERT INTO `payment_systems` (`id`, `title`, `type`, `image`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Fugit doloribus qua1', 'Et cumque consequatu', '544', 1, '2026-07-12 07:01:20', '2026-07-12 08:12:11'),
(2, 'Vero blanditiis sunt', 'Lorem aut ratione od', '545', 0, '2026-07-12 08:11:29', '2026-07-12 08:11:55'),
(3, 'Adipisci asperiores', 'Aut officia expedita', '537', 0, '2026-07-12 08:11:55', '2026-07-12 08:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 53, 'auth_token', 'b9c3f173b01cd065f95bc3874d2745111af140c01268ea3956b58a2bb5c6b525', '[\"*\"]', NULL, '2026-07-07 10:34:26', '2026-07-07 10:34:26'),
(2, 'App\\Models\\User', 53, 'auth_token', '34b1fd13d6222e38dfcbb8dedcb949b51ec8f60a70fd960006b13fb771f618d1', '[\"*\"]', NULL, '2026-07-07 10:35:50', '2026-07-07 10:35:50'),
(3, 'App\\Models\\User', 53, 'auth_token', '5bd18be99416c140d380922dc0113a02f1682deef7fc261fbfeeb35565cf7dd1', '[\"*\"]', NULL, '2026-07-07 10:38:57', '2026-07-07 10:38:57'),
(4, 'App\\Models\\User', 53, 'auth_token', '251155dd8393b7fd6e454a2b338b11ea5b44fd83a01b144027ed48869bef85e3', '[\"*\"]', NULL, '2026-07-07 10:39:02', '2026-07-07 10:39:02'),
(5, 'App\\Models\\User', 53, 'auth_token', 'f66648150b2d34a58952e194206d01944ecb7455eb4230559e7d6be1fa56e12a', '[\"*\"]', NULL, '2026-07-07 10:40:28', '2026-07-07 10:40:28'),
(6, 'App\\Models\\User', 53, 'auth_token', '438f3c146ee404cf6b72e1c87bc5104161ad26db7e49aeb8ac4e8fa5c11a26f3', '[\"*\"]', NULL, '2026-07-07 10:42:27', '2026-07-07 10:42:27'),
(7, 'App\\Models\\User', 53, 'auth_token', 'c195f558e4eb195816470fced14241611620e28d8e20f277209993ae3ce06b7a', '[\"*\"]', NULL, '2026-07-07 10:42:41', '2026-07-07 10:42:41'),
(8, 'App\\Models\\User', 53, 'auth_token', '8908c0a6ba39189cc1d3bad4e02cda73519ebeba3d38fd1185790e282aaa14d2', '[\"*\"]', NULL, '2026-07-07 10:42:43', '2026-07-07 10:42:43'),
(9, 'App\\Models\\User', 53, 'auth_token', 'cfe6051ffd04ad2e5a849687eaf2ad736129c375a6d1fc00922ffe6fe81ef3f3', '[\"*\"]', NULL, '2026-07-07 10:42:46', '2026-07-07 10:42:46'),
(10, 'App\\Models\\User', 53, 'auth_token', '8c01e02109c8d61262bba82b1b559e32f911d4162dd5201af3011420f24dcd97', '[\"*\"]', NULL, '2026-07-07 10:42:54', '2026-07-07 10:42:54'),
(11, 'App\\Models\\User', 53, 'auth_token', '7968a4a488a2442fefac833987f2e3961589828d50606ba4cd018c1ebceb1b1a', '[\"*\"]', NULL, '2026-07-07 10:42:58', '2026-07-07 10:42:58'),
(13, 'App\\Models\\User', 53, 'auth_token', '86ad6db4c3d7856c7017ddf6a3f3dfd4193333a62f3373524964854ea70efc42', '[\"*\"]', NULL, '2026-07-07 10:50:29', '2026-07-07 10:50:29'),
(14, 'App\\Models\\User', 53, 'auth_token', 'c7672a6ccdc2024e6069037c5ad5f42a8eb0b13118a3581d93a0048f7683c4d5', '[\"*\"]', '2026-07-08 05:03:46', '2026-07-07 10:50:32', '2026-07-08 05:03:46'),
(15, 'App\\Models\\User', 53, 'auth_token', '75312ee87a727718224494b2962e4887faa0a245c1401aca3954515f42addbcd', '[\"*\"]', NULL, '2026-07-07 11:50:36', '2026-07-07 11:50:36'),
(16, 'App\\Models\\User', 48, 'auth_token', '0f363d013358845ea97dca8e38d701d042974913c0a4a1582e5e3d9ab6e46ac8', '[\"*\"]', NULL, '2026-07-08 05:02:45', '2026-07-08 05:02:45'),
(17, 'App\\Models\\User', 48, 'auth_token', 'fdacfe237a2fd13ee1717fe6320453a440cdd78d4d4dcd42df32f3bc48942895', '[\"*\"]', '2026-07-16 05:09:18', '2026-07-08 05:02:58', '2026-07-16 05:09:18'),
(18, 'App\\Models\\User', 48, 'auth_token', 'b97a682660d02a9df409b9af849df7fa5aeb0c15e04d10ff4b42909562060851', '[\"*\"]', '2026-07-09 05:59:05', '2026-07-09 05:43:43', '2026-07-09 05:59:05'),
(19, 'App\\Models\\User', 55, 'auth_token', '6190f8c8cbb9e35ecd951b422d9e6eef0e236426d16b2c804b4006ccb9a18f85', '[\"*\"]', NULL, '2026-07-15 08:33:12', '2026-07-15 08:33:12'),
(20, 'App\\Models\\User', 48, 'auth_token', 'd6739d3717322eceb987711751d24e718a74944e000b61d1fb3d110336f4d737', '[\"*\"]', '2026-07-26 08:33:22', '2026-07-15 08:33:41', '2026-07-26 08:33:22'),
(21, 'App\\Models\\User', 48, 'auth_token', '56007dec13319684e23ce12d0a723159fc92072bb5bf45409dbfbc946c6fc837', '[\"*\"]', '2026-07-16 05:32:04', '2026-07-16 05:27:35', '2026-07-16 05:32:04'),
(23, 'App\\Models\\User', 48, 'auth_token', '2d69aa1ec3f8c62d221d6e0f3226edb3d8ec77d7975040b7ddb1735334ef401a', '[\"*\"]', '2026-07-18 05:36:21', '2026-07-18 05:14:25', '2026-07-18 05:36:21'),
(25, 'App\\Models\\User', 48, 'auth_token', '824659055565c049968d8c05cba82fc998006b4cd420caeb25a66efe2f924c29', '[\"*\"]', NULL, '2026-07-26 08:31:59', '2026-07-26 08:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `droploo_product_id` int(100) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(100) DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos` longtext COLLATE utf8mb4_unicode_ci,
  `tags` longtext COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `is_cat` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT '0',
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `badge_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_no` int(11) DEFAULT NULL,
  `todays_deal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `best_selling` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `is_new_arrival` tinyint(1) NOT NULL DEFAULT '0',
  `stock_request` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `droploo_product_id`, `name`, `slug`, `added_by`, `user_id`, `vendor_id`, `brand_id`, `category_id`, `subcategory_id`, `thumbnail`, `photos`, `tags`, `description`, `short_description`, `status`, `is_published`, `is_cat`, `is_featured`, `unit`, `barcode`, `num_of_sale`, `video_link`, `is_variant`, `badge_name`, `batch_no`, `todays_deal`, `best_selling`, `position`, `is_new_arrival`, `stock_request`, `created_at`, `updated_at`) VALUES
(1, 1648, 'Prestige Mini Grinder', 'prestige-mini-grinder', 1, 1, NULL, NULL, 50, NULL, '11', '[\"11\",\"10\",\"9\"]', NULL, '<p>The Prestige Electric Mini Grinder is a compact, portable kitchen appliance designed for rapid dry milling of staples like spices, coffee beans, and grains. It features a food-grade stainless steel bowl and blades housed in an impact-resistant ABS body with a simple one-button push switch.<br><br>The Prestige Electric Mini Grinder is a compact, portable kitchen appliance designed for rapid dry milling of staples like spices, coffee beans, and grains. It features a food-grade stainless steel bowl and blades housed in an impact-resistant ABS body with a simple one-button push switch!</p>', 'The Prestige Electric Mini Grinder is a compact, portable kitchen appliance designed for rapid dry milling of staples like spices, coffee beans, and grains.', 1, 1, 0, 0, 'Pis', NULL, 0, 'https://www.youtube.com/watch?v=XG_9X3p4nlY', 1, NULL, NULL, 0.00, 0, 0, 0, 0, '2026-09-08 08:09:03', '2026-09-08 08:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_import_statuses`
--

CREATE TABLE `product_import_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_rows` int(11) NOT NULL DEFAULT '0',
  `processed_rows` int(11) NOT NULL DEFAULT '0',
  `success_rows` int(11) NOT NULL DEFAULT '0',
  `error_rows` int(11) NOT NULL DEFAULT '0',
  `inserted_rows` int(11) NOT NULL DEFAULT '0',
  `updated_rows` int(11) NOT NULL DEFAULT '0',
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'processing',
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `low_stock_qty` int(11) NOT NULL DEFAULT '0',
  `track_inventory` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_inventories`
--

INSERT INTO `product_inventories` (`id`, `product_id`, `sku`, `barcode`, `stock`, `low_stock_qty`, `track_inventory`, `created_at`, `updated_at`) VALUES
(1, 1, 'PRE234', NULL, 100, 1, 1, '2026-09-08 08:09:03', '2026-09-08 08:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_prices`
--

CREATE TABLE `product_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `wholesale_price` float NOT NULL,
  `regular_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('flat','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_start` timestamp NULL DEFAULT NULL,
  `discount_end` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BDT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_prices`
--

INSERT INTO `product_prices` (`id`, `product_id`, `purchase_price`, `wholesale_price`, `regular_price`, `sale_price`, `discount_type`, `discount`, `discount_start`, `discount_end`, `currency`, `created_at`, `updated_at`) VALUES
(1, 1, 4500.00, 4500, 5000.00, 5000.00, 'flat', 0.00, NULL, NULL, 'BDT', '2026-09-08 08:09:03', '2026-09-08 08:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_seos`
--

CREATE TABLE `product_seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_seos`
--

INSERT INTO `product_seos` (`id`, `product_id`, `meta_title`, `meta_image`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Prestige Mini Grinder', NULL, NULL, '2026-09-08 08:09:03', '2026-09-08 08:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_shippings`
--

CREATE TABLE `product_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_type` enum('free','flat_rate','local_pickup') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'flat_rate',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(10,2) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_shippings`
--

INSERT INTO `product_shippings` (`id`, `product_id`, `shipping_type`, `shipping_cost`, `weight`, `length`, `width`, `height`, `created_at`, `updated_at`) VALUES
(1, 1, 'flat_rate', 0.00, NULL, NULL, NULL, NULL, '2026-09-08 08:09:03', '2026-09-08 08:09:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_stock_requests`
--

CREATE TABLE `product_stock_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_stock` int(11) DEFAULT NULL COMMENT 'Stock before the request',
  `requested_quantity` int(11) DEFAULT NULL COMMENT 'Quantity requested by vendor',
  `approved_quantity` int(11) DEFAULT NULL COMMENT 'Quantity approved by admin',
  `damaged_quantity` int(11) DEFAULT NULL COMMENT 'Quantity marked as damaged by admin',
  `status` enum('pending','approved','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL,
  `tax_type` enum('flat','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_varients`
--

CREATE TABLE `product_varients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `wholesale_price` float NOT NULL,
  `purchase_price` float DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `color` int(11) DEFAULT NULL,
  `attribute_value` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` enum('flat','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2026-04-29 08:27:41', '2026-04-29 08:27:41'),
(2, 'Staff', '2026-04-29 08:27:41', '2026-04-29 08:27:41'),
(3, 'Customer', '2026-04-29 08:27:41', '2026-04-29 08:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_translations`
--

CREATE TABLE `role_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `query` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(1, 'PEN', 145, '2026-05-15 23:38:02', '2026-05-15 23:38:02'),
(2, 'chair 2021', 107, '2026-05-17 00:59:02', '2026-05-17 00:59:02'),
(3, 'blender', 91, '2026-02-19 22:17:02', '2026-03-20 22:17:02'),
(4, 'Camera', 105, '2026-05-15 10:49:02', '2026-05-17 10:49:02'),
(5, 'best headphones', 45, '2026-04-21 16:54:02', '2026-04-30 16:54:02'),
(6, 't-shirt', 127, '2026-05-18 01:32:02', '2026-05-19 01:32:02'),
(7, 'buy jacket online', 39, '2026-04-29 11:42:02', '2026-04-29 11:42:02'),
(8, 'Bag', 93, '2026-04-29 23:06:02', '2026-04-29 23:06:02'),
(9, 'iron', 99, '2026-05-19 11:43:02', '2026-05-19 11:43:02'),
(10, 'tv price', 40, '2026-05-14 05:12:02', '2026-05-16 05:12:02'),
(11, 'mouse 2023', 129, '2026-05-19 14:58:02', '2026-05-19 14:58:02'),
(12, 'marker price', 58, '2026-04-04 12:04:02', '2026-04-04 12:04:02'),
(13, 'HOODIE', 57, '2026-05-18 16:49:02', '2026-05-18 16:49:02'),
(14, 'SANDALS', 5, '2026-02-08 01:09:02', '2026-02-08 01:09:02'),
(15, 'keyboard 2021', 128, '2026-05-18 06:24:02', '2026-05-19 06:24:02'),
(16, 'hard drive 2022', 52, '2026-04-14 07:37:02', '2026-05-05 07:37:02'),
(17, 'mouse', 92, '2025-11-29 15:26:02', '2026-05-19 15:26:02'),
(18, 'refrigerator', 124, '2026-05-13 14:46:02', '2026-05-13 14:46:02'),
(19, 'best washing machine', 93, '2025-11-23 14:25:02', '2026-02-13 14:25:02'),
(20, 'treadmill 2022', 30, '2025-11-28 06:04:02', '2025-11-28 06:04:02'),
(21, 'tablet', 82, '2026-01-13 02:34:02', '2026-01-13 02:34:02'),
(22, 'ERASER', 109, '2026-05-03 22:25:02', '2026-05-18 22:25:02'),
(23, 'best mouse', 84, '2026-05-14 15:50:02', '2026-05-14 15:50:02'),
(24, 'buy lego online', 51, '2026-05-16 08:54:02', '2026-05-16 08:54:02'),
(25, 'Belt', 9, '2026-03-07 11:52:02', '2026-03-07 11:52:02'),
(26, 't-shirt price', 74, '2025-12-04 10:21:02', '2026-01-07 10:21:02'),
(27, 'buy yoga mat online', 31, '2026-03-17 07:30:02', '2026-04-20 07:30:02'),
(28, 'jeans 2020', 66, '2026-02-09 04:30:02', '2026-03-20 04:30:02'),
(29, 'buy sofa online', 81, '2026-05-04 05:28:02', '2026-05-04 05:28:02'),
(30, 'Laptop', 102, '2026-05-20 02:19:02', '2026-05-21 02:19:02'),
(31, 'keyboard price', 72, '2026-05-18 11:52:02', '2026-05-19 11:52:02'),
(32, 'best cricket bat', 92, '2026-05-14 13:06:02', '2026-05-14 13:06:02'),
(33, 'cheap t-shirt', 48, '2026-01-17 15:05:02', '2026-01-17 15:05:02'),
(34, 'MICROWAVE', 109, '2026-05-19 13:22:02', '2026-05-20 13:22:02'),
(35, 'oven price', 56, '2026-04-20 03:49:02', '2026-04-28 03:49:02'),
(36, 'buy smartwatch online', 84, '2026-05-13 16:05:02', '2026-05-17 16:05:02'),
(37, 'sneakers 2021', 91, '2026-05-13 04:51:02', '2026-05-13 04:51:02'),
(38, 'DRONE', 69, '2026-05-13 05:43:02', '2026-05-13 05:43:02'),
(39, 'COOKBOOK', 66, '2026-05-19 17:06:02', '2026-05-20 17:06:02'),
(40, 'LIPSTICK', 78, '2026-05-19 09:37:02', '2026-05-19 09:37:02'),
(41, 'SNEAKERS', 48, '2026-05-15 02:44:02', '2026-05-19 02:44:02'),
(42, 'cheap smartwatch', 60, '2026-05-17 14:52:02', '2026-05-17 14:52:02'),
(43, 'curtain 2021', 65, '2026-03-25 18:21:02', '2026-03-25 18:21:02'),
(44, 'PRINTER', 58, '2025-12-04 19:21:02', '2025-12-04 19:21:02'),
(45, 'best pen', 76, '2026-05-18 06:03:02', '2026-05-18 06:03:02'),
(46, 'smartwatch price', 122, '2026-05-14 20:45:02', '2026-05-14 20:45:02'),
(47, 'Tv', 85, '2026-05-12 01:42:02', '2026-05-12 01:42:02'),
(48, 'graphics card', 38, '2026-05-13 18:25:02', '2026-05-19 18:25:02'),
(49, 'cheap mouse', 133, '2026-05-20 00:11:02', '2026-05-20 00:11:02'),
(50, 'best microwave', 107, '2026-05-19 01:42:02', '2026-05-20 01:42:02'),
(51, 'buy refrigerator online', 44, '2026-05-19 19:11:02', '2026-05-19 19:11:02'),
(52, 'cheap refrigerator', 91, '2026-05-12 18:28:02', '2026-05-12 18:28:02'),
(53, 'perfume', 91, '2026-05-18 06:47:02', '2026-05-19 06:47:02'),
(54, 'buy towel online', 71, '2026-05-16 06:04:02', '2026-05-16 06:04:02'),
(55, 'iron 2021', 69, '2026-05-14 13:11:02', '2026-05-14 13:11:02'),
(56, 'printer 2024', 59, '2026-04-27 17:12:02', '2026-04-27 17:12:02'),
(57, 'buy headphones online', 85, '2026-03-13 09:17:02', '2026-03-21 09:17:02'),
(58, 'cheap lipstick', 51, '2026-05-13 21:29:02', '2026-05-18 21:29:02'),
(59, 'cheap scanner', 20, '2026-02-27 23:06:02', '2026-02-27 23:06:02'),
(60, 'buy gloves online', 90, '2026-05-17 10:14:02', '2026-05-17 10:14:02'),
(61, 'Coffee maker', 91, '2026-04-20 18:22:02', '2026-04-28 18:22:02'),
(62, 'tablet price', 70, '2026-01-12 13:15:02', '2026-01-12 13:15:02'),
(63, 'dictionary price', 115, '2026-05-12 05:36:02', '2026-05-12 05:36:02'),
(64, 'Smartwatch', 69, '2026-05-19 06:21:02', '2026-05-19 06:21:02'),
(65, 'buy sports shoes online', 82, '2026-05-18 02:58:02', '2026-05-20 02:58:02'),
(66, 'headphones', 116, '2026-05-09 11:31:02', '2026-05-09 11:31:02'),
(67, 'Dress', 57, '2026-05-14 20:31:02', '2026-05-18 20:31:02'),
(68, 'buy hair dryer online', 44, '2026-04-11 01:12:02', '2026-04-11 01:12:02'),
(69, 'buy t-shirt online', 23, '2026-05-12 09:11:02', '2026-05-12 09:11:02'),
(70, 'shoes price', 101, '2026-05-20 03:26:02', '2026-05-21 03:26:02'),
(71, 'Hair dryer', 143, '2026-05-15 20:23:02', '2026-05-15 20:23:02'),
(72, 'table price', 44, '2026-05-01 15:48:02', '2026-05-01 15:48:02'),
(73, 'yoga mat', 10, '2026-05-12 09:11:02', '2026-05-12 09:11:02'),
(74, 'SHAMPOO', 54, '2026-05-17 08:18:02', '2026-05-19 08:18:02'),
(75, 'towel price', 103, '2026-05-12 08:11:02', '2026-05-15 08:11:02'),
(76, 'buy comic online', 77, '2026-03-04 20:19:02', '2026-03-04 20:19:02'),
(77, 'cheap air conditioner', 59, '2026-05-13 21:02:02', '2026-05-13 21:02:02'),
(78, 'buy mouse online', 90, '2026-04-29 17:25:02', '2026-04-29 17:25:02'),
(79, 'chess', 89, '2026-05-13 06:03:02', '2026-05-13 06:03:02'),
(80, 'BACKPACK', 61, '2026-03-05 19:03:02', '2026-03-05 19:03:02'),
(81, 'sports shoes 2022', 54, '2026-05-13 07:18:02', '2026-05-14 07:18:02'),
(82, 'best fitness tracker', 34, '2026-03-23 17:39:02', '2026-03-23 17:39:02'),
(83, 'best laptop', 62, '2026-05-15 17:16:02', '2026-05-15 17:16:02'),
(84, 'dumbbells', 98, '2026-05-12 09:55:02', '2026-05-12 09:55:02'),
(85, 'best jeans', 65, '2026-02-14 07:40:02', '2026-02-14 07:40:02'),
(86, 'pen 2020', 29, '2026-01-01 01:20:02', '2026-01-01 01:20:02'),
(87, 'curtain price', 56, '2026-05-09 00:33:02', '2026-05-09 00:33:02'),
(88, 'best magazine', 23, '2025-12-30 06:28:02', '2025-12-30 06:28:02'),
(89, 'buy speaker online', 52, '2025-11-30 04:42:02', '2025-11-30 04:42:02'),
(90, 'Novel', 125, '2026-05-16 19:21:02', '2026-05-16 19:21:02'),
(91, 'cheap treadmill', 9, '2026-02-26 03:58:02', '2026-05-09 03:58:02'),
(92, 'xbox', 49, '2026-05-17 17:22:02', '2026-05-19 17:22:02'),
(93, 'best oven', 96, '2026-05-17 13:48:02', '2026-05-17 13:48:02'),
(94, 'best smartwatch', 99, '2026-05-08 15:22:02', '2026-05-08 15:22:02'),
(95, 'Washing machine', 93, '2026-05-17 04:12:02', '2026-05-17 04:12:02'),
(96, 'JEANS', 56, '2026-05-13 16:33:02', '2026-05-13 16:33:02'),
(97, 'toothbrush 2022', 86, '2026-05-13 19:56:02', '2026-05-17 19:56:02'),
(98, 'cheap magazine', 71, '2026-05-18 06:37:02', '2026-05-19 06:37:02'),
(99, 'air conditioner price', 78, '2026-02-22 03:15:02', '2026-02-22 03:15:02'),
(100, 'shorts price', 58, '2025-12-12 13:32:02', '2025-12-12 13:32:02'),
(101, 'best table', 36, '2025-12-29 08:47:02', '2025-12-29 08:47:02'),
(102, 'toaster 2021', 31, '2026-01-22 06:17:02', '2026-01-22 06:17:02'),
(103, 'gloves price', 42, '2026-04-24 07:04:02', '2026-04-24 07:04:02'),
(104, 'laptop price', 106, '2026-05-16 21:46:02', '2026-05-16 21:46:02'),
(105, 'best puzzle', 46, '2026-03-17 13:30:02', '2026-03-17 13:30:02'),
(106, 'sneakers price', 19, '2026-05-01 04:46:02', '2026-05-14 04:46:02'),
(107, 'SHOES', 37, '2026-05-08 23:06:02', '2026-05-19 23:06:02'),
(108, 'buy perfume online', 63, '2026-01-02 03:01:02', '2026-03-06 03:01:02'),
(109, 'cheap ram', 9, '2026-02-27 06:24:02', '2026-02-27 06:24:02'),
(110, 'smartphone price', 96, '2026-05-11 19:52:02', '2026-05-11 19:52:02'),
(111, 'Notebook', 57, '2026-05-18 15:10:02', '2026-05-18 15:10:02'),
(112, 'buy dishwasher online', 65, '2026-01-12 09:37:02', '2026-01-12 09:37:02'),
(113, 't-shirt 2023', 44, '2025-12-30 04:24:02', '2025-12-30 04:24:02'),
(114, 'best chess', 98, '2026-05-17 06:49:02', '2026-05-18 06:49:02'),
(115, 'buy toothpaste online', 68, '2026-01-05 03:39:02', '2026-01-05 03:39:02'),
(116, 'shampoo 2020', 32, '2026-05-12 18:48:02', '2026-05-12 18:48:02'),
(117, 'cheap dictionary', 39, '2026-04-29 10:58:02', '2026-05-05 10:58:02'),
(118, 'washing machine price', 80, '2025-12-03 16:23:02', '2026-01-30 16:23:02'),
(119, 'MONOPOLY', 91, '2026-04-21 14:10:02', '2026-04-21 14:10:02'),
(120, 'microwave 2022', 67, '2026-02-14 07:09:02', '2026-02-14 07:09:02'),
(121, 'buy monopoly online', 70, '2026-03-30 09:23:02', '2026-04-02 09:23:02'),
(122, 'blender 2020', 62, '2026-05-15 10:12:02', '2026-05-18 10:12:02'),
(123, 'TENNIS RACKET', 48, '2025-12-27 05:53:02', '2025-12-27 05:53:02'),
(124, 'best smartphone', 52, '2025-12-27 08:38:02', '2026-02-09 08:38:02'),
(125, 'scarf', 71, '2026-04-30 09:20:02', '2026-04-30 09:20:02'),
(126, 'carpet 2024', 11, '2026-02-03 18:58:02', '2026-05-04 18:58:02'),
(127, 'hoodie 2024', 119, '2026-05-19 13:57:02', '2026-05-20 13:57:02'),
(128, 'SHORTS', 23, '2026-02-10 03:55:02', '2026-02-10 03:55:02'),
(129, 'DISHWASHER', 68, '2026-05-12 14:50:02', '2026-05-12 14:50:02'),
(130, 'textbook 2021', 50, '2026-05-18 13:43:02', '2026-05-18 13:43:02'),
(131, 'best pants', 97, '2026-05-04 01:06:02', '2026-05-04 01:06:02'),
(132, 'dictionary 2021', 77, '2026-05-19 01:54:02', '2026-05-19 01:54:02'),
(133, 'tennis racket 2020', 74, '2026-03-05 15:00:02', '2026-03-05 15:00:02'),
(134, 'buy fitness tracker online', 14, '2025-12-28 01:08:02', '2026-01-01 01:08:02'),
(135, 'camera price', 15, '2026-04-12 01:29:02', '2026-04-12 01:29:02'),
(136, 'buy shoes online', 84, '2026-04-28 13:09:02', '2026-05-16 13:09:02'),
(137, 'headphones price', 94, '2026-04-08 19:46:02', '2026-04-08 19:46:02'),
(138, 'buy dress online', 36, '2025-11-23 13:51:02', '2025-11-23 13:51:02'),
(139, 'cheap hard drive', 8, '2025-11-24 11:30:02', '2025-11-24 11:30:02'),
(140, 'buy washing machine online', 86, '2026-05-08 00:10:02', '2026-05-08 00:10:02'),
(141, 'cheap headphones', 80, '2026-05-12 22:27:02', '2026-05-18 22:27:02'),
(142, 'buy books online', 51, '2026-05-14 00:01:02', '2026-05-14 00:01:02'),
(143, 'buy microwave online', 38, '2026-02-08 21:36:02', '2026-05-16 21:36:02'),
(144, 'buy tablet online', 49, '2026-04-29 08:42:02', '2026-05-16 08:42:02'),
(145, 'cheap tv', 48, '2026-05-14 14:10:02', '2026-05-14 14:10:02'),
(146, 'Monitor', 40, '2026-05-19 03:58:02', '2026-05-19 03:58:02'),
(147, 'dumbbells 2024', 46, '2026-03-03 22:22:02', '2026-05-13 22:22:02'),
(148, 'buy socks online', 39, '2026-05-19 02:46:02', '2026-05-19 02:46:02'),
(149, 'best towel', 88, '2026-05-14 00:10:02', '2026-05-14 00:10:02'),
(150, 'shoes 2024', 15, '2026-05-12 19:14:02', '2026-05-12 19:14:02'),
(151, 'buy pillow online', 90, '2026-05-11 21:04:02', '2026-05-11 21:04:02'),
(152, 'speaker price', 64, '2026-05-13 19:55:02', '2026-05-15 19:55:02'),
(153, 'cheap pen', 94, '2026-05-19 04:02:02', '2026-05-20 04:02:02'),
(154, 'dictionary 2023', 65, '2026-05-17 09:00:02', '2026-05-17 09:00:02'),
(155, 'Treadmill', 36, '2025-11-20 23:49:02', '2025-11-20 23:49:02'),
(156, 'Pencil', 27, '2026-02-12 05:59:02', '2026-04-10 05:59:02'),
(157, 'cheap smartphone', 59, '2026-05-10 19:47:02', '2026-05-10 19:47:02'),
(158, 'Magazine', 29, '2026-04-29 02:02:02', '2026-04-29 02:02:02'),
(159, 'buy blender online', 45, '2026-05-16 05:25:02', '2026-05-16 05:25:02'),
(160, 'buy hoodie online', 22, '2026-03-02 01:23:02', '2026-05-17 01:23:02'),
(161, 'toaster price', 97, '2026-02-02 18:40:02', '2026-05-06 18:40:02'),
(162, 'dress 2022', 77, '2026-05-17 01:18:02', '2026-05-18 01:18:02'),
(163, 'keyboard', 82, '2026-03-25 09:58:02', '2026-03-25 09:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_name`, `status`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Slider', '1', '1', '2026-05-05 05:42:12', '2026-05-05 05:42:12'),
(2, 'Counter', '1', '2', '2026-05-05 05:42:12', '2026-05-05 05:42:12'),
(3, 'Discover', '1', '3', '2026-05-05 05:42:12', '2026-05-05 05:42:12'),
(4, 'Videos', '1', '4', '2026-05-05 05:42:12', '2026-05-05 05:42:12'),
(5, 'Reviews', '1', '5', '2026-05-05 05:42:12', '2026-05-05 05:42:12'),
(6, 'Faqs', '1', '6', '2026-05-05 05:42:12', '2026-05-05 05:42:12'),
(7, 'Dropshiping Categories', '1', '7', '2026-05-05 05:42:12', '2026-05-05 05:42:12');

-- --------------------------------------------------------

--
-- Table structure for table `section_configs`
--

CREATE TABLE `section_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_configs`
--

INSERT INTO `section_configs` (`id`, `title`, `key`, `order`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'Slider', 'sliders', 1, 1, '2026-07-14 13:09:29', '2026-09-07 11:58:54'),
(2, 'Feature', 'features', 2, 1, '2026-07-14 13:09:36', '2026-07-27 08:12:36'),
(3, 'New Arrivals', 'new_arrivals', 6, 1, '2026-07-13 13:09:43', '2026-07-27 08:13:13'),
(4, 'Today Deal', 'todays_deal', 5, 1, '2026-07-13 13:09:49', '2026-07-27 08:13:12'),
(5, 'Best Selling', 'best_selling', 4, 1, '2026-07-13 13:09:56', '2026-07-27 08:13:11'),
(6, 'Feature', 'featured', 8, 1, '2026-07-13 13:10:03', '2026-07-27 08:11:39'),
(7, 'Categories', 'categories', 7, 1, '2026-07-14 13:10:09', '2026-07-27 08:11:41'),
(8, 'Brand Content', 'brands', 9, 1, '2026-07-14 13:10:15', '2026-07-27 08:11:04'),
(9, 'Campaign', 'campaigns', 3, 1, '2026-07-14 13:10:15', '2026-07-27 08:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_costs`
--

CREATE TABLE `shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_costs`
--

INSERT INTO `shipping_costs` (`id`, `name`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Inside Dhaka', '60', '1', '2026-07-12 05:37:05', '2026-07-12 05:37:08'),
(2, 'Outside Dhaka', '120', '1', '2026-07-12 05:37:12', '2026-07-12 05:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_review` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `star_count` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `sub_title`, `button_name`, `photos`, `button_link`, `customer_review`, `order`, `star_count`, `description`, `created_at`, `updated_at`) VALUES
(8, 'Rem facilis velit d', 'Quis aut cupidatat v', 'Shop', '4', 'https://www.wicesorolyjy.us', NULL, 2, NULL, NULL, '2026-07-11 08:14:22', '2026-09-07 06:12:18'),
(9, 'Ut ut molestiae qui', 'Molestias itaque non', 'Shop', '5', 'https://www.boqykocydibew.com', NULL, 3, NULL, NULL, '2026-07-11 08:15:49', '2026-09-07 06:12:06'),
(11, 'Nulla reiciendis mag', 'Eum ea aut perferend', 'Shop', '6', 'https://www.jicyzipycuzyho.org.uk', NULL, 1, NULL, NULL, '2026-07-11 08:16:19', '2026-09-07 06:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2026-05-02 08:27:03', '2026-05-02 08:27:03'),
(2, 3, 2, '2026-05-13 05:22:23', '2026-05-13 05:22:23');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(62, 57, 'Woman Hijab', 'woman-hijab', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(64, 57, 'Woman Khimar', 'woman-khimar', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(65, 57, 'Woman Jilbab', 'woman-jilbab', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(66, 56, 'Men\'s Panjabi', 'mens-panjabi', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(67, 56, 'Men\'s Jubba', 'mens-jubba', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(68, 58, 'Men\'s Kabli', 'mens-kabli', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(69, 58, 'Kids Jubba', 'kids-jubba', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(70, 58, 'Kids Panjabi', 'kids-panjabi', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(71, 58, 'Kids Hijab', 'kids-hijab', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(72, 57, 'Kids Khimar', 'kids-khimar', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(73, 56, 'Salat Hijab', 'salat-hijab', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03'),
(74, 58, 'Kids Borka', 'kids-borka', NULL, '2026-06-21 11:02:03', '2026-06-21 11:02:03');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `position`, `avatar`, `designation`, `created_at`, `updated_at`) VALUES
(3, 'Destiny Bray', '4', '21', 'Product Owner', '2026-05-04 10:31:35', '2026-05-21 05:23:49'),
(4, 'Troy Tucker', '3', '23', 'Sr. Backend Engineer', '2026-05-04 10:32:37', '2026-05-21 05:23:49'),
(5, 'August Burt', '2', '22', 'Director of Finance', '2026-05-04 10:32:49', '2026-05-21 05:23:49'),
(6, 'Ria Gamble', '1', '24', 'CEO & Founder of Droploo', '2026-05-04 10:33:00', '2026-05-21 05:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_content` text COLLATE utf8mb4_unicode_ci,
  `mpesa_request` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_receipt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_key` text COLLATE utf8mb4_unicode_ci,
  `lang_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_original_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '5144786c-07b4-44df-b881-416dde2221c8', 'uploads/all/VzEKloKvzxLvinL0bB2QdZYOcUTGQrjH9KhMLk0Y.png', 1, 524232, 'png', 'image', '2026-09-07 06:06:04', '2026-09-07 06:06:04', NULL),
(2, 'new arrival', 'uploads/all/UbtJ3WoGrGSKyot0TITPKw3B4jL7PcoiziyHbaVz.svg', 1, 1558000, 'svg', 'image', '2026-09-07 06:07:52', '2026-09-07 06:07:52', NULL),
(3, 'images (3)', 'uploads/all/7Ut5H4kmmPZOLooIIQaaXE2CSkYjw35PkDtCRCvi.jpg', 1, 55596, 'webp', 'image', '2026-09-07 06:08:59', '2026-09-07 06:08:59', NULL),
(4, 'online-shopping-background-design-free-vector', 'uploads/all/M8s8RO8XOT2MSnU4I9loDRi3Zv8wfqzsosIlsifV.jpg', 1, 34246, 'jpg', 'image', '2026-09-07 06:11:13', '2026-09-07 06:11:13', NULL),
(5, 'e-commerce-flat-design-youtube-banner_23-2151267937', 'uploads/all/sZrLSRLhhCMD9nM2qZaFq3mpY4ZJrf3I8OVRYfBV.avif', 1, 8567, 'webp', 'image', '2026-09-07 06:11:14', '2026-09-07 06:11:14', NULL),
(6, 'ecommerce-benefits-1', 'uploads/all/qSswvTNmiwJEAozUEtIs9Lwvd04ccCi1wMAv6bOU.webp', 1, 42288, 'webp', 'image', '2026-09-07 06:11:16', '2026-09-07 06:11:16', NULL),
(7, 'ndHEgXGYtqGjvNHXCf4MxEheCNPcF98AXSyOwOPR', 'uploads/all/UcVDzrlwJsV0K42L947UMm9hl7ER3axUafXcPyGP.webp', 1, 24162, 'webp', 'image', '2026-09-07 08:31:11', '2026-09-07 08:31:11', NULL),
(8, 'fz9Cz7n0Pou20dvAzfI6Qs7mMH2jgBkq9CB8btA9', 'uploads/all/p2mxzLbLqMw1jZXAQoH1oovbT1kVLT8348wRQPHy.webp', 1, 116214, 'webp', 'image', '2026-09-07 09:33:24', '2026-09-07 09:33:24', NULL),
(9, '5ECfh8xQQMc2BGuirRK540qxO5hFBJKMfuHgw87e', 'uploads/all/15fRS9o787S64Sfjn2ktfMAm3zpYttafjnHFsdVW.webp', 1, 19940, 'webp', 'image', '2026-09-07 09:42:12', '2026-09-07 09:42:12', NULL),
(10, 'XFIJ34cKbJN2g2Kfe9FY8Kqy9ExMk1QHyzXJSkl4 (2)', 'uploads/all/8lIlG7XSdZoyTizmL1C2L0M5oHNsAVfkgDjFk08L.jpg', 1, 65731, 'jpg', 'image', '2026-09-07 09:42:13', '2026-09-07 09:42:13', NULL),
(11, 'XFIJ34cKbJN2g2Kfe9FY8Kqy9ExMk1QHyzXJSkl4', 'uploads/all/BTuG2KFBK1hNyCSrIl0oIwDSyHO7AdIDv0vbMLPr.jpg', 1, 65731, 'jpg', 'image', '2026-09-07 09:42:14', '2026-09-07 09:42:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8mb4_unicode_ci,
  `new_email_verificiation_code` text COLLATE utf8mb4_unicode_ci,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT '0.00',
  `banned` tinyint(4) NOT NULL DEFAULT '0',
  `referral_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `email_verified_at`, `verification_code`, `new_email_verificiation_code`, `password`, `remember_token`, `device_token`, `avatar`, `avatar_original`, `address`, `country`, `state`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'admin', 'Admin', 'admin@mail.com', '2026-04-29 08:27:40', NULL, NULL, '$2y$10$uL8ZVG3Rip1pNirU7/5Uo.IKL5sXezUf56DmnJrh4B5ScnFmuejLS', NULL, NULL, NULL, '1572', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2026-04-29 08:27:40', '2026-08-02 07:08:28'),
(2, NULL, NULL, 'staff', 'Wilma Solis', 'jadyzynu@mailinator.com', '2026-07-08 06:45:48', NULL, NULL, '$2y$10$qtG5d.UVZJgYljAWmHwep.MipLUyn2Oxe1VLMOc1MMzw8GhAu7tmC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+1 (314) 176-1935', 0.00, 0, NULL, NULL, 0, '2026-05-02 08:27:03', '2026-05-02 08:27:03'),
(3, NULL, NULL, 'staff', 'Test', 'test@gmail.com', '2026-07-08 06:45:44', NULL, NULL, '$2y$10$8FsE/.qG47FC4sLHGWaPH.6.EyqTNz54faU4oXp3Zp4YtCJgRishK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-05-13 05:22:23', '2026-05-13 05:22:23'),
(4, NULL, NULL, 'vendor', 'Vendor', 'vendor@gmail.com', '2026-05-13 08:49:45', NULL, NULL, '$2y$10$uL8ZVG3Rip1pNirU7/5Uo.IKL5sXezUf56DmnJrh4B5ScnFmuejLS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-05-13 05:22:23', '2026-05-13 05:22:23'),
(7, NULL, NULL, 'customer', 'Asif', 'test1@gmail.com', '2026-06-02 09:28:33', NULL, NULL, '$2y$10$g5.bHs2Q4VIxU.WQoX57h.S39rOuWjU9j406hYh9HogAliPUT6cUm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-06-02 09:28:33', '2026-06-02 09:28:33'),
(8, NULL, NULL, 'customer', 'Asif', 'test5@gmail.com', '2026-06-02 10:54:01', NULL, NULL, '$2y$10$6CJpe8cg.bTzXYBct6JwbOgscYhedveFTwVJeXl6WRa0QbqT3Ekyq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-06-02 10:54:01', '2026-06-02 10:54:01'),
(9, NULL, NULL, 'customer', 'Asif', 'test12@gmail.com', '2026-06-03 05:48:47', NULL, NULL, '$2y$10$BG3ws02Y7nvhulz2RvL6fujLzQdy6PKKjGUkEtVWQY9E.UPadIBP6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-06-03 05:48:47', '2026-06-03 05:48:47'),
(10, NULL, NULL, 'customer', 'Fahad', 'fahad@gmail.com', '2026-06-06 04:22:53', NULL, NULL, '$2y$10$FEqfZ9EzjZdF6d15RA8g7.PfShHJNkeGUuBm51TbV3QjjZCxPXzJq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01923456743', 0.00, 0, NULL, NULL, 0, '2026-06-06 04:22:53', '2026-06-06 04:22:53'),
(11, NULL, NULL, 'customer', 'Fardin', 'fardin@gmail.com', '2026-06-06 04:24:07', NULL, NULL, '$2y$10$SEIpowG/00oNRCBNwquYH.8TCyPXgmvrugaWT/2Z6njpjkn4SVl7.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01945324567', 0.00, 0, NULL, NULL, 0, '2026-06-06 04:24:07', '2026-06-06 04:24:07'),
(48, NULL, NULL, 'customer', 'Asif', 'asif111@asif.com', '2026-06-17 10:20:54', NULL, NULL, '$2y$10$YUPh.qk978FttyrZc/pzvuTidTPgY9ryXeEQHTsrIfKBs60GslbL2', NULL, NULL, 'avatars/48_aKGDw9MVtMTpObDK7OrE.png', NULL, NULL, NULL, NULL, NULL, NULL, '01973250261', 0.00, 0, NULL, NULL, 0, '2026-06-17 10:20:54', '2026-07-13 08:57:58'),
(49, NULL, NULL, 'customer', 'Abir', 'abir@mail.com', '2026-06-27 04:47:23', NULL, NULL, '$2y$10$.OKkKf3ieWgD7EHwmX28HuGLdouuOw21vvkmFJ4mpatPhBUvn1xaK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01923456543', 0.00, 0, NULL, NULL, 0, '2026-06-27 04:47:23', '2026-06-27 04:47:23'),
(50, NULL, NULL, 'customer', 'Abdullah', 'abdullah@mail.com', '2026-06-27 12:15:19', NULL, NULL, '$2y$10$4mUTgomf1bv4DuP3Hl9jK.f8Sry4u7e/AqtpH/Ep2Tx1QHlHOMllq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01923453234', 0.00, 0, NULL, NULL, 0, '2026-06-27 12:15:19', '2026-06-27 12:15:19'),
(52, NULL, NULL, 'customer', 'Joy', 'joy@mail.com', '2026-06-27 12:24:09', NULL, NULL, '$2y$10$f882hbJgrcQUfPXbQHnVDuh65NPTYBSxyQD5z477fBPfDibZxlR2u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01845654345', 0.00, 0, NULL, NULL, 0, '2026-06-27 12:24:09', '2026-06-27 12:24:09'),
(53, NULL, NULL, 'customer', 'Asif', 'asif11@asif.com', '2026-06-27 12:24:09', NULL, NULL, '$2y$10$DUyEetivuUCpbOI1evXDdO1y7/hJMjBdw8W0rRxSKagskMXvFYSFu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01973250267', 0.00, 0, NULL, NULL, 0, '2026-07-07 10:34:26', '2026-07-07 12:04:39'),
(54, NULL, NULL, 'customer', 'Sakib', 'sakib@mail.com', '2026-07-16 11:39:06', NULL, NULL, '$2y$10$0chhHeyZxJrZMLour7c8EuHM4TXXKSNTrds0tbNxbYHv6LTAR6rZS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01812345678', 0.00, 0, NULL, NULL, 0, '2026-07-11 12:14:54', '2026-07-11 12:14:54'),
(55, NULL, NULL, 'customer', 'Sakib1', 'sakib1@mail.com', '2026-07-16 11:39:11', NULL, NULL, '$2y$10$jFnpVGA2lBGUbTDz.UyhQOebTV.EykQKorZfaNBsrQzrhfyf12t5C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01812345672', 0.00, 0, NULL, NULL, 0, '2026-07-11 12:24:12', '2026-07-11 12:24:12'),
(56, NULL, NULL, 'customer', 'Maite Swanson', 'popa@mailinator.com', '2026-07-16 11:39:15', NULL, NULL, '$2y$10$knX7i2H9u6yghqebpg.wruVSWOvh/ArfxHkQcNKEqEMOcaQw34uH2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01934567851', 0.00, 0, NULL, NULL, 0, '2026-07-16 09:30:20', '2026-07-16 09:30:20'),
(57, NULL, NULL, 'customer', 'Asif', 'shakibprince751@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-07-25 10:59:09', '2026-07-25 10:59:09'),
(58, NULL, NULL, 'customer', 'Evangeline Wilcox', NULL, NULL, NULL, NULL, '$2y$10$5cvvkLeqwBWwakvNbzLA2uWXeajM71YNO8UxiC7ognYUoPH5dlpZy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01813111111', 0.00, 0, NULL, NULL, 0, '2026-07-25 12:07:34', '2026-07-25 12:07:34'),
(59, NULL, NULL, 'customer', 'Brian Hatfield', NULL, NULL, NULL, NULL, '$2y$10$oxU/IfydfExw04uDXkxrO.v8e/0TePqzRa1WaDePdRy7IlZC2t0oi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01922752324', 0.00, 0, NULL, NULL, 0, '2026-07-26 08:52:17', '2026-07-26 08:52:17'),
(63, NULL, NULL, 'customer', 'John Doe', 'johnqweqweqwe1@mail.com', '2026-07-27 04:22:28', NULL, NULL, '$2y$10$6qJWJd7O1o4jI3rmeFHWMOHGB3cka.Js1wf3ZN.M0XPsO.eHOjgau', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01712345678', 0.00, 0, NULL, NULL, 0, '2026-07-27 04:22:28', '2026-07-27 04:22:28'),
(64, NULL, NULL, 'customer', 'Asif', 'shakibprince75354345@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-08-01 05:12:41', '2026-08-01 05:12:41'),
(65, NULL, NULL, 'customer', 'Asif', 'shakibprince111233@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01833022226', 0.00, 0, NULL, NULL, 0, '2026-08-15 08:53:04', '2026-08-15 08:53:04');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `otp_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_license` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `is_approved`, `otp_code`, `name`, `phone`, `shop_name`, `domain_name`, `contact_number`, `contact_name`, `nid_image`, `trade_license`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, '987090', 'New Mart', '01833022226', 'Willa Cline', 'https://www.meqof.com', '01833022226', 'Fleur Silva', 'vendor/nid/1786252915_6a780e73a0471.png', 'vendor/trade/1786252915_6a780e73a1194.png', 'akasifislam', '$2y$10$7m6EEuVE9kPJ1PoCVwsAqOfmSuSQk7KPmOSDDjJ5/AiP6vaGrm2cC', '2026-08-08 07:11:52', '2026-08-10 12:07:23'),
(2, 0, '', 'Cheyenne Jenkins', '+1 (837) 125-1925', 'Fitzgerald Oneal', 'Holly Brady', '+1 (438) 578-7952', 'Ima Villarreal', NULL, NULL, 'rirahakiny', '$2y$10$axsIZDLQ5NAdjPNVPjeIuu6cdezXxVVMBzeHPGlKMZU5sLLmZijVC', '2026-08-09 05:53:25', '2026-08-09 05:53:25'),
(3, 0, '', 'Latifah Moreno', '+1 (462) 992-3282', 'Kalia Lloyd', 'Maile Simon', '+1 (831) 328-9053', 'Conan Mueller', NULL, NULL, 'sasizopupi', '$2y$10$GaaHouv9BghnZWhUpHBJUua3anLTX9S1pApLWAa3B.0pBDX/.4vtO', '2026-08-09 06:00:48', '2026-08-09 06:00:48'),
(4, 1, '', 'Gail Barker', '+1 (973) 929-1068', 'Vernon Dodson', 'Lillian Hull', '+1 (376) 729-1447', 'Hanna Turner', NULL, NULL, 'hylys', '$2y$10$7m6EEuVE9kPJ1PoCVwsAqOfmSuSQk7KPmOSDDjJ5/AiP6vaGrm2cC', '2026-08-09 06:01:14', '2026-08-09 06:01:14'),
(5, 0, '', 'Branden Farley', '+1 (267) 168-5273', 'Diana Rosa', 'https://www.meqof.com', '+1 (679) 508-7248', 'Quemby Cantrell', NULL, NULL, 'kygojys', '$2y$10$LJAxN15kGIZ0b3sXBgkEdOxCqw74pR.Wk9ig2DrAY6PfA7QddktHy', '2026-08-09 06:27:13', '2026-08-09 08:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_order_products`
--

CREATE TABLE `vendor_order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sku` varchar(111) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `price_history_id` int(11) DEFAULT NULL,
  `price` decimal(15,2) NOT NULL COMMENT 'Price at the time of purchase',
  `total_amount` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_title_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_title_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_title_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_url`, `short_title_1`, `short_title_2`, `short_title_3`, `button_text`, `button_url`, `created_at`, `updated_at`) VALUES
(1, 'https://www.youtube.com/watch?v=oZTdT8MQexk', 'Nemo similique amet', 'Et ad est ut exercit', 'Rerum voluptas sequi', 'Get Started', 'https://droploo.com', '2026-05-02 05:18:49', '2026-05-02 05:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_logs`
--

CREATE TABLE `visitor_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counts` int(11) NOT NULL DEFAULT '1',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_logs`
--

INSERT INTO `visitor_logs` (`id`, `ip_address`, `device`, `counts`, `is_blocked`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'desktop', 66, 0, '2026-04-29 08:27:49', '2026-04-29 09:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `temp_user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `temp_user_id`, `product_id`, `variation`, `sku`, `created_at`, `updated_at`) VALUES
(3, 58, NULL, 5, '[]', NULL, '2026-07-25 12:07:55', '2026-07-25 12:07:55'),
(4, 58, NULL, 3, '[]', NULL, '2026-07-25 12:08:01', '2026-07-25 12:08:01'),
(5, 58, NULL, 2, '[]', NULL, '2026-07-25 12:08:04', '2026-07-25 12:08:04'),
(6, 58, NULL, 1, '[]', NULL, '2026-07-25 12:08:12', '2026-07-25 12:08:12'),
(7, 58, NULL, 406, '[]', NULL, '2026-07-25 12:08:15', '2026-07-25 12:08:15'),
(8, 58, NULL, 408, '[]', NULL, '2026-07-25 12:08:19', '2026-07-25 12:08:19'),
(9, 59, NULL, 400, '[]', NULL, '2026-07-26 10:04:52', '2026-07-26 10:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `routing_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `vendor_id`, `amount`, `payment_method`, `bank_name`, `bank_branch`, `routing_number`, `bank_account_name`, `account_number`, `status`, `file`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 500.00, 'bkash', NULL, NULL, NULL, NULL, '01945675432', 'pending', '', 'This is my personal number', '2026-08-17 09:22:50', '2026-08-17 09:22:50'),
(2, 1, 1750.00, 'bank', 'UCB', NULL, NULL, NULL, '5235235234', 'pending', '', 'ucb bank', '2026-08-17 09:23:48', '2026-08-17 09:23:48'),
(3, 1, 1000.00, 'bank', 'UCB', 'Uttra', '2342354235', 'Asif', '5235235234', 'pending', '', 'dfsfsd', '2026-08-17 09:35:20', '2026-08-17 09:35:20'),
(4, 1, 500.00, 'bank', 'UCB', 'Uttra', '2342354235', 'Asif', '5235235234', 'paid', 'uploads/withdraw/1786961344_3357fbf438fc3c410a866dd12ff8f59a.jpg', 'sdadasdas', '2026-08-17 09:37:11', '2026-08-17 10:09:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_translations`
--
ALTER TABLE `app_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_categories`
--
ALTER TABLE `attribute_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaigns_slug_unique` (`slug`);

--
-- Indexes for table `campaign_products`
--
ALTER TABLE `campaign_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaign_products_campaign_id_product_id_unique` (`campaign_id`,`product_id`),
  ADD KEY `campaign_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_owner_id_index` (`owner_id`),
  ADD KEY `carts_user_id_index` (`user_id`),
  ADD KEY `carts_temp_user_id_index` (`temp_user_id`),
  ADD KEY `carts_product_id_index` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dropshiping_categories_slug_unique` (`slug`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compares`
--
ALTER TABLE `compares`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `compares_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `compares_user_id_index` (`user_id`),
  ADD KEY `compares_product_id_index` (`product_id`),
  ADD KEY `compares_ip_address_index` (`ip_address`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_user_id_foreign` (`user_id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_usages_user_id_coupon_id_unique` (`user_id`,`coupon_id`),
  ADD KEY `coupon_usages_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_index` (`user_id`),
  ADD KEY `customers_phone_index` (`phone`);

--
-- Indexes for table `damage_products`
--
ALTER TABLE `damage_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `damage_products_vendor_id_foreign` (`vendor_id`),
  ADD KEY `damage_products_product_id_foreign` (`product_id`),
  ADD KEY `damage_products_given_by_foreign` (`given_by`);

--
-- Indexes for table `discovers`
--
ALTER TABLE `discovers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dropshiper_reviews`
--
ALTER TABLE `dropshiper_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dropshippers`
--
ALTER TABLE `dropshippers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dropshippers_email_unique` (`email`),
  ADD UNIQUE KEY `dropshippers_user_name_unique` (`user_name`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_statuses`
--
ALTER TABLE `import_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `import_statuses_batch_id_unique` (`batch_id`);

--
-- Indexes for table `incomplete_orders`
--
ALTER TABLE `incomplete_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `incomplete_orders_order_code_unique` (`order_code`),
  ADD KEY `incomplete_orders_order_id_index` (`order_id`),
  ADD KEY `incomplete_orders_session_id_index` (`session_id`),
  ADD KEY `incomplete_orders_order_code_index` (`order_code`),
  ADD KEY `incomplete_orders_customer_email_index` (`customer_email`),
  ADD KEY `incomplete_orders_customer_phone_index` (`customer_phone`),
  ADD KEY `incomplete_orders_status_index` (`status`),
  ADD KEY `incomplete_orders_last_activity_index` (`last_activity`),
  ADD KEY `incomplete_orders_abandoned_at_index` (`abandoned_at`),
  ADD KEY `incomplete_orders_created_at_index` (`created_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `landingpages`
--
ALTER TABLE `landingpages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `landingpages_slug_unique` (`slug`);

--
-- Indexes for table `landing_page_products`
--
ALTER TABLE `landing_page_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `landing_page_products_landingpage_id_foreign` (`landingpage_id`),
  ADD KEY `landing_page_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_seller_id_index` (`seller_id`),
  ADD KEY `orders_combined_order_id_index` (`combined_order_id`),
  ADD KEY `orders_payment_status_index` (`payment_status`),
  ADD KEY `orders_delivery_status_index` (`delivery_status`),
  ADD KEY `orders_code_index` (`code`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_index` (`order_id`),
  ADD KEY `order_details_product_id_index` (`product_id`),
  ADD KEY `order_details_seller_id_index` (`seller_id`),
  ADD KEY `order_details_payment_status_index` (`payment_status`),
  ADD KEY `order_details_delivery_status_index` (`delivery_status`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payku_payments`
--
ALTER TABLE `payku_payments`
  ADD UNIQUE KEY `payku_payments_transaction_id_unique` (`transaction_id`);

--
-- Indexes for table `payku_transactions`
--
ALTER TABLE `payku_transactions`
  ADD UNIQUE KEY `payku_transactions_id_unique` (`id`),
  ADD UNIQUE KEY `payku_transactions_order_unique` (`order`);

--
-- Indexes for table `payment_systems`
--
ALTER TABLE `payment_systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_import_statuses`
--
ALTER TABLE `product_import_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_import_statuses_batch_id_unique` (`batch_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventories_sku_unique` (`sku`),
  ADD KEY `product_inventories_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_prices_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_seos`
--
ALTER TABLE `product_seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_seos_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_shippings`
--
ALTER TABLE `product_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_shippings_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_stock_requests`
--
ALTER TABLE `product_stock_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_stock_requests_product_id_foreign` (`product_id`),
  ADD KEY `product_stock_requests_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_taxes_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_varients`
--
ALTER TABLE `product_varients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_varients_sku_unique` (`sku`),
  ADD KEY `product_varients_product_id_foreign` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_configs`
--
ALTER TABLE `section_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section_configs_key_unique` (`key`);

--
-- Indexes for table `shipping_costs`
--
ALTER TABLE `shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_slug_unique` (`slug`),
  ADD KEY `sub_categories_dropshiping_category_id_foreign` (`category_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_username_unique` (`username`);

--
-- Indexes for table `vendor_order_products`
--
ALTER TABLE `vendor_order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_order_products_order_id_foreign` (`order_id`),
  ADD KEY `vendor_order_products_product_id_foreign` (`product_id`),
  ADD KEY `vendor_order_products_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitor_logs_ip_address_unique` (`ip_address`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_product_id_index` (`user_id`,`product_id`),
  ADD KEY `wishlists_temp_user_id_product_id_index` (`temp_user_id`,`product_id`),
  ADD KEY `wishlists_temp_user_id_index` (`temp_user_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_vendor_id_foreign` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_translations`
--
ALTER TABLE `app_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attribute_categories`
--
ALTER TABLE `attribute_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `campaign_products`
--
ALTER TABLE `campaign_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `compares`
--
ALTER TABLE `compares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `damage_products`
--
ALTER TABLE `damage_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discovers`
--
ALTER TABLE `discovers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dropshiper_reviews`
--
ALTER TABLE `dropshiper_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `dropshippers`
--
ALTER TABLE `dropshippers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=856;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `import_statuses`
--
ALTER TABLE `import_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomplete_orders`
--
ALTER TABLE `incomplete_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landingpages`
--
ALTER TABLE `landingpages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `landing_page_products`
--
ALTER TABLE `landing_page_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_systems`
--
ALTER TABLE `payment_systems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_import_statuses`
--
ALTER TABLE `product_import_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_prices`
--
ALTER TABLE `product_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_seos`
--
ALTER TABLE `product_seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_shippings`
--
ALTER TABLE `product_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_stock_requests`
--
ALTER TABLE `product_stock_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_varients`
--
ALTER TABLE `product_varients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_translations`
--
ALTER TABLE `role_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `section_configs`
--
ALTER TABLE `section_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shipping_costs`
--
ALTER TABLE `shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor_order_products`
--
ALTER TABLE `vendor_order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campaign_products`
--
ALTER TABLE `campaign_products`
  ADD CONSTRAINT `campaign_products_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `campaign_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compares`
--
ALTER TABLE `compares`
  ADD CONSTRAINT `compares_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compares_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD CONSTRAINT `coupon_usages_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `damage_products`
--
ALTER TABLE `damage_products`
  ADD CONSTRAINT `damage_products_given_by_foreign` FOREIGN KEY (`given_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `damage_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `damage_products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `landing_page_products`
--
ALTER TABLE `landing_page_products`
  ADD CONSTRAINT `landing_page_products_landingpage_id_foreign` FOREIGN KEY (`landingpage_id`) REFERENCES `landingpages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `landing_page_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payku_payments`
--
ALTER TABLE `payku_payments`
  ADD CONSTRAINT `payku_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `payku_transactions` (`id`);

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_prices`
--
ALTER TABLE `product_prices`
  ADD CONSTRAINT `product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_seos`
--
ALTER TABLE `product_seos`
  ADD CONSTRAINT `product_seos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_shippings`
--
ALTER TABLE `product_shippings`
  ADD CONSTRAINT `product_shippings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_stock_requests`
--
ALTER TABLE `product_stock_requests`
  ADD CONSTRAINT `product_stock_requests_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_stock_requests_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD CONSTRAINT `product_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_varients`
--
ALTER TABLE `product_varients`
  ADD CONSTRAINT `product_varients_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_dropshiping_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_order_products`
--
ALTER TABLE `vendor_order_products`
  ADD CONSTRAINT `vendor_order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_order_products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
