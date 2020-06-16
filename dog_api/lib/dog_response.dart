import 'dart:convert';

import 'package:http/http.dart' as http;

final String dogApi = 'https://dog.ceo/api/breeds/image/random';

class DogResponse {
  final String status;
  final String message;

  DogResponse({this.status, this.message});

  factory DogResponse.fromJson(Map<String, dynamic> json) {
    return DogResponse(
      status: json['status'],
      message: json['message'],
    );
  }
}

Future<DogResponse> fetch() async {
  final response = await http.get(dogApi);

  if (response.statusCode == 200) {
    return DogResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load dog.');
  }
}
