import 'package:flutter/material.dart';
import '../model/endemik.dart';
import '../service/endemik_service.dart';
import '../widget/endemik_card.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text("Favorit")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favorit.isEmpty
          ? const Center(child: Text("Belum ada favorit"))
          : ListView.builder(
        itemCount: favorit.length,
        itemBuilder: (_, i) => EndemikCard(favorit[i]),
      ),
    );
  }
}
