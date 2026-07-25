import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/app/app.dart';
import 'package:mobile_flutter/core/network/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cookieJar = await createPersistentCookieJar();

  runApp(
    ProviderScope(
      overrides: [
        apiServiceProvider.overrideWithValue(ApiService(cookieJar: cookieJar)),
      ],
      child: const MyApp(),
    ),
  );
}
