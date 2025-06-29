import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/endemik.dart';
import '../service/endemik_service.dart';
import 'detail_page.dart';
import '../widget/endemik_card.dart';
import '../providers/favorite_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Endemik> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final result = await EndemikService().getData();
    setState(() {
      data = result;
      isLoading = false;
    });
  }

  void goToFavorit() async {
    await Navigator.pushNamed(context, '/favorit');
    setState(() {}); // refresh state ketika kembali dari favorit
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Endemik'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: goToFavorit,
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<FavoriteProvider>(
              builder: (context, favProvider, _) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, i) {
                    final item = data[i];
                    final isFav = favProvider.isFavorite(item);
                    return EndemikCard(item, isFavorite: isFav);
                  },
                );
              },
            ),
    );
  }
}
