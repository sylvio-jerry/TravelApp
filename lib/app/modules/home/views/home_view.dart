import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/app/models/place.dart';
import 'package:travel/app/routes/app_pages.dart';
import 'package:travel/app/shared/themes/app_color.dart';
import 'package:travel/app/shared/widgets/custom_icon_button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  child: Column(
                    children: [
                      const UserInfo(),
                      const SizedBox(height: 25),
                      const SearchBox(),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular places',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('View all',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColor.grayColor)),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      const PlaceCategory(),
                      const SizedBox(height: 50),
                      Container(
                        padding: const EdgeInsets.only(right: 20.0),
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.placeList.length,
                            itemBuilder: (context, index) {
                              return BuildPlace(
                                  place: homeController.placeList[index]);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.selectedNav,
          elevation: 0,
          selectedItemColor: AppColor.primaryLight,
          unselectedItemColor: AppColor.grayColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (int index) {
            state.setSelectedNav(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/icon_home.png'),
                  size: 20,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/icon_clock.png'),
                  size: 20,
                ),
                label: 'Discover'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/icon_heart.png'),
                  size: 20,
                ),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/icon_user.png'),
                  size: 20,
                ),
                label: 'Profile'),
          ],
        );
      }),
    );
  }
}

class BuildPlace extends StatelessWidget {
  const BuildPlace({
    super.key,
    required this.place,
  });
  final Place place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAILS, arguments: place);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        width: 225,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image:
              DecorationImage(image: AssetImage(place.image), fit: BoxFit.fill),
        ),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(colors: [
                AppColor.black.withOpacity(.8),
                AppColor.black.withOpacity(.1),
              ], stops: const [
                .2,
                .7
              ], begin: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CustomIconButton(
                      icon: Icons.favorite_border, onPressed: () {}),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white.withOpacity(.4),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${place.place}, ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                              ),
                              Text(
                                place.country,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: AppColor.black.withOpacity(.6)),
                              ),
                            ],
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
                                    .copyWith(
                                        color: AppColor.black.withOpacity(.6)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_border,
                            color: AppColor.black.withOpacity(.6),
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            place.rating,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColor.black.withOpacity(.6)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class PlaceCategory extends StatelessWidget {
  const PlaceCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (state) {
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.popularPlaces.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                state.setSelectedPlaces(index);
              },
              child: cardPlaces(
                  place: state.popularPlaces[index],
                  index: index,
                  isActive: index == state.selectedPlaces),
            );
          },
        ),
      );
    });
  }
}

class cardPlaces extends StatelessWidget {
  final String place;
  final int index;
  final bool isActive;
  const cardPlaces({
    super.key,
    required this.place,
    required this.index,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isActive
            ? Colors.black.withOpacity(.8)
            : Colors.black.withOpacity(.2),
      ),
      child: Center(
        child: Text(place,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(letterSpacing: 5, color: Colors.white)),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Hi, Jerry 👋',
          style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text('Explore the world',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColor.grayColor, fontFamily: 'Inter')),
      trailing: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: AppColor.primaryLight,
            borderRadius: BorderRadius.circular(18),
            image: const DecorationImage(
              image: AssetImage('assets/images/jerry.png'),
            )),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColor.grayColor.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search places ...',
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColor.grayColor,
                    ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 35,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColor.grayColor, width: 2),
              ),
            ),
            child: IconButton(
                onPressed: () {},
                icon: ClipRRect(
                  child: Image.asset(
                    "assets/icons/setting_icon.png",
                    width: 24,
                    height: 21,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
