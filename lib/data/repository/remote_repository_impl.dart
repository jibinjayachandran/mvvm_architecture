import 'dart:convert';

import 'package:halian/data/models/EventsResponse.dart';
import 'package:halian/data/repository/remote_repository.dart';
import 'package:halian/utilities/constants.dart';
import 'package:http/http.dart' as http;

class RemoteRepositoryImpl implements RemoteRepository{
  final String baseUrl = 'https://api.seatgeek.com/2';

  @override
  Future<EventsResponse> getEvents({String? query}) async{
    final uri = Uri.parse('$baseUrl/events').replace(queryParameters: {
      'client_id': Constants.clientId,
      'q': query,
    });
    var response = await http.get(uri);
    return EventsResponse.fromJson(jsonDecode(response.body));

  }

}