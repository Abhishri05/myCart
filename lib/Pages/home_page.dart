import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'dart:convert';
import "package:my_cart/models/catalog.dart";
import "package:my_cart/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

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
    var catajson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catajson);
    var product = decodedData["products"];
    CatalogModel.items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        // Upar aur niche overlap hone se bachane ke liye
        child: Container(
          padding: Vx.m32, //32 ki Padding from All Sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CatalogHeader(), Cataloglist().expand()],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text("Catalog App"),
        "Catalog App".text.xl5.color(MyTheme.darBluish).bold.make(),
        "Trending Prodcuts".text.xl2.make(),
      ],
    );
  }
}

class Cataloglist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(
          catalog: catalog,
        );
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    // Vx Box is Same as Container
    return VxBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(catalog.image),
        ],
      ),
    ).white.square(200).make();
  }
}
