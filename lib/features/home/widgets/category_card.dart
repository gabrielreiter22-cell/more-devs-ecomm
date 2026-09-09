import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/category_model.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      //height: 50,
      //width: 50,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/products-by-category',
            arguments: category.name,
          );
        },
        child: Column(
          children: [
            Skeleton.replace(
              replacement: Bone(
                height: 40,
                width: 40,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.network(category.imageUrl),
            ),
            Text(category.name, style: AppTextStyle.smallGrey),
          ],
        ),
      ),
    );
  }
}
