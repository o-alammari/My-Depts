// import 'package:flutter/material.dart';

// class MealItem extends StatelessWidget {
//   const MealItem({super.key});

//   void selectMeal(BuildContext ctx) {
//     Navigator.of(ctx).pushNamed(
//       "",
//     );
//   }

//   Row buildRow(IconData icon, String title, BuildContext ctx) {
//     return Row(
//       children: [
//         Icon(icon, color: Theme.of(ctx).splashColor),
//         const SizedBox(width: 6),
//         Text(title),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (ctx, boxConstraints) => InkWell(
//               onTap: () => selectMeal(context),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 elevation: 4,
//                 margin: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             topRight: Radius.circular(15),
//                           ),
//                           child: Hero(
//                             tag: id,
//                             child: InteractiveViewer(
//                               child: FadeInImage(
//                                 image: NetworkImage(imageUrl),
//                                 placeholder:
//                                     const AssetImage('assets/images/a2.png'),
//                                 fit: BoxFit.cover,
//                                 height: 200,
//                                 width: double.infinity,
//                               ),
//                             ),
//                             // child: Image.network(
//                             //   imageUrl,
//                             //   height: 200,
//                             //   width: double.infinity,
//                             //   fit: BoxFit.cover,
//                             // ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 20,
//                           right: 10,
//                           child: Container(
//                             color: Colors.black54,
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 5, horizontal: 20),
//                             // width: 300,
//                             width: boxConstraints.maxWidth * 0.7,
//                             child: Text(
//                               lan.getTexts('meal-$id').toString(),
//                               style: const TextStyle(
//                                   fontSize: 20, color: Colors.white),
//                               softWrap: true,
//                               overflow: TextOverflow.fade,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.schedule,
//                                   color: Theme.of(context).splashColor),
//                               const SizedBox(width: 6),
//                               if (duration <= 10)
//                                 Text('$duration ${lan.getTexts('min2')}'),
//                               if (duration > 10)
//                                 Text('$duration ${lan.getTexts('min')}'),
//                             ],
//                           ),
//                           // buildRow(
//                           //     Icons.schedule, lan.getTexts('min').toString(), context),
//                           buildRow(Icons.work,
//                               lan.getTexts('$complexity').toString(), context),
//                           // lan.getTexts('$affordability').toString(), context),
//                           buildRow(
//                               Icons.attach_money,
//                               lan.getTexts('$affordability').toString(),
//                               context),
//                           // lan.getTexts('$complexity').toString(), context),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }
// }


