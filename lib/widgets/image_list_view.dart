import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/data/data.dart';
import 'package:flutter/material.dart';

class ImageListView extends StatefulWidget {
  final int startIndex;
  const ImageListView({super.key, required this.startIndex});

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (!scrollController.position.atEdge) {
        autoScroller();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        autoScroller();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.98 * pi,
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageBuilder: (context, imageProvider) {
                  return Container(
                    margin:
                        const EdgeInsets.only(right: 8.0, left: 8.0, top: 10.0),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
                imageUrl: products[widget.startIndex + index].productImageUrl,
                
              );
            },
          )),
    );
  }

  void autoScroller() {
    final currentScrollerPosition = scrollController.offset;
    final endScrollerPosition = scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      scrollController.animateTo(
          currentScrollerPosition == endScrollerPosition
              ? 0
              : endScrollerPosition,
          duration: const Duration(seconds: 10),
          curve: Curves.linear);
    });
  }
}
