import 'package:flutter/material.dart';
import 'package:puppy_io/helpers/gallery/gallery_image.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key, required this.dogName, required this.listOfUrls}) : super(key: key);
  final String dogName;
  final List<String> listOfUrls;

  @override
  Widget build(BuildContext context) {
    return GalleryImage(
      imageUrls: listOfUrls,
      titleGallery: dogName,
    );
  }
}
