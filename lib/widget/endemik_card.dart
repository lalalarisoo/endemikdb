import 'package:flutter/material.dart';
import '../model/endemik.dart';
import '../pages/detail_page.dart';

class EndemikCard extends StatelessWidget {
  final Endemik item;
  final bool isFavorite;

  const EndemikCard(this.item, {super.key, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context, listen: false);

    return Card(
      child: ListTile(
        leading: Image.network(item.foto, width: 60, fit: BoxFit.cover),
        title: Text(item.nama),
        subtitle: Text(item.nama_latin),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            if (isFavorite) {
              favProvider.removeFavorite(item);
            } else {
              favProvider.addFavorite(item);
            }
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailPage(item: item)),
          );
        },
      ),
    );
  }
}
