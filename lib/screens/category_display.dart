import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/data/data.dart';
import 'package:flutter/material.dart';

import '../widgets/top_container.dart';

class CategoryDisplayScreen extends StatefulWidget {
  const CategoryDisplayScreen({super.key});

  @override
  State<CategoryDisplayScreen> createState() => _CategoryDisplayScreenState();
}

class _CategoryDisplayScreenState extends State<CategoryDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          const TopContainer(title: 'Missoum', searchBarTitle: 'search title'),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: 170,
                margin: const EdgeInsets.only(bottom:10,left: 10,right: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                    categories[index].thumbnailImage,
                    ),
                    fit: BoxFit.cover
                  )
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Column(
                        children: [
                          Text(categories[index].categoryName,
                          style: const TextStyle(
                            color: Colors.white
                          ),
                          )
                        ],
                      )
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

}
