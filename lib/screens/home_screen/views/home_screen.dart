import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_dev/screens/home_screen/controller/home_controller.dart';
import 'package:learn_dev/util_widgets/error_display_widget.dart';
import '../../../themes/text_styles.dart';
import '../../../util_widgets/loader_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Home",
          style: headings,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, left: 20, right: 20, bottom: 15),
              child: TextField(
                controller: homeController.searchController,
                onChanged: (value) {
                  homeController.searchData(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search Data',
                  suffixIcon: IconButton(
                    onPressed: () {
                      homeController
                          .searchData(homeController.searchController.text);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  if (controller.loading) {
                    return const Center(
                      child: LoaderWidget(),
                    );
                  } else if (controller.posts?.length == 0) {
                    return Center(
                      child: ErrorDisplayWidget(
                        errText: "No data found!",
                      ),
                    );
                  } else {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.posts?.length,
                      itemBuilder: (ctx, ind) {
                        return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            child: Text(
                              controller.posts == null
                                  ? ''
                                  : controller.posts![ind].title,
                              style: titleText,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 10, right: 10, bottom: 20),
                            child: Text(
                              controller.posts == null
                                  ? ''
                                  : controller.posts![ind].body ?? '',
                              style: subTitleText,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
