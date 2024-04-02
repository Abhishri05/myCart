import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'dart:convert';
import "package:my_cart/models/catalog.dart";
import "package:my_cart/widgets/drawer.dart";

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int nums = 30;
  final String str = "CodePur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    const CircularProgressIndicator();
    await Future.delayed(const Duration(seconds: 2));
    var Catajson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(Catajson);
    var product = decodedData["products"];
    CatalogModel.items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummylist = List.generate(10, (index) => CatalogModel.items[0]);

    return Scaffold(
      // HTML Jese Head BOdy aur Foot hota hai iska

      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: ListView.builder(
        //   itemCount: CatalogModel.items.length,
        //   // itemCount: dummylist.length,
        //   itemBuilder: (context, index) {
        //     return ItemWidget(
        //       item: CatalogModel.items[index],
        //       // item: dummylist[index],
        //     );
        //   },
        // ),

        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: GridTile(
                footer: Text("\$${item.price.toString()}"),
                header: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: Colors.deepPurple),
                  child: Text(
                    item.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                child: Image.network(item.image),
              ),
            );
          },
          itemCount: CatalogModel.items.length,
        ),
      ),

      drawer: myDrawer(),
    );
  }
}
