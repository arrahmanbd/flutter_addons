part of 'package:flutter_addons/flutter_addons.dart';

// person
class FakePerson {
  final String name;
  final int age;
  final String email;

  FakePerson({required this.name, required this.age, required this.email});

  @override
  String toString() => 'Person(name: $name, age: $age, email: $email)';
}

// user
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

// product
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

//conversation
class FakeConversation {
  final String id;
  final String senderName;
  final String senderAvatarUrl;
  final String lastMessage;
  final DateTime timestamp;
  final bool isRead;
  final bool isTyping;

  FakeConversation({
    required this.id,
    required this.senderName,
    required this.senderAvatarUrl,
    required this.lastMessage,
    required this.timestamp,
    this.isRead = false,
    this.isTyping = false,
  });
}
