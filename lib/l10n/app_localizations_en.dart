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
  String get discoverTitle => 'Discover';

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
  String get repairTitle => 'Repair Service';

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
  String get mapFilterSell => 'Sales';

  @override
  String get mapFilterRecycle => 'Recycling';

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

  @override
  String get brandName => 'ReStart';

  @override
  String get navHomeLabel => 'Home';

  @override
  String get navMapLabel => 'Map';

  @override
  String get navRecycleLabel => 'Recycle';

  @override
  String get navSellLabel => 'Sell';

  @override
  String get navRewardsLabel => 'Rewards';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonError => 'Something went wrong.';

  @override
  String get commonComingSoon => 'Coming soon';

  @override
  String get commonAll => 'See all';

  @override
  String get commonUnitKg => 'kg';

  @override
  String get commonUnitKm => 'km';

  @override
  String get commonPoints => 'Points';

  @override
  String get commonPointsLower => 'points';

  @override
  String get commonPieces => 'pcs';

  @override
  String get passwordStrengthIdle => 'Password strength';

  @override
  String get passwordWeak => 'Weak';

  @override
  String get passwordFair => 'Fair';

  @override
  String get passwordGood => 'Good';

  @override
  String get passwordStrong => 'Strong';

  @override
  String get levelNew => 'New';

  @override
  String get levelCurious => 'Curious';

  @override
  String get levelAware => 'Aware';

  @override
  String get levelConscious => 'Conscious';

  @override
  String get levelPioneer => 'Pioneer';

  @override
  String get levelChampion => 'Champion';

  @override
  String get tierBronze => 'Bronze';

  @override
  String get tierSilver => 'Silver';

  @override
  String get tierGold => 'Gold';

  @override
  String get loginTitle => 'Welcome back';

  @override
  String get loginSub => 'Please sign in to continue.';

  @override
  String get loginEmailLabel => 'EMAIL';

  @override
  String get loginPasswordLabel => 'PASSWORD';

  @override
  String get loginEmailPh => 'name@email.com';

  @override
  String get loginForgot => 'Forgot password';

  @override
  String get loginAction => 'SIGN IN';

  @override
  String get loginNoAccount => 'Don\'t have an account?';

  @override
  String get loginRegister => 'Sign Up';

  @override
  String get authFillAll => 'Please fill in all fields.';

  @override
  String get authMismatch => 'Passwords do not match.';

  @override
  String get authTermsRequired => 'You must accept the terms to continue.';

  @override
  String get regTitle => 'Create an account';

  @override
  String get regSub => 'Join the ReStart community.';

  @override
  String get regName => 'FULL NAME';

  @override
  String get regNamePh => 'e.g. Jane Smith';

  @override
  String get regEmail => 'EMAIL';

  @override
  String get regPassword => 'PASSWORD';

  @override
  String get regPasswordPh => 'At least 8 characters';

  @override
  String get regConfirm => 'CONFIRM PASSWORD';

  @override
  String get regConfirmPh => 'Repeat your password';

  @override
  String get regTermsPre => 'Terms of Use';

  @override
  String get regTermsMid => ' and ';

  @override
  String get regTermsPost => ' — I accept them.';

  @override
  String get regPrivacy => 'Privacy Policy';

  @override
  String get regAction => 'Sign Up';

  @override
  String get regHave => 'Already have an account?';

  @override
  String get regLogin => 'Sign in';

  @override
  String homeGreeting(String name) {
    return 'Hello $name';
  }

  @override
  String get homeSub => 'Your current environmental impact and activity.';

  @override
  String get homeImpact => 'ENVIRONMENTAL IMPACT';

  @override
  String get homeCo2 => 'CO₂ Saved';

  @override
  String get homeRepair => 'Repair';

  @override
  String get homeSell => 'Sell';

  @override
  String get homeRecycle => 'Recycle';

  @override
  String get homePoints => 'Points Earned';

  @override
  String get homeListings => 'Active Listings';

  @override
  String get homeRecent => 'Recent Activity';

  @override
  String get homeNoActivity => 'No activity yet.';

  @override
  String get menuTitle => 'Menu';

  @override
  String get menuProfile => 'Profile';

  @override
  String get menuDiscover => 'Discover';

  @override
  String get menuRepair => 'Repair';

  @override
  String get menuNotifications => 'Notifications';

  @override
  String get menuSettings => 'Settings';

  @override
  String get menuContact => 'Contact';

  @override
  String get discoverSearch => 'Search devices, categories or spots...';

  @override
  String get discoverCategories => 'CATEGORIES';

  @override
  String get discoverPhone => 'Phone';

  @override
  String get discoverLaptop => 'Computer';

  @override
  String get discoverTablet => 'Tablet';

  @override
  String get discoverOther => 'Other';

  @override
  String get discoverFeatured => 'FEATURED';

  @override
  String get discoverNearby => 'NEARBY SPOTS';

  @override
  String get discoverPromo1Tag => 'Repair Campaign';

  @override
  String get discoverPromo1Title => 'Screen Replacement';

  @override
  String get discoverPromo1Sub => 'Up to 20% recycling discount';

  @override
  String get discoverPromo2Tag => 'Sales Opportunity';

  @override
  String get discoverPromo2Title => 'Sell Your Old Device';

  @override
  String get discoverPromo2Sub => 'Instant valuation and cash payment';

  @override
  String get discoverPromo3Title => 'Recycling Report';

  @override
  String get discoverPromo3Sub => 'See your monthly environmental impact';

  @override
  String get mapOpen => 'Open';

  @override
  String get mapClosed => 'Closed';

  @override
  String get mapLocate => 'My location';

  @override
  String get mapNoPermission => 'Location permission not granted.';

  @override
  String get marketTitle => 'Marketplace';

  @override
  String get marketSafeTitle => 'Safe Selling System';

  @override
  String get marketSafeBody =>
      'Every sale made through ReStart is covered by 100% buyer protection. Your payment is released once the item reaches the buyer.';

  @override
  String get marketMore => 'LEARN MORE';

  @override
  String get marketSearch => 'Search second-hand items...';

  @override
  String get marketActive => 'ACTIVE LISTINGS';

  @override
  String get marketPending => 'PENDING SALES';

  @override
  String get marketOps => 'orders';

  @override
  String get marketForYou => 'Picked for you';

  @override
  String get marketEmpty => 'No products found in this category';

  @override
  String get catAll => 'All';

  @override
  String get catLaptop => 'Computer';

  @override
  String get catAccessory => 'Accessory';

  @override
  String get listingTitle => 'Create Listing';

  @override
  String listingPhotos(String count) {
    return 'PHOTOS ($count/5)';
  }

  @override
  String get listingCover => 'Cover';

  @override
  String get listingPhotoHint => 'Clear, bright photos help it sell faster.';

  @override
  String get listingTitleLabel => 'LISTING TITLE';

  @override
  String get listingTitlePh => 'e.g. Working second-hand washing machine';

  @override
  String get listingCategory => 'CATEGORY';

  @override
  String get listingCategoryPh => 'Select a category';

  @override
  String get listingDescription => 'DESCRIPTION';

  @override
  String get listingDescriptionPh =>
      'Describe the condition, defects and technical specs.';

  @override
  String get listingPrice => 'PRICE (TRY)';

  @override
  String get listingLocation => 'LOCATION';

  @override
  String get listingLocationPh => 'City, District';

  @override
  String get listingTipsTitle => 'Safe Selling Tips';

  @override
  String get listingTipsBody =>
      'Avoid sharing personal information and prefer to hand over items in safe, public places.';

  @override
  String get listingPublish => 'Publish Listing';

  @override
  String get listingSuccess => 'Your listing is live!';

  @override
  String get listingFailed =>
      'Could not publish the listing. Please try again.';

  @override
  String get listingCamera => 'Camera';

  @override
  String get listingGallery => 'Gallery';

  @override
  String get listingPhotoTitle => 'Add photo';

  @override
  String get repairSub =>
      'Bring your device back to life and cut your carbon footprint.';

  @override
  String get repairEcoTitle => 'Repair is the greenest option';

  @override
  String get repairEcoBody =>
      'Repairing an existing device instead of manufacturing a new one prevents about 80% of the e-waste and carbon emissions of an average smartphone.';

  @override
  String get repairServices => 'SELECT A SERVICE';

  @override
  String get repairScreen => 'Screen & Glass';

  @override
  String get repairScreenSub => 'Original or A-grade';

  @override
  String get repairBattery => 'Battery';

  @override
  String get repairBatterySub => 'Warranted replacement';

  @override
  String get repairBoard => 'Motherboard Repair';

  @override
  String get repairBoardSub => 'Micro-soldering and chip replacement.';

  @override
  String get repairNearby => 'NEARBY SERVICES';

  @override
  String recStep(String n) {
    return 'STEP $n OF 3';
  }

  @override
  String get recStepDevice => 'Device Selection';

  @override
  String get recQuestion => 'Which device are you recycling?';

  @override
  String get recQuestionSub =>
      'The device type you choose helps us find suitable recycling facilities.';

  @override
  String get recPhone => 'Phone';

  @override
  String get recPhoneSub => 'Smartphones, feature phones';

  @override
  String get recLaptop => 'Laptop';

  @override
  String get recLaptopSub => 'Laptops, netbooks';

  @override
  String get recTablet => 'Tablet';

  @override
  String get recTabletSub => 'Tablet computers, e-readers';

  @override
  String get recOther => 'Other';

  @override
  String get recOtherSub => 'Accessories, small appliances';

  @override
  String get recContinue => 'Continue';

  @override
  String get recDetailsTitle => 'Device Details';

  @override
  String get recDetailsSub =>
      'Please enter accurate information for the valuation.';

  @override
  String get recStepCategory => 'Category';

  @override
  String get recStepDetails => 'Details';

  @override
  String get recStepConfirm => 'Confirm';

  @override
  String get recBrand => 'Brand';

  @override
  String get recBrandPh => 'e.g. Apple, Samsung...';

  @override
  String get recModel => 'Model / Year';

  @override
  String get recModelPh => 'e.g. iPhone 12, 2021';

  @override
  String get recCondition => 'Device Condition';

  @override
  String get recWorking => 'Working';

  @override
  String get recWorkingSub => 'All functions active.';

  @override
  String get recDamaged => 'Slightly Damaged';

  @override
  String get recDamagedSub => 'Scratches or minor defects.';

  @override
  String get recBroken => 'Not Working';

  @override
  String get recBrokenSub => 'Won\'t turn on or badly damaged.';

  @override
  String get recWeight => 'Estimated Weight (kg)';

  @override
  String get recDelivery => 'Delivery Method';

  @override
  String get recDropoff => 'Drop Off';

  @override
  String get recCourier => 'Call Courier';

  @override
  String get recCenter => 'Nearest Facility';

  @override
  String get recCenterPh => 'Select a facility';

  @override
  String get recEstimate => 'ESTIMATED GAIN';

  @override
  String recCourierBonus(String bonus) {
    return 'With electric courier +$bonus';
  }

  @override
  String get recSubmit => 'Create Request';

  @override
  String get recFailed => 'Could not send the request. Please try again.';

  @override
  String get recPickCenter => 'Please choose a recycling facility.';

  @override
  String get courierTitle => 'Choose a Courier';

  @override
  String get courierSub => 'Pick the right vehicle for your items.';

  @override
  String get courierElectric => 'ELECTRIC';

  @override
  String get courierZero => 'Zero-Emission Delivery';

  @override
  String get courierSelect => 'Select';

  @override
  String get courierCargo => 'Cargo Vehicle';

  @override
  String get courierHeavy => 'Heavy Load';

  @override
  String courierEta(String min) {
    return '~$min min';
  }

  @override
  String get doneTitle => 'Request received';

  @override
  String get doneEarned => 'REWARD EARNED';

  @override
  String doneCo2(String kg) {
    return 'You saved $kg kg of CO₂';
  }

  @override
  String get doneCert => 'Zero Waste Certified';

  @override
  String get doneHome => 'BACK TO HOME';

  @override
  String get rewTitle => 'Your Impact';

  @override
  String get rewSub =>
      'Track your environmental contribution and claim rewards.';

  @override
  String get rewHistory => 'Claim History';

  @override
  String get rewBalance => 'AVAILABLE ECO-POINTS';

  @override
  String get rewRecycled => 'Recycled';

  @override
  String get rewRepaired => 'Repaired';

  @override
  String get rewSold => 'Sold';

  @override
  String get rewTier => 'Tier';

  @override
  String get rewTop => 'TOP CONTRIBUTORS';

  @override
  String get rewYou => 'You';

  @override
  String get rewAchievements => 'Achievements';

  @override
  String get rewCatalog => 'Reward Catalog';

  @override
  String get rewUse => 'Redeem';

  @override
  String get rewNone => 'No rewards available right now';

  @override
  String get rewDigital => 'Digital';

  @override
  String get rewTransit => 'Transit';

  @override
  String get rewService => 'Service';

  @override
  String get rewEco => 'Nature';

  @override
  String get rewRedeemed => 'Reward redeemed';

  @override
  String get rewFailed => 'Could not redeem the reward';

  @override
  String get profVerified => 'Verified Member';

  @override
  String get profTotal => 'TOTAL ACTIONS';

  @override
  String get profCo2 => 'CO₂ SAVED (KG)';

  @override
  String get profSold => 'ITEMS SOLD';

  @override
  String get profRepaired => 'ITEMS REPAIRED';

  @override
  String get profImpact => 'Impact Report';

  @override
  String profOps(String n) {
    return '$n actions';
  }

  @override
  String get profRecent => 'Recent Transactions';

  @override
  String profPointsGain(String n) {
    return '+$n Points';
  }

  @override
  String get notifTitle => 'Notifications';

  @override
  String get notifMarkAll => 'MARK ALL AS READ';

  @override
  String get notifToday => 'TODAY';

  @override
  String get notifYesterday => 'YESTERDAY';

  @override
  String get notifOlder => 'EARLIER';

  @override
  String get notifEmpty => 'No notifications yet';

  @override
  String get notifEmptySub => 'New activity will show up here.';

  @override
  String get setTitle => 'Settings';

  @override
  String get setAppearance => 'APPEARANCE';

  @override
  String get setTheme => 'Theme';

  @override
  String get setLight => 'Light';

  @override
  String get setDark => 'Dark';

  @override
  String get setSystem => 'System';

  @override
  String get setLanguage => 'Language';

  @override
  String get setAccount => 'ACCOUNT';

  @override
  String get setProfile => 'Profile';

  @override
  String get setPassword => 'Password';

  @override
  String get setNotifs => 'Notifications';

  @override
  String get setSecurity => 'SECURITY';

  @override
  String get setSession => 'Session Security';

  @override
  String get setActive => 'Active';

  @override
  String get setAbout => 'ABOUT';

  @override
  String get setTerms => 'Terms';

  @override
  String get setPrivacy => 'Privacy';

  @override
  String get setVersion => 'Version';

  @override
  String get setLogout => 'Sign Out';

  @override
  String get contactHeadline => 'How can we help you?';

  @override
  String get contactBody =>
      'Fill in the form for questions about recycling, repair or the rewards program, or contact us directly.';

  @override
  String get contactSend => 'Send a Message';

  @override
  String get contactName => 'Full Name';

  @override
  String get contactNamePh => 'Your full name';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactEmailPh => 'name@email.com';

  @override
  String get contactMessage => 'Your message';

  @override
  String get contactMax => 'Max 1000 characters';

  @override
  String get contactMessagePh => 'How can we help you?';

  @override
  String get contactSubmit => 'SEND';

  @override
  String get contactChannels => 'ALTERNATIVE CHANNELS';

  @override
  String get contactEmailChannel => 'EMAIL';

  @override
  String get contactPhoneChannel => 'PHONE (24/7)';

  @override
  String get contactSent => 'Your message was sent.';

  @override
  String get contactFailed => 'Could not send the message.';
}
