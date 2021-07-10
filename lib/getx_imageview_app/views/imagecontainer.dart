
import 'package:api_demo2/getx_imageview_app/views/imagesecondview.dart';
import 'package:api_demo2/getx_imageview_app/modelclass/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageContainer extends StatelessWidget {
  final Images images;
  final int index;

  const ImageContainer(this.images, this.index);

  @override
  Widget build(BuildContext context) {
    String url = images.urls!.full!;
    return GestureDetector(
      onTap: () {
        // Get.to(ViewImage(index: index));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImageSecondView(index: index)),
        );
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                images.id!,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              if (images.likes != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        images.categories.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 8),
              Text('\$${images.likes}', style: TextStyle(fontSize: 32)),
            ],
          ),
        ),
      ),
    );
  }
}