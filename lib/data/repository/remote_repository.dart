import '../models/EventsResponse.dart';

abstract class RemoteRepository{
  Future<EventsResponse> getEvents({String? query});
}

