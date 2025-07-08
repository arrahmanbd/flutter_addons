part of 'package:flutter_addons/flutter_addons.dart';

class FakeData {
  // Realistic Dummy Data Generator Functions
  static List<FakePerson> generatePersons(int count) {
    return List.generate(count, (index) {
      return FakePerson(
        name: Fake.names[index % Fake.names.length],
        age: 20 + (index % 50),
        email: Fake.emails[index % Fake.emails.length],
      );
    });
  }

  // Realistic Dummy Data Generator Functions
  static List<FakeUsers> generateUsers(int count) {
    return List.generate(count, (index) {
      return FakeUsers(
        username: Fake.usernames[index % Fake.usernames.length],
        password: Fake.passwords[index % Fake.passwords.length],
        fullName: Fake.names[index % Fake.names.length],
        email: Fake.emails[index % Fake.emails.length],
        comments: Fake.commentsList[index % Fake.commentsList.length],
      );
    });
  }

  // Realistic Dummy Data Generator Functions
  static List<FakeProduct> generateProducts(int count) {
    return List.generate(count, (index) {
      return FakeProduct(
        id: 'P${index + 1}',
        name: Fake.productNames[index % Fake.productNames.length],
        description:
            Fake.productDescriptions[index % Fake.productDescriptions.length],
        price: (index + 1) * 20.0,
        imageUrl: 'https://example.com/images/product${index + 1}.png',
        category: Fake.categories[index % Fake.categories.length],
        comments: Fake.commentsList[index % Fake.commentsList.length],
      );
    });
  }

  // Realistic Dummy Data Generator Functions
  static List<FakeConversation> generateConversations(int count) {
    return List.generate(count, (index) {
      return FakeConversation(
        id: 'conv_$index',
        senderName: Fake.names[index % Fake.names.length],
        senderAvatarUrl: Fake.avatars[index % Fake.avatars.length],
        lastMessage: Fake.messages[index % Fake.messages.length],
        timestamp: DateTime.now().subtract(Duration(minutes: (index + 1) * 5)),
        isRead: index % 3 == 0,
        isTyping: index % 7 == 0,
      );
    });
  }
}
