import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:halian/config/service_locator.dart';
import 'package:halian/data/models/EventsResponse.dart';
import 'package:halian/data/repository/remote_repository.dart';

import '../config/connectivity_handler.dart';

class SeatGeekService {
  var remoteRepo = locator<RemoteRepository>();
  final ValueNotifier<List<num?>> _favouriteIds = ValueNotifier([]);
  ValueNotifier<List<num?>> get favouriteIds => _favouriteIds;
   Events? _selectedEvent;
  Events? get selectedEvent => _selectedEvent;
  List<num?> favList = [];

  onSelectEvent(Events event) {
    _selectedEvent = event;
  }
  bool isFavourite(num? id) {
    return favList.firstWhere(
            (element) => element == id,
        orElse: () => null) !=
        null
        ? true
        : false;
  }

  addToFavourite(num? id){
    favList.add(id!);
    _favouriteIds.value = List.from(favList);
  }

  removeFavourite(num? id){
    favList.removeWhere((element) => element==id);
    _favouriteIds.value = List.from(favList);
  }

  Future<Either<String?, List<Events>>>? getEvents({String? query}) async {
    if(isOnline) {
      var response = await remoteRepo.getEvents(query: query);
      if (response.events != null && response.events!.isNotEmpty) {
        return Right(response.events!);
      } else {
        return Left(response.message);
      }
    }else{
      return const Left('No Internet Connection');
    }
  }
}
