part of 'package:flutter_addons/flutter_addons.dart';

// Base State class for managing application state
// This class is generic and can hold any type of data.
// It provides methods for pattern matching, mapping, and checking state types.

// [ Data Layer ]
// API or Repo returns:
//     Result<T, AppError>
//         ↓
// [ State Layer ]
// Notifier maps Result to:
//     AppState<T>
//         ↓
// [ UI Layer ]
// Widget reads AppState<T>.when(...)

sealed class AppState<T> {
  const AppState();

  /// Pattern matching
  R when<R>({
    required R Function() loading,
    required R Function(T data) data,
    required R Function(AppError error) failure,
  }) {
    if (this is AppLoading<T>) return loading();
    if (this is AppData<T>) return data((this as AppData<T>).data);
    if (this is AppFailure<T>) return failure((this as AppFailure<T>).error);
    throw Exception('Unhandled state');
  }

  /// Transform data value, keep state type
  AppState<U> map<U>(U Function(T value) transform) {
    if (this is AppData<T>) {
      return AppData<U>(transform((this as AppData<T>).data));
    } else if (this is AppFailure<T>) {
      return AppFailure<U>((this as AppFailure<T>).error);
    } else {
      return AppLoading<U>();
    }
  }

  bool get isLoading => this is AppLoading<T>;
  bool get hasData => this is AppData<T>;
  bool get hasError => this is AppFailure<T>;
}

class AppLoading<T> extends AppState<T> {
  const AppLoading();
}

class AppData<T> extends AppState<T> {
  final T data;
  const AppData(this.data);

  AppData<T> copyWith({T? data}) => AppData<T>(data ?? this.data);
}

class AppFailure<T> extends AppState<T> {
  final AppError error;
  const AppFailure(this.error);
}

//Generic State Class Old method
// sealed class AppState<T> {}

// class AppLoading<T> extends AppState<T> {}

// class AppData<T> extends AppState<T> {
//   final T data;
//   AppData(this.data);
// }

// class AppFailure<T> extends AppState<T> {
//   final AppError error;
//   AppFailure(this.error);
// }

// Example usage:

// Data Layer

// Future<Result<User, AppError>> getUser() async {
//   try {
//     final data = await api.getUser();
//     return Ok(data);
//   } catch (e) {
//     return Err(handleException(e)); // convert to AppError
//   }
// }

// Notifier

// Future<void> loadUser() async {
//     state = const AppLoading();

//     final result = await repo.getUser();

//     state = result.fold(
//       (data) => AppData(data),
//       (err) => AppFailure(err),
//     );
//   }

// UI
// ref.watch(userNotifierProvider).when(
//   loading: () => const CircularProgressIndicator(),
//   data: (user) => Text('Hello ${user.name}'),
//   failure: (err) => Text('Error: ${err.error}'),
// );
