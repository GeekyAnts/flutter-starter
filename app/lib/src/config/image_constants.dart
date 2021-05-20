class AllImages {
  AllImages._();
  static AllImages _instance = AllImages._();
  factory AllImages() => _instance;

  String image = 'assets/image';
  String logo = 'assets/images/logo.png';
  String fslogo = 'assets/images/fslogo.png';
  String google = 'assets/images/google.svg';
  String facebook = 'assets/images/facebook.svg';

  String kDefaultImage =
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
}
