import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:halian/ui/features/details/details_provider.dart';
import 'package:halian/ui/features/home/widgets/searchable_appbar.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsProvider provider = DetailsProvider();
    return ChangeNotifierProvider<DetailsProvider>(
      create: (context) => provider,
      child: Scaffold(
        appBar: SearchableAppBar(
          isSearchEnabled: false,
          title: provider.selectedEvent?.shortTitle ?? '',
          favWidget: _favWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),

                child:AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: CachedNetworkImage(
                     imageUrl: provider?.selectedEvent?.performers![0]?.image??'',
                      fit: BoxFit.fill,
                      placeholder: (context, _) => const Icon(Icons.image),
                      errorWidget: (context, _, __) => const Icon(Icons.image),
                    ),
                  ),
                ),

              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                provider.selectedEvent?.title ?? '',
                style: const TextStyle(fontSize: 18, color: Colors.black87,fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                provider.selectedEvent?.url! ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _favWidget(){
    return  Consumer<DetailsProvider>(builder: (context, provider, child) {
      return IconButton(
        onPressed: () => provider.addToFav(),
        icon: Icon(
          provider.isFavourite
              ? Icons.favorite
              : Icons.favorite_border,
          color: provider.isFavourite?Colors.red:Colors.grey,
        ),
        //label: Text(provider.isFavourite ? 'Remove' : 'Add'),
      );
    });
  }
}
