import 'package:az_tech/models/person_model.dart';
import 'package:az_tech/networking/api_calling.dart';
import 'package:get/get.dart';

class PeopleController extends GetxController {
  var peopleList = List<People>.empty(growable: true).obs;
  var searchList = List<People>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPeople();
  }

  void getPeople() async {
    try {
      isLoading(true);
      var people = await ApiService().getPeople();
      peopleList.assignAll(people);
    } finally {
      isLoading(false);
    }
  }

  void searchPeople(String query) {
    final books = peopleList.where((people) {
      final age = people.age!.toLowerCase();
      final interests = people.interests!.toLowerCase();
      final searchLower = query.toLowerCase();

      return age.contains(searchLower) || interests.contains(searchLower);
    }).toList();

    searchList.value = books;
  }
}
