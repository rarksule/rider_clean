import 'package:flutter/material.dart';

abstract class AppLanguage {
  String get offlineMsg;

  String get tryAgain;

  String get skip;

  String get other;

  String get weverify;

  String get standardrates;

  static AppLanguage? of(BuildContext context) =>
      Localizations.of<AppLanguage>(context, AppLanguage);

  String get appName;

  String get welcomeBack;

  String get signInYourAccount;

  String get thisFieldRequired;

  String get email;

  String get logIn;

  String get donHaveAnAccount;

  String get signUp;

  String get createAccount;

  String get createYourAccountToContinue;

  String get firstName;

  String get lastName;

  String get userName;

  String get phoneNumber;

  String get alreadyHaveAnAccount;

  String get yes;

  String get no;

  String get submit;

  String get language;

  String get notification;

  String get phoneLengthLimit;

  String get about;

  String get useInCaseOfEmergency;

  String get notifyAdmin;

  String get notifiedSuccessfully;

  String get complain;

  String get pleaseEnterSubject;

  String get writeDescription;

  String get saveComplain;

  String get editProfile;

  String get address;

  String get updateProfile;

  String get notChangeUsername;

  String get notChangeEmail;

  String get profileUpdateMsg;

  String get areYouSureYouWantDeleteThisNumber;

  String get addContact;

  String get save;

  String get availableBalance;

  String get recentTransactions;

  String get moneyDeposited;

  String get addMoney;

  String get cancel;

  String get pleaseSelectAmount;

  String get amount;

  String get capacity;

  String get paymentMethod;

  String get chooseYouPaymentLate;

  String get enterPromoCode;

  String get confirm;

  String get forInstantPayment;

  String get bookNow;

  String get wallet;

  String get paymentDetail;

  String get rideId;

  String get createdAt;

  String get viewHistory;

  String get paymentDetails;

  String get paymentType;

  String get paymentStatus;

  String get priceDetail;

  String get basePrice;

  String get distancePrice;

  String get timePrice;

  String get waitTime;

  String get extraCharges;

  String get couponDiscount;

  String get total;

  String get payment;

  String get cash;

  String get updatePaymentStatus;

  String get waitingForDriverConformation;

  String get continueNewRide;

  String get payToPayment;

  String get tip;

  String get pay;

  String get howWasYourRide;

  String get wouldYouLikeToAddTip;

  String get addMoreTip;

  String get addMore;

  String get addReviews;

  String get writeYourComments;

  String get continueD;

  String get detailScreen;

  String get aboutDriver;

  String get rideHistory;

  String get emergencyContacts;

  String get logOut;

  String get areYouSureYouWantToLogoutThisApp;

  String get whatWouldYouLikeToGo;

  String get enterYourDestination;

  String get currentLocation;

  String get destinationLocation;

  String get chooseOnMap;

  String get profile;

  String get privacyPolicy;

  String get helpSupport;

  String get termsConditions;

  String get aboutUs;

  String get lookingForNearbyDrivers;

  String get weAreLookingForNearDriversAcceptsYourRide;

  String get areYouSureYouWantToCancelThisRide;

  String get get;

  String get rides;

  String get people;

  String get fare;

  String get done;

  String get availableOffers;

  String get off;

  String get didNotReceiveTheCode;

  String get resend;

  String get carModel;

  String get sos;

  String get driverReview;

  String get signInUsingYourMobileNumber;

  String get otp;

  String get newRideRequested;

  String get accepted;

  String get arrived;

  String get inProgress;

  String get cancelled;

  String get completed;

  String get pleaseEnableLocationPermission;

  String get pending;

  String get failed;

  String get paid;

  String get deleteAccount;

  String get account;

  String get areYouSureYouWantPleaseReadAffect;

  String get deletingAccountEmail;

  String get areYouSureYouWantDeleteAccount;

  String get yourInternetIsNotWorking;

  String get allow;

  String get mostReliableShiwRiderApp;

  String get toEnjoyYourRideExperiencePleaseAllowPermissions;

  String get txtURLEmpty;

  String get lblFollowUs;

  String get setting;

  String get duration;

  String get paymentVia;

  String get findPlace;

  String get pleaseWait;

  String get selectPlace;

  String get placeNotInArea;

  String get complainList;

  String get writeMsg;

  String get pleaseEnterMsg;

  String get viewAll;

  String get pleaseSelectRating;

  String get moneyDebit;

  String get pleaseAcceptTermsOfServicePrivacyPolicy;

  String get iAgreeToThe;

  String get driverInformation;

  String get service;

  String get invoice;

  String get customerName;

  String get sourceLocation;

  String get invoiceNo;

  String get invoiceDate;

  String get orderedDate;

  String get lblCarNumberPlate;

  String get lblCouponCode;

  String get lblRide;

  String get lblRideInformation;

  String get lblWhereAreYou;

  String get lblDropOff;

  String get lblDistance;

  String get lblWhoRiding;

  String get lblSomeoneElse;

  String get lblYou;

  String get lblWhoRidingMsg;

  String get lblNext;

  String get lblLessWalletAmount;

  String get lblPayWhenEnds;

  String noteAccountOwner(String accountName) {
    return 'the Account owner is $accountName';
  }

  String get codeSent;

  String get selectLanguage;

  String get walkThrough1Title;

  String get walkThrough1Subtitle;

  String get walkThrough2Title;

  String get walkThrough3Title;

  String get walkThrough3Subtitle;

  String get walkThrough2Subtitle;

  String get via;

  String get status;

  String get minimumFare;

  String get minutePrice;

  String get waitingTimePrice;

  String get additionalFees;

  String get withDraw;

  String get missingBankDetail;

  String get minimum;

  String get maximum;

  String get required;

  String get bankInfo;

  String get description;

  String get price;

  String get selectSources;

  String get camera;

  String get gallery;

  String? get bankInfoUpdated;

  String get bankName;

  String get accountHolderName;

  String get accountNumber;

  String get updateBankDetail;

  String get addBankDetail;

  String get riderInformation;

  String get withdrawHistory;

  String get approved;

  String get declined;

  String get requested;

  String get cancelRide;

  String get writeReasonHere;

  String get selectReason;

  String get otpCodeHasBeenSentTo;

  String get validateOtp;

  String get driverGoingWrongDirection;

  String get pickUpTimeTakingTooLong;

  String get driverAskedMeToCancel;

  String get oops;

  String get transferedBy;

  String get txnId;

  String get txnDate;

  String get whoWillBeSeated;

  String get servicesNotFound;

  String get stuckHint => 'if you stuck here please restart your app';
}
