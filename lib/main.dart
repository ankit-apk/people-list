import 'package:az_tech/views/people.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'controllers/people_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PeopleController _peopleController = Get.put(PeopleController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Obx(
        () => _peopleController.isLoading.value ? LoadingPage() : PeoplePage(),
      ),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    var medq = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: medq.height,
          width: medq.width,
          color: Color(0xff3d152b),
          child: Container(
            height: medq.height * 0.3,
            width: medq.width / 1.3,
            child: RiveAnimation.asset(
              'assets/isLoading.riv',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
