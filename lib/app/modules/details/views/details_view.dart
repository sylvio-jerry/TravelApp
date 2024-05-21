import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/app/models/place.dart';
import 'package:travel/app/shared/themes/app_color.dart';
import 'package:travel/app/shared/widgets/custom_icon_button.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({super.key});
  final Place place = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // Retrieve the passed 'place' object

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: PlaceImage(place: place),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(children: [
                  TabBar(
                    indicatorColor: AppColor.black,
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Details'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildOverviewTab(context, place),
                        _buildDetailsTab(context, place),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.black.withOpacity(.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {},
                child: SizedBox(
                  width: Get.width * .8,
                  height: 60,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book Now",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColor.white),
                        ),
                        const SizedBox(width: 15),
                        Image.asset(
                          "assets/icons/send_icon.png",
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Widget _buildOverviewTab(BuildContext context, Place place) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OverviewBox(
                iconPath: "assets/icons/icon_clock.png",
                label: place.time,
              ),
              OverviewBox(
                iconPath: "assets/icons/icon_cloud.png",
                label: place.temperature,
              ),
              OverviewBox(
                iconPath: "assets/icons/icon_stars.png",
                label: place.rating,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColor.white.withOpacity(.9),
                AppColor.white
              ], stops: const [
                .2,
                .7,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Text(
              place.overview,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 2),
            ),
          ),
        ),
      ],
    ),
  );
}

class OverviewBox extends StatelessWidget {
  const OverviewBox({
    super.key,
    required this.iconPath,
    required this.label,
  });

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.grayColor),
          child: Image.asset(
            iconPath,
            width: 15,
            height: 15,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColor.grayColor),
        ),
      ],
    );
  }
}

Widget _buildDetailsTab(BuildContext context, place) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        place.detail,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 2),
      ),
    ),
  );
}

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      width: Get.width,
      height: Get.height * .4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(place.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                  icon: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Get.back();
                  }),
              CustomIconButton(
                  icon: Icons.bookmark_border_rounded, onPressed: () {}),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColor.white.withOpacity(.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      place.place,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColor.black.withOpacity(.6),
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          place.location,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.black.withOpacity(.6)),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Price",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money_outlined,
                          color: AppColor.black.withOpacity(.6),
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          place.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.black.withOpacity(.6)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
