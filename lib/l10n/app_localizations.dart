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

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Bring technology back to life'**
  String get appTagline;

  /// No description provided for @recentActivities.
  ///
  /// In en, this message translates to:
  /// **'Recent Activities'**
  String get recentActivities;

  /// No description provided for @mapFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get mapFilterAll;

  /// No description provided for @mapFilterRepair.
  ///
  /// In en, this message translates to:
  /// **'Repair'**
  String get mapFilterRepair;

  /// No description provided for @mapFilterSell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get mapFilterSell;

  /// No description provided for @mapFilterRecycle.
  ///
  /// In en, this message translates to:
  /// **'Recycle'**
  String get mapFilterRecycle;

  /// No description provided for @sustainabilityLevelTitle.
  ///
  /// In en, this message translates to:
  /// **'My Sustainability Level'**
  String get sustainabilityLevelTitle;

  /// No description provided for @sustainabilityLevelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Watch the planet grow!'**
  String get sustainabilityLevelSubtitle;

  /// No description provided for @levelSilver.
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get levelSilver;

  /// No description provided for @levelGold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get levelGold;

  /// No description provided for @levelBronze.
  ///
  /// In en, this message translates to:
  /// **'Bronze'**
  String get levelBronze;

  /// No description provided for @pointsToNextLevel.
  ///
  /// In en, this message translates to:
  /// **'{points} points left to Gold'**
  String pointsToNextLevel(int points);

  /// No description provided for @pointsBreakdownRepair.
  ///
  /// In en, this message translates to:
  /// **'Repair'**
  String get pointsBreakdownRepair;

  /// No description provided for @pointsBreakdownSell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get pointsBreakdownSell;

  /// No description provided for @pointsBreakdownRecycle.
  ///
  /// In en, this message translates to:
  /// **'Recycle'**
  String get pointsBreakdownRecycle;

  /// No description provided for @brandCollaborations.
  ///
  /// In en, this message translates to:
  /// **'Brand Collaborations'**
  String get brandCollaborations;

  /// No description provided for @useButton.
  ///
  /// In en, this message translates to:
  /// **'Use'**
  String get useButton;

  /// No description provided for @insufficientPoints.
  ///
  /// In en, this message translates to:
  /// **'Insufficient points'**
  String get insufficientPoints;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Achievements'**
  String get achievementsTitle;

  /// No description provided for @achievementFirstRepair.
  ///
  /// In en, this message translates to:
  /// **'First Repair'**
  String get achievementFirstRepair;

  /// No description provided for @achievementCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get achievementCompleted;

  /// No description provided for @achievementEnvironmentalist.
  ///
  /// In en, this message translates to:
  /// **'Environmentalist'**
  String get achievementEnvironmentalist;

  /// No description provided for @achievementSuperSeller.
  ///
  /// In en, this message translates to:
  /// **'Super Seller'**
  String get achievementSuperSeller;

  /// No description provided for @achievementGoldLevel.
  ///
  /// In en, this message translates to:
  /// **'Gold Level'**
  String get achievementGoldLevel;

  /// No description provided for @achievementReachPoints.
  ///
  /// In en, this message translates to:
  /// **'Reach 2000 points'**
  String get achievementReachPoints;

  /// No description provided for @achievementTenRecycles.
  ///
  /// In en, this message translates to:
  /// **'10 recycles'**
  String get achievementTenRecycles;

  /// No description provided for @achievementFiftySales.
  ///
  /// In en, this message translates to:
  /// **'50 sales'**
  String get achievementFiftySales;

  /// No description provided for @marketplaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get marketplaceTitle;

  /// No description provided for @activeListingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Active Listings'**
  String get activeListingsTitle;

  /// No description provided for @safeSellingTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe Selling'**
  String get safeSellingTitle;

  /// No description provided for @safeSellingDesc.
  ///
  /// In en, this message translates to:
  /// **'Match with universities and certified repairers'**
  String get safeSellingDesc;

  /// No description provided for @seeDetails.
  ///
  /// In en, this message translates to:
  /// **'See Details'**
  String get seeDetails;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusSold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get statusSold;

  /// No description provided for @createListingTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Listing'**
  String get createListingTitle;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// No description provided for @photoLimitNote.
  ///
  /// In en, this message translates to:
  /// **'You can add min 1, max 5 photos'**
  String get photoLimitNote;

  /// No description provided for @labelTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get labelTitle;

  /// No description provided for @hintTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter product title'**
  String get hintTitle;

  /// No description provided for @labelDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get labelDescription;

  /// No description provided for @hintDescription.
  ///
  /// In en, this message translates to:
  /// **'Describe your product details...'**
  String get hintDescription;

  /// No description provided for @labelCondition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get labelCondition;

  /// No description provided for @conditionNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get conditionNew;

  /// No description provided for @conditionUsed.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get conditionUsed;

  /// No description provided for @conditionRefurbished.
  ///
  /// In en, this message translates to:
  /// **'Refurbished'**
  String get conditionRefurbished;

  /// No description provided for @labelPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get labelPrice;

  /// No description provided for @negotiable.
  ///
  /// In en, this message translates to:
  /// **'Negotiable'**
  String get negotiable;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Info'**
  String get contactInfo;

  /// No description provided for @labelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get labelPhone;

  /// No description provided for @labelCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get labelCity;

  /// No description provided for @cityIstanbul.
  ///
  /// In en, this message translates to:
  /// **'Istanbul'**
  String get cityIstanbul;

  /// No description provided for @cityAnkara.
  ///
  /// In en, this message translates to:
  /// **'Ankara'**
  String get cityAnkara;

  /// No description provided for @cityIzmir.
  ///
  /// In en, this message translates to:
  /// **'Izmir'**
  String get cityIzmir;

  /// No description provided for @publishButton.
  ///
  /// In en, this message translates to:
  /// **'Publish Listing'**
  String get publishButton;

  /// No description provided for @categoryPart.
  ///
  /// In en, this message translates to:
  /// **'Part'**
  String get categoryPart;

  /// No description provided for @categoryDevice.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get categoryDevice;

  /// No description provided for @categoryCable.
  ///
  /// In en, this message translates to:
  /// **'Cable'**
  String get categoryCable;

  /// No description provided for @profileReviewCount.
  ///
  /// In en, this message translates to:
  /// **'({count} reviews)'**
  String profileReviewCount(int count);

  /// No description provided for @statTotalDevices.
  ///
  /// In en, this message translates to:
  /// **'Total Devices'**
  String get statTotalDevices;

  /// No description provided for @statPointsEarned.
  ///
  /// In en, this message translates to:
  /// **'Points Earned'**
  String get statPointsEarned;

  /// No description provided for @carbonSavingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Carbon Savings'**
  String get carbonSavingsTitle;

  /// No description provided for @carbonSavingsUnit.
  ///
  /// In en, this message translates to:
  /// **'CO₂ reduction'**
  String get carbonSavingsUnit;

  /// No description provided for @leaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Community Leaderboard'**
  String get leaderboardTitle;

  /// No description provided for @leaderboardYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get leaderboardYou;

  /// No description provided for @leaderboardThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week #{rank}'**
  String leaderboardThisWeek(int rank);

  /// No description provided for @badgeGalleryTitle.
  ///
  /// In en, this message translates to:
  /// **'Badge Gallery'**
  String get badgeGalleryTitle;

  /// No description provided for @badgeFirstRecycle.
  ///
  /// In en, this message translates to:
  /// **'First Device\nRecycled'**
  String get badgeFirstRecycle;

  /// No description provided for @badgeThreeRepairs.
  ///
  /// In en, this message translates to:
  /// **'Repaired 3 Devices'**
  String get badgeThreeRepairs;

  /// No description provided for @badgeRecycleExpert.
  ///
  /// In en, this message translates to:
  /// **'Recycling\nExpert'**
  String get badgeRecycleExpert;

  /// No description provided for @badgeTenDayStreak.
  ///
  /// In en, this message translates to:
  /// **'10 Day Streak'**
  String get badgeTenDayStreak;

  /// No description provided for @badgeCommunityHelper.
  ///
  /// In en, this message translates to:
  /// **'Community\nHelper'**
  String get badgeCommunityHelper;

  /// No description provided for @badgeLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get badgeLocked;

  /// No description provided for @mockUserRole.
  ///
  /// In en, this message translates to:
  /// **'Eco-friendly technician'**
  String get mockUserRole;

  /// No description provided for @recentActivityTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent Activities'**
  String get recentActivityTitle;

  /// No description provided for @mockActivityRepair.
  ///
  /// In en, this message translates to:
  /// **'Repaired iPhone 12 Pro'**
  String get mockActivityRepair;

  /// No description provided for @mockActivityBadge.
  ///
  /// In en, this message translates to:
  /// **'Earned new badge'**
  String get mockActivityBadge;

  /// No description provided for @mockActivitySavings.
  ///
  /// In en, this message translates to:
  /// **'5kg CO₂ saved'**
  String get mockActivitySavings;

  /// No description provided for @impactSavingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your savings this month'**
  String get impactSavingsTitle;

  /// No description provided for @nearbyServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby Services'**
  String get nearbyServicesTitle;

  /// No description provided for @viewOnMapButton.
  ///
  /// In en, this message translates to:
  /// **'View on Map'**
  String get viewOnMapButton;

  /// No description provided for @distanceAway.
  ///
  /// In en, this message translates to:
  /// **'{distance} away'**
  String distanceAway(String distance);

  /// No description provided for @leaderboardPoints.
  ///
  /// In en, this message translates to:
  /// **'{points} points'**
  String leaderboardPoints(String points);

  /// No description provided for @impactSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'You saved this month'**
  String get impactSummaryTitle;

  /// No description provided for @environmentalImpactTitle.
  ///
  /// In en, this message translates to:
  /// **'Environmental Impact'**
  String get environmentalImpactTitle;

  /// No description provided for @statRepairedDevices.
  ///
  /// In en, this message translates to:
  /// **'Repaired Devices'**
  String get statRepairedDevices;

  /// No description provided for @statPreventedWaste.
  ///
  /// In en, this message translates to:
  /// **'Prevented E-Waste'**
  String get statPreventedWaste;

  /// No description provided for @statTotalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get statTotalEarnings;

  /// No description provided for @statLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String statLevel(String level);

  /// No description provided for @statEcoWarrior.
  ///
  /// In en, this message translates to:
  /// **'Eco Warrior'**
  String get statEcoWarrior;

  /// No description provided for @mockServiceTechFix.
  ///
  /// In en, this message translates to:
  /// **'TechFix Repair Center'**
  String get mockServiceTechFix;

  /// No description provided for @mockServiceEcoPoint.
  ///
  /// In en, this message translates to:
  /// **'EcoPoint Recycling'**
  String get mockServiceEcoPoint;

  /// No description provided for @serviceTagsRepair.
  ///
  /// In en, this message translates to:
  /// **'Phone, Laptop, Tablet'**
  String get serviceTagsRepair;

  /// No description provided for @serviceTagsRecycle.
  ///
  /// In en, this message translates to:
  /// **'All electronic waste'**
  String get serviceTagsRecycle;

  /// No description provided for @actionContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get actionContact;

  /// No description provided for @actionGetDirections.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get actionGetDirections;

  /// No description provided for @homeActionRepair.
  ///
  /// In en, this message translates to:
  /// **'Repair'**
  String get homeActionRepair;

  /// No description provided for @homeActionRepairSub.
  ///
  /// In en, this message translates to:
  /// **'Repair your\ndevice'**
  String get homeActionRepairSub;

  /// No description provided for @homeActionSell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get homeActionSell;

  /// No description provided for @homeActionSellSub.
  ///
  /// In en, this message translates to:
  /// **'Sell\nsecond hand'**
  String get homeActionSellSub;

  /// No description provided for @homeActionRecycle.
  ///
  /// In en, this message translates to:
  /// **'Recycle'**
  String get homeActionRecycle;

  /// No description provided for @homeActionRecycleSub.
  ///
  /// In en, this message translates to:
  /// **'Recycle\nback'**
  String get homeActionRecycleSub;

  /// No description provided for @settingsAppearanceLanguage.
  ///
  /// In en, this message translates to:
  /// **'Appearance and Language'**
  String get settingsAppearanceLanguage;

  /// No description provided for @themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeTitle;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get themeSystem;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @createNewListing.
  ///
  /// In en, this message translates to:
  /// **'List New Item'**
  String get createNewListing;

  /// No description provided for @sellUnusedItems.
  ///
  /// In en, this message translates to:
  /// **'Sell your unused parts'**
  String get sellUnusedItems;

  /// No description provided for @createListingButton.
  ///
  /// In en, this message translates to:
  /// **'Create Listing'**
  String get createListingButton;
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
