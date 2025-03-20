import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class ListOfProduct extends StatelessWidget {
  const ListOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> product = generateDummyProducts(10);
    return product.generateListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.withAlpha(120),
            child: Text(product[index].name.firstLetter),
          ),
          title: Text(product[index].name),
          subtitle: Text(product[index].description),
        ).animate().staggered(index).fadeIn();
      },
    );
  }
}
