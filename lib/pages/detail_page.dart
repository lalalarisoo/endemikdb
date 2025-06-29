import 'package:flutter/material.dart';
import '../model/endemik.dart';
import '../helper/database_helper.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';



class DetailPage extends StatefulWidget {
  final Endemik item;
  const DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Endemik currentItem;

  @override
  void initState() {
    super.initState();
    currentItem = widget.item;
  }

  void toggleFavorit() async {
    String newValue = currentItem.is_favorit == "true" ? "false" : "true";
    await DatabaseHelper().setFavorit(currentItem.id, newValue);
    setState(() {
      currentItem.is_favorit = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context);
    final isFav = favProvider.isFavorite(currentItem);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentItem.nama),
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
            onPressed: () {
              if (isFav) {
                favProvider.removeFavorite(currentItem);
              } else {
                favProvider.addFavorite(currentItem);
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 300,
              child: ClipRect(
                child: PhotoView(
                  imageProvider: NetworkImage(currentItem.foto),
                  backgroundDecoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(currentItem.nama, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(currentItem.nama_latin, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            const SizedBox(height: 16),
            Text("Asal: ${currentItem.asal}", style: const TextStyle(fontSize: 16)),
            Text("Status: ${currentItem.status}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(currentItem.deskripsi, textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}
