// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get loginWelcome => 'Hoş Geldiniz';

  @override
  String get loginSubtitle =>
      'Hesabınıza giriş yaparak e-atıklarınızı değerlendirin.';

  @override
  String get emailHint => 'E-posta Adresi';

  @override
  String get passwordHint => 'Şifre';

  @override
  String get forgotPassword => 'Şifremi Unuttum?';

  @override
  String get loginButton => 'Giriş Yap';

  @override
  String get orDivider => 'veya';

  @override
  String get noAccount => 'Hesabınız yok mu?';

  @override
  String get registerButton => 'Kayıt Ol';

  @override
  String get registerTitle => 'Hesap Oluştur';

  @override
  String get registerSubtitle =>
      'Aramıza katılın ve geri dönüşüm hareketinin bir parçası olun.';

  @override
  String get nameHint => 'Ad Soyad';

  @override
  String get passwordConfirmHint => 'Şifre Tekrar';

  @override
  String get haveAccount => 'Zaten hesabınız var mı?';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navMap => 'Harita';

  @override
  String get navRewards => 'Ödüller';

  @override
  String get navSell => 'Satış';

  @override
  String get homeTitle => 'Sürdürülebilir Gelecek';

  @override
  String get homeSubtitle => 'E-atıklarını değerlendir, doğaya katkı sağla';

  @override
  String get whatToDo => 'Ne yapmak istiyorsun?';

  @override
  String get profileTitle => 'Profil';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get mapTitle => 'E-Atık Noktaları';

  @override
  String get listButton => 'Liste';

  @override
  String get rewardsTitle => 'Ödüller & Puanlar';

  @override
  String get totalPoints => 'Toplam Puanım';

  @override
  String get sellTitle => 'Satış & Pazar Yeri';

  @override
  String get sellSubtitle => 'E-atıklarını sat veya bağışla';

  @override
  String get recycleTitle => 'Geri Dönüşüm';

  @override
  String get recycleQuestion => 'Hangi cihazı dönüştüreceksiniz?';

  @override
  String get recycleSubtitle => 'Cihaz türünü seçerek başlayın';

  @override
  String get devicePhone => 'Telefon';

  @override
  String get deviceLaptop => 'Laptop';

  @override
  String get deviceTablet => 'Tablet';

  @override
  String get deviceOther => 'Diğer';

  @override
  String get devicePhoneSub => 'Akıllı telefon, eski telefon';

  @override
  String get deviceLaptopSub => 'Dizüstü bilgisayar';

  @override
  String get deviceTabletSub => 'iPad, Android tablet';

  @override
  String get deviceOtherSub => 'Elektronik aksesuar';

  @override
  String get discoverTitle => 'Keşfet Sayfası (Yakında)';

  @override
  String get notificationsTitle => 'Bildirimler';

  @override
  String get eventsTab => 'Etkinlikler';

  @override
  String get educationTab => 'Eğitim';

  @override
  String get newLabel => 'YENİ';

  @override
  String get weeklyRecycleEvent => 'Haftalık Geri Dönüşüm Etkinliği';

  @override
  String get weeklyRecycleEventDesc =>
      'Bu hafta Migros Geri Dönüşüm Günü\'nde 2 kat puan kazan!';

  @override
  String get detailsButton => 'Detaylar';

  @override
  String get rewardProgramTitle => 'Ödül Programı';

  @override
  String get rewardProgramDesc =>
      '100 puana ulaştın! Hediyeni almaya hazır mısın?';

  @override
  String get claimRewardButton => 'Hediyemi Al';

  @override
  String get communityEventTitle => 'Topluluk Etkinliği';

  @override
  String get communityEventDesc =>
      'Mahallende temizlik etkinliği düzenlendi. Katılmak ister misin?';

  @override
  String get joinButton => 'Katıl';

  @override
  String get contactTitle => 'İletişim';

  @override
  String get contactUsHeader => 'Bize Ulaşın';

  @override
  String get contactUsSub =>
      'Sorularınız veya önerileriniz için aşağıdaki formu doldurabilirsiniz.';

  @override
  String get nameLabel => 'Ad Soyad';

  @override
  String get emailLabel => 'E-posta';

  @override
  String get messageLabel => 'Mesajınız';

  @override
  String get sendButton => 'Gönder';

  @override
  String get messageSentSuccess => 'Mesajınız başarıyla gönderildi!';

  @override
  String get repairTitle => 'Onar';

  @override
  String get whatDeviceToRepair => 'Hangi cihazını onarmak istiyorsun?';

  @override
  String get deviceTypeSelectSub =>
      'Cihaz türünü seç, en yakın tamirciyi bulalım';

  @override
  String get catPhone => 'Telefon';

  @override
  String get catComputer => 'Bilgisayar';

  @override
  String get catHeadphones => 'Kulaklık';

  @override
  String get catTablet => 'Tablet';

  @override
  String get catConsole => 'Konsol';

  @override
  String get catTV => 'TV';

  @override
  String get nearestShopsTitle => 'En Yakın Tamirciler';

  @override
  String get locationLabel => 'Konum';

  @override
  String get detailButton => 'Detay';

  @override
  String get shopTechnologyCenter => 'Teknoloji Merkezi';

  @override
  String get shopFastRepair => 'Hızlı Tamir';

  @override
  String get shopExpertService => 'Expert Servis';

  @override
  String timeHoursAgo(int hours) {
    return '$hours saat önce';
  }

  @override
  String timeDaysAgo(int days) {
    return '${days}g önce';
  }
}
