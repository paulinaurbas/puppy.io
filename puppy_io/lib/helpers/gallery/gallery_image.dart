import 'package:flutter/material.dart';
import 'package:galleryimage/gallery_Item_model.dart';
import 'package:galleryimage/gallery_Item_thumbnail.dart';

import 'empty_widget.dart';
import 'gallery_view_image_wrapper.dart';

class GalleryImage extends StatefulWidget {
  final List<String> imageUrls;
  final String? titleGallery;

  const GalleryImage({required this.imageUrls, this.titleGallery});

  @override
  _GalleryImageState createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  List<GalleryItemModel> galleryItems = <GalleryItemModel>[];

  @override
  void initState() {
    buildItemsList(widget.imageUrls);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: galleryItems.isEmpty ? getEmptyWidget() : photoBuilder(),
    );
  }

  Widget photoBuilder() {
    return Column(
      children: [
        GridView.builder(
          primary: false,
          itemCount: galleryItems.length > 1 ? 1 : galleryItems.length,
          padding: const EdgeInsets.all(16),
          semanticChildCount: 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 0, crossAxisSpacing: 5),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: galleryItems.length > 3 && index == 2
                  ? buildImageNumbers(index)
                  : GalleryItemThumbnail(
                      galleryItem: galleryItems[index],
                      onTap: () {
                        openImageFullScreen(index);
                      },
                    ),
            );
          },
        ),
        const SizedBox(height: 16,),
        GridView.builder(
          primary: false,
          itemCount: galleryItems.length > 3 ? 3 : galleryItems.length,
          padding: const EdgeInsets.all(0),
          semanticChildCount: 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 5),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: galleryItems.length > 3 && index == 2
                    ? buildImageNumbers(index)
                    : GalleryItemThumbnail(
                        galleryItem: galleryItems[index],
                        onTap: () {
                          openImageFullScreen(index);
                        },
                      ));
          },
        ),
      ],
    );
  }

  Widget buildImageNumbers(int index) {
    return GestureDetector(
      onTap: () {
        openImageFullScreen(index);
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: <Widget>[
          GalleryItemThumbnail(
            galleryItem: galleryItems[index],
          ),
          Container(
            color: Colors.black.withOpacity(.7),
            child: Center(
              child: Text(
                "+${galleryItems.length - index}",
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openImageFullScreen(final int indexOfImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryImageViewWrapper(
          titleGallery: widget.titleGallery,
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.white38,
          ),
          initialIndex: indexOfImage,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  buildItemsList(List<String> items) {
    galleryItems.clear();
    for (var item in items) {
      galleryItems.add(
        GalleryItemModel(id: item, imageUrl: item),
      );
    }
  }
}
