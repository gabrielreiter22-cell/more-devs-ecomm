import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_card.dart';
import 'package:more_devs_do_zero/features/home/widgets/products_section.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.categoryName});

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();

  static const String route = '/products-by-category';

  final String categoryName;
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: AppTextStyle.titleProductByCategory,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Container(
        child: Column(
          spacing: 8,
          children: [
            AppTextField(hintText: 'Digite o produto.'),

            AppTextField(hintText: 'Digite o Produtor/Fabricante.'),
          ],
        ),

        // GridView.builder(
        //   itemCount: _getProductsList().length,
        //   itemBuilder: (context, index) {
        //     Product product = _getProductsList()[index];
        //     return ProductCard(product: product);
        //   },
        //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        //     mainAxisExtent: 265,
        //     crossAxisSpacing: 0,
        //   ),
        // ),
      ),
    );
  }
}
