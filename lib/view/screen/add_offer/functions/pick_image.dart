import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/view/screen/add_dish/functions/from_camera.dart';
import 'package:foodiebuddierestaurant/view/screen/add_dish/functions/from_gallery.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile> showBottomSheetWidget(BuildContext context) async {
  final completer = Completer<XFile>();
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .25,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: .4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Select the image source:',
                style: TextStyle(fontSize: 20, color: Colors.green[700]),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      XFile imagePath = await fromCamera();
                      completer.complete(imagePath);
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.camera,
                    ),
                    label: const Text(
                      'Camera',
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      XFile imagePath = await fromGallery();
                      completer.complete(imagePath);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.image,
                    ),
                    label: const Text(
                      'Gallery',
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
  return completer.future;
}
