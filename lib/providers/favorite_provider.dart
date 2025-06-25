import 'package:flutter/material.dart';
import '../model/endemik.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Endemik> _favorites = [];

  List<Endemik> get favorites => _favorites;

  void addFavorite(Endemik item) {
    if (!_favorites.contains(item)) {
      _favorites.add(item);
      item.is_favorit = "true";
      notifyListeners();
    }
  }

  void removeFavorite(Endemik item) {
    if (_favorites.remove(item)) {
      item.is_favorit = "false";
      notifyListeners();
    }
  }

  bool isFavorite(Endemik item) {
    return _favorites.contains(item);
  }
}
