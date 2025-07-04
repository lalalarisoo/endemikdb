import 'package:flutter/material.dart';
import '../model/endemik.dart';
import '../service/endemik_service.dart';
import '../widget/endemik_card.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  List<Endemik> favorit = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFavorit();
  }

  Future<void> fetchFavorit() async {
    final result = await EndemikService().getFavoritData();
    setState(() {
      favorit = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteProvider>().favorites;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorit")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favorites.isEmpty
          ? const Center(child: Text("Belum ada favorit"))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (_, i) {
          final item = favorites[i];
          return Stack(
            children: [
              EndemikCard(item),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    Provider.of<FavoriteProvider>(context, listen: false)
                        .removeFavorite(item);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.nama} dihapus dari favorit'),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
