import "package:flutter/material.dart";
import 'package:my_cart/widgets/AddtoCart.dart';
import "package:velocity_x/velocity_x.dart";
import "package:my_cart/models/catalog.dart";
import "package:my_cart/widgets/themes.dart";

class HomeDetailPage extends StatelessWidget {
  final Item item;

  const HomeDetailPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Vx.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${item.price}".text.xl4.red700.bold.make(),
            addtoCart(
              catalog: item,
            ).wh(130, 50)
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
              ).h24(context),
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
                      18.heightBox,
                      "Est dolor sed magna clita et voluptua labore consetetEt gubergren erat sed justo erat magna at sed, voluptua sed est amet duo, erat justo sadipscing sadipscing voluptua et no tempor sit. Amet voluptua ipsum ea sea eos, dolores et sea sed justo amet justo sadipscing, rebum lorem diam.ur sadipscing accusam, justo ipsum consetetur clita erat ipsum sadipscing. Magna et."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ))
            ],
          )),
    );
  }
}
