// Visual preview harness: runs the real app against a fake API and lets a script switch
// route / theme / language through a command file (used to capture screenshots).
//   flutter run -d <sim> -t tool/preview_main.dart --dart-define=CMD=/tmp/restart_preview.cmd
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/app/app.dart';
import 'package:mobile_flutter/app/router/app_router.dart';
import 'package:mobile_flutter/core/localization/localization_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/utils/geo.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:mobile_flutter/core/theme/theme_provider.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';

const _cmdPath = String.fromEnvironment('CMD', defaultValue: '/tmp/restart_preview.cmd');

String _ago(Duration d) => DateTime.now().subtract(d).toUtc().toIso8601String();

class FakeApi implements IApiService {
  @override
  Future<Map<String, dynamic>?> getCurrentUser() async => {'id': 'u1', 'email': 'ahmet.yilmaz@example.com', 'fullName': 'Ahmet Yılmaz'};
  @override
  Future<Map<String, dynamic>> getUserProfile(String userId) async => {'fullName': 'Ahmet Yılmaz', 'stats': {'totalPoints': 1250, 'co2Saved': 24.5, 'repairedCount': 5, 'preventedWasteKg': 18, 'totalEarnings': 850}};
  @override
  Future<List<dynamic>> getActivities(String userId, {int limit = 10}) async => [
        {'activityType': 'sell', 'title': 'iPhone 11 Satışı', 'pointsEarned': 0, 'amountEarned': 4500, 'createdAt': _ago(const Duration(hours: 2))},
        {'activityType': 'recycle', 'title': 'Elektronik Atık Teslimi', 'pointsEarned': 50, 'amountEarned': 0, 'createdAt': _ago(const Duration(days: 2))},
        {'activityType': 'repair', 'title': 'Telefon Ekran Değişimi', 'pointsEarned': 0, 'amountEarned': 850, 'createdAt': _ago(const Duration(days: 9))},
      ];
  @override
  Future<Map<String, dynamic>> getLeaderboard({String? userId, int limit = 3}) async => {
        'topUsers': [{'rank': 1, 'fullName': 'A. Demir', 'totalPoints': 32000}, {'rank': 2, 'fullName': 'B. Kaya', 'totalPoints': 28000}, {'rank': 3, 'fullName': 'M. Yılmaz', 'totalPoints': 24000}],
        'currentUser': {'rank': 12, 'fullName': 'Ahmet Yılmaz', 'totalPoints': 1250},
      };
  @override
  Future<List<dynamic>> getUserBadges(String userId) async => [
        {'name': 'İlk Adım', 'icon': 'star', 'isUnlocked': true}, {'name': 'Kahraman', 'icon': 'recycle', 'isUnlocked': true}, {'name': 'Tamirci', 'icon': 'wrench', 'isUnlocked': true},
        {'name': 'Puan Avcısı', 'icon': 'flame', 'isUnlocked': false}, {'name': 'Çevre Dostu', 'icon': 'leaf', 'isUnlocked': false}, {'name': 'Şampiyon', 'icon': 'trophy', 'isUnlocked': false},
      ];
  @override
  Future<List<dynamic>> getUserListings(String userId) async => [
        {'id': 'l1', 'title': 'iPhone 11 128GB', 'description': 'Batarya %88', 'price': 9500, 'status': 'active', 'images': []},
        {'id': 'l2', 'title': 'Dell XPS 13', 'description': 'i7', 'price': 14200, 'status': 'active', 'images': []},
        {'id': 'l3', 'title': 'Watch Series 6', 'description': 'Teslim edildi', 'price': 2100, 'status': 'sold', 'images': []},
      ];
  @override
  Future<List<dynamic>> getProducts({String? category, int? limit}) async => [
        {'id': 'p1', 'title': 'Mekanik Klavye', 'description': 'İyi durumda, kutulu', 'price': 2450, 'rating': 4.8, 'location': 'Kadıköy, İstanbul', 'category': 'accessory'},
        {'id': 'p2', 'title': 'iPad Air 4 64GB', 'description': 'Wi-Fi, kutulu', 'price': 12500, 'rating': 4.9, 'location': 'Beşiktaş, İstanbul', 'category': 'tablet'},
        {'id': 'p3', 'title': 'Anakart (iPhone 12)', 'description': 'Test edilmiş, sorunsuz', 'price': 1200, 'rating': 4.5, 'location': 'Kargo ile Gönderim', 'category': 'phone'},
      ];
  @override
  Future<List<dynamic>> getRewards() async => [
        {'id': 'r1', 'title': 'Kargo Bedava', 'subtitle': 'Bir sonraki alışverişinizde ücretsiz gönderim kazanın.', 'pointsCost': 500},
        {'id': 'r2', 'title': 'Tamir İndirimi', 'subtitle': 'Partner servislerimizde %20 onarım indirimi.', 'pointsCost': 1000},
        {'id': 'r3', 'title': 'Ağaç Bağışı', 'subtitle': 'Adınıza bir fidan dikilmesini sağlayın.', 'pointsCost': 2000},
      ];
  @override
  Future<List<dynamic>> getServices({String? type}) async {
    final all = [
      {'id': 's1', 'name': 'Tekno Servis Kadıköy', 'type': 'repair', 'rating': 4.8, 'tags': ['Telefon'], 'address': 'Osmanağa Mah.', 'latitude': 40.99, 'longitude': 29.03},
      {'id': 's2', 'name': 'Yeşil Nokta', 'type': 'recycle', 'rating': 4.5, 'tags': ['Plastik', 'Kağıt', 'Cam'], 'address': 'Belediye atık toplama tesisi', 'latitude': 41.01, 'longitude': 28.97},
      {'id': 's3', 'name': 'İkinci El Pazarı', 'type': 'sell', 'rating': 4.2, 'tags': [], 'address': 'Mobilya ve ev aletleri alım satım', 'latitude': 41.03, 'longitude': 28.99},
      {'id': 's4', 'name': 'Mobil Tamir Merkezi', 'type': 'repair', 'rating': 4.6, 'tags': [], 'address': 'Moda', 'latitude': 40.98, 'longitude': 29.02},
    ];
    return type == null ? all : all.where((e) => e['type'] == type).toList();
  }
  @override
  Future<List<dynamic>> findCouriers(double lat, double lng) async => [
        {'full_name': 'Mehmet K.', 'distance_meters': 1200, 'is_electric': true},
        {'full_name': 'Ali D.', 'distance_meters': 2100, 'is_electric': false},
      ];
  @override
  Future<List<dynamic>> getNotifications(String userId) async => [
        {'id': 'n1', 'type': 'recycle', 'title': 'Geri Dönüşüm İşlemi Onaylandı', 'body': '2 adet elektronik atık teslimatınız başarıyla doğrulandı. Puanlarınız hesabınıza yansıtılmıştır.', 'isRead': false, 'createdAt': _ago(const Duration(hours: 1))},
        {'id': 'n2', 'type': 'sell', 'title': 'İlanınız Yayında', 'body': '"Yenilenmiş Ofis Sandalyesi" başlıklı ilanınız incelendi ve platformda yayımlandı.', 'isRead': false, 'createdAt': _ago(const Duration(hours: 2))},
        {'id': 'n3', 'type': 'reward', 'title': 'Yeni Ödül Kilidi Açıldı', 'body': 'Tebrikler! Çevre dostu kahve dükkanlarında geçerli %15 indirim kuponu kazandınız.', 'isRead': true, 'createdAt': _ago(const Duration(days: 1))},
        {'id': 'n4', 'type': 'general', 'title': 'Sistem Güncellemesi', 'body': 'Platformumuzda performans iyileştirmeleri yapıldı.', 'isRead': true, 'createdAt': _ago(const Duration(days: 1, hours: 5))},
      ];
  @override
  Future<Map<String, dynamic>> logRecycle(Map<String, dynamic> data) async => {'totalPoints': 8, 'bonusPoints': 3};
  @override
  Future<void> logout() async {}
  @override
  Future<bool> sendContactMessage(Map<String, dynamic> data) async => true;
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError('${invocation.memberName}');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(overrides: [
    apiServiceProvider.overrideWithValue(FakeApi()),
    userLocationProvider.overrideWith((ref) async => Position(latitude: 41.0082, longitude: 28.9784, timestamp: DateTime.now(), accuracy: 10, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0)),
  ]);
  String? last;
  Timer.periodic(const Duration(milliseconds: 600), (_) async {
    try {
      final f = File(_cmdPath);
      if (!f.existsSync()) return;
      final cmd = f.readAsStringSync().trim();
      if (cmd.isEmpty || cmd == last) return;
      last = cmd;
      final parts = cmd.split('|'); // route|theme|lang
      await container.read(themeProvider.notifier).setTheme(parts[1] == 'dark' ? ThemeMode.dark : ThemeMode.light);
      await container.read(localeProvider.notifier).setLocale(Locale(parts.length > 2 ? parts[2] : 'tr'));
      var route = parts[0];
      if (route.startsWith('guest:')) {
        route = route.substring(6);
        await container.read(authViewModelProvider.notifier).logout();
      } else if (container.read(authViewModelProvider).valueOrNull == null) {
        container.invalidate(authViewModelProvider);
        await container.read(authViewModelProvider.future);
      }
      container.read(goRouterProvider).go(route);
    } catch (e) {
      debugPrint('preview cmd error: $e');
    }
  });
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}
