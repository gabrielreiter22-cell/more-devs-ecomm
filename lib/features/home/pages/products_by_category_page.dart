import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/pages/home_page.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomePage.route);
          },
          icon: const Icon(Icons.arrow_back),
        ),

        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: AppTextStyle.titleProductByCategory,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(hintText: 'Insira o nome do fabricante.'),

            SizedBox(height: 12),

            AppTextField(hintText: 'Insira o nome do fabricante.'),
          ],
        ),
        Skeletonizer(
          enabled: isLoading, // no loading, mostra produtos _fake_
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 colunas
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.62, // proporção largura/altura da célula
            ),
            itemBuilder: (context, index) =>
                ProductCard(product: products[index]),
          ),
        ),
      ),
    );
  }
}
