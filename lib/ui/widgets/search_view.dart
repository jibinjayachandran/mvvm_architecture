import 'package:flutter/material.dart';

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
    return   TextField(
      controller: widget.controller,
      onChanged: (value)=>widget.onChange!(value),
      onSubmitted: (value)=>widget.onChange!(value),
      autofocus: true,
      cursorColor: Colors.black87,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration:const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: 20,
        ),
      ),
    );
  }
}
