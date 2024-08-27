import 'package:ecommerce/controllers/category_controller.dart';
import 'package:ecommerce/second/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/request.dart';
import '../view/view_item.dart';
import 'linkapi.dart';

class ViewCategory extends StatelessWidget {
   ViewCategory({super.key,required this.item_cat,required this.categories,required this.categoriesid});
   int item_cat;
   List categoriesid;
   List categories;
  CategoryControllerIMP controller=CategoryControllerIMP();

  @override
  Widget build(BuildContext context) {
    controller.initial(item_cat);
    request instance=request();
    return GetBuilder<CategoryControllerIMP>(
      init: controller,
      builder:(context)=> Scaffold(
        body:   FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!["data"]!=null) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: ViewItem(
                        id:snapshot.data!["data"][index]["id"].toString(),
                        active: snapshot.data!["data"][index]["active"].toString(),
                        count: snapshot.data!["data"][index]["count"].toString(),
                        discount:snapshot.data!["data"][index]["discount"].toString(),
                        discription: snapshot.data!["data"][index]["discription"],
                        discriptoin_ar:snapshot.data!["data"][index]["discriptoin_ar"],

                        name_ar:snapshot.data!["data"][index]["name_ar"],
                        price:snapshot.data!["data"][index]["price"].toString(),

                        image: snapshot.data!["data"][index]["image"],
                        name: snapshot.data!["data"][index]["name"],
                        // content: snapshot.data!["data"][index]["note_content"]
                        //     .toString(),
                        ontap: () {
                          Get.to(()=>
                              ItemDetails(
                                id: snapshot.data!["data"][index]["id"].toString(),
                                active: snapshot.data!["data"][index]["active"].toString(),
                                count: snapshot.data!["data"][index]["count"].toString(),
                                discount:snapshot.data!["data"][index]["discount"].toString(),
                                discription: snapshot.data!["data"][index]["discription"],
                                discriptoin_ar:snapshot.data!["data"][index]["discriptoin_ar"],

                                name_ar:snapshot.data!["data"][index]["name_ar"],
                                price:snapshot.data!["data"][index]["price"].toString(),

                                image: snapshot.data!["data"][index]["image"],
                                name: snapshot.data!["data"][index]["name"],
                                // content: snapshot.data!["data"][index]["note_content"]
                                //     .toString(),
                              // favourite
                              ),);
                        },
                      ),
                    );
                  },
                  itemCount:
                  snapshot.data!["data"].length
              );
            } else {
              return const Center(
                child: Text("Nothing yet!!"),
              );
            }
          },
          future: instance.postrequest(
              category_items, {"item_cat":"${controller.cat}"}),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [...categories.map((value){
            return TextButton(
              onPressed: (){
                controller.changepage(categoriesid[categories.indexOf(value)]);
              }, child:Text(value,style: TextStyle(
              fontSize:controller.cat==categoriesid[categories.indexOf(value)]?30:15,
                color: controller.cat==categoriesid[categories.indexOf(value)]?
                Colors.deepOrange:null
            ),));
        })],),
      )
        );
  }
}
