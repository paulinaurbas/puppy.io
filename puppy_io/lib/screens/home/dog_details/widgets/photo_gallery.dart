import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:puppy_io/generated/locale_keys.g.dart';
import 'package:puppy_io/helpers/gallery/gallery_image.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key, required this.dogName, required this.listOfUrls}) : super(key: key);
  final String dogName;
  final List<String> listOfUrls;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                LocaleKeys.photos.tr(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            GalleryImage(
              imageUrls: listOfUrls,
              titleGallery: dogName,
            ),
          ],
        ),
      ),
    );
  }
}
