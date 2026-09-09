import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controllers/products_by_category_controller.dart';
import 'package:more_devs_do_zero/features/home/models/products_model.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart'; // Certifique-se de importar o pacote
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
  // 1. Controle de carregamento e listas de produtos
  bool isLoading = true;
  // 2. Lista mockada para o Skeletonizer renderizar enquanto carrega
  final List<dynamic> fakeProducts = List.generate(
    6,
    (index) => Products(
      brand: '...',
      name: '...',
      imageUrl: '...',
      price: 0,
      category: '...',
    ),
  );

  @override
  void initState() {
    super.initState();
    context.read<ProductsByCategoryController>().getProductsByCategory(
      widget.categoryName,
    );
    _simulateFetchData();
  }

  @override
  Widget build(BuildContext context) {
    // Define qual lista o GridView deve olhar dependendo do estado de loading
    final products = isLoading
        ? fakeProducts
        : context.read<ProductsByCategoryController>().categoryProducts;

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppTextField(
              hintText: 'Pesquisar produtos',
              onChanged: (value) {
                // Lógica de pesquisa aqui
              },
            ),
            SizedBox(
              height: 12,
            ), // Adicionei um SizedBox para espaçamento entre os campos de pesquisa
            AppTextField(
              hintText: 'Pesquisar Marcas ou produtores.',
              onChanged: (value) {
                // Lógica de pesquisa aqui
              },
            ), //Apptextfield para pesquisar marcas ou produtores.
            const SizedBox(
              height: 12, //Espaçamento entre para o grid.
            ),

            // 3. O Skeletonizer e GridView encapsulados em um Expanded
            Expanded(
              child: Skeletonizer(
                enabled: isLoading,
                child: GridView.builder(
                  // Ajustado para zero porque o Padding externo da Column já cuida das laterais
                  padding: EdgeInsets.zero,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 colunas
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio:
                        0.62, // proporção largura/altura da célula
                  ),
                  itemBuilder: (context, index) {
                    // Substitua pelo seu ProductCard real
                    return ProductCard(product: products[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simulação de carregamento (Remova ou substitua pela sua API/Controller real)
  void _simulateFetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        // realProducts = dadosDaSuaApi;
        isLoading = false;
      });
    }
  }
}
