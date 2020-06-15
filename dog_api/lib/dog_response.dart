

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