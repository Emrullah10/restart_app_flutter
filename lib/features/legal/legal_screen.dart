import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/shared/design_system/rs_bars.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

// DRAFT legal text — must be reviewed/approved by the company's legal counsel before launch.
const _tr = {
  'terms': ('Hizmet Şartları', [
    ('Hizmetin kapsamı', 'TeknoLup; elektronik cihazların onarımı, ikinci el satışı ve geri dönüşümü için kullanıcıları servis noktaları ve diğer kullanıcılarla buluşturan bir platformdur.'),
    ('Hesap ve güvenlik', 'Hesap bilgilerinizin doğruluğundan ve şifrenizin gizliliğinden siz sorumlusunuz. Yetkisiz kullanımı fark ettiğinizde bizi bilgilendirmelisiniz.'),
    ('İlanlar ve satışlar', 'İlan içeriklerinin doğruluğu ve yasal olması satıcının sorumluluğundadır. Yasaklı veya yanıltıcı ilanlar kaldırılabilir.'),
    ('Geri dönüşüm ve ödüller', 'Puanlar yalnızca platform içinde geçerlidir; nakde çevrilemez. Kötüye kullanım tespit edilirse puanlar iptal edilebilir.'),
    ('Değişiklikler', 'Şartlar güncellenebilir; önemli değişiklikler uygulama içinden duyurulur.'),
  ]),
  'privacy': ('Gizlilik Politikası', [
    ('Topladığımız veriler', 'Ad, e-posta, ilan ve işlem bilgileri ile (izin verirseniz) yaklaşık konumunuz işlenir.'),
    ('Kullanım amaçları', 'Hesabınızı yönetmek, size yakın noktaları göstermek, işlemleri ve ödülleri hesaplamak ve hizmeti geliştirmek.'),
    ('Konum', 'Konum yalnızca yakındaki noktaları göstermek için kullanılır; izin vermezseniz uygulama çalışmaya devam eder.'),
    ('Paylaşım ve saklama', 'Verileriniz yasal zorunluluklar dışında üçüncü kişilerle satılmaz. Hesabınız silindiğinde verileriniz makul sürede silinir.'),
    ('Haklarınız', 'KVKK kapsamında verilerinize erişme, düzeltme ve silinmesini isteme hakkına sahipsiniz. Başvuru: destek@teknolup.com'),
  ]),
};
const _en = {
  'terms': ('Terms of Service', [
    ('Scope of service', 'TeknoLup connects users with service points and other users for repairing, reselling and recycling electronic devices.'),
    ('Account and security', 'You are responsible for the accuracy of your account details and the confidentiality of your password. Tell us if you notice unauthorised use.'),
    ('Listings and sales', 'Sellers are responsible for the accuracy and legality of their listings. Prohibited or misleading listings may be removed.'),
    ('Recycling and rewards', 'Points are valid only inside the platform and cannot be converted to cash. Points may be cancelled if abuse is detected.'),
    ('Changes', 'These terms may be updated; significant changes are announced in the app.'),
  ]),
  'privacy': ('Privacy Policy', [
    ('Data we collect', 'Name, email, listing and transaction data and, if you allow it, your approximate location.'),
    ('How we use it', 'To manage your account, show nearby points, calculate transactions and rewards, and improve the service.'),
    ('Location', 'Location is used only to show nearby points; the app keeps working if you decline.'),
    ('Sharing and retention', 'We do not sell your data to third parties except where legally required. When your account is deleted your data is removed within a reasonable time.'),
    ('Your rights', 'You may access, correct or request deletion of your data. Contact: destek@teknolup.com'),
  ]),
};

class LegalScreen extends StatelessWidget {
  final String kind;
  const LegalScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final doc = (context.isTr ? _tr : _en)[kind] ?? (context.isTr ? _tr : _en)['terms']!;
    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsAppBar(leading: RsBarButton(Icons.arrow_back_rounded, color: t.accent, onTap: () => context.canPop() ? context.pop() : context.go('/')), centerTitle: Text(doc.$1, style: AppType.headingMd.copyWith(color: t.fg))),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(padding: const EdgeInsets.all(24), children: [
            Text(doc.$1, style: AppType.displayLgMobile.copyWith(color: t.fg)),
            const SizedBox(height: 24),
            for (var i = 0; i < doc.$2.length; i++) ...[
              Text('${i + 1}. ${doc.$2[i].$1}', style: AppType.headingMd.copyWith(color: t.fg)),
              const SizedBox(height: 8),
              Text(doc.$2[i].$2, style: AppType.bodyMd.copyWith(color: t.fg2)),
              const SizedBox(height: 24),
            ],
          ]),
        ),
      ),
    );
  }
}
