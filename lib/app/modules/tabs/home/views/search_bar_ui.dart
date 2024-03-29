import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/home/controllers/home_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SearchBarUI extends GetView<HomeController> {
  const SearchBarUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Color(0xff303030) : Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey.withOpacity(0.2), offset: const Offset(0, 2), blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                  child: TextField(
                    onChanged: (String txt) {
                      controller.query = txt;
                    },
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '搜索商品...',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(color: Colors.grey.withOpacity(0.4), offset: const Offset(0, 2), blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Obx(
                  () => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.search, size: 20, color: Colors.white),
                    ),
                    onTap: controller.query.trim().isNotEmpty
                        ? () {
                            Get.toNamed(Routes.HOME_SEARCH, arguments: controller.query);
                          }
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
