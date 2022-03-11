import 'package:flutter_app/app/common/cache/storage_utils.dart';
import 'package:flutter_app/app/modules/goods_detail/views/goods_detail_view.dart';
import 'package:flutter_app/app/modules/guide/bindings/guide_binding.dart';
import 'package:flutter_app/app/modules/guide/views/guide_view.dart';
import 'package:flutter_app/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_app/app/modules/login/views/login_view.dart';
import 'package:flutter_app/app/modules/start/bindings/start_binding.dart';
import 'package:flutter_app/app/modules/start/views/start_view.dart';
import 'package:flutter_app/app/modules/tabs/category/views/category_view.dart';
import 'package:flutter_app/app/modules/tabs/home/views/home_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/account_setting/bindings/account_setting_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/account_setting/verify_email/bindings/verify_email_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/account_setting/verify_email/views/verify_email_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/account_setting/views/account_setting_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/address_edit/bindings/address_edit_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/address_edit/views/address_edit_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/bindings/address_list_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/views/address_list_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/feedback/bindings/feedback_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/feedback/views/feedback_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/general_setting/bindings/general_setting_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/general_setting/views/general_setting_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_detail/bindings/order_detail_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_detail/views/order_detail_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_preview/bindings/order_preview_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_preview/views/order_preview_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/bindings/star_list_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/views/star_list_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/update_info/bindings/update_info_binding.dart';
import 'package:flutter_app/app/modules/tabs/setting/update_info/views/update_info_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/views/setting_view.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/views/shopcart_view.dart';
import 'package:flutter_app/app/modules/tabs/views/tabs_view.dart';
import 'package:get/get.dart';

import '../modules/tabs/setting/order/order_list/bindings/order_list_binding.dart';
import '../modules/tabs/setting/order/order_list/views/order_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final INITIAL = _initialPage();

  // 是否是第一次安装
  static String get localKey => 'cache-is-first-installed';

  static String _initialPage() {
    final String? isFirstInstalled = StorageUtils.db.getString(localKey);

    if (isFirstInstalled != null) {
      return Routes.START;
    } else {
      StorageUtils.db.setString(localKey, 'ok');
      return Routes.GUIDE;
    }
  }

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TABS,
      page: () => TabsView(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
        ),
        GetPage(
          name: _Paths.SETTING,
          page: () => SettingView(),
          children: [
            GetPage(
              name: _Paths.ADDRESS_LIST,
              page: () => AddressListView(),
              binding: AddressListBinding(),
              children: [
                GetPage(
                  name: _Paths.ADDRESS_EDIT,
                  page: () => AddressEditView(),
                  binding: AddressEditBinding(),
                ),
              ],
            ),
            GetPage(
              name: _Paths.STAR_LIST,
              page: () => StarListView(),
              binding: StarListBinding(),
            ),
            GetPage(
              name: _Paths.ORDER_LIST,
              page: () => OrderListView(),
              binding: OrderListBinding(),
            ),
            GetPage(
              name: _Paths.ORDER_PREVIEW,
              page: () => OrderPreviewView(),
              binding: OrderPreviewBinding(),
            ),
            GetPage(
              name: _Paths.ORDER_DETAIL,
              page: () => OrderDetailView(),
              binding: OrderDetailBinding(),
            ),
            GetPage(
              name: _Paths.FEEDBACK,
              page: () => FeedbackView(),
              binding: FeedbackBinding(),
            ),
            GetPage(
              name: _Paths.GENERAL_SETTING,
              page: () => GeneralSettingView(),
              binding: GeneralSettingBinding(),
            ),
            GetPage(
              name: _Paths.ACCOUNT_SETTING,
              page: () => AccountSettingView(),
              binding: AccountSettingBinding(),
              children: [
                GetPage(
                  name: _Paths.VERIFY_EMAIL,
                  page: () => VerifyEmailView(),
                  binding: VerifyEmailBinding(),
                ),
              ],
            ),
            GetPage(
              name: _Paths.UPDATE_INFO,
              page: () => UpdateInfoView(),
              binding: UpdateInfoBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.SHOPCART,
          page: () => ShopcartView(),
        ),
        GetPage(
          name: _Paths.CATEGORY,
          page: () => CategoryView(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.GOODS_DETAIL,
      page: () => GoodsDetailView(),
    ),
    GetPage(
      name: _Paths.GUIDE,
      page: () => GuideView(),
      binding: GuideBinding(),
    ),
    GetPage(
      name: _Paths.START,
      page: () => StartView(),
      binding: StartBinding(),
    ),
  ];
}
