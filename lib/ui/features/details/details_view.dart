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
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                provider.selectedEvent?.title ?? '',
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                color: Colors.grey,
                child: Image.network(
                  provider?.selectedEvent?.performers![0]?.image??'',
                  fit: BoxFit.fill,
                  errorBuilder: (context, _, __) => const Icon(Icons.image),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<DetailsProvider>(builder: (context, provider, child) {
                return OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 0.75, color: Colors.red),
                  ),
                  onPressed: () => provider.addToFav(),
                  icon: Icon(
                    provider.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  label: Text(provider.isFavourite ? 'Remove' : 'Add'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
