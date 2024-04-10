import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:my_cart/Pages/cart_page.dart";
import "package:my_cart/Pages/home_detail_page.dart";
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
      floatingActionButton: FloatingActionButton(
        // onPressed: () {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const CartPage(),
        //       ));
        // },
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        backgroundColor: Colors.amber,
        child: const Icon(CupertinoIcons.cart),
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        // Upar aur niche overlap hone se bachane ke liye
        child: Container(
          padding: Vx.m32, //32 ki Padding from All Sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              Cataloglist().expand(),
            ],
          ),
        ),
      ),
      // drawer: myDrawer(),
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
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(item: catalog),
            ),
          ),
          child: CatalogItem(
            catalog: catalog,
          ),
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
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: ProductImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darBluish).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl.bold.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(5),
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.blueAccent),
                        // shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(5))),
                        shape: const MaterialStatePropertyAll(StadiumBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darBluish)),
                    child: "Add to Cart".text.color(Colors.white).xs.make(),
                  )
                ],
              ).pOnly(right: 8)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py(16);
  }
}

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p8
        .rounded
        .color(MyTheme.creamColor)
        .make()
        .p(16)
        .w40(context);
  }
}
