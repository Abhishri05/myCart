import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/core/store.dart';
import 'package:my_cart/models/cart.dart';
import 'package:my_cart/models/catalog.dart';
import 'package:my_cart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class addtoCart extends StatelessWidget {
  final Item catalog;

  addtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [Addmutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();
            Addmutation(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(5),
            overlayColor: const MaterialStatePropertyAll(Colors.blueAccent),
            // shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(5))),
            shape: const MaterialStatePropertyAll(StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(MyTheme.darBluish)),
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.amber,
              ));
  }
}
