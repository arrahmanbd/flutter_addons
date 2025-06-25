// Functional Programming using Flutter Addons
// *****************************************************************************
// This example demonstrates how to use Flutter Addons to create a simple user profile screen with state management, error handling, and functional programming concepts.
// It includes a model, service, repository, notifier, and UI components to display user data.
// *****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
class User {
  final String name;
  final String email;
  User({required this.name, required this.email});
}

//service

class SimpleApi {
  Future<Result<User, AppError>> getUser() async {
    try {
      await Future.delayed(const Duration(seconds: 3, milliseconds: 500));
      final data = User(name: 'John Doe', email: 'john.doe@example.com');
      return Ok(data);
    } catch (e) {
      final error = ExceptionHandler.handle(
        e is Exception ? e : Exception(e.toString()),
      );
      return Err(error); // convert to AppError
    }
  }
}

// repository
class UserRepository {
  final SimpleApi api;

  UserRepository(this.api);

  Future<Result<User, AppError>> getUser() => api.getUser();
}

//notifier
class UserNotifier extends StateNotifier<AppState<User>> {
  final UserRepository repo;

  UserNotifier(this.repo) : super(const AppLoading()) {
    loadUser();
  }

  Future<void> loadUser() async {
    final result = await repo.getUser();
    state = result.fold((data) => AppData(data), (error) => AppFailure(error));
  }
}

/// Providers
final apiProvider = Provider<SimpleApi>((ref) => SimpleApi());

final repoProvider = Provider<UserRepository>(
  (ref) => UserRepository(ref.watch(apiProvider)),
);

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, AppState<User>>(
      (ref) => UserNotifier(ref.watch(repoProvider)),
    );

// ui

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data:
            (user) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '👤 ${user.name}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text('📧 ${user.email}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        () =>
                            ref.read(userNotifierProvider.notifier).loadUser(),
                    child: const Text('Reload'),
                  ),
                ],
              ),
            ),
        failure:
            (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '❌ ${error.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed:
                        () =>
                            ref.read(userNotifierProvider.notifier).loadUser(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
