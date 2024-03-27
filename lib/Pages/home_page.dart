import "package:flutter/material.dart";
import "package:my_cart/models/catalog.dart";
import "package:my_cart/widgets/drawer.dart";
import "package:my_cart/widgets/item_widget.dart";

class HomePage extends StatelessWidget {
  final int nums = 30;
  final String str = "CodePur";

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
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
        ),
      ),

      drawer: myDrawer(),
    );
  }
}
