import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:example/legacy-example/providers/exception_provider.dart';

class DataScreen extends ConsumerWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(dataNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Data Fetch Example")),
      body: Padding(
        padding: 18.p,
        child: Center(
          child: asyncData.when(
            data:
                (data) => Text(
                  data ?? "No data available",
                  style: const TextStyle(fontSize: 18),
                ),
            loading: () => const CircularProgressIndicator(),
            error:
                (error, stackTrace) => Text(
                  "Error: $error",
                  style: const TextStyle(color: Colors.red),
                ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(dataNotifierProvider.notifier).refresh(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
