part of 'package:flutter_addons/flutter_addons.dart';
// Dart extension on num that converts a number into a currency format with a symbol, ensuring a fixed decimal length.

extension CurrencyExtension on num {
  String toDollar({int decimals = 2}) {
    return '\$${toStringAsFixed(decimals)}';
  }

  String toEuro({int decimals = 2}) {
    return '€${toStringAsFixed(decimals)}';
  }

  String toRupee({int decimals = 2}) {
    return '₹${toStringAsFixed(decimals)}';
  }

  String toPound({int decimals = 2}) {
    return '£${toStringAsFixed(decimals)}';
  }

  String toYen({int decimals = 2}) {
    return '¥${toStringAsFixed(decimals)}';
  }

  String toFranc({int decimals = 2}) {
    return 'CHF${toStringAsFixed(decimals)}';
  }

  String toWon({int decimals = 2}) {
    return '₩${toStringAsFixed(decimals)}';
  }

  String toBangladeshiTaka({int decimals = 2}) {
    return '৳${toStringAsFixed(decimals)}';
  }

  String toSaudiRiyal({int decimals = 2}) {
    return '﷼${toStringAsFixed(decimals)}';
  }

  String toMalaysianRinggit({int decimals = 2}) {
    return 'RM${toStringAsFixed(decimals)}';
  }

  String toThaiBaht({int decimals = 2}) {
    return '฿${toStringAsFixed(decimals)}';
  }

  String toCustomCurrency(String symbol, {int decimals = 2}) {
    return '$symbol${toStringAsFixed(decimals)}';
  }
}
