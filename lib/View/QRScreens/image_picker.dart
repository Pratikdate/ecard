import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../subscreen/myProfile/update_profile_screen.dart';
import '../subscreen/myProfile/virtual_profile_page.dart';


class ImagePicker_ extends StatefulWidget {
  const ImagePicker_({super.key,this.isUpdateProfile=false,this.isVirtualProfile=false,});
  final bool isUpdateProfile;
  final bool isVirtualProfile;


  @override
  State<ImagePicker_> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker_> {
  File? imageFile;

  Future _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);


    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  Future _cropImage() async {
    if (imageFile != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
          cropStyle: CropStyle.circle,
          sourcePath: imageFile!.path,
          aspectRatioPresets:
          [
            CropAspectRatioPreset.square,
            
          ],

          uiSettings: [
          AndroidUiSettings(
          toolbarTitle: 'Crop',
          cropGridColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
          IOSUiSettings(title: 'Crop')
    ]);

    if (cropped != null) {
    setState(() {
    imageFile = File(cropped.path);
    if(widget.isUpdateProfile) {
      UpdateProfileScreen.croppedPath = cropped.path;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
    }
    if(widget.isVirtualProfile){
      VirtualProfileScreen.croppedPath = cropped.path;

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const VirtualProfileScreen()));
    }


    });
    }
  }
  }

  void _clearImage() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("Crop Your Image")),
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: imageFile != null
                    ? Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.file(imageFile!))
                    : const Center(
                  child: Text("Add a picture"),
                )),
            Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildIconButton(icon: Icons.add, onpressed: _pickImage),
                      _buildIconButton(icon: Icons.crop, onpressed: _cropImage),
                      _buildIconButton(icon: Icons.clear, onpressed: _clearImage),
                    ],
                  ),
                ))
          ],
        ));
  }

  Widget _buildIconButton(
      {required IconData icon, required void Function()? onpressed}) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          onPressed: onpressed,
          icon: Icon(icon),
          color: Colors.white,
        ));
  }
} 