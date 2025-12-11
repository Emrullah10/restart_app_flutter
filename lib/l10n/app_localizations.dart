import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @loginWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get loginWelcome;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account and evaluate your e-waste.'**
  String get loginSubtitle;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get loginButton;

  /// No description provided for @orDivider.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get orDivider;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerTitle;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join us and be part of the recycling movement.'**
  String get registerSubtitle;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get nameHint;

  /// No description provided for @passwordConfirmHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get passwordConfirmHint;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get navMap;

  /// No description provided for @navRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get navRewards;

  /// No description provided for @navSell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get navSell;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Sustainable Future'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Evaluate your e-waste, contribute to nature'**
  String get homeSubtitle;

  /// No description provided for @whatToDo.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get whatToDo;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @mapTitle.
  ///
  /// In en, this message translates to:
  /// **'E-Waste Points'**
  String get mapTitle;

  /// No description provided for @listButton.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get listButton;

  /// No description provided for @rewardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rewards & Points'**
  String get rewardsTitle;

  /// No description provided for @totalPoints.
  ///
  /// In en, this message translates to:
  /// **'My Total Points'**
  String get totalPoints;

  /// No description provided for @sellTitle.
  ///
  /// In en, this message translates to:
  /// **'Sell & Marketplace'**
  String get sellTitle;

  /// No description provided for @sellSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sell or donate your e-waste'**
  String get sellSubtitle;

  /// No description provided for @recycleTitle.
  ///
  /// In en, this message translates to:
  /// **'Recycle'**
  String get recycleTitle;

  /// No description provided for @recycleQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which device to recycle?'**
  String get recycleQuestion;

  /// No description provided for @recycleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start by selecting device type'**
  String get recycleSubtitle;

  /// No description provided for @devicePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get devicePhone;

  /// No description provided for @deviceLaptop.
  ///
  /// In en, this message translates to:
  /// **'Laptop'**
  String get deviceLaptop;

  /// No description provided for @deviceTablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get deviceTablet;

  /// No description provided for @deviceOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get deviceOther;

  /// No description provided for @devicePhoneSub.
  ///
  /// In en, this message translates to:
  /// **'Smartphone, old phone'**
  String get devicePhoneSub;

  /// No description provided for @deviceLaptopSub.
  ///
  /// In en, this message translates to:
  /// **'Notebook, laptop'**
  String get deviceLaptopSub;

  /// No description provided for @deviceTabletSub.
  ///
  /// In en, this message translates to:
  /// **'iPad, Android tablet'**
  String get deviceTabletSub;

  /// No description provided for @deviceOtherSub.
  ///
  /// In en, this message translates to:
  /// **'Printer, Monitor, etc.'**
  String get deviceOtherSub;

  /// No description provided for @discoverTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover Page (Coming Soon)'**
  String get discoverTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @eventsTab.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get eventsTab;

  /// No description provided for @educationTab.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationTab;

  /// No description provided for @newLabel.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get newLabel;

  /// No description provided for @weeklyRecycleEvent.
  ///
  /// In en, this message translates to:
  /// **'Weekly Recycle Event'**
  String get weeklyRecycleEvent;

  /// No description provided for @weeklyRecycleEventDesc.
  ///
  /// In en, this message translates to:
  /// **'Earn 2x points on Migros Recycling Day this week!'**
  String get weeklyRecycleEventDesc;

  /// No description provided for @detailsButton.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailsButton;

  /// No description provided for @rewardProgramTitle.
  ///
  /// In en, this message translates to:
  /// **'Reward Program'**
  String get rewardProgramTitle;

  /// No description provided for @rewardProgramDesc.
  ///
  /// In en, this message translates to:
  /// **'You reached 100 points! Ready to claim your reward?'**
  String get rewardProgramDesc;

  /// No description provided for @claimRewardButton.
  ///
  /// In en, this message translates to:
  /// **'Claim Reward'**
  String get claimRewardButton;

  /// No description provided for @communityEventTitle.
  ///
  /// In en, this message translates to:
  /// **'Community Event'**
  String get communityEventTitle;

  /// No description provided for @communityEventDesc.
  ///
  /// In en, this message translates to:
  /// **'A cleaning event is organized in your neighborhood. Want to join?'**
  String get communityEventDesc;

  /// No description provided for @joinButton.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get joinButton;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactTitle;

  /// No description provided for @contactUsHeader.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUsHeader;

  /// No description provided for @contactUsSub.
  ///
  /// In en, this message translates to:
  /// **'You can fill out the form below for your questions or suggestions.'**
  String get contactUsSub;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name Surname'**
  String get nameLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @messageLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get messageLabel;

  /// No description provided for @sendButton.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get sendButton;

  /// No description provided for @messageSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your message has been sent successfully!'**
  String get messageSentSuccess;

  /// No description provided for @repairTitle.
  ///
  /// In en, this message translates to:
  /// **'Repair'**
  String get repairTitle;

  /// No description provided for @whatDeviceToRepair.
  ///
  /// In en, this message translates to:
  /// **'Which device do you want to repair?'**
  String get whatDeviceToRepair;

  /// No description provided for @deviceTypeSelectSub.
  ///
  /// In en, this message translates to:
  /// **'Select device type, let\'s find the nearest repair shop'**
  String get deviceTypeSelectSub;

  /// No description provided for @catPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get catPhone;

  /// No description provided for @catComputer.
  ///
  /// In en, this message translates to:
  /// **'Computer'**
  String get catComputer;

  /// No description provided for @catHeadphones.
  ///
  /// In en, this message translates to:
  /// **'Headphones'**
  String get catHeadphones;

  /// No description provided for @catTablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get catTablet;

  /// No description provided for @catConsole.
  ///
  /// In en, this message translates to:
  /// **'Console'**
  String get catConsole;

  /// No description provided for @catTV.
  ///
  /// In en, this message translates to:
  /// **'TV'**
  String get catTV;

  /// No description provided for @nearestShopsTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearest Repair Shops'**
  String get nearestShopsTitle;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @detailButton.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detailButton;

  /// No description provided for @shopTechnologyCenter.
  ///
  /// In en, this message translates to:
  /// **'Technology Center'**
  String get shopTechnologyCenter;

  /// No description provided for @shopFastRepair.
  ///
  /// In en, this message translates to:
  /// **'Fast Repair'**
  String get shopFastRepair;

  /// No description provided for @shopExpertService.
  ///
  /// In en, this message translates to:
  /// **'Expert Service'**
  String get shopExpertService;

  /// No description provided for @timeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours ago'**
  String timeHoursAgo(int hours);

  /// No description provided for @timeDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String timeDaysAgo(int days);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
