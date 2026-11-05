import 'package:food_delivery/utils/app_assets.dart';

class FoodSize {
  final String label;
  final String cookingTime;

  const FoodSize({required this.label, required this.cookingTime});
}

class FoodItem {
  final String name;
  final String imgUrl;
  final double price;
  final bool isFavorite;
  final String? description;
  final List<FoodSize> sizes;

  FoodItem({
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.sizes,
    this.isFavorite = false,
    this.description,
  });

  FoodItem copyWith({
    String? name,
    String? imgUrl,
    double? price,
    bool? isFavorite,
    String? description,
    List<FoodSize>? sizes,
  }) {
    return FoodItem(
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      description: description ?? this.description,
      sizes: sizes ?? this.sizes,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    name: 'Beef Burger',
    imgUrl: AppAssets.beefBurgerImage,
    price: 8.5,
    description:
        'Juicy double beef patty with melted cheddar, fresh lettuce and tomato on a toasted sesame bun.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '10-15 minutes'),
      FoodSize(label: 'Medium', cookingTime: '15-20 minutes'),
      FoodSize(label: 'Large', cookingTime: '20-25 minutes'),
    ],
  ),
  FoodItem(
    name: 'Chicken Burger',
    imgUrl: AppAssets.chickenBurgerImage,
    price: 8.5,
    description:
        'Crispy fried chicken fillet with lettuce, creamy sauce and a soft toasted bun.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '10-15 minutes'),
      FoodSize(label: 'Medium', cookingTime: '15-20 minutes'),
      FoodSize(label: 'Large', cookingTime: '20-25 minutes'),
    ],
  ),
  FoodItem(
    name: 'Chicken Pizza',
    imgUrl: AppAssets.chickenPizzaImage,
    price: 7,
    description:
        'Hand-stretched crust topped with BBQ chicken, red onions and melted mozzarella.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '15-20 minutes'),
      FoodSize(label: 'Medium', cookingTime: '20-25 minutes'),
      FoodSize(label: 'Large', cookingTime: '25-30 minutes'),
    ],
  ),
  FoodItem(
    name: 'Pepperoni Pizza',
    imgUrl: AppAssets.pepperoniPizzaImage,
    price: 8.5,
    description:
        'Classic pizza loaded with spicy pepperoni slices and bubbling mozzarella on tomato sauce.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '15-20 minutes'),
      FoodSize(label: 'Medium', cookingTime: '20-25 minutes'),
      FoodSize(label: 'Large', cookingTime: '25-30 minutes'),
    ],
  ),
  FoodItem(
    name: 'Pasta',
    imgUrl: AppAssets.pastaImage,
    price: 7.5,
    description:
        'Spaghetti tossed in rich tomato sauce, topped with fresh basil and grated parmesan.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '10-15 minutes'),
      FoodSize(label: 'Medium', cookingTime: '15-20 minutes'),
      FoodSize(label: 'Large', cookingTime: '20-25 minutes'),
    ],
  ),
  FoodItem(
    name: 'Salad',
    imgUrl: AppAssets.saladImage,
    price: 8.5,
    description:
        'Fresh mix of lettuce, tomatoes, cucumber and olives with a light house dressing.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '5-10 minutes'),
      FoodSize(label: 'Medium', cookingTime: '10-15 minutes'),
      FoodSize(label: 'Large', cookingTime: '15-20 minutes'),
    ],
  ),
  FoodItem(
    name: 'Beef Shawarma',
    imgUrl: AppAssets.beefShawarmaImage,
    price: 7,
    description:
        'Tender marinated beef slices wrapped in warm bread with garlic sauce and pickles.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '5-10 minutes'),
      FoodSize(label: 'Medium', cookingTime: '10-15 minutes'),
      FoodSize(label: 'Large', cookingTime: '15-20 minutes'),
    ],
  ),
  FoodItem(
    name: 'Chicken Shawarma',
    imgUrl: AppAssets.chickenShawarmaImage,
    price: 7.5,
    description:
        'Juicy spiced chicken wrapped in warm bread with garlic sauce, fries and pickles.',
    sizes: const [
      FoodSize(label: 'Small', cookingTime: '5-10 minutes'),
      FoodSize(label: 'Medium', cookingTime: '10-15 minutes'),
      FoodSize(label: 'Large', cookingTime: '15-20 minutes'),
    ],
  ),
];
