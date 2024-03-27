import "package:flutter/material.dart";
import "package:my_cart/models/catalog.dart";

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: prefer_const_constructors
      shape: StadiumBorder(),
      // color: Colors.blueAccent,
      // elevation: 0 ,
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}"),
        onTap: () {
          print("Item not Found ");
        },
      ),
    );
  }
}
