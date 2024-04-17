import 'package:flutter/material.dart';
import 'package:my_cart/models/cart.dart';
import 'package:my_cart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl4.make().centered(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        const Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(MyTheme.darBluish).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying Not Available".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darBluish),
                shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3.5)))),
            child: "Buy".text.white.make(),
          ).wh(130, 40)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              title: _cart.items[index].name.text.make(),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle_outline)),
            ),
        itemCount: _cart.items.length);
  }
}
