import 'package:flutter/cupertino.dart';
import 'package:halian/data/models/EventsResponse.dart';
import '../../../config/service_locator.dart';
import '../../../services/seat_geek_service.dart';

class DetailsProvider extends ChangeNotifier {
  final _service = locator<SeatGeekService>();
  Events? get selectedEvent => _service.selectedEvent;
  bool get isFavourite =>_service.isFavourite(selectedEvent?.id);

  addToFav() {
    if (isFavourite) {
      _service.removeFavourite(selectedEvent?.id!);
    } else {
      _service.addToFavourite(selectedEvent?.id!);
    }
    notifyListeners();
  }
}
