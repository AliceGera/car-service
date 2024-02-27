import 'dart:io';
import 'dart:typed_data';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class AppCameraWidget extends StatefulWidget {
  const AppCameraWidget({
    super.key,
    required this.savePhoto,
    this.photo,
  });

  final void Function(Uint8List photo) savePhoto;
  final Uint8List? photo;

  @override
  _AppCameraWidgetState createState() => _AppCameraWidgetState();
}

class _AppCameraWidgetState extends State<AppCameraWidget> {
  final picker = ImagePicker();
  Uint8List? photo;

  @override
  void initState() {
    photo = widget.photo;
    super.initState();
  }

  void getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        photo = image.readAsBytesSync();
        if (photo != null) {
          widget.savePhoto.call(photo!);
        }
      }
    });
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        final image = File(pickedFile.path);
        photo = image.readAsBytesSync();
        if (photo != null) {
          widget.savePhoto.call(photo!);
        }
      }
    });
  }

  void showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Фото из галереи'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Камера'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          height: 117,
          width: 117,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: /*DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child:*/
                Center(
              child: (photo == null || photo!.isEmpty)
                  ? SizedBox(
                      height: 137,
                      width: 137,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                'Место для фото',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.medium16.value.copyWith(color: AppColors.white),
                              ),
                            ),
                          )))
                  : Image.memory(
                      photo!,
                      fit: BoxFit.cover,
                      height: 137,
                      width: 137,
                    ),
            ),
          ),
        ),
        //),
        InkWell(highlightColor: Colors.transparent, splashColor: Colors.transparent, onTap: showOptions, child: SvgPicture.asset(SvgIcons.download)),
      ],
    );
  }
}
