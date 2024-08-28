-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-08-08 05:35:53
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE USER 'django_db'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('MlJ4Qy4v/KEk9!0i');
GRANT USAGE ON *.* TO 'django_db'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
CREATE DATABASE IF NOT EXISTS `django_db`;
GRANT ALL PRIVILEGES ON `django\_db`.* TO 'django_db'@'localhost';
GRANT ALL PRIVILEGES ON `django\_db\_%`.* TO 'django_db'@'localhost';

CREATE USER 'django_db'@'127.0.0.1' IDENTIFIED VIA mysql_native_password USING PASSWORD('MlJ4Qy4v/KEk9!0i');
GRANT USAGE ON *.* TO 'django_db'@'127.0.0.1' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON `django\_db\_%`.* TO 'django_db'@'127.0.0.1';

use `django_db`; 


--
-- 資料庫： `django_db`
--

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add post', 7, 'add_post'),
(26, 'Can change post', 7, 'change_post'),
(27, 'Can delete post', 7, 'delete_post'),
(28, 'Can view post', 7, 'view_post');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$i99oOMoLub2llYgg4CnG0h$wpqXWje+jdKZX6gkaXqP+PdRdEV7GyA2u+KQ3ojEs8U=', '2024-08-08 03:23:58.431327', 1, 'admin', '', '', 'badc01dwz@gmail.com', 1, 1, '2024-07-12 07:03:08.390000');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `blog_post_post`
--

CREATE TABLE `blog_post_post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `pub_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `blog_post_post`
--

INSERT INTO `blog_post_post` (`id`, `title`, `slug`, `content`, `pub_date`) VALUES
(1, '第一筆資料', 'Aa123456', '常逛此板受益良多，上次孝親去京都得到了很好的建議也一切順利。九月要首次踏入九州\r\n了，前言碎碎念偏長，請大家不吝指教。\r\n\r\n喜愛慢慢晃咖啡逛街美食，原訂7天都待在福岡（住宿已訂）、但後續想想還是安排2-3天\r\n出去Daytrip走走觀光行程，初次到來，想去熊本&由布院\r\n\r\nA. 由布院：對溫泉街沒興趣，加上沒訂到想住的飯店，只想安排一日來回、因COMICO美\r\n術館是此行很想去的點。\r\nB. 熊本：主要想去熊本城&熊本熊商店\r\n\r\n以上，原訂使用3 Day JR PASS，熊本新幹線時間上當日來回應該沒問題，但其實對於火\r\n車時刻、搶票、換票等非常焦慮，由布院之森很難安排，福岡來回其實班次也很少，乘車\r\n時間又長，整日時間被卡很死。\r\n\r\n綜合以上糾結很久，突然有天才想到何不租車2天呢，（本身不是鐵道迷沒有一定要坐由\r\n布院之森）時間上彈性，又可以多去原本沒考慮的景點如別府、大分、或阿蘇等等隨意晃\r\n晃，查了駕車時間似乎沒太很久（平常就會一日來回台北台中觀光）、花費上初估也沒有\r\n比三人的JPpass貴。於是有了以下行程 請大家看看。\r\n\r\n１． 出遊日期： 9/18-9/24 7天6夜\r\n\r\n２． 每日行程：\r\n3位阿宅文青、6晚都住福岡市區\r\n\r\n\r\nDay 1 下午抵達-咖啡+麵包-博多車站-櫛田神社、附近晃晃\r\nDay 2 六本松-大濠公園-美術館-咖啡-天神逛街\r\nDay 3 自駕 福岡-熊本城+阿蘇-福岡\r\nDay 4 自駕 福岡-由布院-（別府隨意）-福岡 還車\r\nDay 5 太宰府or南藏院-回福岡藥院或逛街\r\nDay 6 福岡補其他景點思考中\r\nDay 7 返台\r\n\r\n\r\n３． 特別希望：\r\n\r\n目前比較糾結的是\r\n1. 幾乎查不到有人分享自駕福岡當日來回，不知道是否有哪裡想的不夠周全？還是太簡\r\n單不需要分享哈\r\n2. 另外我查兩天來回4趟車程，跟福岡-熊本-由布院-福岡順著玩、其實只差一趟路，就\r\n不想特地換飯店了。\r\n3. 熊本城+熊本商店+阿蘇周邊當日來回，行程是不是會太滿（喜歡悠閒玩但歷史與自然\r\n都習慣走馬看花應該不會太久）\r\n4. 如果以上可行，會建議同一日阿蘇跟熊本市區哪個行程先呢\r\n\r\n謝謝大家\r\n\r\n\r\n\r\n\r\n\r\n--\r\n※ 發信站: 批踢踢實業坊(ptt.cc), 來自: 123.193.236.170 (臺灣)\r\n※ 文章網址: https://www.ptt.cc/bbs/Japan_Travel/M.1720708052.A.C5A.html\r\n推 dieshichun  : 因為新幹線熊本博多來回45min 開車要將近2Hr 07/11 23:18\r\n→ dieshichun  : 所以很少有當天來回的 因為都自駕了 行李帶著跑 換 07/11 23:19\r\n→ dieshichun  : 宿沒困擾 07/11 23:19\r\n推 dieshichun  : 福岡來回熊本阿蘇一日理論上可行 可是開車的人很累 07/11 23:23\r\n→ dieshichun  :  都自駕了就直接住熊本吧 住宿費還比較便宜 07/11 23:23\r\n推 dieshichun  : 你想去由布院的話也不一定要由布院之森 可以坐由布 07/11 23:27\r\n→ dieshichun  : 號 坐高速巴士 坐音速號到別府轉龜之井巴士 07/11 23:27\r\n→ dieshichun  : 還是建議你自駕了就不要當天來回了 那是有行李因素 07/11 23:29\r\n→ dieshichun  : 跟有新幹線才可以這樣安排 換宿直接少一半交通時間 07/11 23:29\r\n推 dieshichun  : 然後D3住阿蘇的話，其實省不少時間，阿蘇回福岡2HR 07/11 23:45\r\n→ dieshichun  : ，阿蘇去由布院還是比福岡由布院快一點，中間還可 07/11 23:45\r\n→ dieshichun  : 以排個長者原之類的 07/11 23:45\r\n推 Elaine0530  : 如果沒有一定要去阿蘇 其實搭JR 就可以了 由布院不 07/11 23:58\r\n→ Elaine0530  : 一定要搭由布院之森，可以搭由布，而且由布院那邊商 07/11 23:58\r\n→ Elaine0530  : 店關的滿早的，當天搭JR從福岡往返沒什麼問題 07/11 23:58\r\n→ szuju       : 自己會選jrpass雖然比較貴但是體驗無價 07/11 23:59\r\n推 moonlitwind : 我也是為了體驗新舊由布院之森，去程搭10:11回程搭1 07/12 00:11\r\n→ moonlitwind : 7:11,我一到就先搭計程車去金鱗湖，印象中800日幣, 07/12 00:11\r\n→ moonlitwind : 一到就先繞湖拍拍照，在那附近用餐。用完餐再慢慢走 07/12 00:11\r\n→ moonlitwind : 回車站。時間其實很夠，回程訂了火車便當，在車上吃 07/12 00:11\r\n→ moonlitwind : 東西節省吃晚餐的時間，順便體驗日本的火車便當，7 07/12 00:11\r\n→ moonlitwind : 點半到博多車站就不用再去吃飯，可以採買伴手禮或逛 07/12 00:11\r\n→ moonlitwind : 街什麼的。車票我覺得也不會太難訂，除非你一定要坐 07/12 00:11\r\n→ moonlitwind : 哪個位置，可能才會覺得難訂，給你參考。 07/12 00:11\r\n推 angele      : 其實沒這麼難訂+1，可以訂不到再租車呀。 07/12 00:24\r\n推 chienshu    : Kkday klook 現在有買一送一的一日遊哦！ 07/12 06:14\r\n推 lumy0721    : 前幾天剛訂完（由布院之森週日的），沒那麼難訂+1， 07/12 07:55\r\n→ lumy0721    : 除了要車頭第一排或其他特定座位外，基本上10點準 07/12 07:55\r\n→ lumy0721    : 時進去慢慢選都能選到不錯的位子，甚至到中午12點 07/12 07:55\r\n→ lumy0721    : 都還有位子，所以其實不用太擔心 07/12 07:55\r\n推 CSECRET     : moon大的分享感覺很棒耶 最近也在規劃中 07/12 10:23\r\n→ phoebe9729  : 自駕還每天回福岡住？還去熊本回？ 07/12 12:51\r\n推 maclaywu    : 當天來回4小時，蠻浪費時間的，熊本住宿也很方便 07/12 14:43\r\n→ maclaywu    : 我當初是先去柳川再去熊本住，單日3小時車程 07/12 14:44\r\n→ maclaywu    : 我覺得拉到4小時車程，大家都會蠻辛苦的XD 07/12 14:45\r\n→ maclaywu    : 而且阿蘇跟由布院都值得各待一天(市區我反而還好) 07/12 14:46\r\n推文自動更新已關閉', '2024-07-12 07:18:36.359000'),
(2, '第二筆資料', 's12121111', '多年前我很肯定錄影絕對首選蘋果\r\n\r\ns23u之後也不錯\r\n\r\n但是最近兩年陸機的影像旗艦也進步很大，雖然在防抖錄影方面，還是不如s24u 蘋果15pro\r\n\r\n但是有沒有至少贏過兩年前的蘋果\r\niPhone 13pro呢\r\n\r\n這邊以任何光線拍影片的影片流暢防抖，清晰，調教等等\r\n\r\n謝謝\r\n\r\n補充jptt無法傳影片，所以無法比較\r\n\r\n\r\n\r\n-----\r\nSent from JPTT on my Vivo V2130.\r\n\r\n--\r\n※ 發信站: 批踢踢實業坊(ptt.cc), 來自: 220.137.131.140 (臺灣)\r\n※ 文章網址: https://www.ptt.cc/bbs/MobileComm/M.1720747753.A.075.html\r\n推 sal60614    : 不太可能，蘋果的科技領先大概就跟鋼彈00天上人對其 07/12 09:31\r\n→ sal60614    : 他聯邦那樣，有著根本上的不同 07/12 09:31\r\n推 ssshleo     : 0  目前應該沒有手機贏過iphone的錄影 07/12 09:34\r\n→ ssshleo     : 就算是兩年前的蘋果旗艦也是 07/12 09:34\r\n→ stepnight   : 蘋果錄影是猛在哪？ 07/12 09:40\r\n→ qss05       : 穩定性吧，就算是VIVO測試影片有時候還是會一直變 07/12 09:42\r\n→ qss05       : 色溫，防抖那些都有追上了 07/12 09:42\r\n推 z83420123   : 錄影沒有 07/12 09:46\r\n→ parislove3  : 沒有 iPhone錄影還是獨孤求敗 你多看一些YT中國機 07/12 09:46\r\n→ parislove3  : 測試就知道 07/12 09:47\r\n推 willson1211 : 拍照可以屌虐，但錄影整體穩定性還是唉鳳強 07/12 10:03\r\n推 Ereinion9895: 穩定性應該沒有，iphone在不同場景皆能維持表現， 07/12 10:16\r\n→ Ereinion9895: 陸機比較容易出現某些場景水準落差大的情況 07/12 10:16\r\n→ Atg6086     : 可能沒有，YT跟對岸的B站，蠻多評測都沒有追上蘋果 07/12 10:21\r\n→ wed1979     : 影像還需要練練，拍照已經卷到頭了，拍景由極遠到極 07/12 10:30\r\n→ wed1979     : 近，拍人由膚色到髮絲，所以下一步要卷光影了 07/12 10:30\r\n推 Aerogel     : 沒有，蘋果好處是在錄影色溫過渡調校還有焦段轉換 07/12 10:33\r\n→ Aerogel     : 穩定 07/12 10:33\r\n→ wed1979     : 現在影像頂多玩玩什麼水下攝影，或縮時，要能運鏡或 07/12 10:34\r\n→ wed1979     : 流暢轉焦還是要果，但是iphone鬼影目前無解 07/12 10:34\r\n→ wed1979     : iphone夜景鬼影炫光其實滿吃虧的 07/12 10:36\r\n推 rickey1270  : 因為只有蘋果是用高速CMOS 07/12 10:39\r\n→ oopsskimo   : 色溫跟平衡 其他排的亂跳 07/12 10:40\r\n→ oopsskimo   : 牌 07/12 10:41\r\n→ orange21    : testv很常測  移動的縮時，目前好像真的只有蘋果可 07/12 10:42\r\n→ orange21    : 以 07/12 10:42\r\n推 josephchen08: 拍照 錄影都沒有 07/12 10:47\r\n推 long9487    : 你去看中國評測都把iPhone錄影排第一 07/12 10:57\r\n→ long9487    : 就知道目前還追不上 07/12 10:57\r\n推 FentiC      : iPhone拍照不是最強，但錄影沒有短板 07/12 11:05\r\n推 xx890197    : iPhone拍照不怎麼樣，但錄影很頂沒人反駁 07/12 11:24\r\n推 Alllllogo   : 錄影還是蘋果 07/12 11:26\r\n→ d89413208   : sony pro-i 我覺得可以比看看..讓我驚豔的錄影 07/12 11:27\r\n推 biaw        : 中國機的路線一向是堆料和製造噱頭 如果有一天錄影 07/12 11:29\r\n→ biaw        : 能力稍微接近了一定會大肆宣傳還有買公關公司洗到 07/12 11:29\r\n→ biaw        : 每篇文章都無腦推薦的 07/12 11:29\r\n→ biaw        : sony也有高速讀取的cmos技術 所以規格也有亮眼的部 07/12 11:30\r\n→ biaw        : 分 07/12 11:30\r\n推 APC         : 主鏡頭有機會，全鏡頭還早 07/12 11:36\r\n推 Lukerr      : 常錄影選iPhone不用懷疑，安卓到現在沒有一台錄影 07/12 11:39\r\n→ Lukerr      : 穩定性能追上iPhone 07/12 11:39\r\n推 xoy         : iOS版這幾天有篇討論錄影直播的可以看一下，各有長 07/12 11:49\r\n→ xoy         : 處 07/12 11:49\r\n推 bh0527      : iphone強是他的生態圈，沒有人會因為錄影強特別區 07/12 12:00\r\n→ bh0527      : 買iphone 07/12 12:00\r\n推 Xperia      : iphone13有時候色溫也會亂跳且鬼影嚴重，好處是不 07/12 12:01\r\n→ Xperia      : 太會掉幀卡頓、動態範圍高 07/12 12:01\r\n推 zwk0606     : 目前沒有，蘋果除了鬼影剩下都碾壓 07/12 12:19\r\n推 cross4678   : 現在設定可以鎖定白平衡，色溫亂跳的情況改善不少 07/12 12:20\r\n推 Xperia      : 要用finalcut camera 07/12 12:23\r\n→ Xperia      : 某些中國機(如vivo)還有個毛病，換鏡頭時會有些微 07/12 12:27\r\n→ Xperia      : 聲音，會被錄進去 07/12 12:27\r\n噓 midone740903: 蘋果贏在過熱 07/12 12:29\r\n推 ctes940008  : 0 07/12 12:47\r\n推 dabiddabid  : 蘋果贏，但也慢慢被追上，跟拍照一樣被超車是早晚的 07/12 12:51\r\n→ dabiddabid  : 事 07/12 12:51\r\n推 issemn      : 為什麼那麼多年了還沒一家安卓追得上，真的很奇怪 07/12 12:55\r\n→ issemn      : ，照相可以為什麼錄影就不行？ 07/12 12:55\r\n推 Ryoma       : 拍照用軟體/AI輔助，現階段錄影還是吃硬體實力吧 07/12 12:57\r\n推 szdxc17     : 幾年前也說攝影被追上是早晚的事 07/12 13:03\r\n→ szdxc17     : 然後幾年就過去了 07/12 13:03\r\n→ battlewind  : 現在陸機錄影有拉近了 不過其實iphone拍照也不斷在 07/12 13:12\r\n→ battlewind  : 強化中 07/12 13:12\r\n→ saimeitetsu : 有贏的部分應該是夜晚3X望遠，中國旗艦機會拿真實 07/12 13:32\r\n→ saimeitetsu : 望遠來拍，iphone就裁切比較會糊 07/12 13:32\r\n→ kissa0924307: 算法還是差一截 07/12 13:33\r\n推 s800525     : 蘋果拍照以前不是一路被屌打，從11還12才追上T1嗎？ 07/12 13:35\r\n推 p40403      : 蘋果之所以這麼強是因為用高速CMOS ,目前大底都不能 07/12 14:07\r\n→ p40403      : 用，加上蘋果那個鏡頭排列可以減少切換的延遲，頻寬 07/12 14:07\r\n→ p40403      : 看錄影的碼率就知道，三星有一個高位元率模式這個開 07/12 14:08\r\n→ p40403      : 了可以破百，號稱滅霸的影像旗艦最高才32M.... 07/12 14:08\r\n→ p40403      : 穩定性三星已經追上了，但是電影模式還是輸 07/12 14:08\r\n→ square4     : 高速或大底cmos跟本是偽命題，有的安卓機用更好的l 07/12 14:09\r\n→ square4     : yt-808、900，不還是沒解決問題，主要還是soc的影 07/12 14:09\r\n→ square4     : 片編解碼能力、旗艦相機模組的散熱設計不太行 07/12 14:09\r\n→ EPIRB406    : 中國牌錄影先贏三星再挑戰iPhone比較實在 07/12 14:12\r\n→ battlewind  : 大底是解決畫質 但不論錄影還是拍照都有畫質外的東 07/12 14:15\r\n→ battlewind  : 西要解決 07/12 14:15\r\n→ battlewind  : 譬如防手震反而是小底比較有優勢 07/12 14:17\r\n推 YoungleisaDo: 還差很遠 不然那些自媒體早就大吹特吹 07/12 14:35\r\n推 ihl123456   : iPhone錄影可以直出恐怖片 07/12 14:50\r\n推文自動更新已關閉', '2024-07-12 07:19:53.246000'),
(3, '網頁', 'D12111121211', '概述\r\n哲學\r\nMarkdown 的目標是實現「易讀易寫」。\r\n\r\n不過最需要強調的便是它的可讀性。一份使用 Markdown 格式撰寫的文件應該可以直接以純文字發佈，並且看起來不會像是由許多標籤或是格式指令所構成。Markdown 語法受到一些既有 text-to-HTML 格式的影響，包括Setext、atx、Textile、reStructuredText、Grutatext 和 EtText，然而最大靈感來源其實是純文字的電子郵件格式。\r\n\r\n因此 Markdown 的語法全由標點符號所組成，並經過嚴謹慎選，是為了讓它們看起來就像所要表達的意思。像是在文字兩旁加上星號，看起來就像*強調*。Markdown 的清單看起來，嗯，就是清單。假如你有使用過電子郵件，區塊引言看起來就真的像是引用一段文字。\r\n\r\n行內HTML\r\nMarkdown 的語法有個主要的目的：用來作為一種網路內容的寫作用語言。\r\n\r\nMarkdown 不是要來取代 HTML，甚至也沒有要和它相似，它的語法種類不多，只和 HTML 的一部分有關係，重點不是要創造一種更容易寫作 HTML 文件的語法，我認為 HTML 已經很容易寫了，Markdown 的重點在於，它能讓文件更容易閱讀、編寫。HTML 是一種發佈的格式，Markdown 是一種編寫的格式，因此，Markdown 的格式語法只涵蓋純文字可以涵蓋的範圍。\r\n\r\n不在 Markdown 涵蓋範圍之外的標籤，都可以直接在文件裡面用 HTML 撰寫。不需要額外標註這是 HTML 或是 Markdown；只要直接加標籤就可以了。\r\n\r\n只有區塊元素 ── 比如<div>、<table>、<pre>、<p>等標籤，必需在前後加上空行，以利與內容區隔。而且這些（元素）的開始與結尾標籤，不可以用 tab 或是空白來縮排。Markdown 的產生器有智慧型判斷，可以避免在區塊標籤前後加上沒有必要的<p>標籤。\r\n\r\n舉例來說，在 Markdown 文件裡加上一段 HTML 表格：\r\n\r\nThis is a regular paragraph.\r\n\r\n<table>\r\n    <tr>\r\n        <td>Foo</td>\r\n    </tr>\r\n</table>\r\n\r\nThis is another regular paragraph.\r\n請注意，Markdown 語法在 HTML 區塊標籤中將不會被進行處理。例如，你無法在 HTML 區塊內使用 Markdown 形式的*強調*。\r\n\r\nHTML 的區段標籤如<span>、<cite>、<del>則不受限制，可以在 Markdown 的段落、清單或是標題裡任意使用。依照個人習慣，甚至可以不用 Markdown 格式，而採用 HTML 標籤來格式化。舉例說明：如果比較喜歡 HTML 的 <a>或<img>標籤，可以直接使用這些標籤，而不用 Markdown 提供的連結或是影像標示語法。\r\n\r\nHTML 區段標籤和區塊標籤不同，在區段標籤的範圍內，Markdown 的語法是有效的。\r\n\r\n特殊字元自動轉換\r\n在 HTML 文件中，有兩個字元需要特殊處理：<和&。<符號用於起始標籤&符號則用於標記 HTML 實體，如果你只是想要使用這些符號，你必須要使用實體的形式，像是&lt;和&amp;。\r\n\r\n& 符號其實很容易讓寫作網路文件的人感到困擾，如果你要打「AT&T」，你必須要寫成「AT&amp;T」，還得轉換網址內的 & 符號，如果你要連結到：\r\n\r\nhttp://images.google.com/images?num=30&q=larry+bird\r\n你必須要把網址轉成：\r\n\r\nhttp://images.google.com/images?num=30&amp;q=larry+bird\r\n才能放到連結標籤的href屬性裡。不用說也知道這很容易忘記，這也可能是 HTML 標準檢查所檢查到的錯誤中，數量最多的。\r\n\r\nMarkdown 允許你直接使用這些符號，但是你要小心跳脫字元的使用，如果你是在 HTML 實體中使用&符號的話，它不會被轉換，而在其他情形下，它則會被轉換成&amp;。所以你如果要在文件中插入一個著作權的符號，你可以這樣寫：\r\n\r\n&copy;\r\nMarkdown 將不會對這段文字做修改，但是如果你這樣寫：\r\n\r\nAT&T\r\nMarkdown 就會將它轉為：\r\n\r\nAT&amp;T\r\n類似的狀況也會發生在<符號上，因為 Markdown 支援行內 HTML，如果你是使用<符號作為 HTML 標籤使用，那 Markdown 也不會對它做任何轉換，但是如果你是寫：\r\n\r\n4 < 5\r\nMarkdown 將會把它轉換為：\r\n\r\n4 &lt; 5\r\n不過需要注意的是，code 範圍內，不論是行內還是區塊，<和&兩個符號都一定會被轉換成 HTML 實體，這項特性讓你可以很容易地用 Markdown 寫 HTML code（和 HTML 相對而言。在 HTML 語法中，你要把所有的<和&都轉換為 HTML 實體，才能在 HTML 文件裡面寫出 HTML code。）\r\n\r\n區塊元素\r\n段落和換行\r\n一個段落是由一個以上相連接的行句組成，而一個以上的空行則會切分出不同的段落（空行的定義是顯示上看起來像是空行，便會被視為空行。比方說，若某一行只包含空白和 tab，則該行也會被視為空行），一般的段落不需要用空白或斷行縮排。\r\n\r\n「一個以上相連接的行句組成」這句話其實暗示了 Markdown 允許段落內的強迫斷行，這個特性和其他大部分的 text-to-HTML 格式不一樣（包括 MovableType 的「Convert Line Breaks」選項），其他的格式會把每個斷行都轉成<br />標籤。\r\n\r\n如果你真的想要插入<br />標籤的話，在行尾加上兩個以上的空白，然後按 enter。\r\n\r\n是的，這確實需要花比較多功夫來插入<br />，但是「每個換行都轉換為<br />」的方法在 Markdown 中並不適合， Markdown 中 email 式的區塊引言和多段落的清單在使用換行來排版的時候，不但更好用，還更好閱讀。\r\n\r\n標題\r\nMarkdown 支援兩種標題的語法，Setext和atx形式。\r\n\r\nSetext 形式是用底線的形式，利用=（最高階標題）和-（第二階標題），例如：\r\n\r\nThis is an H1\r\n=============\r\n\r\nThis is an H2\r\n-------------\r\n任何數量的=和-都可以有效果。\r\n\r\nAtx 形式則是在行首插入 1 到 6 個#，各對應到標題 1 到 6 階，例如：\r\n\r\n# This is an H1\r\n\r\n## This is an H2\r\n\r\n###### This is an H6\r\n你可以選擇性地「關閉」atx 樣式的標題，這純粹只是美觀用的，若是覺得這樣看起來比較舒適，你就可以在行尾加上#，而行尾的#數量也不用和開頭一樣（行首的井字數量決定標題的階數）：\r\n\r\n# This is an H1 #\r\n\r\n## This is an H2 ##\r\n\r\n### This is an H3 ######\r\n區塊引言\r\nMarkdown 使用 email 形式的區塊引言，如果你很熟悉如何在 email 信件中引言，你就知道怎麼在 Markdown 文件中建立一個區塊引言，那會看起來像是你強迫斷行，然後在每行的最前面加上>：\r\n\r\n> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,\r\n> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.\r\n> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.\r\n>\r\n> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse\r\n> id sem consectetuer libero luctus adipiscing.\r\nMarkdown 也允許你只在整個段落的第一行最前面加上>：\r\n\r\n> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,\r\nconsectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.\r\nVestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.\r\n\r\n> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse\r\nid sem consectetuer libero luctus adipiscing.\r\n區塊引言可以有階層（例如：引言內的引言），只要根據層數加上不同數量的>：\r\n\r\n> This is the first level of quoting.\r\n>\r\n> > This is nested blockquote.\r\n>\r\n> Back to the first level.\r\n引言的區塊內也可以使用其他的 Markdown 語法，包括標題、清單、程式碼區塊等：\r\n\r\n> ## This is a header.\r\n>\r\n> 1.   This is the first list item.\r\n> 2.   This is the second list item.\r\n>\r\n> Here\'s some example code:\r\n>\r\n>     return shell_exec(\"echo $input | $markdown_script\");\r\n任何標準的文字編輯器都能簡單地建立 email 樣式的引言，例如 BBEdit，你可以選取文字後然後從選單中選擇增加引言階層。\r\n\r\n清單\r\nMarkdown 支援有序清單和無序清單。\r\n\r\n無序清單使用星號、加號或是減號作為清單標記：\r\n\r\n*   Red\r\n*   Green\r\n*   Blue\r\n等同於：\r\n\r\n+   Red\r\n+   Green\r\n+   Blue\r\n也等同於：\r\n\r\n-   Red\r\n-   Green\r\n-   Blue\r\n有序清單則使用數字接著一個英文句點：\r\n\r\n1.  Bird\r\n2.  McHale\r\n3.  Parish\r\n很重要的一點是，你在清單標記上使用的數字並不會影響輸出的 HTML 結果，上面的清單所產生的 HTML 標記為：\r\n\r\n<ol>\r\n<li>Bird</li>\r\n<li>McHale</li>\r\n<li>Parish</li>\r\n</ol>\r\n如果你的清單標記寫成：\r\n\r\n1.  Bird\r\n1.  McHale\r\n1.  Parish\r\n或甚至是：\r\n\r\n3. Bird\r\n1. McHale\r\n8. Parish\r\n你都會得到完全相同的 HTML 輸出。重點在於，你可以讓 Markdown 文件的清單數字和輸出的結果相同，或是你懶一點，你可以完全不用在意數字的正確性。\r\n\r\n如果你使用懶惰的寫法，建議第一個項目最好還是從「1.」開始，因為 Markdown 未來可能會支援有序清單的 start 屬性。\r\n\r\n清單項目標記通常是放在最左邊，但是其實也可以縮排，最多三個空白，項目標記後面則一定要接著至少一個空白或 tab。\r\n\r\n要讓清單看起來更漂亮，你可以把內容用固定的縮排整理好：\r\n\r\n*   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\r\n    Aliquam hendrerit mi posuere lectus. Vestibulum enim wisi,\r\n    viverra nec, fringilla in, laoreet vitae, risus.\r\n*   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.\r\n    Suspendisse id sem consectetuer libero luctus adipiscing.\r\n但是如果你很懶，那也不一定需要：\r\n\r\n*   Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\r\nAliquam hendrerit mi posuere lectus. Vestibulum enim wisi,\r\nviverra nec, fringilla in, laoreet vitae, risus.\r\n*   Donec sit amet nisl. Aliquam semper ipsum sit amet velit.\r\nSuspendisse id sem consectetuer libero luctus adipiscing.\r\n如果清單項目間用空行分開， Markdown 會把項目的內容在輸出時用<p>標籤包起來，舉例來說：\r\n\r\n*   Bird\r\n*   Magic\r\n會被轉換為：\r\n\r\n<ul>\r\n<li>Bird</li>\r\n<li>Magic</li>\r\n</ul>\r\n但是這個：\r\n\r\n*   Bird\r\n\r\n*   Magic\r\n會被轉換為：\r\n\r\n<ul>\r\n<li><p>Bird</p></li>\r\n<li><p>Magic</p></li>\r\n</ul>\r\n清單項目可以包含多個段落，每個項目下的段落都必須縮排 4 個空白或是一個 tab：\r\n\r\n1.  This is a list item with two paragraphs. Lorem ipsum dolor\r\n    sit amet, consectetuer adipiscing elit. Aliquam hendrerit\r\n    mi posuere lectus.\r\n\r\n    Vestibulum enim wisi, viverra nec, fringilla in, laoreet\r\n    vitae, risus. Donec sit amet nisl. Aliquam semper ipsum\r\n    sit amet velit.\r\n\r\n2.  Suspendisse id sem consectetuer libero luctus adipiscing.\r\n如果你每行都有縮排，看起來會看好很多，當然，再次地，如果你很懶惰，Markdown 也允許：\r\n\r\n*   This is a list item with two paragraphs.\r\n\r\n    This is the second paragraph in the list item. You\'re\r\nonly required to indent the first line. Lorem ipsum dolor\r\nsit amet, consectetuer adipiscing elit.\r\n\r\n*   Another item in the same list.\r\n如果要在清單項目內放進引言，那>就需要縮排：\r\n\r\n*   A list item with a blockquote:\r\n\r\n    > This is a blockquote\r\n    > inside a list item.\r\n如果要放程式碼區塊的話，該區塊就需要縮排兩次，也就是 8 個空白或是兩個 tab：\r\n\r\n*   A list item with a code block:\r\n\r\n        <code goes here>\r\n當然，項目清單很可能會不小心產生，像是下面這樣的寫法：\r\n\r\n1986. What a great season.\r\n換句話說，也就是在行首出現數字－句點－空白，要避免這樣的狀況，你可以在句點前面加上反斜線。\r\n\r\n1986\\. What a great season.\r\n程式碼區塊\r\n和程式相關的寫作或是標籤語言原始碼通常會有已經排版好的程式碼區塊，通常這些區塊我們並不希望它以一般段落文件的方式去排版，而是照原來的樣子顯示，Markdown 會用<pre>和<code>標籤來把程式碼區塊包起來。\r\n\r\n要在 Markdown 中建立程式碼區塊很簡單，只要簡單地縮排 4 個空白或是 1 個 tab 就可以，例如，下面的輸入：\r\n\r\nThis is a normal paragraph:\r\n\r\n    This is a code block.\r\nMarkdown 會轉換成：\r\n\r\n<p>This is a normal paragraph:</p>\r\n\r\n<pre><code>This is a code block.\r\n</code></pre>\r\n這個每行一階的縮排（4 個空白或是 1 個 tab），都會被移除，例如：\r\n\r\nHere is an example of AppleScript:\r\n\r\n    tell application \"Foo\"\r\n        beep\r\n    end tell\r\n會被轉換為：\r\n\r\n<p>Here is an example of AppleScript:</p>\r\n\r\n<pre><code>tell application \"Foo\"\r\n    beep\r\nend tell\r\n</code></pre>\r\n一個程式碼區塊會一直持續到沒有縮排的那一行（或是文件結尾）。\r\n\r\n在程式碼區塊裡面，&、<和>會自動轉成 HTML 實體，這樣的方式讓你非常容易使用 Markdown 插入範例用的 HTML 原始碼，只需要複製貼上，再加上縮排就可以了，剩下的 Markdown 都會幫你處理，例如：\r\n\r\n    <div class=\"footer\">\r\n        &copy; 2004 Foo Corporation\r\n    </div>\r\n會被轉換為：\r\n\r\n<pre><code>&lt;div class=\"footer\"&gt;\r\n    &amp;copy; 2004 Foo Corporation\r\n&lt;/div&gt;\r\n</code></pre>\r\n程式碼區塊中，一般的 Markdown 語法不會被轉換，像是星號便只是星號，這表示你可以很容易地以 Markdown 語法撰寫 Markdown 語法相關的文件。\r\n\r\n分隔線\r\n你可以在一行中用三個或以上的星號、減號、底線來建立一個分隔線，行內不能有其他東西。你也可以在星號中間插入空白。下面每種寫法都可以建立分隔線：\r\n\r\n* * *\r\n\r\n***\r\n\r\n*****\r\n\r\n- - -\r\n\r\n---------------------------------------\r\n區段元素\r\n連結\r\nMarkdown 支援兩種形式的連結語法：行內和參考兩種形式。\r\n\r\n不管是哪一種，連結的文字都是用 [方括號] 來標記。\r\n\r\n要建立一個行內形式的連結，只要在方塊括號後面馬上接著括號並插入網址連結即可，如果你還想要加上連結的 title 文字，只要在網址後面，用雙引號把 title 文字包起來即可，例如：\r\n\r\nThis is [an example](http://example.com/ \"Title\") inline link.\r\n\r\n[This link](http://example.net/) has no title attribute.\r\n會產生：\r\n\r\n<p>This is <a href=\"http://example.com/\" title=\"Title\">\r\nan example</a> inline link.</p>\r\n\r\n<p><a href=\"http://example.net/\">This link</a> has no\r\ntitle attribute.</p>\r\n如果你是要連結到同樣主機的資源，你可以使用相對路徑：\r\n\r\nSee my [About](/about/) page for details.\r\n參考形式的連結使用另外一個方括號接在連結文字的括號後面，而在第二個方括號裡面要填入用以辨識連結的標籤：\r\n\r\nThis is [an example][id] reference-style link.\r\n你也可以選擇性地在兩個方括號中間加上空白：\r\n\r\nThis is [an example] [id] reference-style link.\r\n接著，在文件的任意處，你可以把這個標籤的連結內容定義出來：\r\n\r\n[id]: http://example.com/  \"Optional Title Here\"\r\n連結定義的形式為：\r\n\r\n方括號，裡面輸入連結的辨識用標籤\r\n接著一個冒號\r\n接著一個以上的空白或 tab\r\n接著連結的網址\r\n選擇性地接著 title 內容，可以用單引號、雙引號或是括弧包著\r\n下面這三種連結的定義都是相同：\r\n\r\n[foo]: http://example.com/  \"Optional Title Here\"\r\n[foo]: http://example.com/  \'Optional Title Here\'\r\n[foo]: http://example.com/  (Optional Title Here)\r\n請注意：有一個已知的問題是 Markdown.pl 1.0.1 會忽略單引號包起來的連結 title。\r\n\r\n連結網址也可以用角括號包起來：\r\n\r\n[id]: <http://example.com/>  \"Optional Title Here\"\r\n你也可以把 title 屬性放到下一行，也可以加一些縮排，網址太長的話，這樣會比較好看：\r\n\r\n[id]: http://example.com/longish/path/to/resource/here\r\n    \"Optional Title Here\"\r\n網址定義只有在產生連結的時候用到，並不會直接出現在文件之中。\r\n\r\n連結辨識標籤可以有字母、數字、空白和標點符號，但是並不區分大小寫，因此下面兩個連結是一樣的：\r\n\r\n[link text][a]\r\n[link text][A]\r\n預設的連結標籤功能讓你可以省略指定連結標籤，這種情形下，連結標籤和連結文字會視為相同，要用預設連結標籤只要在連結文字後面加上一個空的方括號，如果你要讓”Google”連結到 google.com，你可以簡化成：\r\n\r\n[Google][]\r\n然後定義連結內容：\r\n\r\n[Google]: http://google.com/\r\n由於連結文字可能包含空白，所以這種簡化的標籤內也可以包含多個文字：\r\n\r\nVisit [Daring Fireball][] for more information.\r\n然後接著定義連結： [Daring Fireball]: http://daringfireball.net/\r\n\r\n連結的定義可以放在文件中的任何一個地方，我比較偏好直接放在連結出現段落的後面，你也可以把它放在文件最後面，就像是註解一樣。\r\n\r\n下面是一個參考式連結的範例：\r\n\r\nI get 10 times more traffic from [Google] [1] than from\r\n[Yahoo] [2] or [MSN] [3].\r\n\r\n  [1]: http://google.com/        \"Google\"\r\n  [2]: http://search.yahoo.com/  \"Yahoo Search\"\r\n  [3]: http://search.msn.com/    \"MSN Search\"\r\n如果改成用連結名稱的方式寫：\r\n\r\nI get 10 times more traffic from [Google][] than from\r\n[Yahoo][] or [MSN][].\r\n\r\n  [google]: http://google.com/        \"Google\"\r\n  [yahoo]:  http://search.yahoo.com/  \"Yahoo Search\"\r\n  [msn]:    http://search.msn.com/    \"MSN Search\"\r\n上面兩種寫法都會產生下面的 HTML。\r\n\r\n<p>I get 10 times more traffic from <a href=\"http://google.com/\"\r\ntitle=\"Google\">Google</a> than from\r\n<a href=\"http://search.yahoo.com/\" title=\"Yahoo Search\">Yahoo</a>\r\nor <a href=\"http://search.msn.com/\" title=\"MSN Search\">MSN</a>.</p>\r\n下面是用行內形式寫的同樣一段內容的 Markdown 文件，提供作為比較之用：\r\n\r\nI get 10 times more traffic from [Google](http://google.com/ \"Google\")\r\nthan from [Yahoo](http://search.yahoo.com/ \"Yahoo Search\") or\r\n[MSN](http://search.msn.com/ \"MSN Search\").\r\n參考式的連結其實重點不在於它比較好寫，而是它比較好讀，比較一下上面的範例，使用參考式的文章本身只有 81 個字元，但是用行內形式的連結卻會增加到 176 個字元，如果是用純 HTML 格式來寫，會有 234 個字元，在 HTML 格式中，標籤比文字還要多。\r\n\r\n使用 Markdown 的參考式連結，可以讓文件更像是瀏覽器最後產生的結果，讓你可以把一些標記相關的資訊移到段落文字之外，你就可以增加連結而不讓文章的閱讀感覺被打斷。\r\n\r\n強調\r\nMarkdown 使用星號（*）和底線（_）作為標記強調字詞的符號，被*或_包圍的字詞會被轉成用<em>標籤包圍，用兩個*或_包起來的話，則會被轉成<strong>，例如：\r\n\r\n*single asterisks*\r\n\r\n_single underscores_\r\n\r\n**double asterisks**\r\n\r\n__double underscores__\r\n會轉成：\r\n\r\n<em>single asterisks</em>\r\n\r\n<em>single underscores</em>\r\n\r\n<strong>double asterisks</strong>\r\n\r\n<strong>double underscores</strong>\r\n你可以隨便用你喜歡的樣式，唯一的限制是，你用什麼符號開啟標籤，就要用什麼符號結束。\r\n\r\n強調也可以直接插在文字中間：\r\n\r\nun*frigging*believable\r\n但是如果你的 * 和 _ 兩邊都有空白的話，它們就只會被當成普通的符號。\r\n\r\n如果要在文字前後直接插入普通的星號或底線，你可以用反斜線：\r\n\r\n\\*this text is surrounded by literal asterisks\\*\r\n程式碼\r\n如果要標記一小段行內程式碼，你可以用反引號把它包起來（`），例如：\r\n\r\nUse the `printf()` function.\r\n會產生：\r\n\r\n<p>Use the <code>printf()</code> function.</p>\r\n如果要在程式碼區段內插入反引號，你可以用多個反引號來開啟和結束程式碼區段：\r\n\r\n``There is a literal backtick (`) here.``\r\n這段語法會產生：\r\n\r\n<p><code>There is a literal backtick (`) here.</code></p>\r\n程式碼區段的起始和結束端都可以放入一個空白，起始端後面一個，結束端前面一個，這樣你就可以在區段的一開始就插入反引號：\r\n\r\nA single backtick in a code span: `` ` ``\r\n\r\nA backtick-delimited string in a code span: `` `foo` ``\r\n會產生：\r\n\r\n<p>A single backtick in a code span: <code>`</code></p>\r\n\r\n<p>A backtick-delimited string in a code span: <code>`foo`</code></p>\r\n在程式碼區段內，&和角括號都會被轉成 HTML 實體，這樣會比較容易插入 HTML 原始碼，Markdown 會把下面這段：\r\n\r\nPlease don\'t use any `<blink>` tags.\r\n轉為：\r\n\r\n<p>Please don\'t use any <code>&lt;blink&gt;</code> tags.</p>\r\n你也可以這樣寫：\r\n\r\n`&#8212;` is the decimal-encoded equivalent of `&mdash;`.\r\n以產生：\r\n\r\n<p><code>&amp;#8212;</code> is the decimal-encoded\r\nequivalent of <code>&amp;mdash;</code>.</p>\r\n圖片\r\n很明顯地，要在純文字應用中設計一個「自然」的語法來插入圖片是有一定難度的。\r\n\r\nMarkdown 使用一種和連結很相似的語法來標記圖片，同樣也允許兩種樣式：行內和參考。\r\n\r\n行內圖片的語法看起來像是：\r\n\r\n![Alt text](/path/to/img.jpg)\r\n\r\n![Alt text](/path/to/img.jpg \"Optional title\")\r\n詳細敘述如下：\r\n\r\n一個驚嘆號!\r\n接著一個方括號，裡面放上圖片的替代文字\r\n接著一個普通括號，裡面放上圖片的網址，最後還可以用引號包住並加上 選擇性的’title’文字。\r\n參考式的圖片語法則長得像這樣：\r\n\r\n![Alt text][id]\r\n「id」是圖片參考的名稱，圖片參考的定義方式則和連結參考一樣：\r\n\r\n[id]: url/to/image  \"Optional title attribute\"\r\n到目前為止， Markdown 還沒有辦法指定圖片的寬高，如果你需要的話，你可以使用普通的<img>標籤。\r\n\r\n其他\r\n自動連結\r\nMarkdown 支援比較簡短的自動連結形式來處理網址和電子郵件信箱，只要是用角括號包起來，Markdown 就會自動把它轉成連結，連結的文字就和連結位置一樣，例如：\r\n\r\n<http://example.com/>\r\nMarkdown 會轉為：\r\n\r\n<a href=\"http://example.com/\">http://example.com/</a>\r\n自動的郵件連結也很類似，只是 Markdown 會先做一個編碼轉換的過程，把文字字元轉成 16 進位碼的 HTML 實體，這樣的格式可以混淆一些不好的信箱地址收集機器人，例如：\r\n\r\n<address@example.com>\r\nMarkdown 會轉成：\r\n\r\n<a href=\"&#x6D;&#x61;i&#x6C;&#x74;&#x6F;:&#x61;&#x64;&#x64;&#x72;&#x65;\r\n&#115;&#115;&#64;&#101;&#120;&#x61;&#109;&#x70;&#x6C;e&#x2E;&#99;&#111;\r\n&#109;\">&#x61;&#x64;&#x64;&#x72;&#x65;&#115;&#115;&#64;&#101;&#120;&#x61;\r\n&#109;&#x70;&#x6C;e&#x2E;&#99;&#111;&#109;</a>\r\n在瀏覽器裡面，這段字串會變成一個可以點擊的「address@example.com」連結。\r\n\r\n（這種作法雖然可以混淆不少的機器人，但並無法全部擋下來，不過這樣也比什麼都不做好些。無論如何，公開你的信箱終究會引來廣告信件的。）\r\n\r\n跳脫字元\r\nMarkdown 可以利用反斜線來插入一些在語法中有其他意義的符號，例如：如果你想要用星號加在文字旁邊的方式來做出強調效果（但不用<em>標籤），你可以在星號的前面加上反斜線：\r\n\r\n\\*literal asterisks\\*\r\nMarkdown 支援在下面這些符號前面加上反斜線來幫助插入普通的符號：\r\n\r\n\\   反斜線\r\n`   反引號\r\n*   星號\r\n_   底線\r\n{}  大括號\r\n[]  方括號\r\n()  括號\r\n#   井字號\r\n+   加號\r\n-   減號\r\n.   英文句點\r\n!   驚嘆號', '2024-07-12 07:21:55.817000'),
(4, '照片', 'd22252', '<blockquote class=\"imgur-embed-pub\" lang=\"en\" data-id=\"a/eUQW8Am\"  ><a href=\"//imgur.com/a/eUQW8Am\">I&#39;m excited for his next adventure!</a></blockquote><script async src=\"//s.imgur.com/min/embed.js\" charset=\"utf-8\"></script>', '2024-07-12 07:24:54.227000'),
(5, 'markdown語法', '12111111', '--\r\n__Advertisement :)__\r\n\r\n- __[pica](https://nodeca.github.io/pica/demo/)__ - high quality and fast image\r\n  resize in browser.\r\n- __[babelfish](https://github.com/nodeca/babelfish/)__ - developer friendly\r\n  i18n with plurals support and easy syntax.\r\n\r\nYou will like those projects!\r\n\r\n---\r\n\r\n# h1 Heading 8-)\r\n## h2 Heading\r\n### h3 Heading\r\n#### h4 Heading\r\n##### h5 Heading\r\n###### h6 Heading\r\n\r\n\r\n## Horizontal Rules\r\n\r\n___\r\n\r\n---\r\n\r\n***\r\n\r\n\r\n## Typographic replacements\r\n\r\nEnable typographer option to see result.\r\n\r\n(c) (C) (r) (R) (tm) (TM) (p) (P) +-\r\n\r\ntest.. test... test..... test?..... test!....\r\n\r\n!!!!!! ???? ,,  -- ---\r\n\r\n\"Smartypants, double quotes\" and \'single quotes\'\r\n\r\n\r\n## Emphasis\r\n\r\n**This is bold text**\r\n\r\n__This is bold text__\r\n\r\n*This is italic text*\r\n\r\n_This is italic text_\r\n\r\n~~Strikethrough~~\r\n\r\n\r\n## Blockquotes\r\n\r\n\r\n> Blockquotes can also be nested...\r\n>> ...by using additional greater-than signs right next to each other...\r\n> > > ...or with spaces between arrows.\r\n\r\n\r\n## Lists\r\n\r\nUnordered\r\n\r\n+ Create a list by starting a line with `+`, `-`, or `*`\r\n+ Sub-lists are made by indenting 2 spaces:\r\n  - Marker character change forces new list start:\r\n    * Ac tristique libero volutpat at\r\n    + Facilisis in pretium nisl aliquet\r\n    - Nulla volutpat aliquam velit\r\n+ Very easy!\r\n\r\nOrdered\r\n\r\n1. Lorem ipsum dolor sit amet\r\n2. Consectetur adipiscing elit\r\n3. Integer molestie lorem at massa\r\n\r\n\r\n1. You can use sequential numbers...\r\n1. ...or keep all the numbers as `1.`\r\n\r\nStart numbering with offset:\r\n\r\n57. foo\r\n1. bar\r\n\r\n\r\n## Code\r\n\r\nInline `code`\r\n\r\nIndented code\r\n\r\n    // Some comments\r\n    line 1 of code\r\n    line 2 of code\r\n    line 3 of code\r\n\r\n\r\nBlock code \"fences\"\r\n\r\n```\r\nSample text here...\r\n```\r\n\r\nSyntax highlighting\r\n\r\n``` js\r\nvar foo = function (bar) {\r\n  return bar++;\r\n};\r\n\r\nconsole.log(foo(5));\r\n```\r\n\r\n## Tables\r\n\r\n| Option | Description |\r\n| ------ | ----------- |\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\nRight aligned columns\r\n\r\n| Option | Description |\r\n| ------:| -----------:|\r\n| data   | path to data files to supply the data that will be passed into templates. |\r\n| engine | engine to be used for processing templates. Handlebars is the default. |\r\n| ext    | extension to be used for dest files. |\r\n\r\n\r\n## Links\r\n\r\n[link text](http://dev.nodeca.com)\r\n\r\n[link with title](http://nodeca.github.io/pica/demo/ \"title text!\")\r\n\r\nAutoconverted link https://github.com/nodeca/pica (enable linkify to see)\r\n\r\n\r\n## Images\r\n\r\n![Minion](https://octodex.github.com/images/minion.png)\r\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg \"The Stormtroopocat\")\r\n\r\nLike links, Images also have a footnote style syntax\r\n\r\n![Alt text][id]\r\n\r\nWith a reference later in the document defining the URL location:\r\n\r\n[id]: https://octodex.github.com/images/dojocat.jpg  \"The Dojocat\"\r\n\r\n\r\n## Plugins\r\n\r\nThe killer feature of `markdown-it` is very effective support of\r\n[syntax plugins](https://www.npmjs.org/browse/keyword/markdown-it-plugin).\r\n\r\n\r\n### [Emojies](https://github.com/markdown-it/markdown-it-emoji)\r\n\r\n> Classic markup: :wink: :cry: :laughing: :yum:\r\n>\r\n> Shortcuts (emoticons): :-) :-( 8-) ;)\r\n\r\nsee [how to change output](https://github.com/markdown-it/markdown-it-emoji#change-output) with twemoji.\r\n\r\n\r\n### [Subscript](https://github.com/markdown-it/markdown-it-sub) / [Superscript](https://github.com/markdown-it/markdown-it-sup)\r\n\r\n- 19^th^\r\n- H~2~O\r\n\r\n\r\n### [\\<ins>](https://github.com/markdown-it/markdown-it-ins)\r\n\r\n++Inserted text++\r\n\r\n\r\n### [\\<mark>](https://github.com/markdown-it/markdown-it-mark)\r\n\r\n==Marked text==\r\n\r\n\r\n### [Footnotes](https://github.com/markdown-it/markdown-it-footnote)\r\n\r\nFootnote 1 link[^first].\r\n\r\nFootnote 2 link[^second].\r\n\r\nInline footnote^[Text of inline footnote] definition.\r\n\r\nDuplicated footnote reference[^second].\r\n\r\n[^first]: Footnote **can have markup**\r\n\r\n    and multiple paragraphs.\r\n\r\n[^second]: Footnote text.\r\n\r\n\r\n### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)\r\n\r\nTerm 1\r\n\r\n:   Definition 1\r\nwith lazy continuation.\r\n\r\nTerm 2 with *inline markup*\r\n\r\n:   Definition 2\r\n\r\n        { some code, part of Definition 2 }\r\n\r\n    Third paragraph of definition 2.\r\n\r\n_Compact style:_\r\n\r\nTerm 1\r\n  ~ Definition 1\r\n\r\nTerm 2\r\n  ~ Definition 2a\r\n  ~ Definition 2b\r\n\r\n\r\n### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)\r\n\r\nThis is HTML abbreviation example.\r\n\r\nIt converts \"HTML\", but keep intact partial entries like \"xxxHTMLyyy\" and so on.\r\n\r\n*[HTML]: Hyper Text Markup Language\r\n\r\n### [Custom containers](https://github.com/markdown-it/markdown-it-container)\r\n\r\n::: warning\r\n*here be dragons*\r\n:::', '2024-07-12 07:27:08.134000');

-- --------------------------------------------------------

--
-- 資料表結構 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-07-12 07:18:36.361000', '1', '第一筆資料', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-07-12 07:19:53.247000', '2', '第二筆資料', 1, '[{\"added\": {}}]', 7, 1),
(3, '2024-07-12 07:21:55.819000', '3', '第三組資訊', 1, '[{\"added\": {}}]', 7, 1),
(4, '2024-07-12 07:24:54.229000', '4', '照片', 1, '[{\"added\": {}}]', 7, 1),
(5, '2024-07-12 07:25:31.675000', '3', 'markdown語法', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(6, '2024-07-12 07:27:08.135000', '5', '第五組資訊程式碼', 1, '[{\"added\": {}}]', 7, 1),
(7, '2024-07-12 07:27:20.067000', '3', '網頁', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(8, '2024-07-12 07:27:27.605000', '5', 'markdown語法', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(9, '2024-07-12 07:41:55.566000', '5', 'markdown語法', 2, '[]', 7, 1),
(10, '2024-07-12 08:16:52.810000', '2', '第二筆資料', 2, '[]', 7, 1),
(11, '2024-08-08 03:24:30.418336', '1', '第一筆資料', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'blog_post', 'post'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- 資料表結構 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-08-08 02:46:55.166112'),
(2, 'auth', '0001_initial', '2024-08-08 02:46:55.358448'),
(3, 'admin', '0001_initial', '2024-08-08 02:46:55.409224'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-08-08 02:46:55.414210'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-08-08 02:46:55.419197'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-08-08 02:46:55.454953'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-08-08 02:46:55.476829'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-08-08 02:46:55.482812'),
(9, 'auth', '0004_alter_user_username_opts', '2024-08-08 02:46:55.488797'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-08-08 02:46:55.517717'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-08-08 02:46:55.518715'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-08-08 02:46:55.524698'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-08-08 02:46:55.532695'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-08-08 02:46:55.539198'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-08-08 02:46:55.545193'),
(16, 'auth', '0011_update_proxy_permissions', '2024-08-08 02:46:55.550170'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-08-08 02:46:55.557153'),
(18, 'blog_post', '0001_initial', '2024-08-08 02:46:55.560144'),
(19, 'sessions', '0001_initial', '2024-08-08 02:46:55.574107');

-- --------------------------------------------------------

--
-- 資料表結構 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('inh3o87fgbrhtcqm2iqj7ihh0vgiu730', '.eJxVjEEOwiAQRe_C2hBgAKtL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzsurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL98aMwmfPMTgOebMZCMgwhCA0pC9M2TAESbrARwIiScXIMDRiiHKVr0__6U4Qg:1sbtks:rCnbQfMJ7LFkoCWxqH5piZ-poBf05XGxeUX5AoXNIZ8', '2024-08-22 03:23:58.433325'),
('ipov3zvtureu2ytbu0ulr27oqp9q2anp', '.eJxVjEEOwiAQRe_C2hBgAKtL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzsurwuyWkh9QN8B3rrWlqdZmnpDdF77Tra2N5Xnb376BgL98aMwmfPMTgOebMZCMgwhCA0pC9M2TAESbrARwIiScXIMDRiiHKVr0__6U4Qg:1sSANA:rxnHwLT4xDpyUkpkGjBeonkLsSTFOvOkAljgmVlY23c', '2024-07-26 07:07:16.284000');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 資料表索引 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- 資料表索引 `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 資料表索引 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- 資料表索引 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `blog_post_post`
--
ALTER TABLE `blog_post_post`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- 資料表索引 `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- 資料表索引 `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `blog_post_post`
--
ALTER TABLE `blog_post_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 資料表的限制式 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 資料表的限制式 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
