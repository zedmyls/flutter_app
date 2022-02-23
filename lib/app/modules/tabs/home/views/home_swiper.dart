import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/home/controllers/home_banner_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({Key? key}) : super(key: key);

  HomeBannerController get _controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 1.4,
      width: Get.width,
      child: Obx(
        () => _controller.banner.isNotEmpty
            ? Swiper(
                itemBuilder: (ctx, index) {
                  return Image.network(
                    _controller.banner[index].coverUrl!,
                    fit: BoxFit.fitWidth,
                  );
                },
                itemCount: _controller.banner.length,
                loop: true,
                autoplay: true,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeColor: Get.isDarkMode ? Colors.white : Colors.lightBlueAccent,
                  ),
                ),
                onTap: (index) {
                  Get.toNamed(
                    Routes.GOODS_DETAIL,
                    arguments: _controller.banner[index].id,
                  );
                },
              )
            : Container(
                height: 100,
              ),
      ),
    );
  }
}
