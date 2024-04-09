import "package:flutter/material.dart";
import "package:my_cart/models/catalog.dart";
import "package:my_cart/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

class HomeDetailPage extends StatelessWidget {
  final Item item;

  const HomeDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyTheme.creamColor),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Vx.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${item.price}".text.xl4.red700.bold.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(5),
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.blueAccent),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  // shape: const MaterialStatePropertyAll(StadiumBorder()),
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darBluish)),
              child: "Buy".text.color(Colors.white).make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              20.heightBox,
              Hero(
                tag: Key(item.id.toString()),
                child: Image.network(item.image),
              ).h32(context),
              Expanded(
                  child: VxArc(
                height: 30,
                edge: VxEdge.top,
                arcType: VxArcType.convey,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      item.name.text.xl4.color(MyTheme.darBluish).bold.make(),
                      item.desc.text.xl.textStyle(context.captionStyle).make(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              ))
            ],
          )),
    );
  }
}
