part of 'package:flutter_addons/flutter_addons.dart';

//dummy data
class FakePerson {
  final String name;
  final int age;
  final String email;

  FakePerson({required this.name, required this.age, required this.email});

  @override
  String toString() => 'Person(name: $name, age: $age, email: $email)';
}

class FakeUsers {
  final String username;
  final String password;
  final String fullName;
  final String email;
  final List<String> comments;

  FakeUsers({
    required this.username,
    required this.password,
    required this.fullName,
    required this.email,
    required this.comments,
  });

  @override
  String toString() =>
      'User(username: $username, password: $password, fullName: $fullName, email: $email, comments: $comments)';
}

class FakeProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final List<String> comments;

  FakeProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.comments,
  });

  @override
  String toString() =>
      'Product(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, category: $category, comments: $comments)';
}

class FakeItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> comments;

  FakeItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.comments,
  });

  @override
  String toString() =>
      'Item(id: $id, title: $title, description: $description, price: $price, comments: $comments)';
}

// Realistic Dummy Data Generator Functions

List<FakePerson> generateDummyPersons(int count) {
  List<String> names = [
    "John Smith",
    "Emily Davis",
    "Michael Brown",
    "Jessica Miller",
    "David Wilson",
    "Sophia Johnson",
    "James Lee",
    "Olivia Moore",
    "Daniel Harris",
    "Charlotte Clark",
  ];

  List<String> emails = [
    "john.smith@example.com",
    "emily.davis@example.com",
    "michael.brown@example.com",
    "jessica.miller@example.com",
    "david.wilson@example.com",
    "sophia.johnson@example.com",
    "james.lee@example.com",
    "olivia.moore@example.com",
    "daniel.harris@example.com",
    "charlotte.clark@example.com",
  ];

  return List.generate(count, (index) {
    return FakePerson(
      name: names[index % names.length],
      age: 20 + (index % 50),
      email: emails[index % emails.length],
    );
  });
}

List<FakeUsers> generateDummyUsers(int count) {
  List<String> usernames = [
    "johnsmith123",
    "emilydavis_",
    "michaelb88",
    "jessica_miller",
    "david_wilson",
    "sophia_johnson",
    "jameslee_21",
    "oliviamoore_9",
    "danielharris_7",
    "charlotteclark",
  ];

  List<String> passwords = [
    "password123",
    "qwerty123",
    "letmein456",
    "welcome789",
    "iloveyou1",
    "password@2024",
    "helloWorld1",
    "letmein_1234",
    "trustNo1",
    "mysecurepassword",
  ];

  List<String> fakeNames = [
    "John Smith",
    "Emily Davis",
    "Michael Brown",
    "Jessica Miller",
    "David Wilson",
  ];

  List<String> fakeEmails = [
    "john.smith@example.com",
    "emily.davis@example.com",
    "michael.brown@example.com",
    "jessica.miller@example.com",
    "david.wilson@example.com",
  ];

  List<List<String>> fakeCommentsList = [
    ["Great service!", "Loving the experience.", "Highly recommend!"],
    ["Not bad, but could improve.", "Fast delivery!", "Will shop again."],
    [
      "Worst purchase I've made.",
      "The quality is poor.",
      "Very disappointing.",
    ],
    ["I love this product!", "Excellent quality!", "Very satisfied."],
    ["Fantastic customer support!", "Will return for more.", "Great deals!"],
  ];

  return List.generate(count, (index) {
    return FakeUsers(
      username: usernames[index % usernames.length],
      password: passwords[index % passwords.length],
      fullName: fakeNames[index % fakeNames.length],
      email: fakeEmails[index % fakeEmails.length],
      comments: fakeCommentsList[index % fakeCommentsList.length],
    );
  });
}

List<FakeProduct> generateDummyProducts(int count) {
  List<String> productNames = [
    "Wireless Headphones",
    "Laptop Backpack",
    "Smartphone Stand",
    "Gaming Mouse",
    "4K Monitor",
    "Bluetooth Speaker",
    "USB-C Hub",
    "Smart Watch",
    "Keyboard",
    "External Hard Drive",
  ];

  List<String> fakeProductDescriptions = [
    "High-quality wireless headphones with noise-canceling feature.",
    "Durable laptop backpack with extra compartments for storage.",
    "Adjustable smartphone stand for desk use.",
    "Ergonomic gaming mouse with customizable buttons.",
    "Ultra-clear 4K resolution monitor for professional work and gaming.",
    "Portable Bluetooth speaker with excellent sound quality.",
    "Convenient USB-C hub to expand your connectivity options.",
    "Stylish smart watch with fitness tracking and heart rate monitor.",
    "Mechanical keyboard with customizable RGB lights.",
    "Fast data transfer external hard drive with large storage capacity.",
  ];

  List<String> fakeCategories = [
    "Electronics",
    "Accessories",
    "Office Supplies",
    "Gaming",
    "Home Entertainment",
  ];

  List<List<String>> fakeCommentsList = [
    [
      "Great sound quality!",
      "Comfortable to wear for hours.",
      "Highly recommended!",
    ],
    [
      "Perfect for my daily commute.",
      "Spacious and well-designed.",
      "Love it!",
    ],
    [
      "Great for video calls and reading.",
      "Sturdy and adjustable.",
      "Sleek design.",
    ],
    [
      "Feels amazing for gaming!",
      "Accurate clicks.",
      "I love the RGB lighting.",
    ],
    [
      "Crystal clear image quality.",
      "Perfect for editing photos.",
      "Great refresh rate.",
    ],
    ["Portable and loud sound.", "Love the bass.", "Perfect for outdoor use."],
    [
      "Makes my life so much easier.",
      "Works flawlessly.",
      "A must-have accessory.",
    ],
    ["Tracks my steps accurately.", "Great display.", "Perfect for fitness."],
    ["Responsive keys.", "Good tactile feel.", "Love the RGB backlighting."],
    [
      "Fast and reliable.",
      "I can store everything I need.",
      "Great value for money.",
    ],
  ];

  return List.generate(count, (index) {
    return FakeProduct(
      id: 'P${index + 1}',
      name: productNames[index % productNames.length],
      description:
          fakeProductDescriptions[index % fakeProductDescriptions.length],
      price: (index + 1) * 20.0,
      imageUrl: 'https://example.com/images/product${index + 1}.png',
      category: fakeCategories[index % fakeCategories.length],
      comments: fakeCommentsList[index % fakeCommentsList.length],
    );
  });
}

List<FakeItem> generateDummyItems(int count) {
  List<String> itemTitles = [
    "Item One",
    "Item Two",
    "Item Three",
    "Item Four",
    "Item Five",
    "Item Six",
    "Item Seven",
    "Item Eight",
    "Item Nine",
    "Item Ten",
  ];

  List<String> fakeItemDescriptions = [
    "A useful item for various purposes.",
    "An item designed to solve common problems.",
    "A premium quality item for enthusiasts.",
    "An everyday item with multiple functions.",
    "Compact and easy to use for all ages.",
    "A portable item with advanced features.",
    "A stylish item that adds a touch of elegance.",
    "A high-performance item for professionals.",
    "The ultimate item for comfort and convenience.",
    "A budget-friendly item for casual use.",
  ];

  List<List<String>> fakeCommentsList = [
    [
      "Great item, will buy again.",
      "Not bad for the price.",
      "Highly recommended!",
    ],
    ["Excellent quality!", "Value for money.", "Will purchase again."],
    [
      "Disappointed, expected better quality.",
      "Product didn’t meet my expectations.",
      "Returning this.",
    ],
    [
      "Perfect for everyday use!",
      "Multi-functional and easy to carry.",
      "Great value.",
    ],
    ["Great portable design.", "Very user-friendly.", "Love this item!"],
    [
      "Perfect for travel.",
      "Portable and lightweight.",
      "Great tech for the price.",
    ],
    [
      "Makes my space look elegant.",
      "Stylish and functional.",
      "Good quality.",
    ],
    [
      "High performance, works great!",
      "Perfect for professionals.",
      "Worth every penny.",
    ],
    [
      "Comfortable and practical.",
      "Perfect for relaxing.",
      "Excellent product.",
    ],
    [
      "Affordable and great for casual use.",
      "Sufficient for daily tasks.",
      "Good value.",
    ],
  ];

  return List.generate(count, (index) {
    return FakeItem(
      id: 'I${index + 1}',
      title: itemTitles[index % itemTitles.length],
      description: fakeItemDescriptions[index % fakeItemDescriptions.length],
      price: (index + 1) * 15.0,
      comments: fakeCommentsList[index % fakeCommentsList.length],
    );
  });
}

// A Map to Access All Dummy Data Generation Methods

Map<String, dynamic> dummyDataGenerators = {
  'generatePersons': generateDummyPersons,
  'generateUsers': generateDummyUsers,
  'generateProducts': generateDummyProducts,
  'generateItems': generateDummyItems,
};
