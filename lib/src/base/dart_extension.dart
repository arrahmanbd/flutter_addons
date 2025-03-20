part of 'package:flutter_addons/flutter_addons.dart';

// This file contains a collection of highly useful pure Dart extensions 
// These extensions provide additional functionality for various Dart operations.
// Each extension is designed to be intuitive and easy to use.
// Simply import this file to start leveraging these extensions in your Dart projects.



// 1. Extension to Get the Last Element of a List
extension LastElement<T> on List<T> {
  T? get lastOrNull {
    if (isEmpty) return null;
    return last;
  }
}

// Usage:
// final list = [1, 2, 3];
// final lastItem = list.lastOrNull;  // 3
// final emptyList = [];
// final noItem = emptyList.lastOrNull;  // null


// 2. Extension to Shuffle a List
extension ShuffleList<T> on List<T> {
  void shuffleList() {
    final random = Random();
    for (var i = length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = this[i];
      this[i] = this[j];
      this[j] = temp;
    }
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// list.shuffleList();  // Shuffles the list randomly
// print(list);


// 3. Extension to Remove Duplicates from a List
extension RemoveDuplicates<T> on List<T> {
  List<T> removeDuplicates() {
    return toSet().toList();
  }
}

// Usage:
// final list = [1, 2, 3, 3, 4, 4, 5];
// final uniqueList = list.removeDuplicates();  // [1, 2, 3, 4, 5]
// print(uniqueList);


// 4. Extension to Find the Index of the First Match
extension FindIndex<T> on List<T> {
  int findIndex(bool Function(T) condition) {
    for (var i = 0; i < length; i++) {
      if (condition(this[i])) {
        return i;
      }
    }
    return -1;  // Return -1 if no match found
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// final index = list.findIndex((element) => element == 3);  // 2
// print(index);


// 5. Extension to Split a List into Chunks
extension ChunkList<T> on List<T> {
  List<List<T>> chunk(int chunkSize) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += chunkSize) {
      chunks.add(sublist(i, i + chunkSize > length ? length : i + chunkSize));
    }
    return chunks;
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
// final chunked = list.chunk(3);  // [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
// print(chunked);


// 6. Extension to Sort by a Custom Comparator
extension SortBy<T> on List<T> {
  void sortBy(Comparable Function(T) compare) {
    sort((a, b) => compare(a).compareTo(compare(b)));
  }
}

// Usage:
// class Person {
//   final String name;
//   final int age;
//   Person(this.name, this.age);
// }
// final people = [
//   Person('Alice', 30),
//   Person('Bob', 25),
//   Person('Charlie', 35)
// ];
// people.sortBy((person) => person.age);


// 7. Extension to Reverse the List
extension ReverseList<T> on List<T> {
  List<T> reversedList() {
    return List.from(reversed);
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// final reversed = list.reversedList();  // [5, 4, 3, 2, 1]
// print(reversed);


// 8. Extension to Remove the First Occurrence of an Item
extension RemoveFirstOccurrence<T> on List<T> {
  bool removeFirstOccurrence(T element) {
    final index = indexOf(element);
    if (index != -1) {
      removeAt(index);
      return true;
    }
    return false;
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// final removed = list.removeFirstOccurrence(3);  // true
// print(list);  // [1, 2, 4, 5]


// 9. Extension to Find a Specific Element or Return a Default
extension FindOrDefault<T> on List<T> {
  T? findOrDefault(bool Function(T) condition, T? defaultValue) {
    for (var item in this) {
      if (condition(item)) {
        return item;
      }
    }
    return defaultValue;
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// final found = list.findOrDefault((e) => e == 3, -1);  // 3
// final notFound = list.findOrDefault((e) => e == 6, -1);  // -1


// 10. Extension to Get the Index of a Maximum or Minimum Value
extension MaxMinIndex<T> on List<T> {
  int? maxIndex(Comparable Function(T) compare) {
    if (isEmpty) return null;
    var max = this[0];
    var maxIndex = 0;
    for (var i = 1; i < length; i++) {
      if (compare(this[i]).compareTo(compare(max)) > 0) {
        max = this[i];
        maxIndex = i;
      }
    }
    return maxIndex;
  }

  int? minIndex(Comparable Function(T) compare) {
    if (isEmpty) return null;
    var min = this[0];
    var minIndex = 0;
    for (var i = 1; i < length; i++) {
      if (compare(this[i]).compareTo(compare(min)) < 0) {
        min = this[i];
        minIndex = i;
      }
    }
    return minIndex;
  }
}

// Usage:
// final list = [1, 3, 2, 4, 5];
// final maxIdx = list.maxIndex((x) => x);  // 4 (index of 5)
// final minIdx = list.minIndex((x) => x);  // 0 (index of 1)
// print(maxIdx);  // 4
// print(minIdx);  // 0




// 11. Extension to Merge Two Lists
extension MergeList<T> on List<T> {
  List<T> merge(List<T> other) {
    return this + other;
  }
}

// Usage:
// final list1 = [1, 2, 3];
// final list2 = [4, 5, 6];
// final merged = list1.merge(list2);  // [1, 2, 3, 4, 5, 6]


// 12. Extension to Filter Elements from a List Using Multiple Conditions
extension MultiFilterList<T> on List<T> {
  List<T> multiFilter(List<bool Function(T)> conditions) {
    return where((element) {
      return conditions.every((condition) => condition(element));
    }).toList();
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// final filtered = list.multiFilter([
//   (x) => x.isEven,
//   (x) => x > 2,
// ]);  // [4]


// 13. Extension to Remove Null Elements from a List
extension RemoveNulls<T> on List<T?> {
  List<T> removeNulls() {
    return where((element) => element != null).cast<T>().toList();
  }
}

// Usage:
// final list = [1, null, 2, null, 3];
// final cleaned = list.removeNulls();  // [1, 2, 3]


// 14. Extension to Join List Elements into a String
extension JoinList<T> on List<T> {
  String joinList(String separator) {
    return map((e) => e.toString()).join(separator);
  }
}

// Usage:
// final list = ['apple', 'banana', 'cherry'];
// final result = list.joinList(', ');  // "apple, banana, cherry"


// 15. Extension to Create a List of N Repeated Elements
extension RepeatList<T> on List<T> {
  List<T> repeat(int times) {
    return List<T>.generate(times, (index) => this[index % length]);
  }
}

// Usage:
// final list = [1, 2, 3];
// final repeated = list.repeat(5);  // [1, 2, 3, 1, 2]


// 16. Extension to Check if a List Contains Any of a Set of Values
extension ContainsAny<T> on List<T> {
  bool containsAny(List<T> elements) {
    return elements.any((element) => contains(element));
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// final contains = list.containsAny([2, 6]);  // true


// 17. Extension to Calculate the Average Value of a List of Numbers
extension AverageList on List<num> {
  double get average {
    if (isEmpty) return 0;
    return reduce((value, element) => value + element) / length;
  }
}

// Usage:
// final list = [1, 2, 3, 4, 5];
// final avg = list.average;  // 3.0


// 18. Extension to Convert a List of Strings into a Map
extension StringListToMap on List<String> {
  Map<String, int> toStringMap() {
    return {for (var str in this) str: length};
  }
}

// Usage:
// final list = ['a', 'bb', 'ccc'];
// final map = list.toStringMap();  // {'a': 1, 'bb': 2, 'ccc': 3}


// 19. Extension to Get Distinct Elements Based on a Key
extension DistinctBy<T> on Iterable<T> {
  Iterable<T> distinctBy(bool Function(T) key) {
    var seen = <dynamic>{};
    return where((item) => seen.add(key(item)));
  }
}

// Usage:
// final list = ['apple', 'banana', 'apple', 'cherry'];
// final distinct = list.distinctBy((item) => item);  // ['apple', 'banana', 'cherry']


// 20. Extension to Check if a List is Sorted
extension IsSorted<T extends Comparable> on List<T> {
  bool get isSorted {
    for (int i = 0; i < length - 1; i++) {
      if (this[i].compareTo(this[i + 1]) > 0) {
        return false;
      }
    }
    return true;
  }
}

// Usage:
// final list = [1, 2, 3, 4];
// final isSorted = list.isSorted;  // true


// 21. Extension to Convert a Map to a List of Values
extension MapToList<T, V> on Map<T, V> {
  List<V> toListOfValues() {
    return values.toList();
  }
}

// Usage:
// final map = {'a': 1, 'b': 2, 'c': 3};
// final values = map.toListOfValues();  // [1, 2, 3]


// 22. Extension to Count the Occurrences of a Character in a String
extension CountChar on String {
  int countOccurrences(String character) {
    return allMatches(character).length;
  }
}

// Usage:
// final str = 'hello world';
// final count = str.countOccurrences('o');  // 2


// 23. Extension to Convert a Map of Strings to a Map of Ints
extension MapStringToInt on Map<String, String> {
  Map<String, int> toIntMap() {
    return map((key, value) => MapEntry(key, int.tryParse(value) ?? 0));
  }
}

// Usage:
// final map = {'a': '1', 'b': '2', 'c': '3'};
// final intMap = map.toIntMap();  // {'a': 1, 'b': 2, 'c': 3}


// 24. Extension to Add a Key-Value Pair to a Map if It Doesn’t Exist
extension AddIfAbsent<K, V> on Map<K, V> {
  void addIfAbsent(K key, V Function() value) {
    if (!containsKey(key)) {
      this[key] = value();
    }
  }
}

// Usage:
// final map = {'a': 1, 'b': 2};
// map.addIfAbsent('c', () => 3);  // Adds 'c': 3
// print(map);  // {'a': 1, 'b': 2, 'c': 3}


// 25. Extension to Create a List of Numbers in a Range
extension RangeList on int {
  List<int> rangeTo(int end) {
    return List.generate(end - this + 1, (index) => this + index);
  }
}

// Usage:
// final range = 1.rangeTo(5);  // [1, 2, 3, 4, 5]


// 26. Extension to Split a String into Substrings of Fixed Length
extension SplitFixedLength on String {
  List<String> splitFixedLength(int length) {
    List<String> parts = [];
    for (var i = 0; i < this.length; i += length) {
      parts.add(substring(i, min(i + length, this.length)));
    }
    return parts;
  }
}

// Usage:
// final str = 'abcdefghij';
// final parts = str.splitFixedLength(3);  // ['abc', 'def', 'ghi', 'j']


// 27. Extension to Convert an Iterable to a List of Maps
extension ToListOfMaps<T> on Iterable<T> {
  List<Map<String, T>> toListOfMaps(String key) {
    return map((item) => {key: item}).toList();
  }
}

extension ListGenerator on int {
  /// Generates a List of values based on the number.
  List<T> generateList<T>({
    required T Function(int) itemBuilder,
  }) {
    return List.generate(this, (index) => itemBuilder(index));
  }
}
// Usage:
// final list = [1, 2, 3];
// final listOfMaps = list.toListOfMaps('number');  // [{'number': 1}, {'number': 2}, {'number': 3}]
