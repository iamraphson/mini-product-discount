-- -------------------------------------------------------------
-- TablePlus 4.0.0(370)
--
-- https://tableplus.com/
--
-- Database: discount-product-api
-- Generation Time: 2023-03-29 23:56:58.4460
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'product',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sku` bigint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sku` bigint NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `discounts` (`id`, `name`, `type`, `value`, `sku`) VALUES
(2, 'wraps', 'category', 18.00, NULL),
(3, 'Grilled discount', 'product', 15.00, 74),
(4, 'Avocado discount', 'product', 20.00, 176),
(5, 'spreads', 'category', 25.00, NULL),
(6, 'Cheese discount', 'product', 26.00, 36),
(7, 'Egglette discount', 'product', 11.00, 169),
(8, 'breakfast', 'category', 10.00, NULL);

INSERT INTO `products` (`id`, `name`, `sku`, `price`, `category`) VALUES
(1, 'Avocado', 176, 1000.00, 'add-ons'),
(2, 'Cheese', 177, 1000.00, 'add-ons'),
(3, 'Veggies', 178, 1000.00, 'add-ons'),
(4, 'Jalapeno', 1, 920.00, 'add-ons'),
(5, 'Multiseed', 2, 920.00, 'add-ons'),
(6, 'Onion', 3, 920.00, 'add-ons'),
(7, 'Plain', 4, 920.00, 'add-ons'),
(8, 'Poppy Seed', 5, 920.00, 'add-ons'),
(9, 'Rye Pumpernickle', 6, 920.00, 'add-ons'),
(10, 'Salt', 7, 920.00, 'add-ons'),
(11, 'Sesame', 8, 920.00, 'add-ons'),
(12, 'Whole Wheat', 9, 920.00, 'add-ons'),
(13, 'Sundried Tomato', 10, 920.00, 'add-ons'),
(14, 'Garlic', 11, 920.00, 'add-ons'),
(15, 'Egg', 12, 920.00, 'add-ons'),
(16, 'Chocolate Chip', 13, 920.00, 'add-ons'),
(17, 'Combo', 14, 920.00, 'add-ons'),
(18, 'Cinnamon Raisin', 15, 920.00, 'add-ons'),
(19, 'Blueberry', 16, 920.00, 'add-ons'),
(20, 'Whole Wheat Sesame', 18, 920.00, 'add-ons'),
(21, '1/2 Dozen Bagels', 20, 6750.00, 'add-ons'),
(22, 'Baker\'s Dozen Bagels', 26, 11950.00, 'add-ons'),
(23, 'Bagel/gourmet cream cheese', 28, 3250.00, 'add-ons'),
(24, 'Bagel/lox cr ch', 29, 3750.00, 'add-ons'),
(25, 'Bagel/cr ch', 30, 2650.00, 'add-ons'),
(26, 'Devil Eggs', 165, 3250.00, 'add-ons'),
(27, 'Roasted Red Pepper Frittata Slice with salsa [D]', 166, 5950.00, 'add-ons'),
(28, 'Breakfast Burrito with egg & potatoes', 167, 5950.00, 'breakfast'),
(29, '16 oz. Parfait Yogurt with fresh made granola', 168, 5950.00, 'breakfast'),
(30, 'Plain Challah 1.25 Lb.', 155, 5250.00, 'challah'),
(31, 'Sesame Challah 1.25 Lb.', 156, 5250.00, 'challah'),
(32, 'Poppy Seed Challah 1.25 Lb.', 157, 5250.00, 'challah'),
(33, 'Whole Wheat Challah 1.25 Lb.', 158, 5250.00, 'challah'),
(34, 'Bag of 6 pcs. of Plain Challah Rolls', 159, 4000.00, 'challah'),
(35, '1/8 Cheese Cake', 137, 19950.00, 'cheesecake'),
(36, '1/4 Sheet Cheese Cake', 138, 58950.00, 'cheesecake'),
(37, '1/2 Sheet Cheese Cake', 139, 98950.00, 'cheesecake'),
(38, 'Cappuccino', 1185, 2500.00, 'coffee'),
(39, 'Coffee', 1186, 1500.00, 'coffee'),
(40, 'Hot Chocolate', 1187, 2450.00, 'coffee'),
(41, 'Latte', 1188, 2500.00, 'coffee'),
(42, 'Mocha', 1189, 3000.00, 'coffee'),
(43, 'Espresso', 196, 600.00, 'coffee'),
(44, 'Espresso', 200, 1500.00, 'coffee'),
(45, 'Chocolate Chip Cookies [Dairy]', 86, 1450.00, 'cookies'),
(46, 'Oatmeal Raisin [Dairy]', 87, 1450.00, 'cookies'),
(47, 'M & M [Dairy]', 88, 1250.00, 'cookies'),
(48, 'Sugar Cookie [Dairy]', 89, 1450.00, 'cookies'),
(49, 'Filled Chocolate Cokie [Dairy]', 90, 1450.00, 'cookies'),
(50, 'Peanut Butter [Dairy]', 91, 1450.00, 'cookies'),
(51, 'Filled Macaroon Cookie [Dairy]', 92, 1450.00, 'cookies'),
(52, 'Filled Peanut Butter Cookie [Dairy]', 93, 1450.00, 'cookies'),
(53, 'XL Chocolate Chip Cookie [Dairy]', 94, 2250.00, 'xl-cookies'),
(54, 'XL Oatmeal Raisin Cookie [Dairy]', 95, 2250.00, 'xl-cookies'),
(55, 'XL Peanut Butter Cookie [Dairy]', 96, 2250.00, 'xl-cookies'),
(56, 'XL Sugar Cookie [Dairy]', 97, 2250.00, 'xl-cookies'),
(57, 'M & M Lollipop Cookie [Dairy]', 98, 2250.00, 'xl-cookies'),
(58, 'Sprinkle Cookie [Parve]', 99, 1250.00, 'cookies'),
(59, 'Black & White Cookie [Parve]', 100, 2250.00, 'cookies'),
(60, 'Raspberry Hamentashen $11.95/Lb Parve', 101, 11950.00, 'hamentashen'),
(61, 'Prune Hamentashen $11.95/Lb. Parve', 102, 11950.00, 'hamentashen'),
(62, 'Poppy Hamentashen $11.95/Lb Parve', 103, 11950.00, 'hamentashen'),
(63, 'Apricot Hamentashen $11.95/Lb Parve', 104, 11950.00, 'hamentashen'),
(64, 'Chocolate Hamentashen $11.95/Lb Dairy', 105, 11950.00, 'hamentashen'),
(65, 'Martinelli\'s juice', 179, 1500.00, 'drinks'),
(66, 'Martinelli\'s juice - sparkling', 180, 1500.00, 'drinks'),
(67, 'Odwalla', 181, 4000.00, 'drinks'),
(68, 'Dr. Brown', 182, 1500.00, 'drinks'),
(69, 'Tea', 183, 1350.00, 'drinks'),
(70, 'Snapple', 184, 1500.00, 'drinks'),
(71, 'Soda', 197, 1500.00, 'drinks'),
(72, 'Orangina', 198, 1500.00, 'drinks'),
(73, 'Bottled water', 199, 1500.00, 'drinks'),
(74, 'TULLY\'S COFFEE TO GO', 201, 17000.00, 'coffee'),
(75, 'Vegetarian Frittata [PARVE]', 174, 24950.00, 'frittata-trays'),
(76, 'Spinach', 146, 3950.00, 'knishes'),
(77, 'Veggie', 147, 3950.00, 'knishes'),
(78, 'Broccoli', 148, 3950.00, 'knishes'),
(79, 'Kasha', 149, 3950.00, 'knishes'),
(80, '_ Lb. Gourmet Wild Lox [8oz.]', 83, 15000.00, 'lox'),
(81, 'Gourmet Wild Lox [4oz.]', 84, 7500.00, 'lox'),
(82, 'Double Chocolate', 150, 3250.00, 'muffins'),
(83, 'Banana Nut', 151, 3250.00, 'muffins'),
(84, 'Glorious Morning - Carrot', 152, 3250.00, 'muffins'),
(85, 'Blueberry', 153, 3250.00, 'muffins'),
(86, 'Lemon Poppy Seed', 154, 3250.00, 'muffins'),
(87, '4.5 oz. Butter Croissants', 111, 2950.00, 'croissants'),
(88, '4.25 oz. Chocolate Croissants', 112, 2950.00, 'croissants'),
(89, '4.25 oz. Cream Cheese Croissants', 113, 2950.00, 'croissants'),
(90, '4.25 oz. Strawberry Cream Cheese Croissants', 114, 2950.00, 'croissants'),
(91, '4.25 oz. Blueberry Cream Cheese Croissants', 115, 2950.00, 'croissants'),
(92, '4.55 oz. Apple Turnovers', 116, 2950.00, 'turnovers'),
(93, '4.55 oz. Cherry Turnovers', 117, 2950.00, 'turnovers'),
(94, '6.5 oz. Cinnamon Rolls', 118, 3250.00, 'turnovers'),
(95, 'Smoked Baked Salmon Salad', 50, 6950.00, 'salads'),
(96, 'Smoked White Fish Salad', 51, 6950.00, 'salads'),
(97, 'Herring in Cream Sauce', 52, 6500.00, 'salads'),
(98, 'Herring in Wine Sauce', 53, 6500.00, 'salads'),
(99, 'Izzy\'s Tuna Salad', 54, 5250.00, 'salads'),
(100, 'Egg Salad', 55, 4250.00, 'salads'),
(101, 'Hummus or Veggie \"Chopped Liver\"', 63, 4500.00, 'salads'),
(102, 'Lentil with carrots 12oz.', 79, 4550.00, 'soups'),
(103, 'Minestrone 12oz.', 80, 4550.00, 'soups'),
(104, 'Barley 12oz.', 81, 4550.00, 'soups'),
(105, 'Flatgels', 21, 1950.00, 'specialty-bagels'),
(106, 'Challa Bagel', 24, 4950.00, 'specialty-bagels'),
(107, 'Strawberry Cream Cheese', 31, 3950.00, 'spreads'),
(108, 'Blueberry Cream Cheese', 32, 3950.00, 'spreads'),
(109, 'Cinnamon Raisin Cream Cheese', 33, 3950.00, 'spreads'),
(110, 'Belgian Orange Chocolate Cream Cheese', 34, 3950.00, 'spreads'),
(111, 'Walnut Raisin Cream Cheese', 35, 3950.00, 'spreads'),
(112, 'Classic Cream Cheese', 36, 3500.00, 'spreads'),
(113, 'Low - Fat Cream Cheese', 37, 3500.00, 'spreads'),
(114, 'Cucumber Scallion Cream Cheese', 38, 3950.00, 'spreads'),
(115, 'Chive Cream Cheese', 39, 3950.00, 'spreads'),
(116, 'Dijon Garlic Cream Cheese', 40, 3950.00, 'spreads'),
(117, 'Sundried Tomato Cream Cheese', 41, 3950.00, 'spreads'),
(118, 'Lox Spread', 42, 4500.00, 'spreads'),
(119, 'Black Olive Cream Cheese', 43, 3950.00, 'spreads'),
(120, 'Green Olive & Garlic Cream Cheese', 44, 3950.00, 'spreads'),
(121, 'Green Olive & Pimento Cream Cheese', 45, 3950.00, 'spreads'),
(122, 'Roasted Red Pepper Cream Cheese', 46, 3950.00, 'spreads'),
(123, 'Mexican Salsa Cream Cheese', 47, 3950.00, 'spreads'),
(124, 'Veggie Cream Cheese', 48, 3950.00, 'spreads'),
(125, 'Jalapeno Cream Cheese', 49, 3950.00, 'spreads'),
(126, 'Baked Salmon with lettuce, tomato & cucumber', 72, 7950.00, 'wraps'),
(127, 'Egg Salad with lettuce, tomato & cucumber', 73, 6950.00, 'wraps'),
(128, 'Grilled Eggplant with Mushrooms & Onions', 74, 6950.00, 'wraps'),
(129, 'Grilled Veggies', 75, 6950.00, 'wraps'),
(130, 'Hummus & Falafel with tahina sauce', 76, 6950.00, 'wraps'),
(131, 'Tuna Salad with lettuce, tomato & cucumber', 77, 6950.00, 'wraps'),
(132, 'White Fish Salad with lettuce, tomato & cucumber', 78, 7950.00, 'wraps'),
(133, 'Egglette', 169, 3500.00, 'breakfast'),
(134, 'Egglette - Cheese & Veggie', 170, 6360.00, 'breakfast');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;