-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 01, 2017 at 05:48 PM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fct001`
--

-- --------------------------------------------------------

--
-- Table structure for table `fct001_commentmeta`
--

CREATE TABLE `fct001_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fct001_comments`
--

CREATE TABLE `fct001_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_comments`
--

INSERT INTO `fct001_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2016-10-02 16:25:49', '2016-10-02 16:25:49', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fct001_links`
--

CREATE TABLE `fct001_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fct001_options`
--

CREATE TABLE `fct001_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_options`
--

INSERT INTO `fct001_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/fct001', 'yes'),
(2, 'home', 'http://localhost/fct001', 'yes'),
(3, 'blogname', 'Facebook Contests', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'SDPapaioannou@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:107:{s:10:\"Contest/?$\";s:31:\"index.php?post_type=fct_contest\";s:27:\"Contest/page/([0-9]{1,})/?$\";s:49:\"index.php?post_type=fct_contest&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:35:\"contest/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"contest/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"contest/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"contest/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"contest/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"contest/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"contest/([^/]+)/embed/?$\";s:45:\"index.php?contest_type=$matches[1]&embed=true\";s:28:\"contest/([^/]+)/trackback/?$\";s:38:\"index.php?fct_contest=$matches[1]&tb=1\";s:36:\"contest/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?contest_type=$matches[1]&paged=$matches[2]\";s:43:\"contest/([^/]+)/comment-page-([0-9]{1,})/?$\";s:51:\"index.php?fct_contest=$matches[1]&cpage=$matches[2]\";s:32:\"contest/([^/]+)(?:/([0-9]+))?/?$\";s:50:\"index.php?fct_contest=$matches[1]&page=$matches[2]\";s:24:\"contest/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"contest/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"contest/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"contest/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"contest/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"contest/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\"contest/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?contest_type=$matches[1]&feed=$matches[2]\";s:43:\"contest/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?contest_type=$matches[1]&feed=$matches[2]\";s:18:\"contest/([^/]+)/?$\";s:34:\"index.php?contest_type=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=27&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:8:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:58:\"contact-form-7--template-support/cf7--template-support.php\";i:2;s:36:\"contact-form-7/wp-contact-form-7.php\";i:3;s:19:\"members/members.php\";i:4;s:53:\"nextend-facebook-connect/nextend-facebook-connect.php\";i:5;s:35:\"sdp-content-likes/content-likes.php\";i:6;s:33:\"sdp-project-functionality/mcf.php\";i:7;s:21:\"sdp-social/social.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'fct001', 'yes'),
(41, 'stylesheet', 'fct001', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'client', 'yes'),
(48, 'db_version', '37965', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', 'large', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '27', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '37965', 'yes'),
(92, 'fct001_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:93:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:14:\"ure_edit_roles\";b:1;s:16:\"ure_create_roles\";b:1;s:16:\"ure_delete_roles\";b:1;s:23:\"ure_create_capabilities\";b:1;s:23:\"ure_delete_capabilities\";b:1;s:18:\"ure_manage_options\";b:1;s:15:\"ure_reset_roles\";b:1;s:16:\"read_psp_project\";b:1;s:25:\"read_private_psp_projects\";b:1;s:16:\"edit_psp_project\";b:1;s:17:\"edit_psp_projects\";b:1;s:24:\"edit_others_psp_projects\";b:1;s:27:\"edit_published_psp_projects\";b:1;s:20:\"publish_psp_projects\";b:1;s:26:\"delete_others_psp_projects\";b:1;s:27:\"delete_private_psp_projects\";b:1;s:29:\"delete_published_psp_projects\";b:1;s:10:\"list_roles\";b:1;s:12:\"create_roles\";b:1;s:12:\"delete_roles\";b:1;s:10:\"edit_roles\";b:1;s:16:\"restrict_content\";b:1;s:15:\"delete_Contests\";b:1;s:23:\"delete_private_Contests\";b:1;s:25:\"delete_published_Contests\";b:1;s:13:\"edit_Contests\";b:1;s:21:\"edit_private_Contests\";b:1;s:23:\"edit_published_Contests\";b:1;s:16:\"publish_Contests\";b:1;s:22:\"delete_others_Contests\";b:1;s:20:\"edit_others_Contests\";b:1;s:21:\"read_private_Contests\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:6:\"client\";a:2:{s:4:\"name\";s:6:\"Client\";s:12:\"capabilities\";a:28:{s:4:\"read\";b:1;s:16:\"read_fct_contest\";b:1;s:25:\"read_private_fct_contests\";b:1;s:16:\"edit_fct_contest\";b:1;s:17:\"edit_fct_contests\";b:1;s:24:\"edit_others_fct_contests\";b:1;s:27:\"edit_published_fct_contests\";b:1;s:20:\"publish_fct_contests\";b:1;s:26:\"delete_others_fct_contests\";b:1;s:27:\"delete_private_fct_contests\";b:1;s:29:\"delete_published_fct_contests\";b:1;s:27:\"delete_private_psp_projects\";b:1;s:29:\"delete_published_psp_projects\";b:1;s:17:\"edit_psp_projects\";b:1;s:27:\"edit_published_psp_projects\";b:1;s:20:\"publish_psp_projects\";b:1;s:25:\"read_private_psp_projects\";b:1;s:19:\"delete_psp_projects\";b:1;s:25:\"edit_private_psp_projects\";b:1;s:15:\"delete_Contests\";b:1;s:23:\"delete_private_Contests\";b:1;s:25:\"delete_published_Contests\";b:1;s:13:\"edit_Contests\";b:1;s:21:\"edit_private_Contests\";b:1;s:23:\"edit_published_Contests\";b:1;s:16:\"publish_Contests\";b:1;s:19:\"assign_contest_type\";b:1;s:12:\"upload_files\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:44:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:16:\"read_psp_project\";b:1;s:25:\"read_private_psp_projects\";b:1;s:16:\"edit_psp_project\";b:1;s:17:\"edit_psp_projects\";b:1;s:24:\"edit_others_psp_projects\";b:1;s:27:\"edit_published_psp_projects\";b:1;s:20:\"publish_psp_projects\";b:1;s:26:\"delete_others_psp_projects\";b:1;s:27:\"delete_private_psp_projects\";b:1;s:29:\"delete_published_psp_projects\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:19:\"psp_project_manager\";a:2:{s:4:\"name\";s:15:\"Project Manager\";s:12:\"capabilities\";a:15:{s:4:\"read\";b:1;s:10:\"edit_posts\";b:0;s:12:\"delete_posts\";b:0;s:13:\"publish_posts\";b:0;s:12:\"upload_files\";b:1;s:16:\"read_psp_project\";b:1;s:25:\"read_private_psp_projects\";b:1;s:16:\"edit_psp_project\";b:1;s:17:\"edit_psp_projects\";b:1;s:24:\"edit_others_psp_projects\";b:1;s:27:\"edit_published_psp_projects\";b:1;s:20:\"publish_psp_projects\";b:1;s:26:\"delete_others_psp_projects\";b:1;s:27:\"delete_private_psp_projects\";b:1;s:29:\"delete_published_psp_projects\";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(99, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'cron', 'a:4:{i:1506875150;a:3:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1506875783;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1506949145;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(110, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1506868284;s:7:\"checked\";a:1:{s:6:\"fct001\";s:5:\"0.1.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(131, 'theme_mods_twentysixteen', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1475426190;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(132, 'current_theme', 'Facebook Contests', 'yes'),
(133, 'theme_mods_fct001', 'a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:4;s:6:\"footer\";i:5;}}', 'yes'),
(134, 'theme_switched', '', 'yes'),
(201, 'recently_activated', 'a:0:{}', 'yes'),
(202, 'wpcf7', 'a:2:{s:7:\"version\";s:3:\"4.7\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1477140925;s:7:\"version\";s:5:\"4.5.1\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(204, 'contest_type_children', 'a:0:{}', 'yes'),
(206, 'acf_version', '5.5.14', 'yes'),
(225, 'nextend_fb_connect', 's:986:\"a:12:{s:8:\"_wpnonce\";s:10:\"c1aa17d7d8\";s:16:\"_wp_http_referer\";s:66:\"/fct001/wp-admin/options-general.php?page=nextend-facebook-connect\";s:20:\"newfb_update_options\";s:1:\"Y\";s:8:\"fb_appid\";s:15:\"615347261977517\";s:9:\"fb_secret\";s:32:\"533b1b36d117d2ace91552533f34e68e\";s:14:\"fb_user_prefix\";s:3:\"fb_\";s:11:\"fb_redirect\";s:33:\"http://localhost/fct001/wp-admin/\";s:15:\"fb_redirect_reg\";s:4:\"auto\";s:13:\"fb_load_style\";s:1:\"1\";s:15:\"fb_login_button\";s:154:\"<div class=\"button button--login new-fb-btn new-fb-1 new-fb-default-anim\"><div class=\"new-fb-1-1\"><div class=\"new-fb-1-1-1\">CONNECT WITH</div></div></div>\";s:14:\"fb_link_button\";s:156:\"<div class=\"button button--link new-fb-btn new-fb-1 new-fb-default-anim\"><div class=\"new-fb-1-1\"><div class=\"new-fb-1-1-1\">LINK ACCOUNT TO</div></div></div>\";s:16:\"fb_unlink_button\";s:157:\"<div class=\"button button--unlink new-fb-btn new-fb-1 new-fb-default-anim\"><div class=\"new-fb-1-1\"><div class=\"new-fb-1-1-1\">UNLINK ACCOUNT</div></div></div>\";}\";', 'yes'),
(232, 'fb_app_id', '615347261977517', 'yes'),
(233, 'fb_app_secret', '533b1b36d117d2ace91552533f34e68e', 'yes'),
(234, 'fb_id', '204691903296846', 'yes'),
(235, 'fb_query_limit', '5', 'yes'),
(236, 'twitter_query', '', 'yes'),
(237, 'twitter_consumer_key1', '', 'yes'),
(238, 'twitter_consumer_key2', '', 'yes'),
(239, 'twitter_token', '', 'yes'),
(240, 'twitter_tag', '', 'yes'),
(241, 'twitter_query_limit', '', 'yes'),
(242, 'instagram_app_id', '23xe23e23e', 'yes'),
(243, 'instagram_tag', '32ex32ex23e', 'yes'),
(244, 'instagram_query_limit', 'x3ex23e', 'yes'),
(245, 'allow_auto', '', 'yes'),
(351, 'user_role_editor', 'a:1:{s:11:\"ure_version\";s:4:\"4.30\";}', 'yes'),
(354, 'fct001_backup_user_roles', 'a:6:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:6:\"client\";a:2:{s:4:\"name\";s:6:\"Client\";s:12:\"capabilities\";a:34:{i:0;s:10:\"edit_posts\";i:1;s:13:\"publish_posts\";i:2;s:20:\"edit_published_posts\";i:3;s:22:\"delete_published_posts\";s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;}}}', 'no'),
(355, 'ure_tasks_queue', 'a:0:{}', 'yes'),
(370, 'ure_role_additional_options_values', 'a:2:{s:6:\"client\";a:0:{}s:10:\"subscriber\";a:0:{}}', 'yes'),
(727, 'WPLANG', '', 'yes'),
(746, 'category_children', 'a:0:{}', 'yes'),
(747, 'mlikes_likes_page', '0', 'yes'),
(756, 'wpmdb_settings', 'a:11:{s:3:\"key\";s:40:\"nS66DFueWmpfrBNEqHXRrVcQvUkUAviLlZ0qLxbo\";s:10:\"allow_pull\";b:0;s:10:\"allow_push\";b:0;s:8:\"profiles\";a:1:{i:0;a:17:{s:13:\"save_computer\";s:1:\"1\";s:9:\"gzip_file\";s:1:\"1\";s:13:\"replace_guids\";s:1:\"1\";s:12:\"exclude_spam\";s:1:\"1\";s:19:\"keep_active_plugins\";s:1:\"0\";s:13:\"create_backup\";s:1:\"0\";s:18:\"exclude_post_types\";s:1:\"0\";s:18:\"exclude_transients\";s:1:\"1\";s:25:\"compatibility_older_mysql\";s:1:\"1\";s:6:\"action\";s:8:\"savefile\";s:15:\"connection_info\";s:0:\"\";s:11:\"replace_old\";a:2:{i:1;s:18:\"//localhost/fct001\";i:2;s:22:\"C:\\xampp\\htdocs\\fct001\";}s:11:\"replace_new\";a:2:{i:1;s:27:\"//www.facebook-contests.com\";i:2;s:45:\"/home/sdpap/public_html/facebook-contests.com\";}s:22:\"save_migration_profile\";s:1:\"1\";s:29:\"save_migration_profile_option\";s:3:\"new\";s:18:\"create_new_profile\";s:13:\"local_godaddy\";s:4:\"name\";s:13:\"local_godaddy\";}}s:7:\"licence\";s:0:\"\";s:10:\"verify_ssl\";b:0;s:17:\"blacklist_plugins\";a:0:{}s:11:\"max_request\";i:1048576;s:22:\"delay_between_requests\";i:0;s:18:\"prog_tables_hidden\";b:1;s:21:\"pause_before_finalize\";b:0;}', 'no'),
(757, 'wpmdb_schema_version', '1', 'no'),
(758, 'wpmdb_state_timeout_58e03ec78c70e', '1491177555', 'no'),
(759, 'wpmdb_state_58e03ec78c70e', 'a:22:{s:6:\"action\";s:19:\"wpmdb_migrate_table\";s:6:\"intent\";s:8:\"savefile\";s:3:\"url\";s:0:\"\";s:9:\"form_data\";s:502:\"action=savefile&save_computer=1&gzip_file=1&connection_info=&replace_old%5B%5D=&replace_new%5B%5D=&replace_old%5B%5D=%2F%2Flocalhost%2Ffct001&replace_new%5B%5D=%2F%2Fwww.facebook-contests.com&replace_old%5B%5D=C%3A%5Cxampp%5Chtdocs%5Cfct001&replace_new%5B%5D=%2Fhome%2Fsdpap%2Fpublic_html%2Ffacebook-contests.com&replace_guids=1&exclude_spam=1&exclude_transients=1&compatibility_older_mysql=1&save_migration_profile=1&save_migration_profile_option=new&create_new_profile=local_godaddy&remote_json_data=\";s:5:\"stage\";s:7:\"migrate\";s:5:\"nonce\";s:10:\"56e4adac4e\";s:12:\"site_details\";a:1:{s:5:\"local\";a:9:{s:12:\"is_multisite\";s:5:\"false\";s:8:\"site_url\";s:23:\"http://localhost/fct001\";s:8:\"home_url\";s:23:\"http://localhost/fct001\";s:6:\"prefix\";s:7:\"fct001_\";s:15:\"uploads_baseurl\";s:43:\"http://localhost/fct001/wp-content/uploads/\";s:7:\"uploads\";a:6:{s:4:\"path\";s:49:\"C:\\xampp\\htdocs\\fct001/wp-content/uploads/2017/04\";s:3:\"url\";s:50:\"http://localhost/fct001/wp-content/uploads/2017/04\";s:6:\"subdir\";s:8:\"/2017/04\";s:7:\"basedir\";s:41:\"C:\\xampp\\htdocs\\fct001/wp-content/uploads\";s:7:\"baseurl\";s:42:\"http://localhost/fct001/wp-content/uploads\";s:5:\"error\";b:0;}s:11:\"uploads_dir\";s:33:\"wp-content/uploads/wp-migrate-db/\";s:8:\"subsites\";a:0:{}s:13:\"subsites_info\";a:0:{}}}s:4:\"code\";i:200;s:7:\"message\";s:2:\"OK\";s:4:\"body\";s:11:\"{\"error\":0}\";s:9:\"dump_path\";s:98:\"C:\\xampp\\htdocs\\fct001\\wp-content\\uploads\\wp-migrate-db\\fct001-migrate-20170401235903-0rbfg.sql.gz\";s:13:\"dump_filename\";s:35:\"fct001-migrate-20170401235903-0rbfg\";s:8:\"dump_url\";s:99:\"http://localhost/fct001/wp-content/uploads/wp-migrate-db/fct001-migrate-20170401235903-0rbfg.sql.gz\";s:10:\"db_version\";s:5:\"5.5.5\";s:8:\"site_url\";s:23:\"http://localhost/fct001\";s:18:\"find_replace_pairs\";a:2:{s:11:\"replace_old\";a:2:{i:1;s:18:\"//localhost/fct001\";i:2;s:22:\"C:\\xampp\\htdocs\\fct001\";}s:11:\"replace_new\";a:2:{i:1;s:27:\"//www.facebook-contests.com\";i:2;s:45:\"/home/sdpap/public_html/facebook-contests.com\";}}s:18:\"migration_state_id\";s:13:\"58e03ec78c70e\";s:5:\"table\";s:12:\"fct001_users\";s:11:\"current_row\";s:0:\"\";s:10:\"last_table\";s:1:\"1\";s:12:\"primary_keys\";s:0:\"\";s:4:\"gzip\";s:1:\"0\";}', 'no'),
(773, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(1009, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1010, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1011, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1012, 'db_upgraded', '', 'yes'),
(1033, '_site_transient_timeout_n_nextend5962552dbaa4e4.19294275', '1499620157', 'no'),
(1034, '_site_transient_n_nextend5962552dbaa4e4.19294275', '1', 'no'),
(1035, '_site_transient_timeout_nextend5962552dbaa4e4.19294275state', '1499620729', 'no'),
(1036, '_site_transient_nextend5962552dbaa4e4.19294275state', '', 'no'),
(1039, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:4:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.8.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.8.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.8.2\";s:7:\"version\";s:5:\"4.8.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.8.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.8.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.8.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.8.2\";s:7:\"version\";s:5:\"4.8.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.7.6.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.7.6.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.7.6-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.7.6-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.7.6\";s:7:\"version\";s:5:\"4.7.6\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.6.7.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.6.7.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.6.7-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.6.7-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.6.7-partial-1.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.6.7-rollback-1.zip\";}s:7:\"current\";s:5:\"4.6.7\";s:7:\"version\";s:5:\"4.6.7\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:5:\"4.6.1\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1506868285;s:15:\"version_checked\";s:5:\"4.6.1\";s:12:\"translations\";a:0:{}}', 'no'),
(1040, 'can_compress_scripts', '1', 'no'),
(1051, '_site_transient_timeout_browser_5d9a37c6a96acca914609d0251644dda', '1500583644', 'no'),
(1052, '_site_transient_browser_5d9a37c6a96acca914609d0251644dda', 'a:9:{s:8:\"platform\";s:7:\"Windows\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"58.0.3029.110\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}', 'no'),
(1053, '_site_transient_timeout_n_nextend5967e04a60bb06.57497587', '1499983450', 'no'),
(1054, '_site_transient_n_nextend5967e04a60bb06.57497587', '1', 'no'),
(1055, '_site_transient_timeout_nextend5967e04a60bb06.57497587state', '1499983617', 'no'),
(1056, '_site_transient_nextend5967e04a60bb06.57497587state', '', 'no'),
(1059, '_site_transient_timeout_n_nextend5967ee5dcee276.90547219', '1499987053', 'no'),
(1060, '_site_transient_n_nextend5967ee5dcee276.90547219', '1', 'no'),
(1061, '_site_transient_timeout_nextend5967ee5dcee276.90547219state', '1499987263', 'no'),
(1062, '_site_transient_nextend5967ee5dcee276.90547219state', '', 'no'),
(1070, '_site_transient_timeout_browser_8ce1bea2f653ca2ce71bdf6183bef333', '1500740491', 'no'),
(1071, '_site_transient_browser_8ce1bea2f653ca2ce71bdf6183bef333', 'a:9:{s:8:\"platform\";s:7:\"Windows\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"59.0.3071.115\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}', 'no'),
(1077, '_site_transient_timeout_n_nextend596a437d582750.76277178', '1500139917', 'no'),
(1078, '_site_transient_n_nextend596a437d582750.76277178', '1', 'no'),
(1079, '_site_transient_timeout_nextend596a437d582750.76277178state', '1500140010', 'no'),
(1080, '_site_transient_nextend596a437d582750.76277178state', '', 'no'),
(1088, '_site_transient_timeout_n_nextend596b9d48735b10.76732448', '1500228440', 'no'),
(1089, '_site_transient_n_nextend596b9d48735b10.76732448', '1', 'no'),
(1090, '_site_transient_timeout_nextend596b9d48735b10.76732448state', '1500228441', 'no'),
(1091, '_site_transient_nextend596b9d48735b10.76732448state', '', 'no'),
(1099, '_site_transient_timeout_n_nextend597d78586f1268.42109427', '1501398632', 'no'),
(1100, '_site_transient_n_nextend597d78586f1268.42109427', '1', 'no'),
(1101, '_site_transient_timeout_nextend597d78586f1268.42109427state', '1501400564', 'no'),
(1102, '_site_transient_nextend597d78586f1268.42109427state', '', 'no'),
(1103, '_site_transient_timeout_nextend597d78586f1268.42109427_fb_r', '1501400553', 'no'),
(1104, '_site_transient_nextend597d78586f1268.42109427_fb_r', 'http://localhost/fct001/wp-admin/', 'no'),
(1105, '_site_transient_timeout_n_nextend597d80643326c9.97386091', '1501400692', 'no'),
(1106, '_site_transient_n_nextend597d80643326c9.97386091', '1', 'no'),
(1107, '_site_transient_timeout_nextend597d80643326c9.97386091state', '1501402823', 'no'),
(1108, '_site_transient_nextend597d80643326c9.97386091state', '', 'no'),
(1109, '_site_transient_timeout_nextend597d80643326c9.97386091_fb_r', '1501402822', 'no'),
(1110, '_site_transient_nextend597d80643326c9.97386091_fb_r', 'http://localhost/fct001/wp-admin/', 'no'),
(1111, '_site_transient_timeout_n_nextend597d92bf2e74a1.44867007', '1501405391', 'no'),
(1112, '_site_transient_n_nextend597d92bf2e74a1.44867007', '1', 'no'),
(1113, '_site_transient_timeout_nextend597d92bf2e74a1.44867007state', '1501405391', 'no'),
(1114, '_site_transient_nextend597d92bf2e74a1.44867007state', '', 'no'),
(1117, '_site_transient_timeout_browser_abde1f4743c83ddb8acc0e54ab93923a', '1502006592', 'no'),
(1118, '_site_transient_browser_abde1f4743c83ddb8acc0e54ab93923a', 'a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:11:\"62.0.3170.0\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}', 'no'),
(1124, '_site_transient_timeout_n_nextend59b2b692863d18.26228721', '1504887970', 'no'),
(1125, '_site_transient_n_nextend59b2b692863d18.26228721', '1', 'no'),
(1126, '_site_transient_timeout_nextend59b2b692863d18.26228721state', '1504887971', 'no'),
(1127, '_site_transient_nextend59b2b692863d18.26228721state', '', 'no'),
(1130, '_site_transient_timeout_browser_87c68c91eaaef49c704bffb8976a5090', '1505489172', 'no'),
(1131, '_site_transient_browser_87c68c91eaaef49c704bffb8976a5090', 'a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:11:\"63.0.3210.0\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}', 'no'),
(1157, '_site_transient_timeout_n_nextend59c93bc61c79c5.99563893', '1506363862', 'no'),
(1158, '_site_transient_n_nextend59c93bc61c79c5.99563893', '1', 'no'),
(1159, '_site_transient_timeout_nextend59c93bc61c79c5.99563893state', '1506363862', 'no'),
(1160, '_site_transient_nextend59c93bc61c79c5.99563893state', '', 'no'),
(1163, '_site_transient_timeout_browser_96c7514a3e4c8b815e5070ef91c89986', '1506965063', 'no'),
(1164, '_site_transient_browser_96c7514a3e4c8b815e5070ef91c89986', 'a:9:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:11:\"63.0.3222.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}', 'no'),
(1169, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1506868280;s:7:\"checked\";a:14:{s:34:\"advanced-custom-fields-pro/acf.php\";s:6:\"5.5.14\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:3:\"4.7\";s:58:\"contact-form-7--template-support/cf7--template-support.php\";s:3:\"1.4\";s:19:\"members/members.php\";s:5:\"1.1.3\";s:53:\"nextend-facebook-connect/nextend-facebook-connect.php\";s:5:\"2.0.2\";s:35:\"sdp-content-likes/content-likes.php\";s:3:\"1.1\";s:33:\"sdp-project-functionality/mcf.php\";s:3:\"1.1\";s:21:\"sdp-events/events.php\";s:3:\"1.0\";s:15:\"sdp-geo/geo.php\";s:3:\"1.0\";s:27:\"sdp-mailchimp/mailchimp.php\";s:3:\"1.0\";s:21:\"sdp-social/social.php\";s:3:\"1.0\";s:52:\"sdp-social-media-aggregator/im-social-aggregator.php\";s:3:\"1.3\";s:27:\"wp-api-and-wp-seo/index.php\";s:3:\"1.0\";s:37:\"user-role-editor/user-role-editor.php\";s:4:\"4.35\";}s:8:\"response\";a:2:{s:37:\"user-role-editor/user-role-editor.php\";O:8:\"stdClass\":8:{s:2:\"id\";s:30:\"w.org/plugins/user-role-editor\";s:4:\"slug\";s:16:\"user-role-editor\";s:6:\"plugin\";s:37:\"user-role-editor/user-role-editor.php\";s:11:\"new_version\";s:4:\"4.36\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/user-role-editor/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/user-role-editor.4.36.zip\";s:6:\"tested\";s:5:\"4.8.1\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":6:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"5.6.2\";s:3:\"url\";s:37:\"https://www.advancedcustomfields.com/\";s:6:\"tested\";s:5:\"4.9.0\";s:7:\"package\";s:0:\"\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":8:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:3:\"4.9\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/contact-form-7.4.9.zip\";s:6:\"tested\";s:5:\"4.8.2\";s:13:\"compatibility\";a:0:{}}s:19:\"members/members.php\";O:8:\"stdClass\":8:{s:2:\"id\";s:21:\"w.org/plugins/members\";s:4:\"slug\";s:7:\"members\";s:6:\"plugin\";s:19:\"members/members.php\";s:11:\"new_version\";s:5:\"2.0.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/members/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/members.2.0.1.zip\";s:6:\"tested\";s:5:\"4.8.2\";s:13:\"compatibility\";a:0:{}}s:53:\"nextend-facebook-connect/nextend-facebook-connect.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:38:\"w.org/plugins/nextend-facebook-connect\";s:4:\"slug\";s:24:\"nextend-facebook-connect\";s:6:\"plugin\";s:53:\"nextend-facebook-connect/nextend-facebook-connect.php\";s:11:\"new_version\";s:5:\"2.0.2\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/nextend-facebook-connect/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/nextend-facebook-connect.2.0.2.zip\";}}}', 'no'),
(1170, '_site_transient_timeout_n_nextend59d0ef74aeb5b1.96600295', '1506868612', 'no'),
(1171, '_site_transient_n_nextend59d0ef74aeb5b1.96600295', '1', 'no'),
(1172, '_site_transient_timeout_nextend59d0ef74aeb5b1.96600295state', '1506870608', 'no'),
(1173, '_site_transient_nextend59d0ef74aeb5b1.96600295state', '', 'no'),
(1176, '_site_transient_timeout_browser_f560e515874dd459ce2182d5e05ce235', '1507469819', 'no'),
(1177, '_site_transient_browser_f560e515874dd459ce2182d5e05ce235', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:11:\"63.0.3229.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1180, '_site_transient_timeout_theme_roots', '1506869123', 'no'),
(1181, '_site_transient_theme_roots', 'a:2:{s:6:\"fct001\";s:7:\"/themes\";s:10:\"fct001_dev\";s:7:\"/themes\";}', 'no'),
(1184, '_transient_timeout_plugin_slugs', '1506955590', 'no'),
(1185, '_transient_plugin_slugs', 'a:14:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:2;s:58:\"contact-form-7--template-support/cf7--template-support.php\";i:3;s:19:\"members/members.php\";i:4;s:53:\"nextend-facebook-connect/nextend-facebook-connect.php\";i:5;s:35:\"sdp-content-likes/content-likes.php\";i:6;s:33:\"sdp-project-functionality/mcf.php\";i:7;s:21:\"sdp-events/events.php\";i:8;s:15:\"sdp-geo/geo.php\";i:9;s:27:\"sdp-mailchimp/mailchimp.php\";i:10;s:21:\"sdp-social/social.php\";i:11;s:52:\"sdp-social-media-aggregator/im-social-aggregator.php\";i:12;s:27:\"wp-api-and-wp-seo/index.php\";i:13;s:37:\"user-role-editor/user-role-editor.php\";}', 'no'),
(1186, '_transient_timeout_acf_plugin_info_pro', '1506871892', 'no');
INSERT INTO `fct001_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1187, '_transient_acf_plugin_info_pro', 'a:16:{s:4:\"name\";s:26:\"Advanced Custom Fields PRO\";s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:8:\"homepage\";s:37:\"https://www.advancedcustomfields.com/\";s:7:\"version\";s:5:\"5.6.2\";s:6:\"author\";s:13:\"Elliot Condon\";s:10:\"author_url\";s:28:\"http://www.elliotcondon.com/\";s:12:\"contributors\";s:12:\"elliotcondon\";s:8:\"requires\";s:5:\"3.6.0\";s:6:\"tested\";s:5:\"4.9.0\";s:4:\"tags\";a:67:{i:0;s:5:\"5.6.1\";i:1;s:11:\"5.6.0-beta2\";i:2;s:11:\"5.6.0-beta1\";i:3;s:9:\"5.6.0-RC2\";i:4;s:9:\"5.6.0-RC1\";i:5;s:5:\"5.6.0\";i:6;s:5:\"5.5.9\";i:7;s:5:\"5.5.7\";i:8;s:5:\"5.5.5\";i:9;s:5:\"5.5.3\";i:10;s:5:\"5.5.2\";i:11;s:6:\"5.5.14\";i:12;s:6:\"5.5.13\";i:13;s:6:\"5.5.12\";i:14;s:6:\"5.5.11\";i:15;s:6:\"5.5.10\";i:16;s:5:\"5.5.1\";i:17;s:5:\"5.5.0\";i:18;s:5:\"5.4.8\";i:19;s:5:\"5.4.7\";i:20;s:5:\"5.4.6\";i:21;s:5:\"5.4.5\";i:22;s:5:\"5.4.4\";i:23;s:5:\"5.4.3\";i:24;s:5:\"5.4.2\";i:25;s:5:\"5.4.1\";i:26;s:5:\"5.4.0\";i:27;s:5:\"5.3.8\";i:28;s:5:\"5.3.7\";i:29;s:5:\"5.3.6\";i:30;s:5:\"5.3.5\";i:31;s:5:\"5.3.4\";i:32;s:5:\"5.3.3\";i:33;s:5:\"5.3.2\";i:34;s:6:\"5.3.10\";i:35;s:5:\"5.3.1\";i:36;s:5:\"5.3.0\";i:37;s:5:\"5.2.9\";i:38;s:5:\"5.2.8\";i:39;s:5:\"5.2.7\";i:40;s:5:\"5.2.6\";i:41;s:5:\"5.2.5\";i:42;s:5:\"5.2.4\";i:43;s:5:\"5.2.3\";i:44;s:5:\"5.2.2\";i:45;s:5:\"5.2.1\";i:46;s:5:\"5.2.0\";i:47;s:5:\"5.1.9\";i:48;s:5:\"5.1.8\";i:49;s:5:\"5.1.7\";i:50;s:5:\"5.1.6\";i:51;s:5:\"5.1.5\";i:52;s:5:\"5.1.4\";i:53;s:5:\"5.1.3\";i:54;s:5:\"5.1.2\";i:55;s:5:\"5.1.1\";i:56;s:5:\"5.1.0\";i:57;s:5:\"5.0.9\";i:58;s:5:\"5.0.8\";i:59;s:5:\"5.0.7\";i:60;s:5:\"5.0.6\";i:61;s:5:\"5.0.5\";i:62;s:5:\"5.0.4\";i:63;s:5:\"5.0.3\";i:64;s:5:\"5.0.2\";i:65;s:5:\"5.0.1\";i:66;s:5:\"5.0.0\";}s:6:\"tagged\";s:61:\"acf, advanced, custom, field, fields, form, repeater, content\";s:11:\"description\";s:1518:\"<p>Use the Advanced Custom Fields plugin to take full control of your WordPress edit screens & custom field data.</p>\n<b>Add fields on demand.</b> Our field builder allows you to quickly and easily add fields to WP edit screens with only the click of a few buttons!\n<b>Add them anywhere.</b> Fields can be added all over WP including posts, users, taxonomy terms, media, comments and even custom options pages!\n<b>Show them everywhere.</b> Load and display your custom field values in any theme template file with our hassle free developer friendly functions!\n<h4> Features </h4>\n<ul><li>Simple & Intuitive</li><li>Powerful Functions</li><li>Over 30 Field Types</li><li>Extensive Documentation</li><li>Millions of Users</li></ul>\n<h4> Links </h4>\n<ul><li>[Website](<a href=\"https://www.advancedcustomfields.com)\">www.advancedcustomfields.com)</a></li><li>[Documentation](<a href=\"https://www.advancedcustomfields.com/resources/)\">www.advancedcustomfields.com/resources/)</a></li><li>[Support](<a href=\"https://support.advancedcustomfields.com)\">support.advancedcustomfields.com)</a></li><li>[ACF PRO](<a href=\"https://www.advancedcustomfields.com/resources/pro/)\">www.advancedcustomfields.com/resources/pro/)</a></li></ul>\n<h4> PRO </h4>\n<p>The Advanced Custom Fields plugin is also available in a professional version which includes more fields, more functionality, and more flexibility! [Learn more](<a href=\"https://www.advancedcustomfields.com/resources/pro/)\">www.advancedcustomfields.com/resources/pro/)</a></p>\n\";s:12:\"installation\";s:515:\"<p>From your WordPress dashboard<ol><li><b>Visit</b> Plugins > Add New</li><li><b>Search</b> for \"Advanced Custom Fields\"</li><li><b>Activate</b> Advanced Custom Fields from your Plugins page</li><li><b>Click</b> on the new menu item \"Custom Fields\" and create your first Custom Field Group!</li><li><b>Read</b> the documentation to [get started](<a href=\"https://www.advancedcustomfields.com/resources/getting-started-with-acf/)\">www.advancedcustomfields.com/resources/getting-started-with-acf/)</a></li></ol></p>\n\";s:9:\"changelog\";s:4760:\"<h4> 5.6.2 </h4>\n<ul><li>Range field: Added new field type</li><li>Clone field: Fixed bug causing value update issues for <code>seamless</code> + widgets / nave menu items</li><li>Location: Added parent theme<code>s post templates to </code>post template\' location rule</li><li>Location: Fixed bug causing <code>nav menu</code> location rule to fail during AJAX (add new item)</li><li>Core: Fixed PHP errors in customizer when editing non ACF panels</li><li>Core: Fixed bug casing backslash character to break fields / field groups</li><li>Core: Many minor bug fixes</li><li>Language: Updated Romanian translation - thanks to Ionut Staicu</li><li>Language: Updated Italian translation - thanks to Davide Pantè</li><li>Language: Update Turkish translation - thanks to Emre Erkan</li><li>Language: Updated Russian translation - Thanks to Алекс Яровиков</li><li>Language: Updated French translation - Thanks to Julie Arrigoni</li></ul>\n<h4> 5.6.1 </h4>\n<ul><li>Fixed an assortment of bugs found in 5.6.0</li></ul>\n<h4> 5.6.0 </h4>\n<ul><li>Link field: Added new field type</li><li>Group field: Added new field type</li><li>API: Improved `have_rows()` function to work with clone and group field values</li><li>Core: Added new location for Menus</li><li>Core: Added new location for Menu Items</li><li>Core: Added types to Attachment location rule</li><li>Core: Added \"Confirm Remove\" tooltips</li><li>Core: Updated Select2 JS library to v4</li><li>Core: Minor fixes and improvements</li></ul>\n<h4> 5.5.14 </h4>\n<ul><li>Core: Minor bug fixes</li></ul>\n<h4> 5.5.13 </h4>\n<ul><li>Clone field: Improved <code>Fields</code> setting to show all fields within a matching field group search</li><li>Flexible Content field: Fixed bug causing <code>layout_title</code> filter to fail when field is cloned</li><li>Flexible Content field: Added missing <code>translate_field</code> function</li><li>WYSIWYG field: Fixed JS error when using CKEditor plugin</li><li>Date Picker field: Improved <code>Display Format</code> and <code>Return Format</code> settings UI</li><li>Time Picker field: Same as above</li><li>Datetime Picker field: Same as above</li><li>Core: Added new <code>remove_wp_meta_box</code> setting</li><li>Core: Added constants ACF, ACF_PRO, ACF_VERSION and ACF_PATH</li><li>Core: Improved compatibility with Select2 v4 including sortable functionality</li><li>Language: Updated Portuguese translation - thanks to Pedro Mendonça</li></ul>\n<h4> 5.5.12 </h4>\n<ul><li>Tab field: Allowed HTML within field label to show in tab</li><li>Core: Improved plugin update class</li><li>Language: Updated Portuguese translation - thanks to Pedro Mendonça</li><li>Language: Updated Brazilian Portuguese translation - thanks to Rafael Ribeiro</li></ul>\n<h4> 5.5.11 </h4>\n<ul><li>Google Map field: Added new <code>google_map_init</code> JS action</li><li>Core: Minor fixes and improvements</li><li>Language: Updated Swiss German translation - thanks to Raphael Hüni</li><li>Language: Updated French translation - thanks to Maxime Bernard-Jacquet</li></ul>\n<h4> 5.5.10 </h4>\n<ul><li>API: Added new functionality to the `acf_form()` function:</li><li>- added new <code>html_updated_message</code> setting</li><li>- added new <code>html_submit_button</code> setting</li><li>- added new <code>html_submit_spinner</code> setting</li><li>- added new <code>acf/pre_submit_form</code> filter run when form is successfully submit (before saving $_POST)</li><li>- added new <code>acf/submit_form</code> action run when form is successfully submit (after saving $_POST)</li><li>- added new <code>%post_id%</code> replace string to the <code>return</code> setting</li><li>- added new encryption logic to prevent $_POST exploits</li><li>- added new `acf_register_form()` function</li><li>Core: Fixed bug preventing values being loaded on a new post/page preview</li><li>Core: Fixed missing <code>Bulk Actions</code> dropdown on sync screen when no field groups exist</li><li>Core: Fixed bug ignoring PHP field groups if exists in JSON</li><li>Core: Minor fixes and improvements</li></ul>\n<h4> 5.5.9 </h4>\n<ul><li>Core: Fixed bug causing ACF4 PHP field groups to be ignored if missing ‘key’ setting</li></ul>\n<h4> 5.5.8 </h4>\n<ul><li>Flexible Content: Added logic to better <code>clean up</code> data when re-ordering layouts</li><li>oEmbed field: Fixed bug causing incorrect width and height settings in embed HTML</li><li>Core: Fixed bug causing incorrect Select2 CSS version loading for WooCommerce 2.7</li><li>Core: Fixed bug preventing <code>min-height</code> style being applied to floating width fields</li><li>Core: Added new JS <code>init</code> actions for wysiwyg, date, datetime, time and select2 fields</li><li>Core: Minor fixes and improvements</li></ul>\n\";s:14:\"upgrade_notice\";s:551:\"<h4> 5.2.7 </h4>\n<ul><li>Field class names have changed slightly in v5.2.7 from `field_type-{$type}` to `acf-field-{$type}`. This change was introduced to better optimise JS performance. The previous class names can be added back in with the following filter: <a href=\"https://www.advancedcustomfields.com/resources/acfcompatibility/\">www.advancedcustomfields.com/resources/acfcompatibility/</a></li></ul>\n<h4> 3.0.0 </h4>\n<ul><li>Editor is broken in WordPress 3.3</li></ul>\n<h4> 2.1.4 </h4>\n<ul><li>Adds post_id column back into acf_values</li></ul>\n\";s:7:\"banners\";a:2:{s:3:\"low\";s:65:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.png\";s:4:\"high\";s:66:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.png\";}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `fct001_postmeta`
--

CREATE TABLE `fct001_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_postmeta`
--

INSERT INTO `fct001_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2, 4, '_form', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]'),
(3, 4, '_mail', 'a:8:{s:7:\"subject\";s:34:\"Facebook Contests \"[your-subject]\"\";s:6:\"sender\";s:37:\"[your-name] <SDPapaioannou@gmail.com>\";s:4:\"body\";s:178:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Facebook Contests (http://localhost/fct001)\";s:9:\"recipient\";s:23:\"SDPapaioannou@gmail.com\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(4, 4, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:34:\"Facebook Contests \"[your-subject]\"\";s:6:\"sender\";s:43:\"Facebook Contests <SDPapaioannou@gmail.com>\";s:4:\"body\";s:120:\"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Facebook Contests (http://localhost/fct001)\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:33:\"Reply-To: SDPapaioannou@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(5, 4, '_messages', 'a:8:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";}'),
(6, 4, '_additional_settings', NULL),
(7, 4, '_locale', 'en_US'),
(13, 17, '_edit_lock', '1496176321:1'),
(14, 17, '_edit_last', '1'),
(16, 24, '_edit_lock', '1494973271:1'),
(17, 24, '_edit_last', '1'),
(18, 24, 'start_date', '2017-04-30 00:00:00'),
(19, 24, '_start_date', 'field_58dd812b9d8b7'),
(20, 24, 'gallery', 'a:2:{i:0;s:2:\"25\";i:1;s:2:\"26\";}'),
(21, 24, '_gallery', 'field_58dd80e41b557'),
(22, 25, '_wp_attached_file', '2017/03/vossen-a45amg-blue-13.jpg'),
(23, 25, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:1066;s:4:\"file\";s:33:\"2017/03/vossen-a45amg-blue-13.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"vossen-a45amg-blue-13-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"vossen-a45amg-blue-13-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:33:\"vossen-a45amg-blue-13-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:34:\"vossen-a45amg-blue-13-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(24, 26, '_wp_attached_file', '2017/03/vossen-a45amg-blue-15.jpg'),
(25, 26, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:1066;s:4:\"file\";s:33:\"2017/03/vossen-a45amg-blue-15.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"vossen-a45amg-blue-15-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"vossen-a45amg-blue-15-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:33:\"vossen-a45amg-blue-15-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:34:\"vossen-a45amg-blue-15-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(26, 27, '_edit_lock', '1506867164:1'),
(27, 27, '_edit_last', '1'),
(28, 30, '_edit_lock', '1491069103:1'),
(29, 30, '_edit_last', '1'),
(30, 34, '_edit_lock', '1496176326:1'),
(31, 34, '_edit_last', '1'),
(32, 27, 'title', 'Excite Your Customers With Digital Promotions'),
(33, 27, '_title', 'field_58dfd62cdae1a'),
(34, 27, 'description', 'Facebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.'),
(35, 27, '_description', 'field_58dfd63ddae1b'),
(36, 27, 'link_text', 'Login'),
(37, 27, '_link_text', 'field_58dfd47702da0'),
(38, 27, 'url', 'http://wp-admin'),
(39, 27, '_url', 'field_58dfd37c2bafd'),
(40, 27, 'link_type', 'internal'),
(41, 27, '_link_type', 'field_58dfd3fa0c34e'),
(42, 27, 'ctas', '2'),
(43, 27, '_ctas', 'field_58dfe948d5fd3'),
(44, 38, 'title', ''),
(45, 38, '_title', 'field_58dfd62cdae1a'),
(46, 38, 'description', ''),
(47, 38, '_description', 'field_58dfd63ddae1b'),
(48, 38, 'link_text', ''),
(49, 38, '_link_text', 'field_58dfd47702da0'),
(50, 38, 'url', ''),
(51, 38, '_url', 'field_58dfd37c2bafd'),
(52, 38, 'link_type', 'external'),
(53, 38, '_link_type', 'field_58dfd3fa0c34e'),
(54, 38, 'ctas', ''),
(55, 38, '_ctas', 'field_58dfd8a9559c8'),
(56, 39, 'title', 'Register'),
(57, 39, '_title', 'field_58dfd62cdae1a'),
(58, 39, 'description', 'no...'),
(59, 39, '_description', 'field_58dfd63ddae1b'),
(60, 39, 'link_text', 'Register'),
(61, 39, '_link_text', 'field_58dfd47702da0'),
(62, 39, 'url', 'http://wp-admin'),
(63, 39, '_url', 'field_58dfd37c2bafd'),
(64, 39, 'link_type', 'internal'),
(65, 39, '_link_type', 'field_58dfd3fa0c34e'),
(66, 39, 'ctas', ''),
(67, 39, '_ctas', 'field_58dfd8a9559c8'),
(68, 27, 'link_internal', 'wp-admin'),
(69, 27, '_link_internal', 'field_58dfda7ee496e'),
(70, 27, 'cta_register', ''),
(71, 27, '_cta_register', 'field_58dfd8a9559c8'),
(72, 27, 'cta_login', ''),
(73, 27, '_cta_login', 'field_58dfd9e634ac7'),
(74, 43, 'title', 'Excite Your Customers With Digital Promotions'),
(75, 43, '_title', 'field_58dfd62cdae1a'),
(76, 43, 'description', 'Facebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.'),
(77, 43, '_description', 'field_58dfd63ddae1b'),
(78, 43, 'link_text', 'Login'),
(79, 43, '_link_text', 'field_58dfd47702da0'),
(80, 43, 'url', 'http://wp-admin'),
(81, 43, '_url', 'field_58dfd37c2bafd'),
(82, 43, 'link_type', 'internal'),
(83, 43, '_link_type', 'field_58dfd3fa0c34e'),
(84, 43, 'ctas', ''),
(85, 43, '_ctas', 'field_58dfd8a9559c8'),
(86, 43, 'link_internal', ''),
(87, 43, '_link_internal', 'field_58dfda7ee496e'),
(88, 43, 'cta_register', ''),
(89, 43, '_cta_register', 'field_58dfd8a9559c8'),
(90, 43, 'cta_login', ''),
(91, 43, '_cta_login', 'field_58dfd9e634ac7'),
(92, 44, 'title', 'Excite Your Customers With Digital Promotions'),
(93, 44, '_title', 'field_58dfd62cdae1a'),
(94, 44, 'description', 'Facebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.'),
(95, 44, '_description', 'field_58dfd63ddae1b'),
(96, 44, 'link_text', 'Login'),
(97, 44, '_link_text', 'field_58dfd47702da0'),
(98, 44, 'url', 'http://wp-admin'),
(99, 44, '_url', 'field_58dfd37c2bafd'),
(100, 44, 'link_type', 'internal'),
(101, 44, '_link_type', 'field_58dfd3fa0c34e'),
(102, 44, 'ctas', ''),
(103, 44, '_ctas', 'field_58dfd8a9559c8'),
(104, 44, 'link_internal', 'wp-admin'),
(105, 44, '_link_internal', 'field_58dfda7ee496e'),
(106, 44, 'cta_register', ''),
(107, 44, '_cta_register', 'field_58dfd8a9559c8'),
(108, 44, 'cta_login', ''),
(109, 44, '_cta_login', 'field_58dfd9e634ac7'),
(110, 27, 'text', 'Login'),
(111, 27, '_text', 'field_58dfd47702da0'),
(112, 27, 'internal', 'w-admin'),
(113, 27, '_internal', 'field_58dfda7ee496e'),
(114, 27, 'type', 'internal'),
(115, 27, '_type', 'field_58dfd3fa0c34e'),
(116, 45, 'title', 'Excite Your Customers With Digital Promotions'),
(117, 45, '_title', 'field_58dfd62cdae1a'),
(118, 45, 'description', 'Facebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.'),
(119, 45, '_description', 'field_58dfd63ddae1b'),
(120, 45, 'link_text', 'Login'),
(121, 45, '_link_text', 'field_58dfd47702da0'),
(122, 45, 'url', 'http://wp-admin'),
(123, 45, '_url', 'field_58dfd37c2bafd'),
(124, 45, 'link_type', 'internal'),
(125, 45, '_link_type', 'field_58dfd3fa0c34e'),
(126, 45, 'ctas', ''),
(127, 45, '_ctas', 'field_58dfd8a9559c8'),
(128, 45, 'link_internal', 'wp-admin'),
(129, 45, '_link_internal', 'field_58dfda7ee496e'),
(130, 45, 'cta_register', ''),
(131, 45, '_cta_register', 'field_58dfd8a9559c8'),
(132, 45, 'cta_login', ''),
(133, 45, '_cta_login', 'field_58dfd9e634ac7'),
(134, 45, 'text', 'Login'),
(135, 45, '_text', 'field_58dfd47702da0'),
(136, 45, 'internal', 'w-admin'),
(137, 45, '_internal', 'field_58dfda7ee496e'),
(138, 45, 'type', 'internal'),
(139, 45, '_type', 'field_58dfd3fa0c34e'),
(140, 27, 'ctas_0_text', 'Register'),
(141, 27, '_ctas_0_text', 'field_58dfe95bd5fd4_field_58dfd47702da0'),
(142, 27, 'ctas_0_internal', 'wp-login.php?action=register'),
(143, 27, '_ctas_0_internal', 'field_58dfe95bd5fd4_field_58dfda7ee496e'),
(144, 27, 'ctas_0_type', 'internal'),
(145, 27, '_ctas_0_type', 'field_58dfe95bd5fd4_field_58dfd3fa0c34e'),
(146, 27, 'ctas_1_text', 'Login'),
(147, 27, '_ctas_1_text', 'field_58dfe95bd5fd4_field_58dfd47702da0'),
(148, 27, 'ctas_1_internal', 'wp-admin'),
(149, 27, '_ctas_1_internal', 'field_58dfe95bd5fd4_field_58dfda7ee496e'),
(150, 27, 'ctas_1_type', 'internal'),
(151, 27, '_ctas_1_type', 'field_58dfe95bd5fd4_field_58dfd3fa0c34e'),
(152, 49, 'title', 'Excite Your Customers With Digital Promotions'),
(153, 49, '_title', 'field_58dfd62cdae1a'),
(154, 49, 'description', 'Facebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.'),
(155, 49, '_description', 'field_58dfd63ddae1b'),
(156, 49, 'link_text', 'Login'),
(157, 49, '_link_text', 'field_58dfd47702da0'),
(158, 49, 'url', 'http://wp-admin'),
(159, 49, '_url', 'field_58dfd37c2bafd'),
(160, 49, 'link_type', 'internal'),
(161, 49, '_link_type', 'field_58dfd3fa0c34e'),
(162, 49, 'ctas', '2'),
(163, 49, '_ctas', 'field_58dfe948d5fd3'),
(164, 49, 'link_internal', 'wp-admin'),
(165, 49, '_link_internal', 'field_58dfda7ee496e'),
(166, 49, 'cta_register', ''),
(167, 49, '_cta_register', 'field_58dfd8a9559c8'),
(168, 49, 'cta_login', ''),
(169, 49, '_cta_login', 'field_58dfd9e634ac7'),
(170, 49, 'text', 'Login'),
(171, 49, '_text', 'field_58dfd47702da0'),
(172, 49, 'internal', 'w-admin'),
(173, 49, '_internal', 'field_58dfda7ee496e'),
(174, 49, 'type', 'internal'),
(175, 49, '_type', 'field_58dfd3fa0c34e'),
(176, 49, 'ctas_0_text', 'Register'),
(177, 49, '_ctas_0_text', 'field_58dfe95bd5fd4_field_58dfd47702da0'),
(178, 49, 'ctas_0_internal', 'wp-admin/register'),
(179, 49, '_ctas_0_internal', 'field_58dfe95bd5fd4_field_58dfda7ee496e'),
(180, 49, 'ctas_0_type', 'internal'),
(181, 49, '_ctas_0_type', 'field_58dfe95bd5fd4_field_58dfd3fa0c34e'),
(182, 49, 'ctas_1_text', 'Login'),
(183, 49, '_ctas_1_text', 'field_58dfe95bd5fd4_field_58dfd47702da0'),
(184, 49, 'ctas_1_internal', 'wp-admin'),
(185, 49, '_ctas_1_internal', 'field_58dfe95bd5fd4_field_58dfda7ee496e'),
(186, 49, 'ctas_1_type', 'internal'),
(187, 49, '_ctas_1_type', 'field_58dfe95bd5fd4_field_58dfd3fa0c34e'),
(188, 50, 'title', 'Excite Your Customers With Digital Promotions'),
(189, 50, '_title', 'field_58dfd62cdae1a'),
(190, 50, 'description', 'Facebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.'),
(191, 50, '_description', 'field_58dfd63ddae1b'),
(192, 50, 'link_text', 'Login'),
(193, 50, '_link_text', 'field_58dfd47702da0'),
(194, 50, 'url', 'http://wp-admin'),
(195, 50, '_url', 'field_58dfd37c2bafd'),
(196, 50, 'link_type', 'internal'),
(197, 50, '_link_type', 'field_58dfd3fa0c34e'),
(198, 50, 'ctas', '2'),
(199, 50, '_ctas', 'field_58dfe948d5fd3'),
(200, 50, 'link_internal', 'wp-admin'),
(201, 50, '_link_internal', 'field_58dfda7ee496e'),
(202, 50, 'cta_register', ''),
(203, 50, '_cta_register', 'field_58dfd8a9559c8'),
(204, 50, 'cta_login', ''),
(205, 50, '_cta_login', 'field_58dfd9e634ac7'),
(206, 50, 'text', 'Login'),
(207, 50, '_text', 'field_58dfd47702da0'),
(208, 50, 'internal', 'w-admin'),
(209, 50, '_internal', 'field_58dfda7ee496e'),
(210, 50, 'type', 'internal'),
(211, 50, '_type', 'field_58dfd3fa0c34e'),
(212, 50, 'ctas_0_text', 'Register'),
(213, 50, '_ctas_0_text', 'field_58dfe95bd5fd4_field_58dfd47702da0'),
(214, 50, 'ctas_0_internal', 'wp-login.php?action=register'),
(215, 50, '_ctas_0_internal', 'field_58dfe95bd5fd4_field_58dfda7ee496e'),
(216, 50, 'ctas_0_type', 'internal'),
(217, 50, '_ctas_0_type', 'field_58dfe95bd5fd4_field_58dfd3fa0c34e'),
(218, 50, 'ctas_1_text', 'Login'),
(219, 50, '_ctas_1_text', 'field_58dfe95bd5fd4_field_58dfd47702da0'),
(220, 50, 'ctas_1_internal', 'wp-admin'),
(221, 50, '_ctas_1_internal', 'field_58dfe95bd5fd4_field_58dfda7ee496e'),
(222, 50, 'ctas_1_type', 'internal'),
(223, 50, '_ctas_1_type', 'field_58dfe95bd5fd4_field_58dfd3fa0c34e'),
(227, 52, '_edit_lock', '1506867079:1'),
(228, 52, '_edit_last', '1'),
(229, 52, '_wp_page_template', 'templates/page--active-contests.php'),
(230, 57, '_menu_item_type', 'post_type'),
(231, 57, '_menu_item_menu_item_parent', '0'),
(232, 57, '_menu_item_object_id', '27'),
(233, 57, '_menu_item_object', 'page'),
(234, 57, '_menu_item_target', ''),
(235, 57, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(236, 57, '_menu_item_xfn', ''),
(237, 57, '_menu_item_url', ''),
(239, 58, '_menu_item_type', 'post_type'),
(240, 58, '_menu_item_menu_item_parent', '0'),
(241, 58, '_menu_item_object_id', '52'),
(242, 58, '_menu_item_object', 'page'),
(243, 58, '_menu_item_target', ''),
(244, 58, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(245, 58, '_menu_item_xfn', ''),
(246, 58, '_menu_item_url', ''),
(248, 60, '_edit_lock', '1506867090:1'),
(249, 60, '_edit_last', '1'),
(250, 60, '_wp_page_template', 'templates/page--expired-contests.php'),
(263, 67, '_edit_lock', '1499022758:2'),
(264, 67, '_edit_last', '2'),
(265, 67, 'start_date', '2017-10-31 00:00:00'),
(266, 67, '_start_date', 'field_58dd812b9d8b7'),
(267, 67, 'gallery', 'a:2:{i:0;s:2:\"68\";i:1;s:2:\"69\";}'),
(268, 67, '_gallery', 'field_58dd80e41b557'),
(269, 68, '_wp_attached_file', '2017/04/2016_RXPX_300_05.jpg'),
(270, 68, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2752;s:6:\"height\";i:1031;s:4:\"file\";s:28:\"2017/04/2016_RXPX_300_05.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"2016_RXPX_300_05-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"2016_RXPX_300_05-300x112.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:112;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:28:\"2016_RXPX_300_05-768x288.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:288;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:29:\"2016_RXPX_300_05-1024x384.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:384;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(271, 69, '_wp_attached_file', '2017/04/2016_RXTXAS_260_01.jpg'),
(272, 69, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2429;s:6:\"height\";i:1631;s:4:\"file\";s:30:\"2017/04/2016_RXTXAS_260_01.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"2016_RXTXAS_260_01-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"2016_RXTXAS_260_01-300x201.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:201;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"2016_RXTXAS_260_01-768x516.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:516;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"2016_RXTXAS_260_01-1024x688.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:688;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(273, 70, '_edit_lock', '1499022974:4'),
(274, 70, '_edit_last', '4'),
(275, 70, 'start_date', '2017-12-31 00:00:00'),
(276, 70, '_start_date', 'field_58dd812b9d8b7'),
(277, 70, 'gallery', 'a:2:{i:0;s:2:\"71\";i:1;s:2:\"72\";}'),
(278, 70, '_gallery', 'field_58dd80e41b557'),
(279, 71, '_wp_attached_file', '2017/04/4f5dc2673b575e36064b598e8da9aea0.jpeg'),
(280, 71, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1280;s:6:\"height\";i:960;s:4:\"file\";s:45:\"2017/04/4f5dc2673b575e36064b598e8da9aea0.jpeg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:45:\"4f5dc2673b575e36064b598e8da9aea0-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:45:\"4f5dc2673b575e36064b598e8da9aea0-300x225.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:45:\"4f5dc2673b575e36064b598e8da9aea0-768x576.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:46:\"4f5dc2673b575e36064b598e8da9aea0-1024x768.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(281, 72, '_wp_attached_file', '2017/04/caribbean1.jpg'),
(282, 72, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1152;s:6:\"height\";i:864;s:4:\"file\";s:22:\"2017/04/caribbean1.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"caribbean1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"caribbean1-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"caribbean1-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"caribbean1-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(283, 76, '_menu_item_type', 'post_type'),
(284, 76, '_menu_item_menu_item_parent', '0'),
(285, 76, '_menu_item_object_id', '60'),
(286, 76, '_menu_item_object', 'page'),
(287, 76, '_menu_item_target', ''),
(288, 76, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(289, 76, '_menu_item_xfn', ''),
(290, 76, '_menu_item_url', ''),
(291, 70, '_thumbnail_id', '72'),
(292, 67, '_thumbnail_id', '69'),
(293, 24, '_thumbnail_id', '25'),
(294, 84, '_edit_lock', '1500227672:1'),
(295, 84, '_edit_last', '1'),
(296, 84, '_wp_page_template', 'templates/page.php'),
(297, 89, '_menu_item_type', 'post_type'),
(298, 89, '_menu_item_menu_item_parent', '0'),
(299, 89, '_menu_item_object_id', '84'),
(300, 89, '_menu_item_object', 'page'),
(301, 89, '_menu_item_target', ''),
(302, 89, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(303, 89, '_menu_item_xfn', ''),
(304, 89, '_menu_item_url', ''),
(306, 90, '_menu_item_type', 'custom'),
(307, 90, '_menu_item_menu_item_parent', '0'),
(308, 90, '_menu_item_object_id', '90'),
(309, 90, '_menu_item_object', 'custom'),
(310, 90, '_menu_item_target', ''),
(311, 90, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(312, 90, '_menu_item_xfn', ''),
(313, 90, '_menu_item_url', 'http://www.sdpapaioannou.com'),
(314, 92, '_edit_lock', '1506867097:1'),
(315, 92, '_edit_last', '1'),
(316, 92, '_wp_page_template', 'templates/page--fb.php'),
(317, 27, '_wp_page_template', 'templates/page.php');

-- --------------------------------------------------------

--
-- Table structure for table `fct001_posts`
--

CREATE TABLE `fct001_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_posts`
--

INSERT INTO `fct001_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-10-02 16:25:49', '2016-10-02 16:25:49', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2016-10-02 16:25:49', '2016-10-02 16:25:49', '', 0, 'http://localhost/fct001/?p=1', 0, 'post', '', 1),
(4, 1, '2016-10-22 12:55:25', '2016-10-22 12:55:25', '<label> Your Name (required)\n    [text* your-name] </label>\n\n<label> Your Email (required)\n    [email* your-email] </label>\n\n<label> Subject\n    [text your-subject] </label>\n\n<label> Your Message\n    [textarea your-message] </label>\n\n[submit \"Send\"]\nFacebook Contests \"[your-subject]\"\n[your-name] <SDPapaioannou@gmail.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Facebook Contests (http://localhost/fct001)\nSDPapaioannou@gmail.com\nReply-To: [your-email]\n\n0\n0\n\nFacebook Contests \"[your-subject]\"\nFacebook Contests <SDPapaioannou@gmail.com>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Facebook Contests (http://localhost/fct001)\n[your-email]\nReply-To: SDPapaioannou@gmail.com\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2016-10-22 12:55:25', '2016-10-22 12:55:25', '', 0, 'http://localhost/fct001/?post_type=wpcf7_contact_form&p=4', 0, 'wpcf7_contact_form', '', 0),
(17, 1, '2017-03-30 22:02:13', '2017-03-30 22:02:13', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:11:\"fct_contest\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Prize Data', 'prize-data', 'publish', 'closed', 'closed', '', 'group_58dd803e04056', '', '', '2017-05-30 20:32:00', '2017-05-30 20:32:00', '', 0, 'http://localhost/fct001/?post_type=acf-field-group&#038;p=17', 0, 'acf-field-group', '', 0),
(20, 1, '2017-03-30 22:05:16', '2017-03-30 22:05:16', 'a:16:{s:4:\"type\";s:7:\"gallery\";s:12:\"instructions\";s:38:\"Please upload images of the contest...\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:3:\"min\";s:0:\"\";s:3:\"max\";i:6;s:6:\"insert\";s:6:\"append\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Gallery', 'gallery', 'publish', 'closed', 'closed', '', 'field_58dd80e41b557', '', '', '2017-05-30 20:32:00', '2017-05-30 20:32:00', '', 17, 'http://localhost/fct001/?post_type=acf-field&#038;p=20', 1, 'acf-field', '', 0),
(21, 1, '2017-03-30 22:09:25', '2017-03-30 22:09:25', 'a:8:{s:4:\"type\";s:16:\"date_time_picker\";s:12:\"instructions\";s:38:\"Select the day that the contest starts\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"display_format\";s:12:\"F j, Y g:i a\";s:13:\"return_format\";s:11:\"Y-m-d H:i:s\";s:9:\"first_day\";i:1;}', 'Start Date', 'start_date', 'publish', 'closed', 'closed', '', 'field_58dd812b9d8b7', '', '', '2017-04-22 14:38:32', '2017-04-22 14:38:32', '', 17, 'http://localhost/fct001/?post_type=acf-field&#038;p=21', 0, 'acf-field', '', 0),
(24, 1, '2017-03-30 22:15:39', '2017-03-30 22:15:39', 'This year, Mercedes AMG celebrates 3 consecutive championships in Formula 1 and gives away one of it\'s best models! The amazing A45 AMG!\r\nLike, Comment and Share to join the contest and win this magnificent car.', 'Mercedes A45 AMG', '', 'publish', 'closed', 'closed', '', 'mercedes-a45-amg', '', '', '2017-05-16 22:23:33', '2017-05-16 22:23:33', '', 0, 'http://localhost/fct001/?post_type=fct_contest&#038;p=24', 0, 'fct_contest', '', 0),
(25, 1, '2017-03-30 22:51:19', '2017-03-30 22:51:19', '', 'vossen-a45amg-blue-13', '', 'inherit', 'open', 'closed', '', 'vossen-a45amg-blue-13', '', '', '2017-03-30 22:51:23', '2017-03-30 22:51:23', '', 24, 'http://localhost/fct001/wp-content/uploads/2017/03/vossen-a45amg-blue-13.jpg', 0, 'attachment', 'image/jpeg', 0),
(26, 1, '2017-03-30 22:51:20', '2017-03-30 22:51:20', '', 'vossen-a45amg-blue-15', '', 'inherit', 'open', 'closed', '', 'vossen-a45amg-blue-15', '', '', '2017-03-30 22:51:20', '2017-03-30 22:51:20', '', 24, 'http://localhost/fct001/wp-content/uploads/2017/03/vossen-a45amg-blue-15.jpg', 0, 'attachment', 'image/jpeg', 0),
(27, 1, '2017-04-01 17:10:36', '2017-04-01 17:10:36', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'publish', 'closed', 'closed', '', 'homepage', '', '', '2017-10-01 14:14:43', '2017-10-01 14:14:43', '', 0, 'http://localhost/fct001/?page_id=27', 0, 'page', '', 0),
(28, 1, '2017-04-01 16:08:18', '2017-04-01 16:08:18', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\n&nbsp;\r\n\r\n&nbsp;', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 16:08:18', '2017-04-01 16:08:18', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2017-04-01 16:17:11', '2017-04-01 16:17:11', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 16:17:11', '2017-04-01 16:17:11', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2017-04-01 16:23:18', '2017-04-01 16:23:18', 'a:7:{s:8:\"location\";a:1:{i:0;a:2:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}i:1;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"!=\";s:5:\"value\";s:4:\"post\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Utils -- Link', 'utils-link', 'publish', 'closed', 'closed', '', 'group_58dfd36d81885', '', '', '2017-04-01 17:52:42', '2017-04-01 17:52:42', '', 0, 'http://localhost/fct001/?post_type=acf-field-group&#038;p=30', 0, 'acf-field-group', '', 0),
(31, 1, '2017-04-01 16:23:18', '2017-04-01 16:23:18', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:7:\"http://\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_58dfd3fa0c34e\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"external\";}}}}', 'Custom', 'custom', 'publish', 'closed', 'closed', '', 'field_58dfd37c2bafd', '', '', '2017-04-01 17:51:34', '2017-04-01 17:51:34', '', 30, 'http://localhost/fct001/?post_type=acf-field&#038;p=31', 1, 'acf-field', '', 0),
(32, 1, '2017-04-01 16:25:24', '2017-04-01 16:25:24', 'a:13:{s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:2:{s:8:\"external\";s:8:\"External\";s:8:\"internal\";s:8:\"Internal\";}s:13:\"default_value\";a:1:{i:0;s:8:\"external\";}s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:2:\"ui\";i:0;s:4:\"ajax\";i:0;s:13:\"return_format\";s:5:\"value\";s:11:\"placeholder\";s:0:\"\";}', 'Type', 'type', 'publish', 'closed', 'closed', '', 'field_58dfd3fa0c34e', '', '', '2017-04-01 17:51:34', '2017-04-01 17:51:34', '', 30, 'http://localhost/fct001/?post_type=acf-field&#038;p=32', 3, 'acf-field', '', 0),
(33, 1, '2017-04-01 16:25:54', '2017-04-01 16:25:54', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Text', 'text', 'publish', 'closed', 'closed', '', 'field_58dfd47702da0', '', '', '2017-04-01 17:51:34', '2017-04-01 17:51:34', '', 30, 'http://localhost/fct001/?post_type=acf-field&#038;p=33', 0, 'acf-field', '', 0),
(34, 1, '2017-04-01 16:33:25', '2017-04-01 16:33:25', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"27\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Homepage', 'homepage', 'publish', 'closed', 'closed', '', 'group_58dfd62457220', '', '', '2017-04-01 17:58:45', '2017-04-01 17:58:45', '', 0, 'http://localhost/fct001/?post_type=acf-field-group&#038;p=34', 0, 'acf-field-group', '', 0),
(35, 1, '2017-04-01 16:33:25', '2017-04-01 16:33:25', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Title', 'title', 'publish', 'closed', 'closed', '', 'field_58dfd62cdae1a', '', '', '2017-04-01 16:33:25', '2017-04-01 16:33:25', '', 34, 'http://localhost/fct001/?post_type=acf-field&p=35', 0, 'acf-field', '', 0),
(36, 1, '2017-04-01 16:33:25', '2017-04-01 16:33:25', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:7:\"wpautop\";}', 'Description', 'description', 'publish', 'closed', 'closed', '', 'field_58dfd63ddae1b', '', '', '2017-04-01 16:33:25', '2017-04-01 16:33:25', '', 34, 'http://localhost/fct001/?post_type=acf-field&p=36', 1, 'acf-field', '', 0),
(38, 1, '2017-04-01 16:45:22', '2017-04-01 16:45:22', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 16:45:22', '2017-04-01 16:45:22', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2017-04-01 16:47:18', '2017-04-01 16:47:18', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 16:47:18', '2017-04-01 16:47:18', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(42, 1, '2017-04-01 16:53:00', '2017-04-01 16:53:00', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_58dfd3fa0c34e\";s:8:\"operator\";s:2:\"!=\";s:5:\"value\";s:8:\"external\";}}}}', 'Internal', 'internal', 'publish', 'closed', 'closed', '', 'field_58dfda7ee496e', '', '', '2017-04-01 17:51:34', '2017-04-01 17:51:34', '', 30, 'http://localhost/fct001/?post_type=acf-field&#038;p=42', 2, 'acf-field', '', 0),
(43, 1, '2017-04-01 16:54:40', '2017-04-01 16:54:40', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 16:54:40', '2017-04-01 16:54:40', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2017-04-01 17:03:32', '2017-04-01 17:03:32', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 17:03:32', '2017-04-01 17:03:32', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2017-04-01 17:53:33', '2017-04-01 17:53:33', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 17:53:33', '2017-04-01 17:53:33', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2017-04-01 17:56:27', '2017-04-01 17:56:27', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:3:\"row\";s:12:\"button_label\";s:7:\"Add CTA\";}', 'CTAs', 'ctas', 'publish', 'closed', 'closed', '', 'field_58dfe948d5fd3', '', '', '2017-04-01 17:58:45', '2017-04-01 17:58:45', '', 34, 'http://localhost/fct001/?post_type=acf-field&#038;p=46', 2, 'acf-field', '', 0),
(47, 1, '2017-04-01 17:56:27', '2017-04-01 17:56:27', 'a:10:{s:4:\"type\";s:5:\"clone\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:5:\"clone\";a:1:{i:0;s:19:\"group_58dfd36d81885\";}s:7:\"display\";s:8:\"seamless\";s:6:\"layout\";s:5:\"block\";s:12:\"prefix_label\";i:0;s:11:\"prefix_name\";i:0;}', 'Call to Action', 'cta', 'publish', 'closed', 'closed', '', 'field_58dfe95bd5fd4', '', '', '2017-04-01 17:58:34', '2017-04-01 17:58:34', '', 46, 'http://localhost/fct001/?post_type=acf-field&#038;p=47', 0, 'acf-field', '', 0),
(49, 1, '2017-04-01 18:00:33', '2017-04-01 18:00:33', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-01 18:00:33', '2017-04-01 18:00:33', '', 27, 'http://localhost/fct001/2017/04/01/27-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2017-04-02 00:14:41', '2017-04-02 00:14:41', '<h1>Excite Your Customers\r\nWith Digital Promotions</h1>\r\nFacebook Contests is a web-based platform created to produce exciting, frontend-rich promotional campaigns on Facebook. Take advantage of the Facebook community and promote your products and services as easy as it gets, in front of millions of people.', 'Homepage', '', 'inherit', 'closed', 'closed', '', '27-revision-v1', '', '', '2017-04-02 00:14:41', '2017-04-02 00:14:41', '', 27, 'http://localhost/fct001/2017/04/02/27-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2017-04-02 18:50:07', '2017-04-02 18:50:07', 'Here are the latest prizes, waiting for a person to win it!', 'Active Contests', '', 'publish', 'closed', 'closed', '', 'active-contests', '', '', '2017-10-01 14:13:42', '2017-10-01 14:13:42', '', 0, 'http://localhost/fct001/?page_id=52', 0, 'page', '', 0),
(53, 1, '2017-04-02 18:50:07', '2017-04-02 18:50:07', '', 'Active Draws', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2017-04-02 18:50:07', '2017-04-02 18:50:07', '', 52, 'http://localhost/fct001/2017/04/02/52-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2017-04-02 19:14:58', '2017-04-02 19:14:58', 'Here are the latest prizes, waiting for a person to', 'Active Draws', '', 'inherit', 'closed', 'closed', '', '52-autosave-v1', '', '', '2017-04-02 19:14:58', '2017-04-02 19:14:58', '', 52, 'http://localhost/fct001/2017/04/02/52-autosave-v1/', 0, 'revision', '', 0),
(55, 1, '2017-04-02 19:15:31', '2017-04-02 19:15:31', 'Here are the latest prizes, waiting for a person to win it!', 'Active Draws', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2017-04-02 19:15:31', '2017-04-02 19:15:31', '', 52, 'http://localhost/fct001/2017/04/02/52-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2017-04-02 19:16:36', '2017-04-02 19:16:36', 'Here are the latest prizes, waiting for a person to win it!', 'Lates Prizes!', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2017-04-02 19:16:36', '2017-04-02 19:16:36', '', 52, 'http://localhost/fct001/2017/04/02/52-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2017-04-03 20:53:50', '2017-04-03 20:53:50', '', 'Home', '', 'publish', 'closed', 'closed', '', '57', '', '', '2017-10-01 14:15:47', '2017-10-01 14:15:47', '', 0, 'http://localhost/fct001/?p=57', 1, 'nav_menu_item', '', 0),
(58, 1, '2017-04-03 20:53:50', '2017-04-03 20:53:50', ' ', '', '', 'publish', 'closed', 'closed', '', 'active-draws', '', '', '2017-10-01 14:15:47', '2017-10-01 14:15:47', '', 0, 'http://localhost/fct001/?p=58', 2, 'nav_menu_item', '', 0),
(59, 1, '2017-04-03 21:00:07', '2017-04-03 21:00:07', 'Here are the latest prizes, waiting for a person to win it!', 'Active Draws', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2017-04-03 21:00:07', '2017-04-03 21:00:07', '', 52, 'http://localhost/fct001/2017/04/03/52-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2017-04-03 21:00:25', '2017-04-03 21:00:25', '', 'Expired Contests', '', 'publish', 'closed', 'closed', '', 'inactive-contests', '', '', '2017-10-01 14:13:52', '2017-10-01 14:13:52', '', 0, 'http://localhost/fct001/?page_id=60', 0, 'page', '', 0),
(61, 1, '2017-04-03 21:00:25', '2017-04-03 21:00:25', '', 'Inactive Draws', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2017-04-03 21:00:25', '2017-04-03 21:00:25', '', 60, 'http://localhost/fct001/2017/04/03/60-revision-v1/', 0, 'revision', '', 0),
(67, 2, '2017-04-22 15:52:33', '2017-04-22 15:52:33', '<div class=\"row-fluid pdp-solo-header-details-inner\">\r\n<div id=\"pdp-solo-header-description\" class=\"table-cell\">The ultimate top-of-the-line racing watercraft combines power, handling and control like nothing else on the water. And with the 300-hp Rotax 1630 ACE engine, nothing else will come close to you on the buoy course.</div>\r\n<div class=\"price-details border-gradient table-cell\"></div>\r\n</div>', 'Sea Doo RXP 300', '', 'publish', 'closed', 'closed', '', 'sea-doo-rxp-300', '', '', '2017-07-02 19:12:36', '2017-07-02 19:12:36', '', 0, 'http://localhost/fct001/?post_type=fct_contest&#038;p=67', 0, 'fct_contest', '', 0),
(68, 2, '2017-04-22 15:52:22', '2017-04-22 15:52:22', '', '2016_rxpx_300_05', '', 'inherit', 'open', 'closed', '', '2016_rxpx_300_05', '', '', '2017-04-22 15:52:22', '2017-04-22 15:52:22', '', 67, 'http://localhost/fct001/wp-content/uploads/2017/04/2016_RXPX_300_05.jpg', 0, 'attachment', 'image/jpeg', 0),
(69, 2, '2017-04-22 15:52:24', '2017-04-22 15:52:24', '', '2016_rxtxas_260_01', '', 'inherit', 'open', 'closed', '', '2016_rxtxas_260_01', '', '', '2017-04-22 15:52:24', '2017-04-22 15:52:24', '', 67, 'http://localhost/fct001/wp-content/uploads/2017/04/2016_RXTXAS_260_01.jpg', 0, 'attachment', 'image/jpeg', 0),
(70, 4, '2017-04-22 16:06:10', '2017-04-22 16:06:10', 'Punta Cana, the easternmost tip of the Dominican Republic, abuts the Caribbean Sea and the Atlantic Ocean. It\'s a region known for its 32km stretch of beaches and clear waters. The Bávaro area and Punta Cana combine to form what\'s known as La Costa del Coco, or the Coconut Coast, an area of lavish, all-inclusive resorts. It\'s popular for zip-lining, windsurfing, kayaking and sailing.', 'Travel to Caribbeans', '', 'publish', 'closed', 'closed', '', 'travel-to-caribbeans', '', '', '2017-07-02 19:13:52', '2017-07-02 19:13:52', '', 0, 'http://localhost/fct001/?post_type=fct_contest&#038;p=70', 0, 'fct_contest', '', 0),
(71, 4, '2017-04-22 16:06:00', '2017-04-22 16:06:00', '', '4f5dc2673b575e36064b598e8da9aea0', '', 'inherit', 'open', 'closed', '', '4f5dc2673b575e36064b598e8da9aea0', '', '', '2017-04-22 16:06:00', '2017-04-22 16:06:00', '', 70, 'http://localhost/fct001/wp-content/uploads/2017/04/4f5dc2673b575e36064b598e8da9aea0.jpeg', 0, 'attachment', 'image/jpeg', 0),
(72, 4, '2017-04-22 16:06:01', '2017-04-22 16:06:01', '', 'caribbean1', '', 'inherit', 'open', 'closed', '', 'caribbean1', '', '', '2017-04-22 16:06:01', '2017-04-22 16:06:01', '', 70, 'http://localhost/fct001/wp-content/uploads/2017/04/caribbean1.jpg', 0, 'attachment', 'image/jpeg', 0),
(74, 1, '2017-04-30 18:55:43', '2017-04-30 18:55:43', 'Here are the latest prizes, waiting for a person to win it!', 'Active Contests', '', 'inherit', 'closed', 'closed', '', '52-revision-v1', '', '', '2017-04-30 18:55:43', '2017-04-30 18:55:43', '', 52, 'http://localhost/fct001/2017/04/30/52-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2017-04-30 18:56:05', '2017-04-30 18:56:05', '', 'Inactive Contests', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2017-04-30 18:56:05', '2017-04-30 18:56:05', '', 60, 'http://localhost/fct001/2017/04/30/60-revision-v1/', 0, 'revision', '', 0),
(76, 1, '2017-04-30 18:57:12', '2017-04-30 18:57:12', ' ', '', '', 'publish', 'closed', 'closed', '', 'past-contests', '', '', '2017-10-01 14:15:47', '2017-10-01 14:15:47', '', 0, 'http://localhost/fct001/?p=76', 3, 'nav_menu_item', '', 0),
(84, 1, '2017-07-16 17:23:44', '2017-07-16 17:23:44', 'By using this platform, you accept storing your facebook public info like name and email, in order to participate to our contests.\r\nWe don\'t request access to any personal info and we never going to publish or share with others any information we retrieved by joining our draws.\r\nThis platform is developed for strictly educational purposes.', 'Privacy', '', 'publish', 'closed', 'closed', '', 'pivacy', '', '', '2017-07-16 17:56:47', '2017-07-16 17:56:47', '', 0, 'http://localhost/fct001/?page_id=84', 0, 'page', '', 0),
(85, 1, '2017-07-16 17:23:34', '2017-07-16 17:23:34', '', 'Pivacy', '', 'inherit', 'closed', 'closed', '', '84-revision-v1', '', '', '2017-07-16 17:23:34', '2017-07-16 17:23:34', '', 84, 'http://localhost/fct001/2017/07/16/84-revision-v1/', 0, 'revision', '', 0),
(86, 1, '2017-07-16 17:24:39', '2017-07-16 17:24:39', '', 'Privacy', '', 'inherit', 'closed', 'closed', '', '84-revision-v1', '', '', '2017-07-16 17:24:39', '2017-07-16 17:24:39', '', 84, 'http://localhost/fct001/2017/07/16/84-revision-v1/', 0, 'revision', '', 0),
(87, 1, '2017-07-16 17:56:50', '2017-07-16 17:56:50', 'By using this platform, you accept storing your facebook public info like name and email, in order to participate to our contests.\nWe don\'t request access to any personal info and we never going to publish or share with others any information we retrieved by joining our draws.\nThis platform is developed for strictly educational purposes.', 'Privacy', '', 'inherit', 'closed', 'closed', '', '84-autosave-v1', '', '', '2017-07-16 17:56:50', '2017-07-16 17:56:50', '', 84, 'http://localhost/fct001/2017/07/16/84-autosave-v1/', 0, 'revision', '', 0),
(88, 1, '2017-07-16 17:37:47', '2017-07-16 17:37:47', 'By using this platform, you accept storing your facebook public info like name and email, in order to participate to our contests.\r\nWe don\'t request access to any personal info and we never going to publish or share with others any information we retrieved by joining our draws.\r\nThis platform is developed for strictly educational purposes.', 'Privacy', '', 'inherit', 'closed', 'closed', '', '84-revision-v1', '', '', '2017-07-16 17:37:47', '2017-07-16 17:37:47', '', 84, 'http://localhost/fct001/2017/07/16/84-revision-v1/', 0, 'revision', '', 0),
(89, 1, '2017-07-16 17:57:57', '2017-07-16 17:57:57', '', 'Privacy & Policy', '', 'publish', 'closed', 'closed', '', 'privacy-policy', '', '', '2017-07-16 17:59:07', '2017-07-16 17:59:07', '', 0, 'http://localhost/fct001/?p=89', 2, 'nav_menu_item', '', 0),
(90, 1, '2017-07-16 17:59:07', '2017-07-16 17:59:07', '', 'Developed & Designed by SDPapaioannou', '', 'publish', 'closed', 'closed', '', 'developed-designed-by-sdpapaioannou', '', '', '2017-07-16 17:59:07', '2017-07-16 17:59:07', '', 0, 'http://localhost/fct001/?p=90', 1, 'nav_menu_item', '', 0),
(91, 1, '2017-09-25 17:24:28', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2017-09-25 17:24:28', '0000-00-00 00:00:00', '', 0, 'http://localhost/fct001/?p=91', 0, 'post', '', 0),
(92, 1, '2017-09-25 17:25:00', '2017-09-25 17:25:00', '', 'Facebook Contests', '', 'publish', 'closed', 'closed', '', 'facebook-contests', '', '', '2017-10-01 14:14:00', '2017-10-01 14:14:00', '', 0, 'http://localhost/fct001/?page_id=92', 0, 'page', '', 0),
(93, 1, '2017-09-25 17:25:00', '2017-09-25 17:25:00', '', 'Facebook Contests', '', 'inherit', 'closed', 'closed', '', '92-revision-v1', '', '', '2017-09-25 17:25:00', '2017-09-25 17:25:00', '', 92, 'http://localhost/fct001/2017/09/25/92-revision-v1/', 0, 'revision', '', 0),
(94, 1, '2017-10-01 14:12:26', '2017-10-01 14:12:26', '', 'Expired Contests', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2017-10-01 14:12:26', '2017-10-01 14:12:26', '', 60, 'http://localhost/fct001/2017/10/01/60-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fct001_social_users`
--

CREATE TABLE `fct001_social_users` (
  `ID` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `identifier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fct001_social_users`
--

INSERT INTO `fct001_social_users` (`ID`, `type`, `identifier`) VALUES
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(1, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'fb', '1811190685771104'),
(2, 'config', '1811190685771104'),
(2, 'config', '1811190685771104'),
(2, 'config', '1811190685771104'),
(2, 'config', '1811190685771104'),
(2, 'config', '1811190685771104'),
(2, 'config', '1811190685771104'),
(2, 'config', '1811190685771104'),
(2, 'config', '1811190685771104');

-- --------------------------------------------------------

--
-- Table structure for table `fct001_termmeta`
--

CREATE TABLE `fct001_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fct001_terms`
--

CREATE TABLE `fct001_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_terms`
--

INSERT INTO `fct001_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Services', 'services', 0),
(3, 'Products', 'products', 0),
(4, 'Main Menu', 'main-menu', 0),
(5, 'Footer Menu', 'footer-menu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fct001_term_relationships`
--

CREATE TABLE `fct001_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_term_relationships`
--

INSERT INTO `fct001_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(24, 3, 0),
(57, 4, 0),
(58, 4, 0),
(67, 3, 0),
(70, 2, 0),
(76, 4, 0),
(89, 5, 0),
(90, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fct001_term_taxonomy`
--

CREATE TABLE `fct001_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_term_taxonomy`
--

INSERT INTO `fct001_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'contest_type', 'Contest type in which prizes are services', 0, 1),
(3, 3, 'contest_type', 'Contest type in which prizes are products', 0, 2),
(4, 4, 'nav_menu', '', 0, 3),
(5, 5, 'nav_menu', '', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fct001_usermeta`
--

CREATE TABLE `fct001_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_usermeta`
--

INSERT INTO `fct001_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'fct001_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(11, 1, 'fct001_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '0'),
(15, 1, 'fct001_dashboard_quick_press_last_post_id', '91'),
(16, 1, 'closedpostboxes_dashboard', 'a:4:{i:0;s:19:\"dashboard_right_now\";i:1;s:18:\"dashboard_activity\";i:2;s:21:\"dashboard_quick_press\";i:3;s:17:\"dashboard_primary\";}'),
(17, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(20, 2, 'nickname', 'ctp001spyridonaspapaioannou'),
(21, 2, 'first_name', 'Spyridonas'),
(22, 2, 'last_name', 'Papaioannou'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'comment_shortcuts', 'false'),
(26, 2, 'admin_color', 'fresh'),
(27, 2, 'use_ssl', '0'),
(28, 2, 'show_admin_bar_front', 'true'),
(29, 2, 'fct001_capabilities', 'a:1:{s:6:\"client\";b:1;}'),
(30, 2, 'fct001_user_level', '0'),
(32, 2, 'fb_profile_picture', 'https://graph.facebook.com/1811190685771104/picture?type=large'),
(33, 2, 'fb_user_access_token', 'O:35:\"Facebook\\Authentication\\AccessToken\":2:{s:8:\"\0*\0value\";s:176:\"EAAIvp7L2s60BAGJCql6ZBOv2OqMZBmeHGdmsaBUnlBDQ06DGOaaUtorPyAQNbVcMEstut4vEu09SSp4ZBy6zWvgydivpf8v8JEgyk29vAYNiwW7TZAzp2Sp4yjIDPCCY6fCQ689eDhMT3LkupHEwpbhhXZC3YI8NcvIB8NQJglQZDZD\";s:12:\"\0*\0expiresAt\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2017-11-30 15:36:53.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Athens\";}}'),
(34, 2, 'closedpostboxes_dashboard', 'a:2:{i:0;s:18:\"dashboard_activity\";i:1;s:17:\"dashboard_primary\";}'),
(35, 2, 'metaboxhidden_dashboard', 'a:0:{}'),
(38, 2, 'fct001_dashboard_quick_press_last_post_id', '12'),
(58, 1, 'closedpostboxes_fct_contest', 'a:0:{}'),
(59, 1, 'metaboxhidden_fct_contest', 'a:3:{i:0;s:23:\"acf-group_580b9d1febb35\";i:1;s:7:\"slugdiv\";i:2;s:10:\"members-cp\";}'),
(60, 1, 'fct001_user-settings', 'libraryContent=browse&hidetb=1&editor=html'),
(61, 1, 'fct001_user-settings-time', '1500226663'),
(75, 1, 'fb_user_access_token', 'EAAIvp7L2s60BAKwhDg3qorBdeTfo9q6NkMzKkCD100VvjrPl1oUBfsS8y22Dgjhf5Y3OjIBBcXxg6ZAXc3RWAXZBNXocQnlrXvGtJqLWwwbDbkeLAq5MVDWmGizr3lZCbomlH4eeEyUYBhW3XPzfax9s8rBmgZCc3DLaTgVGCgZDZD'),
(76, 1, 'closedpostboxes_page', 'a:2:{i:0;s:12:\"revisionsdiv\";i:1;s:10:\"members-cp\";}'),
(77, 1, 'metaboxhidden_page', 'a:8:{i:0;s:23:\"acf-group_580b9d1febb35\";i:1;s:23:\"acf-group_58dfd62457220\";i:2;s:23:\"acf-group_58dd803e04056\";i:3;s:23:\"acf-group_58dfd36d81885\";i:4;s:10:\"postcustom\";i:5;s:16:\"commentstatusdiv\";i:6;s:7:\"slugdiv\";i:7;s:9:\"authordiv\";}'),
(78, 1, 'acf_user_settings', 'a:0:{}'),
(79, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(80, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:25:\"add-post-type-fct_contest\";i:1;s:12:\"add-post_tag\";i:2;s:16:\"add-contest_type\";}'),
(87, 2, 'fct001_user-settings', 'libraryContent=browse'),
(88, 2, 'fct001_user-settings-time', '1492876229'),
(91, 4, 'nickname', 'max'),
(92, 4, 'first_name', ''),
(93, 4, 'last_name', ''),
(94, 4, 'description', ''),
(95, 4, 'rich_editing', 'true'),
(96, 4, 'comment_shortcuts', 'false'),
(97, 4, 'admin_color', 'fresh'),
(98, 4, 'use_ssl', '0'),
(99, 4, 'show_admin_bar_front', 'true'),
(100, 4, 'fct001_capabilities', 'a:1:{s:6:\"client\";b:1;}'),
(101, 4, 'fct001_user_level', '0'),
(102, 4, 'default_password_nag', ''),
(104, 5, 'nickname', 'andrew'),
(105, 5, 'first_name', ''),
(106, 5, 'last_name', ''),
(107, 5, 'description', ''),
(108, 5, 'rich_editing', 'true'),
(109, 5, 'comment_shortcuts', 'false'),
(110, 5, 'admin_color', 'fresh'),
(111, 5, 'use_ssl', '0'),
(112, 5, 'show_admin_bar_front', 'true'),
(113, 5, 'fct001_capabilities', 'a:1:{s:6:\"client\";b:1;}'),
(114, 5, 'fct001_user_level', '0'),
(115, 5, 'dismissed_wp_pointers', ''),
(118, 4, 'fct001_user-settings', 'libraryContent=browse'),
(119, 4, 'fct001_user-settings-time', '1492877166'),
(122, 1, 'nav_menu_recently_edited', '4'),
(126, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:38:\"dashboard_right_now,dashboard_activity\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
(130, 5, 'session_tokens', 'a:1:{s:64:\"1c59a93ba82b9eb7d0fe72a0f98aaf5fef4efea6b9a15cc2d55bfb459015b6d6\";a:4:{s:10:\"expiration\";i:1499195798;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36\";s:5:\"login\";i:1499022998;}}'),
(137, 2, 'session_tokens', 'a:1:{s:64:\"7add4e67fce0795f394c73fdef1e0dbb4710f24827d523fea41ecd38e7c1ee35\";a:4:{s:10:\"expiration\";i:1507569862;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3222.0 Safari/537.36\";s:5:\"login\";i:1506360262;}}'),
(139, 1, 'session_tokens', 'a:1:{s:64:\"3f75f4490a22b37aa93c2c151c2591b71412756f31af21fd464f02635bf9e948\";a:4:{s:10:\"expiration\";i:1507039911;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:119:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3229.0 Safari/537.36\";s:5:\"login\";i:1506867111;}}');

-- --------------------------------------------------------

--
-- Table structure for table `fct001_users`
--

CREATE TABLE `fct001_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fct001_users`
--

INSERT INTO `fct001_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BuMvMD5JKbY8anUqasaymc5/JXpi3M/', 'admin', 'SDPapaioannou@gmail.com', '', '2016-10-02 16:25:49', '', 0, 'admin'),
(2, 'ctp001spyridonaspapaioannou', '$P$BDKhw0ZgahNdU/MMJHvI7FnEhv8ghi.', 'ctp001spyridonaspapaioannou', 's.d.papaioannou@outlook.com', '', '2016-10-23 18:13:27', '1477246408:$P$BCWUgmLSMNYDkYqiH8O7qucgEU6V3U0', 0, 'Spyridonas Papaioannou'),
(4, 'max', '$P$BGqpziRxBmHGThlkh1lSv82LddIhDh.', 'max', 'ss32@mailintor.com', '', '2017-04-22 15:53:33', '1492876414:$P$BV/TyAYwugNkO/jNynVflAJdx9.Ywf1', 0, 'max'),
(5, 'andrew', '$P$BuMvMD5JKbY8anUqasaymc5/JXpi3M/', 'andrew', 'ss32@mailinator.com', '', '2017-04-22 15:58:53', '', 0, 'andrew');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fct001_commentmeta`
--
ALTER TABLE `fct001_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `fct001_comments`
--
ALTER TABLE `fct001_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `fct001_links`
--
ALTER TABLE `fct001_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `fct001_options`
--
ALTER TABLE `fct001_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `fct001_postmeta`
--
ALTER TABLE `fct001_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `fct001_posts`
--
ALTER TABLE `fct001_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `fct001_social_users`
--
ALTER TABLE `fct001_social_users`
  ADD KEY `ID` (`ID`,`type`);

--
-- Indexes for table `fct001_termmeta`
--
ALTER TABLE `fct001_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `fct001_terms`
--
ALTER TABLE `fct001_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `fct001_term_relationships`
--
ALTER TABLE `fct001_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `fct001_term_taxonomy`
--
ALTER TABLE `fct001_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `fct001_usermeta`
--
ALTER TABLE `fct001_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `fct001_users`
--
ALTER TABLE `fct001_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fct001_commentmeta`
--
ALTER TABLE `fct001_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fct001_comments`
--
ALTER TABLE `fct001_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fct001_links`
--
ALTER TABLE `fct001_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fct001_options`
--
ALTER TABLE `fct001_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1188;
--
-- AUTO_INCREMENT for table `fct001_postmeta`
--
ALTER TABLE `fct001_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;
--
-- AUTO_INCREMENT for table `fct001_posts`
--
ALTER TABLE `fct001_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `fct001_termmeta`
--
ALTER TABLE `fct001_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fct001_terms`
--
ALTER TABLE `fct001_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fct001_term_taxonomy`
--
ALTER TABLE `fct001_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fct001_usermeta`
--
ALTER TABLE `fct001_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `fct001_users`
--
ALTER TABLE `fct001_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
