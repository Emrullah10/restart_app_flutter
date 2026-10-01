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
  String get discoverTitle => 'Keşfet';

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
  String get repairTitle => 'Tamir Servisi';

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

  @override
  String get viewAll => 'Tümünü Gör';

  @override
  String get filter => 'Filtrele';

  @override
  String get details => 'Detaylar';

  @override
  String get searchHint => 'Ara...';

  @override
  String get noResults => 'Sonuç bulunamadı';

  @override
  String get markAllAsRead => 'Tümünü okundu işaretle';

  @override
  String get thisWeek => 'Bu hafta';

  @override
  String get allMarkedAsRead => 'Tüm bildirimler okundu olarak işaretlendi';

  @override
  String get appTagline => 'Teknolojiyi hayata döndür';

  @override
  String get recentActivities => 'Son Aktiviteler';

  @override
  String get mapFilterAll => 'Tümü';

  @override
  String get mapFilterRepair => 'Tamir';

  @override
  String get mapFilterSell => 'Satış';

  @override
  String get mapFilterRecycle => 'Geri Dönüşüm';

  @override
  String get sustainabilityLevelTitle => 'Sürdürülebilirlik Seviyem';

  @override
  String get sustainabilityLevelSubtitle => 'Gezegenin büyümesini izle!';

  @override
  String get levelSilver => 'Gümüş';

  @override
  String get levelGold => 'Altın';

  @override
  String get levelBronze => 'Bronz';

  @override
  String pointsToNextLevel(int points) {
    return 'Altın seviyeye $points puan kaldı';
  }

  @override
  String get pointsBreakdownRepair => 'Onarım';

  @override
  String get pointsBreakdownSell => 'Satış';

  @override
  String get pointsBreakdownRecycle => 'Dönüştürme';

  @override
  String get brandCollaborations => 'Marka İş Birlikleri';

  @override
  String get useButton => 'Kullan';

  @override
  String get insufficientPoints => 'Yetersiz puan';

  @override
  String get achievementsTitle => 'Başarılarım';

  @override
  String get achievementFirstRepair => 'İlk Onarım';

  @override
  String get achievementCompleted => 'Tamamlandı';

  @override
  String get achievementEnvironmentalist => 'Çevreci';

  @override
  String get achievementSuperSeller => 'Süper Satıcı';

  @override
  String get achievementGoldLevel => 'Altın Seviye';

  @override
  String get achievementReachPoints => '2000 puana ulaş';

  @override
  String get achievementTenRecycles => '10 dönüştürme';

  @override
  String get achievementFiftySales => '50 satış';

  @override
  String get marketplaceTitle => 'Pazar Yeri';

  @override
  String get activeListingsTitle => 'Aktif İlanlar';

  @override
  String get safeSellingTitle => 'Güvenli Satış';

  @override
  String get safeSellingDesc =>
      'Üniversiteler ve sertifikalı tamircilerle eşleşin';

  @override
  String get seeDetails => 'Detayları Gör';

  @override
  String get statusActive => 'Aktif';

  @override
  String get statusPending => 'Bekliyor';

  @override
  String get statusSold => 'Satıldı';

  @override
  String get createListingTitle => 'İlan Ver';

  @override
  String get selectCategory => 'Kategori Seçin';

  @override
  String get addPhoto => 'Fotoğraf Ekle';

  @override
  String get photoLimitNote => 'En az 1, en fazla 5 fotoğraf ekleyebilirsiniz';

  @override
  String get labelTitle => 'Başlık';

  @override
  String get hintTitle => 'Ürün başlığını yazın';

  @override
  String get labelDescription => 'Açıklama';

  @override
  String get hintDescription => 'Ürününüzün detaylarını açıklayın...';

  @override
  String get labelCondition => 'Durum';

  @override
  String get conditionNew => 'Sıfır';

  @override
  String get conditionUsed => 'İkinci El';

  @override
  String get conditionRefurbished => 'Yenilenmiş';

  @override
  String get labelPrice => 'Fiyat';

  @override
  String get negotiable => 'Pazarlık kabul ediyorum';

  @override
  String get contactInfo => 'İletişim Bilgileri';

  @override
  String get labelPhone => 'Telefon';

  @override
  String get labelCity => 'Şehir';

  @override
  String get cityIstanbul => 'İstanbul';

  @override
  String get cityAnkara => 'Ankara';

  @override
  String get cityIzmir => 'İzmir';

  @override
  String get publishButton => 'İlanı Yayınla';

  @override
  String get categoryPart => 'Parça';

  @override
  String get categoryDevice => 'Cihaz';

  @override
  String get categoryCable => 'Kablo';

  @override
  String profileReviewCount(int count) {
    return '($count değerlendirme)';
  }

  @override
  String get statTotalDevices => 'Toplam Cihaz';

  @override
  String get statPointsEarned => 'Kazanılan Puan';

  @override
  String get carbonSavingsTitle => 'Karbon Tasarrufu';

  @override
  String get carbonSavingsUnit => 'CO₂ azaltımı';

  @override
  String get leaderboardTitle => 'Topluluk Sıralaması';

  @override
  String get leaderboardYou => 'Sen';

  @override
  String leaderboardThisWeek(int rank) {
    return 'Bu hafta #$rank';
  }

  @override
  String get badgeGalleryTitle => 'Rozet Galerisi';

  @override
  String get badgeFirstRecycle => 'İlk Cihazını\nDönüştürdün';

  @override
  String get badgeThreeRepairs => '3 Cihaz Onardın';

  @override
  String get badgeRecycleExpert => 'Geri Dönüşüm\nUzmanı';

  @override
  String get badgeTenDayStreak => '10 Günlük Seri';

  @override
  String get badgeCommunityHelper => 'Toplum\nYardımcısı';

  @override
  String get badgeLocked => 'Kilidli';

  @override
  String get mockUserRole => 'Çevre dostu teknisyen';

  @override
  String get recentActivityTitle => 'Son Aktiviteler';

  @override
  String get mockActivityRepair => 'iPhone 12 Pro onardın';

  @override
  String get mockActivityBadge => 'Yeni rozet kazandın';

  @override
  String get mockActivitySavings => '5kg CO₂ tasarrufu';

  @override
  String get impactSavingsTitle => 'Bu ay tasarruf ettiğin';

  @override
  String get nearbyServicesTitle => 'Yakınındaki Hizmetler';

  @override
  String get viewOnMapButton => 'Haritada Gör';

  @override
  String distanceAway(String distance) {
    return '$distance uzaklıkta';
  }

  @override
  String leaderboardPoints(String points) {
    return '$points puan';
  }

  @override
  String get impactSummaryTitle => 'Bu ay tasarruf ettiğin';

  @override
  String get environmentalImpactTitle => 'Çevresel Etkinin';

  @override
  String get statRepairedDevices => 'Onarılan Cihaz';

  @override
  String get statPreventedWaste => 'Önlenen E-Atık';

  @override
  String get statTotalEarnings => 'Toplam Kazanç';

  @override
  String statLevel(String level) {
    return 'Level $level';
  }

  @override
  String get statEcoWarrior => 'Eco Warrior';

  @override
  String get mockServiceTechFix => 'TechFix Onarım Merkezi';

  @override
  String get mockServiceEcoPoint => 'EcoPoint Geri Dönüşüm';

  @override
  String get serviceTagsRepair => 'Telefon, Laptop, Tablet';

  @override
  String get serviceTagsRecycle => 'Tüm elektronik atıklar';

  @override
  String get actionContact => 'İletişim';

  @override
  String get actionGetDirections => 'Yol Tarifi';

  @override
  String get homeActionRepair => 'Onar';

  @override
  String get homeActionRepairSub => 'Cihazını\ntamir ettir';

  @override
  String get homeActionSell => 'Sat';

  @override
  String get homeActionSellSub => 'İkinci el\nsat';

  @override
  String get homeActionRecycle => 'Dönüştür';

  @override
  String get homeActionRecycleSub => 'Geri\ndönüştür';

  @override
  String get settingsAppearanceLanguage => 'Görünüm ve Dil';

  @override
  String get settingsAccount => 'Hesap';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get logoutConfirmTitle => 'Çıkış Yap';

  @override
  String get logoutConfirmMessage =>
      'Çıkış yapmak istediğinizden emin misiniz?';

  @override
  String get cancel => 'Vazgeç';

  @override
  String get themeTitle => 'Tema';

  @override
  String get themeLight => 'Açık Tema';

  @override
  String get themeDark => 'Koyu Tema';

  @override
  String get themeSystem => 'Sistem Varsayılanı';

  @override
  String get languageTitle => 'Dil';

  @override
  String get createNewListing => 'Yeni İlan Ver';

  @override
  String get sellUnusedItems => 'Kullanmadığın parçaları sat';

  @override
  String get createListingButton => 'İlan Oluştur';

  @override
  String get brandName => 'ReStart';

  @override
  String get navHomeLabel => 'Ana Sayfa';

  @override
  String get navMapLabel => 'Harita';

  @override
  String get navRecycleLabel => 'Dönüştür';

  @override
  String get navSellLabel => 'Sat';

  @override
  String get navRewardsLabel => 'Ödüller';

  @override
  String get commonLoading => 'Yükleniyor…';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonError => 'Bir şeyler ters gitti.';

  @override
  String get commonComingSoon => 'Yakında';

  @override
  String get commonAll => 'Tümünü Gör';

  @override
  String get commonUnitKg => 'kg';

  @override
  String get commonUnitKm => 'km';

  @override
  String get commonPoints => 'Puan';

  @override
  String get commonPointsLower => 'puan';

  @override
  String get commonPieces => 'adet';

  @override
  String get passwordStrengthIdle => 'Şifre gücü';

  @override
  String get passwordWeak => 'Zayıf';

  @override
  String get passwordFair => 'Orta';

  @override
  String get passwordGood => 'İyi';

  @override
  String get passwordStrong => 'Güçlü';

  @override
  String get levelNew => 'Yeni';

  @override
  String get levelCurious => 'Meraklı';

  @override
  String get levelAware => 'Duyarlı';

  @override
  String get levelConscious => 'Bilinçli';

  @override
  String get levelPioneer => 'Öncü';

  @override
  String get levelChampion => 'Şampiyon';

  @override
  String get tierBronze => 'Bronz';

  @override
  String get tierSilver => 'Gümüş';

  @override
  String get tierGold => 'Altın';

  @override
  String get loginTitle => 'Tekrar hoş geldiniz';

  @override
  String get loginSub => 'Devam etmek için lütfen giriş yapın.';

  @override
  String get loginEmailLabel => 'E-POSTA';

  @override
  String get loginPasswordLabel => 'ŞİFRE';

  @override
  String get loginEmailPh => 'ornek@email.com';

  @override
  String get loginForgot => 'Şifremi unuttum';

  @override
  String get loginAction => 'GİRİŞ YAP';

  @override
  String get loginNoAccount => 'Hesabınız yok mu?';

  @override
  String get loginRegister => 'Kayıt Ol';

  @override
  String get authFillAll => 'Lütfen tüm alanları doldurun.';

  @override
  String get authMismatch => 'Şifreler eşleşmiyor.';

  @override
  String get authTermsRequired =>
      'Devam etmek için şartları kabul etmelisiniz.';

  @override
  String get regTitle => 'Hesap oluşturun';

  @override
  String get regSub => 'ReStart topluluğuna katılın.';

  @override
  String get regName => 'AD SOYAD';

  @override
  String get regNamePh => 'Örn: Ahmet Yılmaz';

  @override
  String get regEmail => 'E-POSTA';

  @override
  String get regPassword => 'ŞİFRE';

  @override
  String get regPasswordPh => 'En az 8 karakter';

  @override
  String get regConfirm => 'ŞİFRE TEKRAR';

  @override
  String get regConfirmPh => 'Şifrenizi onaylayın';

  @override
  String get regTermsPre => 'Kullanım Koşulları';

  @override
  String get regTermsMid => ' ve ';

  @override
  String get regTermsPost => '\'nı kabul ediyorum.';

  @override
  String get regPrivacy => 'Gizlilik Politikası';

  @override
  String get regAction => 'Kayıt Ol';

  @override
  String get regHave => 'Zaten hesabınız var mı?';

  @override
  String get regLogin => 'Giriş yapın';

  @override
  String homeGreeting(String name) {
    return 'Merhaba $name';
  }

  @override
  String get homeSub => 'Güncel çevresel etkin ve aktivitelerin.';

  @override
  String get homeImpact => 'ÇEVRESEL ETKİ';

  @override
  String get homeCo2 => 'CO₂ Tasarrufu Sağlandı';

  @override
  String get homeRepair => 'Tamir Et';

  @override
  String get homeSell => 'Sat';

  @override
  String get homeRecycle => 'Geri Dönüştür';

  @override
  String get homePoints => 'Kazanılan Puan';

  @override
  String get homeListings => 'Aktif İlanlar';

  @override
  String get homeRecent => 'Son Aktiviteler';

  @override
  String get homeNoActivity => 'Henüz aktivite yok.';

  @override
  String get menuTitle => 'Menü';

  @override
  String get menuProfile => 'Profil';

  @override
  String get menuDiscover => 'Keşfet';

  @override
  String get menuRepair => 'Tamir';

  @override
  String get menuNotifications => 'Bildirimler';

  @override
  String get menuSettings => 'Ayarlar';

  @override
  String get menuContact => 'İletişim';

  @override
  String get discoverSearch => 'Cihaz, kategori veya nokta ara...';

  @override
  String get discoverCategories => 'KATEGORİLER';

  @override
  String get discoverPhone => 'Telefon';

  @override
  String get discoverLaptop => 'Bilgisayar';

  @override
  String get discoverTablet => 'Tablet';

  @override
  String get discoverOther => 'Diğer';

  @override
  String get discoverFeatured => 'ÖNE ÇIKANLAR';

  @override
  String get discoverNearby => 'YAKINDAKİ NOKTALAR';

  @override
  String get discoverPromo1Tag => 'Onarım Kampanyası';

  @override
  String get discoverPromo1Title => 'Ekran Değişimi';

  @override
  String get discoverPromo1Sub => '%20\'ye varan geri dönüşüm indirimi';

  @override
  String get discoverPromo2Tag => 'Satış Fırsatı';

  @override
  String get discoverPromo2Title => 'Eski Cihazını Sat';

  @override
  String get discoverPromo2Sub => 'Anında değerleme ve nakit ödeme';

  @override
  String get discoverPromo3Title => 'Dönüşüm Raporu';

  @override
  String get discoverPromo3Sub => 'Aylık çevresel etkinizi görün';

  @override
  String get mapOpen => 'Açık';

  @override
  String get mapClosed => 'Kapalı';

  @override
  String get mapLocate => 'Konumum';

  @override
  String get mapNoPermission => 'Konum izni verilmedi.';

  @override
  String get marketTitle => 'Pazaryeri';

  @override
  String get marketSafeTitle => 'Güvenli Satış Sistemi';

  @override
  String get marketSafeBody =>
      'ReStart üzerinden yapılan tüm satışlar %100 alıcı koruması altındadır. Ödemeniz, ürün alıcıya ulaştıktan sonra hesabınıza aktarılır.';

  @override
  String get marketMore => 'DAHA FAZLA BİLGİ EDİN';

  @override
  String get marketSearch => 'İkinci el ürün ara...';

  @override
  String get marketActive => 'AKTİF İLANLAR';

  @override
  String get marketPending => 'BEKLEYEN SATIŞ';

  @override
  String get marketOps => 'işlem';

  @override
  String get marketForYou => 'Sana Özel Öneriler';

  @override
  String get marketEmpty => 'Bu kategoride ürün bulunamadı';

  @override
  String get catAll => 'Tümü';

  @override
  String get catLaptop => 'Bilgisayar';

  @override
  String get catAccessory => 'Aksesuar';

  @override
  String get listingTitle => 'İlan Oluştur';

  @override
  String listingPhotos(String count) {
    return 'FOTOĞRAFLAR ($count/5)';
  }

  @override
  String get listingCover => 'Kapak';

  @override
  String get listingPhotoHint =>
      'Net ve aydınlık fotoğraflar satışı hızlandırır.';

  @override
  String get listingTitleLabel => 'İLAN BAŞLIĞI';

  @override
  String get listingTitlePh => 'Örn: Sorunsuz 2. El Çamaşır Makinesi';

  @override
  String get listingCategory => 'KATEGORİ';

  @override
  String get listingCategoryPh => 'Kategori Seçin';

  @override
  String get listingDescription => 'AÇIKLAMA';

  @override
  String get listingDescriptionPh =>
      'Ürünün durumu, kusurları ve teknik özellikleri hakkında bilgi verin.';

  @override
  String get listingPrice => 'FİYAT (TL)';

  @override
  String get listingLocation => 'KONUM';

  @override
  String get listingLocationPh => 'Şehir, İlçe';

  @override
  String get listingTipsTitle => 'Güvenli Satış İpuçları';

  @override
  String get listingTipsBody =>
      'Kişisel bilgilerinizi açıklamaktan kaçının ve teslimatları güvenli, halka açık alanlarda yapmayı tercih edin.';

  @override
  String get listingPublish => 'İlanı Yayınla';

  @override
  String get listingSuccess => 'İlanınız yayınlandı!';

  @override
  String get listingFailed => 'İlan yayınlanamadı. Lütfen tekrar deneyin.';

  @override
  String get listingCamera => 'Kamera';

  @override
  String get listingGallery => 'Galeri';

  @override
  String get listingPhotoTitle => 'Fotoğraf ekle';

  @override
  String get repairSub =>
      'Cihazınızı hayata döndürerek karbon ayak izinizi azaltın.';

  @override
  String get repairEcoTitle => 'Tamir en çevreci seçenek';

  @override
  String get repairEcoBody =>
      'Yeni bir cihaz üretimi yerine mevcut cihazı onarmak, ortalama bir akıllı telefon için doğaya salınan e-atık miktarını ve karbon emisyonunu %80 oranında engeller.';

  @override
  String get repairServices => 'HİZMET SEÇİMİ';

  @override
  String get repairScreen => 'Ekran & Cam';

  @override
  String get repairScreenSub => 'Orijinal veya A Kalite';

  @override
  String get repairBattery => 'Batarya';

  @override
  String get repairBatterySub => 'Garantili Değişim';

  @override
  String get repairBoard => 'Anakart Onarımı';

  @override
  String get repairBoardSub => 'Mikro lehimleme ve çip değişimi işlemleri.';

  @override
  String get repairNearby => 'YAKINDAKİ SERVİSLER';

  @override
  String recStep(String n) {
    return 'ADIM $n / 3';
  }

  @override
  String get recStepDevice => 'Cihaz Seçimi';

  @override
  String get recQuestion => 'Hangi cihazı geri dönüştürüyorsunuz?';

  @override
  String get recQuestionSub =>
      'Seçtiğiniz cihaz türü, uygun geri dönüşüm tesislerini bulmamıza yardımcı olacaktır.';

  @override
  String get recPhone => 'Telefon';

  @override
  String get recPhoneSub => 'Akıllı telefonlar, tuşlu telefonlar';

  @override
  String get recLaptop => 'Dizüstü';

  @override
  String get recLaptopSub => 'Laptoplar, netbooklar';

  @override
  String get recTablet => 'Tablet';

  @override
  String get recTabletSub => 'Tablet bilgisayarlar, e-okuyucular';

  @override
  String get recOther => 'Diğer';

  @override
  String get recOtherSub => 'Aksesuarlar, küçük ev aletleri';

  @override
  String get recContinue => 'Devam Et';

  @override
  String get recDetailsTitle => 'Cihaz Detayları';

  @override
  String get recDetailsSub => 'Değerleme için lütfen doğru bilgileri girin.';

  @override
  String get recStepCategory => 'Kategori';

  @override
  String get recStepDetails => 'Detaylar';

  @override
  String get recStepConfirm => 'Onay';

  @override
  String get recBrand => 'Marka';

  @override
  String get recBrandPh => 'Örn: Apple, Samsung...';

  @override
  String get recModel => 'Model / Yıl';

  @override
  String get recModelPh => 'Örn: iPhone 12, 2021';

  @override
  String get recCondition => 'Cihaz Durumu';

  @override
  String get recWorking => 'Çalışıyor';

  @override
  String get recWorkingSub => 'Tüm fonksiyonları aktif.';

  @override
  String get recDamaged => 'Hafif Hasarlı';

  @override
  String get recDamagedSub => 'Çizik veya ufak kusurlar.';

  @override
  String get recBroken => 'Çalışmıyor';

  @override
  String get recBrokenSub => 'Açılmıyor veya ağır hasarlı.';

  @override
  String get recWeight => 'Tahmini Ağırlık (kg)';

  @override
  String get recDelivery => 'Teslimat Yöntemi';

  @override
  String get recDropoff => 'Noktaya Bırak';

  @override
  String get recCourier => 'Kurye Çağır';

  @override
  String get recCenter => 'En Yakın Merkez';

  @override
  String get recCenterPh => 'Merkez seçin';

  @override
  String get recEstimate => 'TAHMİNİ KAZANÇ';

  @override
  String recCourierBonus(String bonus) {
    return 'Elektrikli kuryeyle +$bonus';
  }

  @override
  String get recSubmit => 'Talebi Oluştur';

  @override
  String get recFailed => 'Talep gönderilemedi. Lütfen tekrar deneyin.';

  @override
  String get recPickCenter => 'Lütfen bir geri dönüşüm merkezi seçin.';

  @override
  String get courierTitle => 'Kurye Seç';

  @override
  String get courierSub =>
      'Dönüştürülecek eşyalarınız için uygun aracı belirleyin.';

  @override
  String get courierElectric => 'ELEKTRİK';

  @override
  String get courierZero => 'Sıfır Emisyon Teslimatı';

  @override
  String get courierSelect => 'Seç';

  @override
  String get courierCargo => 'Kargo Aracı';

  @override
  String get courierHeavy => 'Ağır Yük';

  @override
  String courierEta(String min) {
    return '~$min dk';
  }

  @override
  String get doneTitle => 'Talebiniz alındı';

  @override
  String get doneEarned => 'KAZANILAN ÖDÜL';

  @override
  String doneCo2(String kg) {
    return '$kg kg CO₂ tasarrufu sağladınız';
  }

  @override
  String get doneCert => 'Sıfır Atık Sertifikalı';

  @override
  String get doneHome => 'ANA SAYFAYA DÖN';

  @override
  String get rewTitle => 'Etkiniz';

  @override
  String get rewSub => 'Çevresel katkınızı takip edin ve ödüllerinizi alın.';

  @override
  String get rewHistory => 'Kullanım Geçmişi';

  @override
  String get rewBalance => 'KULLANILABİLİR EKO-PUAN';

  @override
  String get rewRecycled => 'Geri Dönüşüm';

  @override
  String get rewRepaired => 'Onarım';

  @override
  String get rewSold => 'Satış';

  @override
  String get rewTier => 'Seviye';

  @override
  String get rewTop => 'EN ÇOK KATKI SAĞLAYANLAR';

  @override
  String get rewYou => 'Siz';

  @override
  String get rewAchievements => 'Başarımlar';

  @override
  String get rewCatalog => 'Ödül Kataloğu';

  @override
  String get rewUse => 'Kullan';

  @override
  String get rewNone => 'Şu anda kullanılabilir ödül yok';

  @override
  String get rewDigital => 'Dijital';

  @override
  String get rewTransit => 'Ulaşım';

  @override
  String get rewService => 'Hizmet';

  @override
  String get rewEco => 'Doğa';

  @override
  String get rewRedeemed => 'Ödül kullanıldı';

  @override
  String get rewFailed => 'Ödül kullanılamadı';

  @override
  String get profVerified => 'Doğrulanmış Üye';

  @override
  String get profTotal => 'TOPLAM İŞLEM';

  @override
  String get profCo2 => 'CO₂ TASARRUFU (KG)';

  @override
  String get profSold => 'SATILAN ÜRÜN';

  @override
  String get profRepaired => 'ONARILAN ÜRÜN';

  @override
  String get profImpact => 'Etki Karnesi';

  @override
  String profOps(String n) {
    return '$n İşlem';
  }

  @override
  String get profRecent => 'Son İşlemler';

  @override
  String profPointsGain(String n) {
    return '+$n Puan';
  }

  @override
  String get notifTitle => 'Bildirimler';

  @override
  String get notifMarkAll => 'TÜMÜNÜ OKUNDU İŞARETLE';

  @override
  String get notifToday => 'BUGÜN';

  @override
  String get notifYesterday => 'DÜN';

  @override
  String get notifOlder => 'DAHA ESKİ';

  @override
  String get notifEmpty => 'Henüz bildiriminiz yok';

  @override
  String get notifEmptySub => 'Yeni etkinlikler burada görünecek.';

  @override
  String get setTitle => 'Ayarlar';

  @override
  String get setAppearance => 'GÖRÜNÜM';

  @override
  String get setTheme => 'Tema';

  @override
  String get setLight => 'Açık';

  @override
  String get setDark => 'Koyu';

  @override
  String get setSystem => 'Sistem';

  @override
  String get setLanguage => 'Dil';

  @override
  String get setAccount => 'HESAP';

  @override
  String get setProfile => 'Profil';

  @override
  String get setPassword => 'Şifre';

  @override
  String get setNotifs => 'Bildirimler';

  @override
  String get setSecurity => 'GÜVENLİK';

  @override
  String get setSession => 'Oturum Güvenliği';

  @override
  String get setActive => 'Aktif';

  @override
  String get setAbout => 'HAKKINDA';

  @override
  String get setTerms => 'Koşullar';

  @override
  String get setPrivacy => 'Gizlilik';

  @override
  String get setVersion => 'Sürüm';

  @override
  String get setLogout => 'Çıkış Yap';

  @override
  String get contactHeadline => 'Size nasıl yardımcı olabiliriz?';

  @override
  String get contactBody =>
      'Geri dönüşüm, onarım veya ödül programı hakkında sorularınız için formu doldurun veya doğrudan bizimle iletişime geçin.';

  @override
  String get contactSend => 'Mesaj Gönder';

  @override
  String get contactName => 'Ad Soyad';

  @override
  String get contactNamePh => 'Adınız Soyadınız';

  @override
  String get contactEmail => 'E-posta';

  @override
  String get contactEmailPh => 'ornek@eposta.com';

  @override
  String get contactMessage => 'Mesajınız';

  @override
  String get contactMax => 'Max 1000 karakter';

  @override
  String get contactMessagePh => 'Size nasıl yardımcı olabiliriz?';

  @override
  String get contactSubmit => 'GÖNDER';

  @override
  String get contactChannels => 'ALTERNATİF KANALLAR';

  @override
  String get contactEmailChannel => 'E-POSTA';

  @override
  String get contactPhoneChannel => 'TELEFON (7/24)';

  @override
  String get contactSent => 'Mesajınız iletildi.';

  @override
  String get contactFailed => 'Mesaj gönderilemedi.';

  @override
  String get pwHint => 'Hesabınızı korumak için güçlü bir şifre seçin.';

  @override
  String get pwCurrent => 'MEVCUT ŞİFRE';

  @override
  String get pwNew => 'YENİ ŞİFRE';

  @override
  String get pwSave => 'ŞİFREYİ GÜNCELLE';

  @override
  String get pwChanged => 'Şifreniz güncellendi.';

  @override
  String get pwTooShort => 'Yeni şifre en az 8 karakter olmalı.';

  @override
  String get prefHint => 'Hangi türde bildirim almak istediğinizi seçin.';

  @override
  String get prefRecycle => 'Geri dönüşüm';

  @override
  String get prefRecycleSub => 'Teslimat ve puan bildirimleri';

  @override
  String get prefMarket => 'Pazaryeri';

  @override
  String get prefMarketSub => 'İlan ve satış güncellemeleri';

  @override
  String get prefRewards => 'Ödüller';

  @override
  String get prefRewardsSub => 'Yeni ödül ve seviye bildirimleri';

  @override
  String get prefSystem => 'Sistem';

  @override
  String get prefSystemSub => 'Bakım ve duyurular';
}
