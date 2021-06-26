import 'package:az_tech/controllers/people_controller.dart';
import 'package:az_tech/views/search_people.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  PeopleController _peopleController = Get.put(PeopleController());
  @override
  Widget build(BuildContext context) {
    var medq = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(PeopleSearch());
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: Colors.purple.shade400,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: medq.width * 0.02,
                    ),
                    Text(
                      "Filter",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 100, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'People',
                    style: TextStyle(
                      fontFamily: 'TheSecret',
                      fontSize: medq.height * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    color: Colors.purple.shade300,
                    height: medq.height * 0.007,
                    width: medq.width / 4.3,
                  ),
                  SizedBox(
                    height: medq.height * 0.03,
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                      childAspectRatio: 9 / 11,
                    ),
                    itemCount: _peopleController.peopleList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: medq.width / 2.2,
                          height: medq.height * 0.4,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: CachedNetworkImage(
                                  imageUrl: _peopleController
                                      .peopleList[index].image!,
                                  placeholder: (context, url) =>
                                      RiveAnimation.asset(
                                    'assets/placeholder.riv',
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.directional(
                                bottom: 36,
                                start: 8,
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  _peopleController.peopleList[index].name!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: medq.height * 0.025,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                bottom: 36,
                                end: 8,
                                textDirection: TextDirection.ltr,
                                child: CircleAvatar(
                                  backgroundColor: Colors.purple.shade300,
                                  child: Text(
                                    _peopleController.peopleList[index].age!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: medq.height * 0.025,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                bottom: 16,
                                start: 8,
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  'Interests: ${_peopleController.peopleList[index].interests!}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: medq.height * 0.018,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
