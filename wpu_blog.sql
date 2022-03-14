-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2022 at 11:41 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wpu_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Web Programming', 'web-programming', '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(2, 'Web Design', 'web-design', '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(3, 'Personal', 'personal', '2022-03-10 15:57:42', '2022-03-10 15:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_10_115900_create_posts_table', 1),
(6, '2022_02_14_010718_create_categories_table', 1),
(7, '2022_03_14_130511_add_is_admin_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publised_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `image`, `excerpt`, `body`, `publised_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Ex voluptatem aut commodi animi dolore earum voluptate.', 'laboriosam-repudiandae-necessitatibus-tenetur-voluptas', NULL, 'Voluptatum quas blanditiis nemo excepturi rerum culpa. Expedita eligendi dolorem doloribus enim aut. Occaecati ad voluptatem ut nobis facere harum ea.', '<p>Ab accusantium qui cum esse natus harum. Quibusdam corrupti et ut illum molestiae velit. Hic possimus qui praesentium occaecati rem nisi et.</p><p>Voluptas tempore itaque amet quis quis. Ullam possimus deleniti aut et totam rerum architecto. Quibusdam natus iure commodi est veniam.</p><p>Quasi unde odio repellat sit quam molestias qui. Totam nulla natus beatae. Fugiat earum omnis sint incidunt quos dolor aut.</p><p>Laborum iure quo et dignissimos molestiae qui vero. Possimus beatae quia dolorem vel qui praesentium. Omnis animi exercitationem saepe possimus.</p><p>Ratione odit a dolorum quo eius tenetur. Deleniti facilis modi nostrum fuga assumenda blanditiis. Voluptas sint qui cumque fugit aliquam distinctio.</p><p>Doloremque doloremque quaerat velit qui. Ea sed blanditiis quia voluptatum qui. Assumenda odit sint iste est ipsa velit voluptas.</p><p>Ut aspernatur ut culpa enim doloribus. Voluptates voluptas omnis molestias rerum.</p><p>Fuga maiores quis eum commodi alias qui. Fugit rerum corrupti vel fugiat mollitia est. Itaque neque nostrum sit asperiores recusandae enim quis.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(2, 1, 2, 'Dignissimos est neque ut aut.', 'doloremque-itaque-eos-itaque-incidunt-inventore-aliquid', NULL, 'Consequuntur beatae omnis voluptas molestias id et minima minima. Laborum sed voluptatum inventore optio minima minima explicabo.', '<p>Quasi excepturi inventore temporibus est dolor saepe nihil. Adipisci in dicta velit eligendi fuga sunt. Assumenda repudiandae ducimus fugiat aut recusandae fuga ut. Sit iure ut omnis.</p><p>Necessitatibus perspiciatis enim pariatur ut. Rem dolor ut saepe fugit. Officiis qui similique alias voluptatem architecto ullam.</p><p>Id recusandae doloribus cupiditate minima consectetur sint quas. Dolor provident ex numquam ducimus perferendis vero. Est quo placeat quam dicta aut. Numquam eum sunt laudantium nisi optio minima vel.</p><p>Dicta consequatur molestias porro sint. Explicabo quia laudantium et nemo illum. Qui itaque dolorem provident veritatis fuga qui.</p><p>Sed alias odit aut unde ipsa eveniet facilis. Reiciendis mollitia eum soluta expedita. Repudiandae hic animi quia provident maxime.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(4, 2, 3, 'Voluptatum sint distinctio similique.', 'aut-labore-iste-assumenda', NULL, 'Nisi sit nisi occaecati veritatis aut. Possimus et voluptas numquam cum. Exercitationem cum et nobis consequatur. Quam itaque enim sit illo vel perspiciatis et.', '<p>Quo voluptatum repudiandae id quidem eaque. Harum est tenetur et ut qui ipsa hic. Expedita quia est vero officiis totam enim. Quis asperiores inventore pariatur et doloremque distinctio qui.</p><p>Veritatis eligendi ut quos voluptatibus. Corrupti sit corporis laborum quo quam mollitia aut. Veniam accusantium est est enim itaque commodi. Asperiores dolorem quasi accusamus eius amet occaecati tempore. Fugit similique magni iure asperiores.</p><p>Sunt laborum aut voluptas. Voluptas veritatis aut ratione tempore explicabo harum sit.</p><p>Voluptatem cumque enim soluta dolor omnis. Quasi ratione incidunt ducimus sunt eum. Aspernatur voluptas ipsa omnis incidunt.</p><p>Optio saepe ratione ut iste. Sit quia voluptas dolor est porro aliquid consectetur. Sit dolores vitae repudiandae id placeat voluptas tempore. Laboriosam voluptatibus quia inventore et.</p><p>Sequi debitis rem commodi ea consequatur quia rem itaque. Voluptatem sint praesentium facilis laudantium aliquid quo atque. Et sequi id cupiditate eius. Vel maiores saepe minima doloribus.</p><p>Ut similique dolores quas aut ut a animi. Provident voluptas saepe nobis. Cum laudantium blanditiis inventore fugiat occaecati vel vel. Iusto quod rerum quis ut aut voluptas pariatur. Laborum recusandae accusantium quia sit.</p><p>Quo possimus ut saepe. Earum ut pariatur aspernatur ipsam quia maxime et qui. Qui magnam asperiores nulla quis mollitia eaque ut laboriosam. Modi id nisi quo. Sint officiis aut id eum.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(5, 1, 2, 'Cum vel aut assumenda earum sit doloremque quisquam minima est.', 'est-ad-quia-quo-nihil-sed-eos-ducimus', NULL, 'Omnis aspernatur quas est praesentium. Reprehenderit debitis provident dignissimos nam et qui aut. Debitis minus perspiciatis sed iusto illum vitae. Sint quia qui enim omnis.', '<p>Voluptatem et vitae et rerum dignissimos ratione. Cum voluptas aliquid possimus eum quas accusantium. Ut ea adipisci et quos tenetur. Itaque amet velit minima earum.</p><p>Est ratione quaerat voluptate dolor. Iure molestiae voluptatem quaerat cupiditate asperiores soluta. Temporibus id alias id. Magni vitae minus quibusdam earum ut voluptatem.</p><p>Quisquam eligendi voluptatem placeat non neque non laboriosam occaecati. Quas natus aut voluptatem eum quae ratione.</p><p>Totam et deleniti quis porro explicabo laudantium qui. Porro animi aliquam quia doloribus facilis. Fugit reprehenderit aliquid quis eligendi odio quo sapiente non. Corporis minima doloribus eos praesentium modi.</p><p>Veritatis et deserunt voluptatem non ut. Omnis mollitia vero debitis quaerat earum voluptas. Dignissimos dolores magni officia qui dolor incidunt.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(6, 1, 3, 'Recusandae incidunt quis.', 'voluptas-consequuntur-ab-eius-eum-ut', NULL, 'Est quaerat est quis delectus voluptatem nostrum nobis quisquam. Sapiente quo eos qui qui ut rem quos. Quod sed quia enim officiis. Qui facere aut omnis aperiam voluptatibus.', '<p>Eos sunt et pariatur magnam asperiores quia eaque harum. Voluptatum maxime et iure qui dolor enim labore. Dicta consequatur est est eos dolores.</p><p>Qui enim officiis et rerum omnis nobis corrupti ad. Corrupti molestias eum quam blanditiis nobis. Exercitationem aspernatur est delectus et soluta numquam omnis.</p><p>Error necessitatibus sequi maxime enim aut. Nulla quaerat voluptatum sint sit. Nihil quo vitae exercitationem veniam inventore laborum quo. Autem in expedita sit totam.</p><p>Ipsum nemo enim recusandae labore sed fugit. Ipsum dolore perferendis aut ut pariatur impedit. Alias debitis architecto voluptatem nemo reiciendis non.</p><p>Autem vel est unde deleniti cumque perferendis. Ex velit veritatis expedita iusto. Praesentium ea natus sunt laboriosam tempora non.</p><p>Odio dolorum dicta sed veniam voluptas maxime doloremque. Eius provident exercitationem dicta molestiae dolores labore praesentium officia. Quia ab corporis delectus consequatur eum omnis ad. Voluptas eveniet consectetur rerum adipisci.</p><p>Nam sed non aliquam consequatur molestiae aliquam enim. Et rem ipsam saepe. Iusto vel qui qui omnis earum consequatur ullam. Magni maiores nostrum asperiores ullam blanditiis vel eos nam.</p><p>Perferendis et nulla maxime aperiam totam corporis. Aspernatur ab debitis minima totam. Eius dolor voluptatibus minima ullam iste totam. Incidunt qui quia alias autem dicta.</p><p>Officiis voluptatibus aperiam et quae nulla repellat. Corrupti deserunt modi molestiae maxime a assumenda aliquam. Qui commodi sed dolor dolores quidem. Velit et consectetur magnam consequatur omnis. Consequatur ullam et ut provident sint sed esse.</p><p>Qui saepe velit quisquam provident facilis ab. Doloremque eaque deleniti inventore ipsa repellendus et. Et voluptatem at veniam iste reprehenderit ut a. Qui rerum sed numquam non.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(10, 1, 3, 'Labore dolores quod illo voluptas laborum fugit iusto ex incidunt.', 'ad-vel-eum-qui', NULL, 'Velit dicta dolor dolorum enim velit autem placeat. Dignissimos qui excepturi rem illum laudantium quae. Ab quo qui architecto et non voluptatum.', '<p>Ratione minima et tempore magni. Ipsam et aut modi adipisci voluptas. Culpa laboriosam blanditiis reiciendis est perferendis aut.</p><p>Perferendis ad repellat beatae eveniet. Non quis molestiae sed libero blanditiis aspernatur commodi dolore.</p><p>Eum laborum laudantium voluptatem sed sunt tempore vel. Mollitia quia eveniet sit id impedit. Voluptatem corrupti reprehenderit maxime soluta ea iure.</p><p>Porro rerum voluptatem quaerat minima magni optio et. Molestiae aspernatur fugit rerum quisquam dolores tempora. Maxime ea impedit sed et nihil ut numquam. Iste voluptates ullam explicabo blanditiis est.</p><p>Est tempora sed velit. Earum nobis sunt aspernatur ab praesentium. Molestiae vero voluptas soluta tenetur quia dolorum. Dolor et consequuntur cum et.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(11, 2, 3, 'Incidunt aut enim omnis voluptatum blanditiis.', 'id-enim-non-rerum-in-cum-nihil', NULL, 'Nulla ea rerum distinctio consequuntur est itaque quia. Illum eius aliquam et corrupti ipsam ea totam. Repellendus consequatur sit ipsa non laudantium et autem.', '<p>Dolorem aperiam nihil qui ut magni eaque. At delectus nihil ratione non tempore nam. Aut veritatis accusantium aut molestias. Unde natus non voluptatum sed libero.</p><p>Ipsam mollitia sunt dolore nesciunt saepe officia. Impedit rerum sapiente et ut ipsam.</p><p>Ut commodi dolor optio vel nesciunt deleniti. Vel doloremque repudiandae totam omnis. Voluptatem dolor nulla iste a qui corporis.</p><p>Dicta id delectus qui qui eligendi iure. Temporibus autem eos dolor incidunt voluptas. Odio reiciendis qui at iure quo itaque esse.</p><p>Dolores veniam numquam laboriosam eligendi. Eveniet expedita harum vel qui architecto. Ducimus occaecati blanditiis mollitia voluptas. Vitae suscipit asperiores a est et error.</p><p>Ab ut natus consequatur cum porro nostrum. Non enim accusantium non autem odit architecto. Aspernatur amet fuga cupiditate id sint. Sint dolores sed adipisci laborum atque sint eius sed.</p><p>Voluptas voluptatibus adipisci nobis laudantium quia inventore quisquam. Quia iusto facilis officiis est optio. Corrupti voluptas illum laudantium sit velit. Ipsam quaerat impedit et odio laudantium.</p><p>Sapiente illum voluptas culpa. Maxime praesentium facere placeat. Voluptatem neque rerum perferendis architecto quia.</p><p>Voluptas eius dicta modi autem. Doloremque illo tempore alias sunt sapiente reiciendis. Quos fuga rerum aut a.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(14, 1, 2, 'Molestiae dolorem et ex est dolorum.', 'et-rerum-molestiae-adipisci-hic-rerum-quaerat', NULL, 'Enim eos sapiente beatae. Fuga enim est est. Earum officiis consequatur eum ab ducimus soluta.', '<p>Iure expedita qui debitis cupiditate. A autem sint provident cupiditate voluptatum accusantium doloribus. Non id nobis eum tempore fugit. Veritatis veniam aut sunt id asperiores eos fuga.</p><p>Quaerat eaque ex nihil praesentium distinctio. Quia omnis aut fugit fugit quas iusto ut. Eos et culpa voluptatibus aut voluptas.</p><p>Consequuntur rerum voluptatem sapiente nihil maxime et sint. Accusamus omnis ut consequuntur molestiae. Enim voluptatem dolor ut ipsum. Error qui dignissimos quod quam animi.</p><p>Ducimus sed et ut autem impedit dolorum. Quia at nisi eligendi ab. Veritatis minima officiis ut dolor doloremque dicta. Ullam in sed odit maxime omnis.</p><p>Sit natus at maiores voluptatum recusandae. Aut provident quo ut.</p><p>Hic ut ullam deserunt laboriosam. Enim eum ea nemo molestiae est at qui. Nihil repellat iusto voluptates quam aut. Est architecto harum dignissimos beatae alias expedita tenetur. Incidunt neque cum neque aut nulla repudiandae.</p><p>Voluptatem sunt quia unde beatae in facilis. Minima aut atque sit consequatur dignissimos. Sit officiis eum voluptatem sequi quaerat unde. Dolores aut accusantium maxime dignissimos dolorum dolor deleniti et.</p><p>Numquam quae aut consectetur molestias. Sit ab dicta est enim. Aspernatur sit voluptatem nihil non non. Adipisci voluptas cumque quod occaecati accusamus.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(15, 3, 1, 'Iusto dolores.', 'officiis-omnis-architecto-enim-natus-mollitia-quo', NULL, 'Voluptatem nihil rem asperiores quo. Quia unde hic qui soluta.Sunt exercitationem eius mollitia quidem quae accusantium soluta voluptates. Illum rerum dignissimos architecto aperiam. Inventore nemo es...', '<div>Voluptatem nihil rem asperiores quo. Quia unde hic qui soluta.<br><br></div><div>Sunt exercitationem eius mollitia quidem quae accusantium soluta voluptates. Illum rerum dignissimos architecto aperiam. Inventore nemo esse omnis maxime.<br><br></div><div>Molestias impedit hic et dolorem omnis repellendus accusamus. Dolore velit odio commodi delectus. Iste doloremque qui minus sit.<br><br></div><div>Praesentium ut nostrum beatae et magni aspernatur cum rerum. Reiciendis rem ut nemo cumque laboriosam dolores. Omnis sapiente aut rerum necessitatibus.<br><br></div><div>Est molestias quo explicabo distinctio delectus vel quas. Facere molestias quibusdam provident. In quaerat architecto saepe harum tempora expedita explicabo. Consequatur hic suscipit nemo.<br><br></div><div>Porro error qui ipsa est est autem est. Quia non ut accusantium. Sunt qui quaerat ipsum sequi nulla fugit. Rerum et dolor voluptate veniam facere consequatur.<br><br></div><div>Nesciunt voluptatem quaerat debitis magnam sequi consequatur. Consequatur dolores enim itaque a fuga. Id et cumque molestias.<br><br></div>', NULL, '2022-03-10 15:57:42', '2022-03-10 16:00:03'),
(16, 1, 3, 'Officiis dicta reiciendis sint.', 'quaerat-molestiae-dolores-provident', NULL, 'Quaerat quis aut officiis velit aut quia. Voluptate necessitatibus aperiam tenetur tempora. Eligendi quasi inventore inventore placeat nihil.', '<p>Iure quaerat voluptatibus quis ut voluptatum. Cupiditate quisquam nulla inventore et et quo. Et voluptatem accusantium sit. Odio sed quia iste saepe accusantium in vero similique.</p><p>Qui dicta sint sequi nostrum enim. Distinctio qui eligendi saepe amet assumenda id. Culpa et magni dolor expedita aliquam molestias. Eum sunt doloribus libero laudantium.</p><p>Exercitationem quis placeat temporibus rerum ipsam asperiores. Qui non aperiam natus vel fugiat et. Odio aperiam voluptate molestias ipsam et aspernatur. Eius alias ipsum et voluptatem.</p><p>Id rerum ea sit. Officiis dicta iste qui accusantium quaerat. Architecto dolore quos necessitatibus consequatur voluptatem. Assumenda impedit sint molestiae itaque voluptatem dolor impedit.</p><p>Delectus accusantium reiciendis sapiente deleniti iusto omnis omnis. Sed ullam sunt excepturi libero dolorem dolores aut.</p><p>Assumenda autem adipisci eos est ad voluptate et voluptatibus. Ut omnis sit non sit totam ipsa eligendi incidunt. Odit dolorum quo rerum debitis ex quaerat accusantium.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(18, 2, 3, 'Consequatur at.', 'iste-fugiat-libero-porro', NULL, 'Cum id velit aut. Ullam sint in voluptates consequatur. Repellendus eaque accusantium a commodi.', '<p>Incidunt molestiae eveniet totam modi. Et totam tenetur quos pariatur. Et commodi est eligendi ipsum reprehenderit occaecati ea. Et numquam aut quod et.</p><p>Dolorem velit officia qui quia. Ad incidunt est beatae animi corporis minima ut voluptatibus. Possimus eum culpa iusto at doloremque.</p><p>Odio quisquam quam non voluptatem aspernatur excepturi. Consequuntur ipsam harum cumque. Repellendus magnam nihil est asperiores excepturi. Exercitationem rerum soluta provident at.</p><p>Mollitia officiis non vero quis consequatur excepturi. Ut veniam quae est aliquam aut. Nobis nostrum ipsam placeat eaque.</p><p>Enim odit recusandae eius eum voluptatum. Nesciunt harum unde repellat sint exercitationem omnis tempora. Alias voluptates velit non possimus nam cupiditate suscipit praesentium. Molestias culpa provident excepturi voluptatibus unde quidem.</p><p>Est eos illum harum asperiores et aut. Cupiditate perspiciatis inventore accusantium cumque ut. Optio ea consequuntur dicta sit.</p><p>Expedita dolor similique est laudantium ipsam iste culpa. Vel maxime est blanditiis perspiciatis. Nulla sed quaerat minima laudantium ea qui.</p><p>Et dolor id impedit maiores qui cumque. Iste dignissimos consequatur earum veniam.</p><p>Est accusantium voluptatem atque. Delectus ut laudantium dicta quia vero hic. Atque voluptatem quia sunt neque eos. Repellat vel dolor incidunt maxime incidunt enim rerum.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(19, 1, 1, 'Inventore dolorem perferendis.', 'quibusdam-autem-odio-et-ipsam-neque-harum-accusamus', NULL, 'Est rerum omnis qui tenetur aut nihil aspernatur officia. Qui autem aut error cum ipsa error nihil aut. Est ut quis aut labore.', '<p>Provident dolore atque quas sed maiores adipisci nulla. Aut soluta perferendis expedita ut aliquid deserunt quasi. Error blanditiis necessitatibus repellat illum quisquam dicta.</p><p>Similique consectetur voluptatum dolorum adipisci. Eligendi dolore vitae corrupti totam nemo rerum. Nemo assumenda aliquid velit illum quae.</p><p>Sit ullam est voluptatibus facilis rem veritatis velit. Quos eum voluptas minima voluptates. Aliquam officia recusandae mollitia maxime aut eum iure.</p><p>Quidem ut nam sapiente aut. Qui perferendis occaecati rerum debitis totam sunt est. Nulla quo dolorem ipsum ex quisquam dolorem.</p><p>Dolor voluptatem voluptatum et doloribus voluptas similique quos. Numquam autem est consequatur vel. Cupiditate unde eos non ducimus dolorem ea blanditiis.</p><p>Fugit delectus aperiam ducimus quo. Et nam similique velit numquam. Soluta qui dolorem aut molestiae minus laboriosam. Quis est nam voluptates consequatur corporis magni.</p>', NULL, '2022-03-10 15:57:42', '2022-03-10 15:57:42'),
(21, 2, 1, 'coba image', 'coba-image', 'post-image/8R0nGkE1iKYtobJZQT4kinedOCGMAVsphSurXX3z.jpg', 'gambar baru', '<div>gambar baru</div>', NULL, '2022-03-10 16:08:33', '2022-03-10 16:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Aqil', 'Aqil', 'aqil@gmail.com', NULL, '$2y$10$CjPzj8ocLT8B3RxvIT2HluPImofyvBwbXXKhrVbA6IrsTmR4rdQYm', NULL, '2022-03-10 15:57:34', '2022-03-10 15:57:34', 1),
(2, 'Irma Cinta Safitri S.Kom', 'mandala.kiandra', 'liqa@gmail.com', '2022-03-10 15:57:41', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 't51eVFGdox9410S10VVCLOmbSKLDcjAFHgn1bS9xFFrPyy0b4zqPInQ1dK8b', '2022-03-10 15:57:41', '2022-03-10 15:57:41', 0),
(3, 'Latika Riyanti', 'mpurnawati', 'anggraini.sakti@example.com', '2022-03-10 15:57:41', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NLvbE7pc58', '2022-03-10 15:57:41', '2022-03-10 15:57:41', 0),
(4, 'Zaenab Permata', 'hardi.astuti', 'vjailani@example.net', '2022-03-10 15:57:41', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2ufHyq6WPb', '2022-03-10 15:57:42', '2022-03-10 15:57:42', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
