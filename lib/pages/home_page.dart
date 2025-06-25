import 'package:flutter/material.dart';
import '../model/endemik.dart';
import '../service/endemik_service.dart';
import 'detail_page.dart';
import '../widget/endemik_card.dart';

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

  void goToFavorit() {
    Navigator.pushNamed(context, '/favorit');
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
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, i) => EndemikCard(data[i]),
      ),
    );
  }
}
