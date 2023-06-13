class Apis {
  static const baseUrl = 'http://157.175.150.140:9500';
  static const apiUrl = '/api/';

  static const signUpApi = '$baseUrl${apiUrl}register/';
  static const loginApi = '$baseUrl${apiUrl}login/';
  static const profileApi= '$baseUrl${apiUrl}profile/';
  static const updateProfileApi= '$baseUrl${apiUrl}update-user-profile/';
  static const changePasswordApi= '$baseUrl${apiUrl}change-password/';
  static const transferMoneyApi= '$baseUrl${apiUrl}transfer/';
}