import 'package:flutter/material.dart';
import 'package:halian/config/router/route_strings.dart';
import 'package:halian/config/service_locator.dart';
import 'package:halian/data/models/EventsResponse.dart';
import 'package:halian/services/seat_geek_service.dart';

import '../../../../config/router/my_router.dart';
import '../../../../utilities/utils.dart';

class HomeProvider extends ChangeNotifier {
  final _router = locator<MyRouter>().router;
  final _service = locator<SeatGeekService>();
  BuildContext? _context;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Events?> _events = [];

  List<Events?> get events => _events;

  ValueNotifier<List<num?>> get favouriteIds => _service.favouriteIds;

  init(BuildContext context) {
    _context = context;
    loadEventList('');
  }

  bool isFavourite(int index) {
    return _service.favouriteIds.value.firstWhere(
                (element) => element == events[index]?.id,
                orElse: () => null) !=
            null
        ? true
        : false;
  }

  loadEventList(String query) {
    setBusy(true);
    _service.getEvents(query: query)?.then((value) {
      value.fold((l) {
        l != null ? Utils.showSnackBar(_context!, l) : null;
        setBusy(false);
      }, (r) {
        _events = r;
        setBusy(false);
      });
    }).onError((error, stackTrace) {
      setBusy(false);
      Utils.showSnackBar(_context!, stackTrace.toString());
    });
  }

  onEventSelect(int index) {
    _service.onSelectEvent(_events[index]!);
    _router.pushNamed(detailsView);
  }

  setBusy(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
