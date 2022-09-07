import 'package:flutter/material.dart';

class SearchViewProvider extends ChangeNotifier{
  bool _isSearching = false;
   bool get isSearching => _isSearching;

   onChange(){
     _isSearching = !_isSearching;
     notifyListeners();
   }

}