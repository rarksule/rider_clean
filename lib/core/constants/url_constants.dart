class UrlConstants {
  UrlConstants._();
  static const getUserDetail = "get-UserDetail";
  static const initializeLogin = "initialize-login";
  static const register = 'register';
  static const login = 'login';
  static const commonData = "common-data";
  static const getJwt = 'get-jwt';
  static const refreshjwt = 'refresh';
  static const updateProfile = 'update-profile';
  static const logOut = 'log-out';
  static const serviceList = 'service-list';
  static const userDetail = 'user-detail?id=\$userId';
  static const updateLocation = 'update-user-status';
  static const walletData = 'wallet-list?page=\$page';
  static const paymentGateWay = 'payment-gateway-list?status=1';
  static const saveWallet = 'save-wallet';
  static const saveSos = 'save-sos';
  static const sosList = 'sos-list?region_id=\$regionId';
  static const sosDelete = 'sos-delete/\$id';
  static const estimatePriceTime = 'estimate-price-time';
  static const couponList = 'coupon-list';
  static const savePayment = 'save-payment';
  static const saveriderequest = 'save-riderequest';
  static const currentriderequest = 'current-riderequest';
  static const riderequestupdate = 'riderequest-update/\$rideId';
  static const saveriderating = 'save-ride-rating';
  static const adminsosnotify = 'admin-sos-notify';
  static const riderequestList =
      'riderequest-list?page=\$page&rider_id=\$riderId';
  static const savecompliant = 'save-complaint';
  static const riderequestDetail = 'riderequest-detail?id=\$rideId';
  static const notoficationlist =
      'notification-list?page=\$page&type=markas_read';
  static const updateuser = 'update-user-status';
  static const deleteuser = 'delete-user-account';
  static const savecompliantComment = 'save-complaintcomment';
  static const compliantComment =
      'complaintcomment-list?complaint_id=\$complaintId&page=\$currentPage';
  static const driverDetail = 'driver-detail?id=\$userId';
  static const userbankAccount = 'user_bank_account[account_number]';
  static const nearbydriver =
      'near-by-driver?latitude=\${latLng!.latitude}&longitude=\${latLng.longitude}';
  static const appSetting = 'appsetting';
  static const walletDetail = 'wallet-detail';
  static const withdrawRequest = 'withdrawrequest-list?page=\$page';
}

// Future<GoogleMapSearchModel> searchAddressRequest({String? search}) async {
//   return GoogleMapSearchModel.fromJson(await handleResponse(await buildHttpResponse(
//       'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search',
//       method: HttpMethod.GET)));
// }

// Future<GooglePlaceIdModel> searchAddressRequestPlaceId(
//     {String? placeId}) async {
//   return GooglePlaceIdModel.fromJson(await handleResponse(await buildHttpResponse(
//       'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId',
//       method: HttpMethod.GET)));
// }
