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
        return Card(
          child:
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: context.primaryColor,
                  child: Text(
                    product[index].name.firstLetter,
                    style: context.bodySmall.copyWith(color: context.background),
                  ),
                ),
                title: Text(product[index].name),
                subtitle: Text(product[index].description),
              ).animate().staggered(index).fadeIn(),
        );
      },
    );
  }
}
