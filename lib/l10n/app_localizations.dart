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
  /// **'Discover'**
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
  /// **'Repair Service'**
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

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get thisWeek;

  /// No description provided for @allMarkedAsRead.
  ///
  /// In en, this message translates to:
  /// **'All notifications marked as read'**
  String get allMarkedAsRead;

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
  /// **'Sales'**
  String get mapFilterSell;

  /// No description provided for @mapFilterRecycle.
  ///
  /// In en, this message translates to:
  /// **'Recycling'**
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

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccount;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

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

  /// No description provided for @brandName.
  ///
  /// In en, this message translates to:
  /// **'ReStart'**
  String get brandName;

  /// No description provided for @navHomeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHomeLabel;

  /// No description provided for @navMapLabel.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get navMapLabel;

  /// No description provided for @navRecycleLabel.
  ///
  /// In en, this message translates to:
  /// **'Recycle'**
  String get navRecycleLabel;

  /// No description provided for @navSellLabel.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get navSellLabel;

  /// No description provided for @navRewardsLabel.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get navRewardsLabel;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get commonLoading;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get commonError;

  /// No description provided for @commonComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get commonComingSoon;

  /// No description provided for @commonAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get commonAll;

  /// No description provided for @commonUnitKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get commonUnitKg;

  /// No description provided for @commonUnitKm.
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get commonUnitKm;

  /// No description provided for @commonPoints.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get commonPoints;

  /// No description provided for @commonPointsLower.
  ///
  /// In en, this message translates to:
  /// **'points'**
  String get commonPointsLower;

  /// No description provided for @commonPieces.
  ///
  /// In en, this message translates to:
  /// **'pcs'**
  String get commonPieces;

  /// No description provided for @passwordStrengthIdle.
  ///
  /// In en, this message translates to:
  /// **'Password strength'**
  String get passwordStrengthIdle;

  /// No description provided for @passwordWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get passwordWeak;

  /// No description provided for @passwordFair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get passwordFair;

  /// No description provided for @passwordGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get passwordGood;

  /// No description provided for @passwordStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get passwordStrong;

  /// No description provided for @levelNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get levelNew;

  /// No description provided for @levelCurious.
  ///
  /// In en, this message translates to:
  /// **'Curious'**
  String get levelCurious;

  /// No description provided for @levelAware.
  ///
  /// In en, this message translates to:
  /// **'Aware'**
  String get levelAware;

  /// No description provided for @levelConscious.
  ///
  /// In en, this message translates to:
  /// **'Conscious'**
  String get levelConscious;

  /// No description provided for @levelPioneer.
  ///
  /// In en, this message translates to:
  /// **'Pioneer'**
  String get levelPioneer;

  /// No description provided for @levelChampion.
  ///
  /// In en, this message translates to:
  /// **'Champion'**
  String get levelChampion;

  /// No description provided for @tierBronze.
  ///
  /// In en, this message translates to:
  /// **'Bronze'**
  String get tierBronze;

  /// No description provided for @tierSilver.
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get tierSilver;

  /// No description provided for @tierGold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get tierGold;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginTitle;

  /// No description provided for @loginSub.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to continue.'**
  String get loginSub;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'EMAIL'**
  String get loginEmailLabel;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get loginPasswordLabel;

  /// No description provided for @loginEmailPh.
  ///
  /// In en, this message translates to:
  /// **'name@email.com'**
  String get loginEmailPh;

  /// No description provided for @loginForgot.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get loginForgot;

  /// No description provided for @loginAction.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get loginAction;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginNoAccount;

  /// No description provided for @loginRegister.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get loginRegister;

  /// No description provided for @authFillAll.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields.'**
  String get authFillAll;

  /// No description provided for @authMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get authMismatch;

  /// No description provided for @authTermsRequired.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms to continue.'**
  String get authTermsRequired;

  /// No description provided for @regTitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get regTitle;

  /// No description provided for @regSub.
  ///
  /// In en, this message translates to:
  /// **'Join the ReStart community.'**
  String get regSub;

  /// No description provided for @regName.
  ///
  /// In en, this message translates to:
  /// **'FULL NAME'**
  String get regName;

  /// No description provided for @regNamePh.
  ///
  /// In en, this message translates to:
  /// **'e.g. Jane Smith'**
  String get regNamePh;

  /// No description provided for @regEmail.
  ///
  /// In en, this message translates to:
  /// **'EMAIL'**
  String get regEmail;

  /// No description provided for @regPassword.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get regPassword;

  /// No description provided for @regPasswordPh.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get regPasswordPh;

  /// No description provided for @regConfirm.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM PASSWORD'**
  String get regConfirm;

  /// No description provided for @regConfirmPh.
  ///
  /// In en, this message translates to:
  /// **'Repeat your password'**
  String get regConfirmPh;

  /// No description provided for @regTermsPre.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get regTermsPre;

  /// No description provided for @regTermsMid.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get regTermsMid;

  /// No description provided for @regTermsPost.
  ///
  /// In en, this message translates to:
  /// **' — I accept them.'**
  String get regTermsPost;

  /// No description provided for @regPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get regPrivacy;

  /// No description provided for @regAction.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get regAction;

  /// No description provided for @regHave.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get regHave;

  /// No description provided for @regLogin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get regLogin;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello {name}'**
  String homeGreeting(String name);

  /// No description provided for @homeSub.
  ///
  /// In en, this message translates to:
  /// **'Your current environmental impact and activity.'**
  String get homeSub;

  /// No description provided for @homeImpact.
  ///
  /// In en, this message translates to:
  /// **'ENVIRONMENTAL IMPACT'**
  String get homeImpact;

  /// No description provided for @homeCo2.
  ///
  /// In en, this message translates to:
  /// **'CO₂ Saved'**
  String get homeCo2;

  /// No description provided for @homeRepair.
  ///
  /// In en, this message translates to:
  /// **'Repair'**
  String get homeRepair;

  /// No description provided for @homeSell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get homeSell;

  /// No description provided for @homeRecycle.
  ///
  /// In en, this message translates to:
  /// **'Recycle'**
  String get homeRecycle;

  /// No description provided for @homePoints.
  ///
  /// In en, this message translates to:
  /// **'Points Earned'**
  String get homePoints;

  /// No description provided for @homeListings.
  ///
  /// In en, this message translates to:
  /// **'Active Listings'**
  String get homeListings;

  /// No description provided for @homeRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get homeRecent;

  /// No description provided for @homeNoActivity.
  ///
  /// In en, this message translates to:
  /// **'No activity yet.'**
  String get homeNoActivity;

  /// No description provided for @menuTitle.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menuTitle;

  /// No description provided for @menuProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get menuProfile;

  /// No description provided for @menuDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get menuDiscover;

  /// No description provided for @menuRepair.
  ///
  /// In en, this message translates to:
  /// **'Repair'**
  String get menuRepair;

  /// No description provided for @menuNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get menuNotifications;

  /// No description provided for @menuSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menuSettings;

  /// No description provided for @menuContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get menuContact;

  /// No description provided for @discoverSearch.
  ///
  /// In en, this message translates to:
  /// **'Search devices, categories or spots...'**
  String get discoverSearch;

  /// No description provided for @discoverCategories.
  ///
  /// In en, this message translates to:
  /// **'CATEGORIES'**
  String get discoverCategories;

  /// No description provided for @discoverPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get discoverPhone;

  /// No description provided for @discoverLaptop.
  ///
  /// In en, this message translates to:
  /// **'Computer'**
  String get discoverLaptop;

  /// No description provided for @discoverTablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get discoverTablet;

  /// No description provided for @discoverOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get discoverOther;

  /// No description provided for @discoverFeatured.
  ///
  /// In en, this message translates to:
  /// **'FEATURED'**
  String get discoverFeatured;

  /// No description provided for @discoverNearby.
  ///
  /// In en, this message translates to:
  /// **'NEARBY SPOTS'**
  String get discoverNearby;

  /// No description provided for @discoverPromo1Tag.
  ///
  /// In en, this message translates to:
  /// **'Repair Campaign'**
  String get discoverPromo1Tag;

  /// No description provided for @discoverPromo1Title.
  ///
  /// In en, this message translates to:
  /// **'Screen Replacement'**
  String get discoverPromo1Title;

  /// No description provided for @discoverPromo1Sub.
  ///
  /// In en, this message translates to:
  /// **'Up to 20% recycling discount'**
  String get discoverPromo1Sub;

  /// No description provided for @discoverPromo2Tag.
  ///
  /// In en, this message translates to:
  /// **'Sales Opportunity'**
  String get discoverPromo2Tag;

  /// No description provided for @discoverPromo2Title.
  ///
  /// In en, this message translates to:
  /// **'Sell Your Old Device'**
  String get discoverPromo2Title;

  /// No description provided for @discoverPromo2Sub.
  ///
  /// In en, this message translates to:
  /// **'Instant valuation and cash payment'**
  String get discoverPromo2Sub;

  /// No description provided for @discoverPromo3Title.
  ///
  /// In en, this message translates to:
  /// **'Recycling Report'**
  String get discoverPromo3Title;

  /// No description provided for @discoverPromo3Sub.
  ///
  /// In en, this message translates to:
  /// **'See your monthly environmental impact'**
  String get discoverPromo3Sub;

  /// No description provided for @mapOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get mapOpen;

  /// No description provided for @mapClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get mapClosed;

  /// No description provided for @mapLocate.
  ///
  /// In en, this message translates to:
  /// **'My location'**
  String get mapLocate;

  /// No description provided for @mapNoPermission.
  ///
  /// In en, this message translates to:
  /// **'Location permission not granted.'**
  String get mapNoPermission;

  /// No description provided for @marketTitle.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get marketTitle;

  /// No description provided for @marketSafeTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe Selling System'**
  String get marketSafeTitle;

  /// No description provided for @marketSafeBody.
  ///
  /// In en, this message translates to:
  /// **'Every sale made through ReStart is covered by 100% buyer protection. Your payment is released once the item reaches the buyer.'**
  String get marketSafeBody;

  /// No description provided for @marketMore.
  ///
  /// In en, this message translates to:
  /// **'LEARN MORE'**
  String get marketMore;

  /// No description provided for @marketSearch.
  ///
  /// In en, this message translates to:
  /// **'Search second-hand items...'**
  String get marketSearch;

  /// No description provided for @marketActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE LISTINGS'**
  String get marketActive;

  /// No description provided for @marketPending.
  ///
  /// In en, this message translates to:
  /// **'PENDING SALES'**
  String get marketPending;

  /// No description provided for @marketOps.
  ///
  /// In en, this message translates to:
  /// **'orders'**
  String get marketOps;

  /// No description provided for @marketForYou.
  ///
  /// In en, this message translates to:
  /// **'Picked for you'**
  String get marketForYou;

  /// No description provided for @marketEmpty.
  ///
  /// In en, this message translates to:
  /// **'No products found in this category'**
  String get marketEmpty;

  /// No description provided for @catAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get catAll;

  /// No description provided for @catLaptop.
  ///
  /// In en, this message translates to:
  /// **'Computer'**
  String get catLaptop;

  /// No description provided for @catAccessory.
  ///
  /// In en, this message translates to:
  /// **'Accessory'**
  String get catAccessory;

  /// No description provided for @listingTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Listing'**
  String get listingTitle;

  /// No description provided for @listingPhotos.
  ///
  /// In en, this message translates to:
  /// **'PHOTOS ({count}/5)'**
  String listingPhotos(String count);

  /// No description provided for @listingCover.
  ///
  /// In en, this message translates to:
  /// **'Cover'**
  String get listingCover;

  /// No description provided for @listingPhotoHint.
  ///
  /// In en, this message translates to:
  /// **'Clear, bright photos help it sell faster.'**
  String get listingPhotoHint;

  /// No description provided for @listingTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'LISTING TITLE'**
  String get listingTitleLabel;

  /// No description provided for @listingTitlePh.
  ///
  /// In en, this message translates to:
  /// **'e.g. Working second-hand washing machine'**
  String get listingTitlePh;

  /// No description provided for @listingCategory.
  ///
  /// In en, this message translates to:
  /// **'CATEGORY'**
  String get listingCategory;

  /// No description provided for @listingCategoryPh.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get listingCategoryPh;

  /// No description provided for @listingDescription.
  ///
  /// In en, this message translates to:
  /// **'DESCRIPTION'**
  String get listingDescription;

  /// No description provided for @listingDescriptionPh.
  ///
  /// In en, this message translates to:
  /// **'Describe the condition, defects and technical specs.'**
  String get listingDescriptionPh;

  /// No description provided for @listingPrice.
  ///
  /// In en, this message translates to:
  /// **'PRICE (TRY)'**
  String get listingPrice;

  /// No description provided for @listingLocation.
  ///
  /// In en, this message translates to:
  /// **'LOCATION'**
  String get listingLocation;

  /// No description provided for @listingLocationPh.
  ///
  /// In en, this message translates to:
  /// **'City, District'**
  String get listingLocationPh;

  /// No description provided for @listingTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe Selling Tips'**
  String get listingTipsTitle;

  /// No description provided for @listingTipsBody.
  ///
  /// In en, this message translates to:
  /// **'Avoid sharing personal information and prefer to hand over items in safe, public places.'**
  String get listingTipsBody;

  /// No description provided for @listingPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish Listing'**
  String get listingPublish;

  /// No description provided for @listingSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your listing is live!'**
  String get listingSuccess;

  /// No description provided for @listingFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not publish the listing. Please try again.'**
  String get listingFailed;

  /// No description provided for @listingCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get listingCamera;

  /// No description provided for @listingGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get listingGallery;

  /// No description provided for @listingPhotoTitle.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get listingPhotoTitle;

  /// No description provided for @repairSub.
  ///
  /// In en, this message translates to:
  /// **'Bring your device back to life and cut your carbon footprint.'**
  String get repairSub;

  /// No description provided for @repairEcoTitle.
  ///
  /// In en, this message translates to:
  /// **'Repair is the greenest option'**
  String get repairEcoTitle;

  /// No description provided for @repairEcoBody.
  ///
  /// In en, this message translates to:
  /// **'Repairing an existing device instead of manufacturing a new one prevents about 80% of the e-waste and carbon emissions of an average smartphone.'**
  String get repairEcoBody;

  /// No description provided for @repairServices.
  ///
  /// In en, this message translates to:
  /// **'SELECT A SERVICE'**
  String get repairServices;

  /// No description provided for @repairScreen.
  ///
  /// In en, this message translates to:
  /// **'Screen & Glass'**
  String get repairScreen;

  /// No description provided for @repairScreenSub.
  ///
  /// In en, this message translates to:
  /// **'Original or A-grade'**
  String get repairScreenSub;

  /// No description provided for @repairBattery.
  ///
  /// In en, this message translates to:
  /// **'Battery'**
  String get repairBattery;

  /// No description provided for @repairBatterySub.
  ///
  /// In en, this message translates to:
  /// **'Warranted replacement'**
  String get repairBatterySub;

  /// No description provided for @repairBoard.
  ///
  /// In en, this message translates to:
  /// **'Motherboard Repair'**
  String get repairBoard;

  /// No description provided for @repairBoardSub.
  ///
  /// In en, this message translates to:
  /// **'Micro-soldering and chip replacement.'**
  String get repairBoardSub;

  /// No description provided for @repairNearby.
  ///
  /// In en, this message translates to:
  /// **'NEARBY SERVICES'**
  String get repairNearby;

  /// No description provided for @recStep.
  ///
  /// In en, this message translates to:
  /// **'STEP {n} OF 3'**
  String recStep(String n);

  /// No description provided for @recStepDevice.
  ///
  /// In en, this message translates to:
  /// **'Device Selection'**
  String get recStepDevice;

  /// No description provided for @recQuestion.
  ///
  /// In en, this message translates to:
  /// **'Which device are you recycling?'**
  String get recQuestion;

  /// No description provided for @recQuestionSub.
  ///
  /// In en, this message translates to:
  /// **'The device type you choose helps us find suitable recycling facilities.'**
  String get recQuestionSub;

  /// No description provided for @recPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get recPhone;

  /// No description provided for @recPhoneSub.
  ///
  /// In en, this message translates to:
  /// **'Smartphones, feature phones'**
  String get recPhoneSub;

  /// No description provided for @recLaptop.
  ///
  /// In en, this message translates to:
  /// **'Laptop'**
  String get recLaptop;

  /// No description provided for @recLaptopSub.
  ///
  /// In en, this message translates to:
  /// **'Laptops, netbooks'**
  String get recLaptopSub;

  /// No description provided for @recTablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get recTablet;

  /// No description provided for @recTabletSub.
  ///
  /// In en, this message translates to:
  /// **'Tablet computers, e-readers'**
  String get recTabletSub;

  /// No description provided for @recOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get recOther;

  /// No description provided for @recOtherSub.
  ///
  /// In en, this message translates to:
  /// **'Accessories, small appliances'**
  String get recOtherSub;

  /// No description provided for @recContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get recContinue;

  /// No description provided for @recDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Device Details'**
  String get recDetailsTitle;

  /// No description provided for @recDetailsSub.
  ///
  /// In en, this message translates to:
  /// **'Please enter accurate information for the valuation.'**
  String get recDetailsSub;

  /// No description provided for @recStepCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get recStepCategory;

  /// No description provided for @recStepDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get recStepDetails;

  /// No description provided for @recStepConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get recStepConfirm;

  /// No description provided for @recBrand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get recBrand;

  /// No description provided for @recBrandPh.
  ///
  /// In en, this message translates to:
  /// **'e.g. Apple, Samsung...'**
  String get recBrandPh;

  /// No description provided for @recModel.
  ///
  /// In en, this message translates to:
  /// **'Model / Year'**
  String get recModel;

  /// No description provided for @recModelPh.
  ///
  /// In en, this message translates to:
  /// **'e.g. iPhone 12, 2021'**
  String get recModelPh;

  /// No description provided for @recCondition.
  ///
  /// In en, this message translates to:
  /// **'Device Condition'**
  String get recCondition;

  /// No description provided for @recWorking.
  ///
  /// In en, this message translates to:
  /// **'Working'**
  String get recWorking;

  /// No description provided for @recWorkingSub.
  ///
  /// In en, this message translates to:
  /// **'All functions active.'**
  String get recWorkingSub;

  /// No description provided for @recDamaged.
  ///
  /// In en, this message translates to:
  /// **'Slightly Damaged'**
  String get recDamaged;

  /// No description provided for @recDamagedSub.
  ///
  /// In en, this message translates to:
  /// **'Scratches or minor defects.'**
  String get recDamagedSub;

  /// No description provided for @recBroken.
  ///
  /// In en, this message translates to:
  /// **'Not Working'**
  String get recBroken;

  /// No description provided for @recBrokenSub.
  ///
  /// In en, this message translates to:
  /// **'Won\'t turn on or badly damaged.'**
  String get recBrokenSub;

  /// No description provided for @recWeight.
  ///
  /// In en, this message translates to:
  /// **'Estimated Weight (kg)'**
  String get recWeight;

  /// No description provided for @recDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery Method'**
  String get recDelivery;

  /// No description provided for @recDropoff.
  ///
  /// In en, this message translates to:
  /// **'Drop Off'**
  String get recDropoff;

  /// No description provided for @recCourier.
  ///
  /// In en, this message translates to:
  /// **'Call Courier'**
  String get recCourier;

  /// No description provided for @recCenter.
  ///
  /// In en, this message translates to:
  /// **'Nearest Facility'**
  String get recCenter;

  /// No description provided for @recCenterPh.
  ///
  /// In en, this message translates to:
  /// **'Select a facility'**
  String get recCenterPh;

  /// No description provided for @recEstimate.
  ///
  /// In en, this message translates to:
  /// **'ESTIMATED GAIN'**
  String get recEstimate;

  /// No description provided for @recCourierBonus.
  ///
  /// In en, this message translates to:
  /// **'With electric courier +{bonus}'**
  String recCourierBonus(String bonus);

  /// No description provided for @recSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create Request'**
  String get recSubmit;

  /// No description provided for @recFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not send the request. Please try again.'**
  String get recFailed;

  /// No description provided for @recPickCenter.
  ///
  /// In en, this message translates to:
  /// **'Please choose a recycling facility.'**
  String get recPickCenter;

  /// No description provided for @courierTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a Courier'**
  String get courierTitle;

  /// No description provided for @courierSub.
  ///
  /// In en, this message translates to:
  /// **'Pick the right vehicle for your items.'**
  String get courierSub;

  /// No description provided for @courierElectric.
  ///
  /// In en, this message translates to:
  /// **'ELECTRIC'**
  String get courierElectric;

  /// No description provided for @courierZero.
  ///
  /// In en, this message translates to:
  /// **'Zero-Emission Delivery'**
  String get courierZero;

  /// No description provided for @courierSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get courierSelect;

  /// No description provided for @courierCargo.
  ///
  /// In en, this message translates to:
  /// **'Cargo Vehicle'**
  String get courierCargo;

  /// No description provided for @courierHeavy.
  ///
  /// In en, this message translates to:
  /// **'Heavy Load'**
  String get courierHeavy;

  /// No description provided for @courierEta.
  ///
  /// In en, this message translates to:
  /// **'~{min} min'**
  String courierEta(String min);

  /// No description provided for @doneTitle.
  ///
  /// In en, this message translates to:
  /// **'Request received'**
  String get doneTitle;

  /// No description provided for @doneEarned.
  ///
  /// In en, this message translates to:
  /// **'REWARD EARNED'**
  String get doneEarned;

  /// No description provided for @doneCo2.
  ///
  /// In en, this message translates to:
  /// **'You saved {kg} kg of CO₂'**
  String doneCo2(String kg);

  /// No description provided for @doneCert.
  ///
  /// In en, this message translates to:
  /// **'Zero Waste Certified'**
  String get doneCert;

  /// No description provided for @doneHome.
  ///
  /// In en, this message translates to:
  /// **'BACK TO HOME'**
  String get doneHome;

  /// No description provided for @rewTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Impact'**
  String get rewTitle;

  /// No description provided for @rewSub.
  ///
  /// In en, this message translates to:
  /// **'Track your environmental contribution and claim rewards.'**
  String get rewSub;

  /// No description provided for @rewHistory.
  ///
  /// In en, this message translates to:
  /// **'Claim History'**
  String get rewHistory;

  /// No description provided for @rewBalance.
  ///
  /// In en, this message translates to:
  /// **'AVAILABLE ECO-POINTS'**
  String get rewBalance;

  /// No description provided for @rewRecycled.
  ///
  /// In en, this message translates to:
  /// **'Recycled'**
  String get rewRecycled;

  /// No description provided for @rewRepaired.
  ///
  /// In en, this message translates to:
  /// **'Repaired'**
  String get rewRepaired;

  /// No description provided for @rewSold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get rewSold;

  /// No description provided for @rewTier.
  ///
  /// In en, this message translates to:
  /// **'Tier'**
  String get rewTier;

  /// No description provided for @rewTop.
  ///
  /// In en, this message translates to:
  /// **'TOP CONTRIBUTORS'**
  String get rewTop;

  /// No description provided for @rewYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get rewYou;

  /// No description provided for @rewAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get rewAchievements;

  /// No description provided for @rewCatalog.
  ///
  /// In en, this message translates to:
  /// **'Reward Catalog'**
  String get rewCatalog;

  /// No description provided for @rewUse.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get rewUse;

  /// No description provided for @rewNone.
  ///
  /// In en, this message translates to:
  /// **'No rewards available right now'**
  String get rewNone;

  /// No description provided for @rewDigital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get rewDigital;

  /// No description provided for @rewTransit.
  ///
  /// In en, this message translates to:
  /// **'Transit'**
  String get rewTransit;

  /// No description provided for @rewService.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get rewService;

  /// No description provided for @rewEco.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get rewEco;

  /// No description provided for @rewRedeemed.
  ///
  /// In en, this message translates to:
  /// **'Reward redeemed'**
  String get rewRedeemed;

  /// No description provided for @rewFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not redeem the reward'**
  String get rewFailed;

  /// No description provided for @profVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified Member'**
  String get profVerified;

  /// No description provided for @profTotal.
  ///
  /// In en, this message translates to:
  /// **'TOTAL ACTIONS'**
  String get profTotal;

  /// No description provided for @profCo2.
  ///
  /// In en, this message translates to:
  /// **'CO₂ SAVED (KG)'**
  String get profCo2;

  /// No description provided for @profSold.
  ///
  /// In en, this message translates to:
  /// **'ITEMS SOLD'**
  String get profSold;

  /// No description provided for @profRepaired.
  ///
  /// In en, this message translates to:
  /// **'ITEMS REPAIRED'**
  String get profRepaired;

  /// No description provided for @profImpact.
  ///
  /// In en, this message translates to:
  /// **'Impact Report'**
  String get profImpact;

  /// No description provided for @profOps.
  ///
  /// In en, this message translates to:
  /// **'{n} actions'**
  String profOps(String n);

  /// No description provided for @profRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get profRecent;

  /// No description provided for @profPointsGain.
  ///
  /// In en, this message translates to:
  /// **'+{n} Points'**
  String profPointsGain(String n);

  /// No description provided for @notifTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifTitle;

  /// No description provided for @notifMarkAll.
  ///
  /// In en, this message translates to:
  /// **'MARK ALL AS READ'**
  String get notifMarkAll;

  /// No description provided for @notifToday.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get notifToday;

  /// No description provided for @notifYesterday.
  ///
  /// In en, this message translates to:
  /// **'YESTERDAY'**
  String get notifYesterday;

  /// No description provided for @notifOlder.
  ///
  /// In en, this message translates to:
  /// **'EARLIER'**
  String get notifOlder;

  /// No description provided for @notifEmpty.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get notifEmpty;

  /// No description provided for @notifEmptySub.
  ///
  /// In en, this message translates to:
  /// **'New activity will show up here.'**
  String get notifEmptySub;

  /// No description provided for @setTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get setTitle;

  /// No description provided for @setAppearance.
  ///
  /// In en, this message translates to:
  /// **'APPEARANCE'**
  String get setAppearance;

  /// No description provided for @setTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get setTheme;

  /// No description provided for @setLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get setLight;

  /// No description provided for @setDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get setDark;

  /// No description provided for @setSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get setSystem;

  /// No description provided for @setLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get setLanguage;

  /// No description provided for @setAccount.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get setAccount;

  /// No description provided for @setProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get setProfile;

  /// No description provided for @setPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get setPassword;

  /// No description provided for @setNotifs.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get setNotifs;

  /// No description provided for @setSecurity.
  ///
  /// In en, this message translates to:
  /// **'SECURITY'**
  String get setSecurity;

  /// No description provided for @setSession.
  ///
  /// In en, this message translates to:
  /// **'Session Security'**
  String get setSession;

  /// No description provided for @setActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get setActive;

  /// No description provided for @setAbout.
  ///
  /// In en, this message translates to:
  /// **'ABOUT'**
  String get setAbout;

  /// No description provided for @setTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get setTerms;

  /// No description provided for @setPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get setPrivacy;

  /// No description provided for @setVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get setVersion;

  /// No description provided for @setLogout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get setLogout;

  /// No description provided for @contactHeadline.
  ///
  /// In en, this message translates to:
  /// **'How can we help you?'**
  String get contactHeadline;

  /// No description provided for @contactBody.
  ///
  /// In en, this message translates to:
  /// **'Fill in the form for questions about recycling, repair or the rewards program, or contact us directly.'**
  String get contactBody;

  /// No description provided for @contactSend.
  ///
  /// In en, this message translates to:
  /// **'Send a Message'**
  String get contactSend;

  /// No description provided for @contactName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get contactName;

  /// No description provided for @contactNamePh.
  ///
  /// In en, this message translates to:
  /// **'Your full name'**
  String get contactNamePh;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactEmailPh.
  ///
  /// In en, this message translates to:
  /// **'name@email.com'**
  String get contactEmailPh;

  /// No description provided for @contactMessage.
  ///
  /// In en, this message translates to:
  /// **'Your message'**
  String get contactMessage;

  /// No description provided for @contactMax.
  ///
  /// In en, this message translates to:
  /// **'Max 1000 characters'**
  String get contactMax;

  /// No description provided for @contactMessagePh.
  ///
  /// In en, this message translates to:
  /// **'How can we help you?'**
  String get contactMessagePh;

  /// No description provided for @contactSubmit.
  ///
  /// In en, this message translates to:
  /// **'SEND'**
  String get contactSubmit;

  /// No description provided for @contactChannels.
  ///
  /// In en, this message translates to:
  /// **'ALTERNATIVE CHANNELS'**
  String get contactChannels;

  /// No description provided for @contactEmailChannel.
  ///
  /// In en, this message translates to:
  /// **'EMAIL'**
  String get contactEmailChannel;

  /// No description provided for @contactPhoneChannel.
  ///
  /// In en, this message translates to:
  /// **'PHONE (24/7)'**
  String get contactPhoneChannel;

  /// No description provided for @contactSent.
  ///
  /// In en, this message translates to:
  /// **'Your message was sent.'**
  String get contactSent;

  /// No description provided for @contactFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not send the message.'**
  String get contactFailed;

  /// No description provided for @pwHint.
  ///
  /// In en, this message translates to:
  /// **'Choose a strong password to protect your account.'**
  String get pwHint;

  /// No description provided for @pwCurrent.
  ///
  /// In en, this message translates to:
  /// **'CURRENT PASSWORD'**
  String get pwCurrent;

  /// No description provided for @pwNew.
  ///
  /// In en, this message translates to:
  /// **'NEW PASSWORD'**
  String get pwNew;

  /// No description provided for @pwSave.
  ///
  /// In en, this message translates to:
  /// **'UPDATE PASSWORD'**
  String get pwSave;

  /// No description provided for @pwChanged.
  ///
  /// In en, this message translates to:
  /// **'Your password was updated.'**
  String get pwChanged;

  /// No description provided for @pwTooShort.
  ///
  /// In en, this message translates to:
  /// **'New password must be at least 8 characters.'**
  String get pwTooShort;

  /// No description provided for @prefHint.
  ///
  /// In en, this message translates to:
  /// **'Choose which notifications you want to receive.'**
  String get prefHint;

  /// No description provided for @prefRecycle.
  ///
  /// In en, this message translates to:
  /// **'Recycling'**
  String get prefRecycle;

  /// No description provided for @prefRecycleSub.
  ///
  /// In en, this message translates to:
  /// **'Delivery and points updates'**
  String get prefRecycleSub;

  /// No description provided for @prefMarket.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get prefMarket;

  /// No description provided for @prefMarketSub.
  ///
  /// In en, this message translates to:
  /// **'Listing and sales updates'**
  String get prefMarketSub;

  /// No description provided for @prefRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get prefRewards;

  /// No description provided for @prefRewardsSub.
  ///
  /// In en, this message translates to:
  /// **'New rewards and level-ups'**
  String get prefRewardsSub;

  /// No description provided for @prefSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get prefSystem;

  /// No description provided for @prefSystemSub.
  ///
  /// In en, this message translates to:
  /// **'Maintenance and announcements'**
  String get prefSystemSub;
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
