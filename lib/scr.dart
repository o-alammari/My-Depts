// import 'package:flutter/material.dart';

// import 'meal_item.dart';

// class Scree1 extends StatelessWidget {
//   const Scree1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           appBar:
//               AppBar(title: Text(lan.getTexts('cat-$categoryId').toString())),
//           body: GridView.builder(
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               // maxCrossAxisExtent: isLanaScape ? dw * 0.5 : dw * 0.6,
//               // maxCrossAxisExtent: dw <= 400 ? 400 : 500,
//               maxCrossAxisExtent:  500,
//               // mainAxisExtent: isLanaScape
//               //     ? (mediaQuery.size.height - mediaQuery.padding.top) * 0.8
//               //     : null,
//               mainAxisExtent: null,
//               childAspectRatio: 1.0,
//               crossAxisSpacing: 0,
//               mainAxisSpacing: 0,
//             ),
//             itemBuilder: (context, index) {
//               return MealItem(
//                 id: displayMeal![index].id,
//                 imageUrl: displayMeal![index].imageUrl,
//                 duration: displayMeal![index].duration,
//                 complexity: displayMeal![index].complexity,
//                 affordability: displayMeal![index].affordability,
//               );
//             },
//             itemCount: displayMeal!.length,
//           )),
//     );
//   }
// }

