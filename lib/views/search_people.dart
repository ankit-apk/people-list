import 'package:az_tech/controllers/people_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class PeopleSearch extends StatefulWidget {
  const PeopleSearch({Key? key}) : super(key: key);

  @override
  _PeopleSearchState createState() => _PeopleSearchState();
}

class _PeopleSearchState extends State<PeopleSearch> {
  PeopleController _peopleController = Get.put(PeopleController());
  @override
  Widget build(BuildContext context) {
    var medq = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8,
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Filter by age or interest',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _peopleController.searchPeople(value);
                    },
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
                    itemCount: _peopleController.searchList.length,
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
                                      .searchList[index].image!,
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
                                  _peopleController.searchList[index].name!,
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
                                    _peopleController.searchList[index].age!,
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
                                  'Interests: ${_peopleController.searchList[index].interests!}',
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
