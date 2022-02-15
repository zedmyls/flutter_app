part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const TABS = _Paths.TABS;
  static const HOME = _Paths.TABS + _Paths.HOME;
  static const SETTING = _Paths.TABS + _Paths.SETTING;
  static const SHOPCART = _Paths.TABS + _Paths.SHOPCART;
  static const CATEGORY = _Paths.TABS + _Paths.CATEGORY;
  static const GOODS_LIST = _Paths.TABS + _Paths.HOME + _Paths.GOODS_LIST;
  static const GOODS_DETAIL = _Paths.GOODS_DETAIL;
  static const ADDRESS_LIST =
      _Paths.TABS + _Paths.SETTING + _Paths.ADDRESS_LIST;
  static const ADDRESS_EDIT =
      _Paths.TABS + _Paths.SETTING + _Paths.ADDRESS_LIST + _Paths.ADDRESS_EDIT;
  static const STAR_LIST = _Paths.TABS + _Paths.SETTING + _Paths.STAR_LIST;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const TABS = '/tabs';
  static const HOME = '/home';
  static const SETTING = '/setting';
  static const SHOPCART = '/shopcart';
  static const CATEGORY = '/category';
  static const GOODS_LIST = '/goods-list';
  static const GOODS_DETAIL = '/goods-detail';
  static const ADDRESS_LIST = '/address-list';
  static const ADDRESS_EDIT = '/address-edit';
  static const STAR_LIST = '/star-list';
}
