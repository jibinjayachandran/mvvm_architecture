import 'package:flutter/material.dart';
import 'package:halian/ui/features/home/providers/search_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/search_view.dart';

class SearchableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  final Function? onSearch;
  final bool isSearchEnabled;

  const SearchableAppBar({
    Key? key,
    this.height = kToolbarHeight,
    this.isSearchEnabled = true,
    this.onSearch,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewProvider>(
      create: (context)=>SearchViewProvider(),
      builder: (context,child) {
        return Consumer<SearchViewProvider>(
          builder: (context,provider,child) {
            return AppBar(
              backgroundColor: Colors.white70,
              iconTheme: const IconThemeData(
                color: Colors.black87, //change your color here
              ),
              elevation: 0.75,
              title: provider.isSearching
                  ? SearchView(
                      onChange: (value) {
                        onSearch!(value);
                      },
                    )
                  : Text(
                      title??'',
                      style: const TextStyle(color: Colors.black87),
                    ),
              actions:isSearchEnabled? [
                IconButton(
                  onPressed:() =>provider.onChange(),
                  icon: Icon(
                    provider.isSearching ? Icons.close : Icons.search,
                    color: Colors.black87,
                  ),
                ),
              ]:null,
            );
          }
        );
      }
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
