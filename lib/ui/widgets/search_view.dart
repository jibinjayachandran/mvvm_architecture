import 'package:flutter/material.dart';
import 'package:halian/utilities/app_colors.dart';

class SearchView extends StatefulWidget {
  final Function? onChange;
  final TextEditingController? controller;
  const SearchView({Key? key,this.onChange, this.controller}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  @override
  Widget build(BuildContext context) {
    return   Container(
      height:40,
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value)=>widget.onChange!(value),
        onSubmitted: (value)=>widget.onChange!(value),
        autofocus: true,
        cursorColor: Colors.black87,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
        ),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search,color: Colors.black87,),
          filled: true,
          fillColor: AppColors.searchBgColor,
          contentPadding: const EdgeInsets.only(left:10,right: 10),
          border:OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(3.0),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
