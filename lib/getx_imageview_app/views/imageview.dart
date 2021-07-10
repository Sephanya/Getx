

import 'package:api_demo2/getx_imageview_app/views/imagecontainer.dart';
import 'package:api_demo2/getx_imageview_app/controller/imagecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class ImageView extends StatelessWidget {


  final ImageController imageController = Get.put(ImageController(),tag: 'images');
  //double iconSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.ac_unit,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Images',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),

              ],
            ),
          ),
          Expanded(
            child: Obx(() {

              if(!imageController.isNetworkAvailable.value){
                return Column(
                  children: [
                    Text("Check the Internet Connection",style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){
                      // imageController.fetchImages();

                    }, icon: Icon(Icons.network_check),iconSize: 80,padding: EdgeInsets.only(top: 30),)
                  ],
                );
              }

              else if (imageController.isLoading.value)
                return Center(child: CircularProgressIndicator());

              else if (imageController.error.value.isNotEmpty){

                return Column(
                  children: [
                    Text(imageController.error.toString(),style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){
                      imageController.fetchImages();

                    }, icon: Icon(Icons.refresh),iconSize: 80,padding: EdgeInsets.only(top: 30),)
                  ],
                );
              }
              else {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: imageController.imageList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ImageContainer(imageController.imageList[index], index);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
              }

            }),
          )
        ],
      ),
    );
  }
}


