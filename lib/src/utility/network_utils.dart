part of 'package:flutter_addons/flutter_addons.dart';

/// Network Utilities Extensions for Dart & Flutter
///
/// This package contains useful extensions for IP address validation, URL checks,
/// domain extraction, port validation, and network status handling.

extension NetworkExtensions on String {
  /// Checks if the string is a valid IPv4 address
  ///
  /// Example:
  /// ```dart
  /// String ip = "192.168.1.1";
  /// print(ip.isValidIPv4); // true
  /// ```
  bool get isValidIPv4 {
    return RegExp(Patterns.validIPv4).hasMatch(this);
  }

  /// Checks if the string is a valid IPv6 address
  ///
  /// Example:
  /// ```dart
  /// String ip = "2001:db8::ff00:42:8329";
  /// print(ip.isValidIPv6); // true
  /// ```
  bool get isValidIPv6 {
    final regex = RegExp(
      r'^([0-9a-fA-F]{1,4}:){7}([0-9a-fA-F]{1,4}|:)$|^(([0-9a-fA-F]{1,4}:){1,6}:'
      r'|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}'
      r'|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}'
      r'|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}'
      r'|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}'
      r'|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))$',
    );
    return regex.hasMatch(this);
  }

  /// Checks if the string is a valid URL
  ///
  /// Example:
  /// ```dart
  /// String url = "https://www.google.com";
  /// print(url.isValidUrl); // true
  /// ```
  bool get isValidUrl {
    final regex = RegExp(Patterns.url);
    return regex.hasMatch(this);
  }

  /// Checks if the string is a valid domain name
  ///
  /// Example:
  /// ```dart
  /// String domain = "example.com";
  /// print(domain.isValidDomain); // true
  /// ```
  bool get isValidDomain {
    final regex = RegExp(Patterns.domain);
    return regex.hasMatch(this);
  }

  /// Extracts the domain name from a URL
  ///
  /// Example:
  /// ```dart
  /// String url = "https://www.google.com";
  /// print(url.extractDomain); // google.com
  /// ```
  String? get extractDomain {
    try {
      Uri uri = Uri.parse(this);
      return uri.host.isNotEmpty ? uri.host : null;
    } catch (e) {
      return null;
    }
  }

  /// Checks if the string is a valid port number (1 - 65535)
  ///
  /// Example:
  /// ```dart
  /// String port = "8080";
  /// print(port.isValidPort); // true
  /// String invalidPort = "70000";
  /// print(invalidPort.isValidPort); // false
  /// ```
  bool get isValidPort {
    final port = int.tryParse(this);
    return port != null && port > 0 && port <= 65535;
  }
}

extension NetworkStatus on InternetAddress {
  /// Checks if the given IP address is reachable by pinging
  ///
  /// Example:
  /// ```dart
  /// InternetAddress address = InternetAddress("8.8.8.8");
  /// bool reachable = await address.isReachable;
  /// print("Google DNS reachable: $reachable"); // true if online
  /// ```
  Future<bool> get isReachable async {
    try {
      final result = await Process.run('ping', ['-c', '1', address]);
      return result.exitCode == 0;
    } catch (e) {
      return false;
    }
  }
}
