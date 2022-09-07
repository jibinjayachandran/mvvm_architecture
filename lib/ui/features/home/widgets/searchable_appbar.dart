import 'package:flutter/material.dart';
import 'package:halian/ui/features/home/providers/search_provider.dart';
import 'package:halian/utilities/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../widgets/search_view.dart';

class SearchableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  final Function? onSearch;
  final bool isSearchEnabled;
  final Widget? favWidget;

  const SearchableAppBar({
    Key? key,
    this.height = kToolbarHeight,
    this.isSearchEnabled = true,
    this.onSearch,
    this.title,
    this.favWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewProvider>(
      create: (context)=>SearchViewProvider(),
      builder: (context,child) {
        return Consumer<SearchViewProvider>(
          builder: (context,provider,child) {
            return AppBar(
              centerTitle: false,
              backgroundColor: Colors.white,
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
              actions: [
                isSearchEnabled? _searchWidget(provider):favWidget!
              ],
            );
          }
        );
      }
    );
  }
  Widget _searchWidget(SearchViewProvider provider){
    return  provider.isSearching ? TextButton(
      onPressed:() =>provider.onChange(),
      child:const Text('Cancel',style: TextStyle(color: AppColors.goldenColor),)
      ,
    ):
    IconButton(
      onPressed:() =>provider.onChange(),
      icon: const Icon(
        Icons.search,
        color: Colors.black87,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
