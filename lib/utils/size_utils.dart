import 'package:flutter/material.dart';

import '../common_export.dart';

/// [SizeConfig] to make project scalable
class UiSizeConfig {
  static MediaQueryData? _mediaQueryData;
  static bool isMobile = false, isTablet = false, isDesktop = true;
  static double? screenWidth,
      screenHeight,
      blockSizeHorizontal,
      blockSizeVertical,
      _safeAreaHorizontal,
      _safeAreaVertical,
      safeBlockHorizontal,
      safeBlockVertical,
      profileDrawerWidth,
      refHeight,
      refWidth,
      refMobileHeight,
      refMobileWidth,
      refTabletHeight,
      refTabletWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    refHeight = 897;
    refWidth = 1366;
    refTabletHeight = 1024;
    refTabletWidth = 768;
    refMobileHeight = 760;
    refMobileWidth = 360;
    isDesktop = Responsive.isDesktop(context);
    isMobile = Responsive.isMobile(context);
    isTablet = Responsive.isTablet(context);

    if (screenHeight! < 1200) {
      blockSizeHorizontal = screenWidth! / 100;
      blockSizeVertical = screenHeight! / 100;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
      safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
    } else {
      blockSizeHorizontal = screenWidth! / 120;
      blockSizeVertical = screenHeight! / 120;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 120;
      safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 120;
    }
  }

  static double getWidthRatio(double val) {
    double res = (val / refWidth!) * 100;
    return res * blockSizeHorizontal! > 2800
        ? 2400
        : res * blockSizeHorizontal!;
  }

  static double getHeightRatio(double val) {
    double res = (val / refHeight!) * 100;
    return res * blockSizeVertical!;
  }

  static double getFontRatio(double val) {
    // double res = (val / refWidth!) * 100;
    // if (screenWidth! > screenHeight!) {
    //   return res * safeBlockHorizontal!;
    // } else {
    //   return res * safeBlockVertical!;
    // }
    return val;
  }

  static double getTabletWidthRatio(double val) {
    double res = (val / refTabletWidth!) * 100;
    return res * blockSizeHorizontal!;
  }

  static double getTabletHeightRatio(double val) {
    double res = (val / refTabletHeight!) * 100;
    return res * blockSizeVertical!;
  }

  static double getTabletFontRatio(double val) {
    double res = (val / refTabletWidth!) * 100;
    if (screenWidth! < screenHeight!) {
      return res * safeBlockHorizontal!;
    } else {
      return res * safeBlockVertical!;
    }
  }

  static double getMobileWidthRatio(double val) {
    double res = (val / refMobileWidth!) * 100;
    return res * blockSizeHorizontal!;
  }

  static double getMobileHeightRatio(double val) {
    double res = (val / refMobileHeight!) * 100;
    return res * blockSizeVertical!;
  }

  static double getMobileFontRatio(double val) {
    double res = (val / refMobileWidth!) * 100;
    if (screenWidth! < screenHeight!) {
      return res * safeBlockHorizontal!;
    } else {
      return res * safeBlockVertical!;
    }
  }

  static double getResponsiveFont(double val) {
    if (isMobile) {
      return val.toMobileFont;
    } else if (isTablet) {
      return val.toTabletFont;
    } else {
      return val.toFont;
    }
  }

  static double getResponsiveHeight(double val) {
    if (isMobile) {
      return val.toMobileHeight;
    } else if (isTablet) {
      return val.toTabletHeight;
    } else {
      return val.toHeight;
    }
  }

  static double getResponsiveWidth(double val) {
    if (isMobile) {
      return val.toMobileWidth;
    } else if (isTablet) {
      return val.toTabletWidth;
    } else {
      return val.toWidth;
    }
  }
}

extension SizeUtils on num {
  double get toWidth => UiSizeConfig.getWidthRatio(toDouble());

  double get toHeight => UiSizeConfig.getHeightRatio(toDouble());

  double get toFont => UiSizeConfig.getFontRatio(toDouble());

  double get toTabletWidth => UiSizeConfig.getTabletWidthRatio(toDouble());

  double get toTabletHeight => UiSizeConfig.getTabletHeightRatio(toDouble());

  double get toTabletFont => UiSizeConfig.getTabletFontRatio(toDouble());

  double get toMobileWidth => UiSizeConfig.getMobileWidthRatio(toDouble());

  double get toMobileHeight => UiSizeConfig.getMobileHeightRatio(toDouble());

  double get toMobileFont => UiSizeConfig.getMobileFontRatio(toDouble());

  double get toResponsiveFont => UiSizeConfig.getResponsiveFont(toDouble());

  double get toResponsiveHeight => UiSizeConfig.getResponsiveHeight(toDouble());

  double get toResponsiveWidth => UiSizeConfig.getResponsiveWidth(toDouble());
}
