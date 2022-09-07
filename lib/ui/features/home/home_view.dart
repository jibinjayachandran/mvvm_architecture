import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:halian/ui/features/home/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/searchable_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = HomeProvider();
    return Scaffold(
      appBar: SearchableAppBar(
        title: 'Events',
        onSearch: (value) {
          value.toString().isNotEmpty ? provider.loadEventList(value) : null;
        },
      ),
      body: ChangeNotifierProvider<HomeProvider>(
          create: (context) => provider..init(context),
          builder: (context, child) {
            return Consumer<HomeProvider>(
              builder: (context, provider, child) => provider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : ListView.separated(
                      itemCount: provider.events.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => ListTile(
                        onTap: () => provider.onEventSelect(index),
                        dense: false,
                        title: Text(provider.events[index]?.title ?? ''),
                        leading: _leadingImage(
                          provider.events[index]?.performers![0].image ?? '',
                        ),
                        subtitle: Text(
                          provider.events[index]?.venue?.address ?? '',
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing:
                            _trailingWidget(index, provider),
                      ),
                    ),
            );
          }),
    );
  }

  Widget _leadingImage(String? url) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: CachedNetworkImage(
          imageUrl: url!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(),
          errorWidget: (context, _, __) => const Icon(Icons.image),
        ),
      ),
    );
  }

  Widget _trailingWidget(int index, HomeProvider provider) {
    return ValueListenableBuilder<List<num?>>(
        valueListenable: provider.favouriteIds,
        builder: (context, items, child) =>
           Icon(provider.isFavourite(index)
            ? Icons.favorite
            : Icons.favorite_border,
             color:provider.isFavourite(index)? Colors.red:Colors.grey,
           ),
    );
  }
}
