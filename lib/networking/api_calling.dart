import 'package:az_tech/models/person_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<People>> getPeople() async {
    var client = http.Client();

    var response = await client.get(
      Uri.parse(
          'https://drive.google.com/uc?export=view&id=1JL4MGKpSBOVb8mat1fk1BWD-TbtRK0JE'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return peopleFromJson(jsonString);
    }
    throw response.statusCode;
  }
}
