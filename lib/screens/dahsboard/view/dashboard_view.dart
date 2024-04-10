import 'package:darshit_practical_010_04/constants/commontext.dart';
import 'package:darshit_practical_010_04/constants/height_width.dart';
import 'package:darshit_practical_010_04/screens/dahsboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class DashBoardView extends StatelessWidget {
   DashBoardView({super.key});
var controller = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackcolor,
        actions: [
          Row(
            children: [
              Icon(Icons.filter_list_alt,size: 25,color: whitecolor,),
              width20,
              Icon(Icons.search,size: 25,color: whitecolor,)
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

             Container(
              height: 35,
              width: Get.width,
              color: blackcolor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryList.value.length,
                    itemBuilder: (context, index) =>
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: GestureDetector(
                         onTap: () {
                          controller.GetCategoryById(id:controller.categoryList.value[index].id,
                          page: 1);
                         },
                         child: CommonText(
                          text: controller.categoryList.value[index].name,
                          textColor: whitecolor,
                          fontSize: 18,
                                             ),
                       ),
                     ),
                  ),
                ),
              ),
            ),

          Obx(
            () =>  Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.subcategoryList.value.length,
                itemBuilder: (context, index) =>
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: CommonText(
                          text: controller.subcategoryList.value[index].name,
                          textColor: blackcolor,
                          fontSize: 22,
                        fontWeight: FontWeight.w700,
                                       ),
                     ),
                     SizedBox(
                       height: 150,
                       child: Obx(
                         () =>  ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: controller.subcategoryList.value[index].product!.length,
                           itemBuilder:(context, pindex) =>
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Column(
                                   children: [
                                     Stack(
                                       children: [
                                         Container(
                                           height: 120,
                                           width: 120,
                                           decoration: BoxDecoration(
                                               image: DecorationImage(image: NetworkImage(
                                                   controller.subcategoryList.value[index].product![pindex].imageName!
                                               ),fit: BoxFit.cover)
                                           ),
                                         ),
                                         Positioned(
                                           top: 10,
                                           left: 20,
                                           child: Container(
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(10),
                                               color: Colors.blue
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: CommonText(
                                                 text: controller.subcategoryList.value[index].product![pindex].priceCode!,
                                                 fontSize: 14,
                                                 textColor: blackcolor,
                                               ),
                                             ),
                                           ),
                                         ),

                                       ],
                                     ),
                                     height10,
                                     SizedBox(
                                       width: 120,
                                       child: CommonText(
                                         text:controller.subcategoryList.value[index].product![pindex].name ,
                                         maxLine: 1,
                                         textOverflow: TextOverflow.ellipsis,
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                         ),

                       ),

                     ),
                     height30,
                   ],

                 ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


