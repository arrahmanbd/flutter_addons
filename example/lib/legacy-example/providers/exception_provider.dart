import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ErrorMapper Provider
final errorMapperProvider = Provider<ErrorMapper>((ref) {
  return DefaultErrorMapper();
});

// API Service Class
class ApiService {
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));

    // Simulating API failure
    throw NetworkException(
      "Network error! Please check your internet connection.",
    );

    // return "Fetched Data at ${DateTime.now()}";
    // Uncomment for a successful API response
  }
}

// API Service Provider
final apiServiceProvider = Provider((ref) => ApiService());

// Data Notifier
class DataNotifier extends AsyncNotifier<String?> {
  String? _cachedData;
  late final ApiService _apiService;
  late final ErrorMapper _errorMapper;

  DataNotifier();

  @override
  Future<String?> build() async {
    _apiService = ref.read(apiServiceProvider);
    _errorMapper = ref.read(errorMapperProvider);
    ref.keepAlive();
    return _cachedData ?? await _fetchData();
  }

  Future<String?> _fetchData() async {
    try {
      final result = await _apiService.fetchData();
      _cachedData = result;
      return result;
    } catch (e, stackTrace) {
      final exception = e is Exception ? e : Exception(e.toString());
      final appException = AppException.fromError(
        exception,
        stackTrace: stackTrace,
        errorMapper: _errorMapper,
      );
      throw appException;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _fetchData());
  }
}

//Data Notifier Provider (No AutoDispose)
final dataNotifierProvider = AsyncNotifierProvider<DataNotifier, String?>(
  DataNotifier.new,
  name: 'dataNotifierProvider',
);
