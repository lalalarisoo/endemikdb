import 'package:flutter/material.dart';
import '../model/endemik.dart';
import '../pages/detail_page.dart';

class EndemikCard extends StatelessWidget {
  final Endemik item;
  const EndemikCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Image.network(item.foto, width: 60, fit: BoxFit.cover),
        title: Text(item.nama),
        subtitle: Text(item.nama_latin),
        trailing: item.is_favorit == "true"
            ? const Icon(Icons.favorite, color: Colors.red)
            : const Icon(Icons.favorite_border),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(item: item),
            ),
          );
        },
      ),
    );
  }
}
