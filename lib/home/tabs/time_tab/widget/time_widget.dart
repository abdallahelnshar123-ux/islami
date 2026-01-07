import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/screen_size.dart';
import 'Pray_time_widget.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,

      /// background ========================================================
      child: Container(
        height: double.infinity,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppAssets.prayBg),
          ),
          borderRadius: BorderRadius.circular(40),
        ),

        /// body ============================================================
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.011,
                horizontal: context.width * 0.04,
              ),

              /// header ============================================================
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('16 Jul,\n2024', style: AppStyles.bold16White),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Pray Time',
                        style: AppStyles.bold20Black.copyWith(
                          color: AppColors.black70Color,
                        ),
                      ),
                      Text(
                        'Tuesday',
                        style: AppStyles.bold20Black.copyWith(
                          color: AppColors.black90Color,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '09 Muh,\n1446',
                    style: AppStyles.bold16White,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),

            /// time slider ====================================================
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  autoPlay: true,
                  height: context.height * 0.17,
                  viewportFraction: .3,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  enlargeFactor: .30,
                ),
                items: List.generate(5, (index) => index).map((index) {
                  return PrayTimeWidget(index: index);
                }).toList(),
              ),
            ),

            /// footer ======================================================
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.011,
                horizontal: context.width * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconBuilder(AppColors.transparentColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Next Pray',
                        style: AppStyles.bold16Black.copyWith(
                          color: AppColors.black70Color,
                        ),
                      ),
                      Text(' - 02:32', style: AppStyles.bold16Black),
                    ],
                  ),
                  iconBuilder(AppColors.blackColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconBuilder(Color color) {
    return IconButton(
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      padding: EdgeInsets.all(0),
      onPressed: () {},
      icon: SvgPicture.asset(
        width: 25,
        AppAssets.iconVolumeMuted2,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
