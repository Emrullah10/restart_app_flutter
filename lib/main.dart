import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/app/app.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/storage/token_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final apiService = ApiService(tokenStorage: SecureTokenStorage());
  await apiService.restoreSession();

  runApp(
    ProviderScope(
      overrides: [apiServiceProvider.overrideWithValue(apiService)],
      child: const MyApp(),
    ),
  );
}
