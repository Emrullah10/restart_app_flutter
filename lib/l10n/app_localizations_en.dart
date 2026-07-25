// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginWelcome => 'Welcome';

  @override
  String get loginSubtitle =>
      'Log in to your account and evaluate your e-waste.';

  @override
  String get emailHint => 'Email Address';

  @override
  String get passwordHint => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get loginButton => 'Log In';

  @override
  String get orDivider => 'or';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get registerButton => 'Register';

  @override
  String get registerTitle => 'Create Account';

  @override
  String get registerSubtitle =>
      'Join us and be part of the recycling movement.';

  @override
  String get nameHint => 'Full Name';

  @override
  String get passwordConfirmHint => 'Confirm Password';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get navHome => 'Home';

  @override
  String get navMap => 'Map';

  @override
  String get navRewards => 'Rewards';

  @override
  String get navSell => 'Sell';

  @override
  String get homeTitle => 'Sustainable Future';

  @override
  String get homeSubtitle => 'Evaluate your e-waste, contribute to nature';

  @override
  String get whatToDo => 'What do you want to do?';

  @override
  String get profileTitle => 'Profile';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get mapTitle => 'E-Waste Points';

  @override
  String get listButton => 'List';

  @override
  String get rewardsTitle => 'Rewards & Points';

  @override
  String get totalPoints => 'My Total Points';

  @override
  String get sellTitle => 'Sell & Marketplace';

  @override
  String get sellSubtitle => 'Sell or donate your e-waste';

  @override
  String get recycleTitle => 'Recycle';

  @override
  String get recycleQuestion => 'Which device to recycle?';

  @override
  String get recycleSubtitle => 'Start by selecting device type';

  @override
  String get devicePhone => 'Phone';

  @override
  String get deviceLaptop => 'Laptop';

  @override
  String get deviceTablet => 'Tablet';

  @override
  String get deviceOther => 'Other';

  @override
  String get devicePhoneSub => 'Smartphone, old phone';

  @override
  String get deviceLaptopSub => 'Notebook, laptop';

  @override
  String get deviceTabletSub => 'iPad, Android tablet';

  @override
  String get deviceOtherSub => 'Printer, Monitor, etc.';

  @override
  String get discoverTitle => 'Discover Page (Coming Soon)';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get eventsTab => 'Events';

  @override
  String get educationTab => 'Education';

  @override
  String get newLabel => 'NEW';

  @override
  String get weeklyRecycleEvent => 'Weekly Recycle Event';

  @override
  String get weeklyRecycleEventDesc =>
      'Earn 2x points on Migros Recycling Day this week!';

  @override
  String get detailsButton => 'Details';

  @override
  String get rewardProgramTitle => 'Reward Program';

  @override
  String get rewardProgramDesc =>
      'You reached 100 points! Ready to claim your reward?';

  @override
  String get claimRewardButton => 'Claim Reward';

  @override
  String get communityEventTitle => 'Community Event';

  @override
  String get communityEventDesc =>
      'A cleaning event is organized in your neighborhood. Want to join?';

  @override
  String get joinButton => 'Join';

  @override
  String get contactTitle => 'Contact';

  @override
  String get contactUsHeader => 'Contact Us';

  @override
  String get contactUsSub =>
      'You can fill out the form below for your questions or suggestions.';

  @override
  String get nameLabel => 'Name Surname';

  @override
  String get emailLabel => 'Email';

  @override
  String get messageLabel => 'Your Message';

  @override
  String get sendButton => 'Send';

  @override
  String get messageSentSuccess => 'Your message has been sent successfully!';

  @override
  String get repairTitle => 'Repair';

  @override
  String get whatDeviceToRepair => 'Which device do you want to repair?';

  @override
  String get deviceTypeSelectSub =>
      'Select device type, let\'s find the nearest repair shop';

  @override
  String get catPhone => 'Phone';

  @override
  String get catComputer => 'Computer';

  @override
  String get catHeadphones => 'Headphones';

  @override
  String get catTablet => 'Tablet';

  @override
  String get catConsole => 'Console';

  @override
  String get catTV => 'TV';

  @override
  String get nearestShopsTitle => 'Nearest Repair Shops';

  @override
  String get locationLabel => 'Location';

  @override
  String get detailButton => 'Detail';

  @override
  String get shopTechnologyCenter => 'Technology Center';

  @override
  String get shopFastRepair => 'Fast Repair';

  @override
  String get shopExpertService => 'Expert Service';

  @override
  String timeHoursAgo(int hours) {
    return '$hours hours ago';
  }

  @override
  String timeDaysAgo(int days) {
    return '$days days ago';
  }

  @override
  String get viewAll => 'View All';

  @override
  String get filter => 'Filter';

  @override
  String get details => 'Details';

  @override
  String get searchHint => 'Search...';

  @override
  String get noResults => 'No results found';

  @override
  String get markAllAsRead => 'Mark all as read';

  @override
  String get thisWeek => 'This week';

  @override
  String get allMarkedAsRead => 'All notifications marked as read';

  @override
  String get appTagline => 'Bring technology back to life';

  @override
  String get recentActivities => 'Recent Activities';

  @override
  String get mapFilterAll => 'All';

  @override
  String get mapFilterRepair => 'Repair';

  @override
  String get mapFilterSell => 'Sell';

  @override
  String get mapFilterRecycle => 'Recycle';

  @override
  String get sustainabilityLevelTitle => 'My Sustainability Level';

  @override
  String get sustainabilityLevelSubtitle => 'Watch the planet grow!';

  @override
  String get levelSilver => 'Silver';

  @override
  String get levelGold => 'Gold';

  @override
  String get levelBronze => 'Bronze';

  @override
  String pointsToNextLevel(int points) {
    return '$points points left to Gold';
  }

  @override
  String get pointsBreakdownRepair => 'Repair';

  @override
  String get pointsBreakdownSell => 'Sell';

  @override
  String get pointsBreakdownRecycle => 'Recycle';

  @override
  String get brandCollaborations => 'Brand Collaborations';

  @override
  String get useButton => 'Use';

  @override
  String get insufficientPoints => 'Insufficient points';

  @override
  String get achievementsTitle => 'My Achievements';

  @override
  String get achievementFirstRepair => 'First Repair';

  @override
  String get achievementCompleted => 'Completed';

  @override
  String get achievementEnvironmentalist => 'Environmentalist';

  @override
  String get achievementSuperSeller => 'Super Seller';

  @override
  String get achievementGoldLevel => 'Gold Level';

  @override
  String get achievementReachPoints => 'Reach 2000 points';

  @override
  String get achievementTenRecycles => '10 recycles';

  @override
  String get achievementFiftySales => '50 sales';

  @override
  String get marketplaceTitle => 'Marketplace';

  @override
  String get activeListingsTitle => 'Active Listings';

  @override
  String get safeSellingTitle => 'Safe Selling';

  @override
  String get safeSellingDesc =>
      'Match with universities and certified repairers';

  @override
  String get seeDetails => 'See Details';

  @override
  String get statusActive => 'Active';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusSold => 'Sold';

  @override
  String get createListingTitle => 'Create Listing';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get addPhoto => 'Add Photo';

  @override
  String get photoLimitNote => 'You can add min 1, max 5 photos';

  @override
  String get labelTitle => 'Title';

  @override
  String get hintTitle => 'Enter product title';

  @override
  String get labelDescription => 'Description';

  @override
  String get hintDescription => 'Describe your product details...';

  @override
  String get labelCondition => 'Condition';

  @override
  String get conditionNew => 'New';

  @override
  String get conditionUsed => 'Used';

  @override
  String get conditionRefurbished => 'Refurbished';

  @override
  String get labelPrice => 'Price';

  @override
  String get negotiable => 'Negotiable';

  @override
  String get contactInfo => 'Contact Info';

  @override
  String get labelPhone => 'Phone';

  @override
  String get labelCity => 'City';

  @override
  String get cityIstanbul => 'Istanbul';

  @override
  String get cityAnkara => 'Ankara';

  @override
  String get cityIzmir => 'Izmir';

  @override
  String get publishButton => 'Publish Listing';

  @override
  String get categoryPart => 'Part';

  @override
  String get categoryDevice => 'Device';

  @override
  String get categoryCable => 'Cable';

  @override
  String profileReviewCount(int count) {
    return '($count reviews)';
  }

  @override
  String get statTotalDevices => 'Total Devices';

  @override
  String get statPointsEarned => 'Points Earned';

  @override
  String get carbonSavingsTitle => 'Carbon Savings';

  @override
  String get carbonSavingsUnit => 'CO₂ reduction';

  @override
  String get leaderboardTitle => 'Community Leaderboard';

  @override
  String get leaderboardYou => 'You';

  @override
  String leaderboardThisWeek(int rank) {
    return 'This week #$rank';
  }

  @override
  String get badgeGalleryTitle => 'Badge Gallery';

  @override
  String get badgeFirstRecycle => 'First Device\nRecycled';

  @override
  String get badgeThreeRepairs => 'Repaired 3 Devices';

  @override
  String get badgeRecycleExpert => 'Recycling\nExpert';

  @override
  String get badgeTenDayStreak => '10 Day Streak';

  @override
  String get badgeCommunityHelper => 'Community\nHelper';

  @override
  String get badgeLocked => 'Locked';

  @override
  String get mockUserRole => 'Eco-friendly technician';

  @override
  String get recentActivityTitle => 'Recent Activities';

  @override
  String get mockActivityRepair => 'Repaired iPhone 12 Pro';

  @override
  String get mockActivityBadge => 'Earned new badge';

  @override
  String get mockActivitySavings => '5kg CO₂ saved';

  @override
  String get impactSavingsTitle => 'Your savings this month';

  @override
  String get nearbyServicesTitle => 'Nearby Services';

  @override
  String get viewOnMapButton => 'View on Map';

  @override
  String distanceAway(String distance) {
    return '$distance away';
  }

  @override
  String leaderboardPoints(String points) {
    return '$points points';
  }

  @override
  String get impactSummaryTitle => 'You saved this month';

  @override
  String get environmentalImpactTitle => 'Environmental Impact';

  @override
  String get statRepairedDevices => 'Repaired Devices';

  @override
  String get statPreventedWaste => 'Prevented E-Waste';

  @override
  String get statTotalEarnings => 'Total Earnings';

  @override
  String statLevel(String level) {
    return 'Level $level';
  }

  @override
  String get statEcoWarrior => 'Eco Warrior';

  @override
  String get mockServiceTechFix => 'TechFix Repair Center';

  @override
  String get mockServiceEcoPoint => 'EcoPoint Recycling';

  @override
  String get serviceTagsRepair => 'Phone, Laptop, Tablet';

  @override
  String get serviceTagsRecycle => 'All electronic waste';

  @override
  String get actionContact => 'Contact';

  @override
  String get actionGetDirections => 'Get Directions';

  @override
  String get homeActionRepair => 'Repair';

  @override
  String get homeActionRepairSub => 'Repair your\ndevice';

  @override
  String get homeActionSell => 'Sell';

  @override
  String get homeActionSellSub => 'Sell\nsecond hand';

  @override
  String get homeActionRecycle => 'Recycle';

  @override
  String get homeActionRecycleSub => 'Recycle\nback';

  @override
  String get settingsAppearanceLanguage => 'Appearance and Language';

  @override
  String get settingsAccount => 'Account';

  @override
  String get logout => 'Log Out';

  @override
  String get logoutConfirmTitle => 'Log Out';

  @override
  String get logoutConfirmMessage => 'Are you sure you want to log out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get themeTitle => 'Theme';

  @override
  String get themeLight => 'Light Theme';

  @override
  String get themeDark => 'Dark Theme';

  @override
  String get themeSystem => 'System Default';

  @override
  String get languageTitle => 'Language';

  @override
  String get createNewListing => 'List New Item';

  @override
  String get sellUnusedItems => 'Sell your unused parts';

  @override
  String get createListingButton => 'Create Listing';
}
