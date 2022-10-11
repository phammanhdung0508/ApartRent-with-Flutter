import 'dart:io';

import 'package:apart_rent/components/custom_drop_box.dart';
import 'package:apart_rent/components/custom_text_field.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class DescribeInformation extends StatefulWidget {
  final Function(String?) houseDirection;
  final Function(String?) balconyDirection;
  final Function(String?) apartImageUrl;
  final TextEditingController area;
  final TextEditingController numberOfBedroom;
  final TextEditingController numberOfBathroom;
  final TextEditingController legalInformation;
  const DescribeInformation(
      {Key? key,
      required this.area,
      required this.numberOfBedroom,
      required this.numberOfBathroom,
      required this.legalInformation,
      required this.houseDirection,
      required this.balconyDirection, 
      required this.apartImageUrl})
      : super(key: key);

  @override
  _DescribeInformation createState() => _DescribeInformation();
}

class _DescribeInformation extends State<DescribeInformation> {
  void passhouseDir(String? data) => widget.houseDirection(data);
  void passbalconyDir(String? data) => widget.balconyDirection(data);
  void passUrl(String? data) => widget.apartImageUrl(data);

  //PlatformFile? pickedFile;
  UploadTask? uploadTask;
  XFile? image;
  List<File> multipleImages = [];

  Future selectMultipleImages() async {
    List<XFile>? picked =
        await ImagePicker().pickMultiImage(maxHeight: 200, maxWidth: 200);
    picked!.map((e) => File(e.path)).toList();
    setState(() {
      multipleImages = picked.map((e) => File(e.path)).toList();
    });
  }

  Future selectImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final temporary = XFile(image.path);
      setState(() {
        this.image = temporary;
        uploadFile();
      });
    } on PlatformException catch (e) {
      throw Exception('Faild to pick image: $e');
    }
  }

  Future uploadFile() async {
    final path = 'images/${image!.name}';
    final file = File(image!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    passUrl(urlDownload);
    print('Download link: $urlDownload'); //Debug only
  }

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Card(
              elevation: 0,
              color: const Color.fromARGB(176, 245, 245, 245),
              child: CustomTextField(
                  controller: widget.area,
                  hint: "Dien tich",
                  label: "m²",
                  type: TextInputType.number),
            ),
            SizedBox(height: getProportionateScreenWidth(3)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: const Color.fromARGB(176, 243, 243, 243),
                    child: CustomTextField(
                        controller: widget.numberOfBedroom,
                        hint: "Phòng ngủ",
                        label: "Số phòng ngủ",
                        type: TextInputType.number),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: const Color.fromARGB(176, 243, 243, 243),
                    child: CustomTextField(
                        controller: widget.numberOfBathroom,
                        hint: "Phòng vệ sinh",
                        label: "Số phòng vệ sinh",
                        type: TextInputType.number),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(3)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: const Color.fromARGB(176, 243, 243, 243),
                    child: CustomDropBox(
                        onChanged: (selectedValue) => {
                              setState(() {
                                dropdownValue = selectedValue;
                                passhouseDir(dropdownValue);
                              })
                            },
                        value: dropdownValue,
                        list: direction,
                        hint: "Chọn hướng nhà",
                        label: "Hướng nhà"),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 0,
                    color: const Color.fromARGB(176, 243, 243, 243),
                    child: CustomDropBox(
                        onChanged: (selectedValue) => {
                              setState(() {
                                dropdownValue = selectedValue;
                                passbalconyDir(dropdownValue);
                              })
                            },
                        value: dropdownValue,
                        list: direction,
                        hint: "Hướng ban công",
                        label: "Chọn hướng ban công"),
                  ),
                ),
              ],
            ),
            Card(
              elevation: 0,
              color: const Color.fromARGB(176, 243, 243, 243),
              child: CustomTextField(
                  controller: widget.legalInformation,
                  hint:
                      "Ví dụ: Đã có sổ đỏ, đã có sổ hồng, Đã được phê duyệt, ...",
                  label: "Thông tin pháp lý",
                  type: TextInputType.text),
            ),
            SizedBox(height: getProportionateScreenWidth(3)),
            Stack(
              children: [
                image != null
                    ? Image.file(
                        File(image!.path),
                        width: MediaQuery.of(context).size.width,
                        height: 650,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/add_images.png',
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                      ),
                Positioned(
                  width: SizeConfig.screenWidth,
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 4),
                                  blurRadius: 10),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              selectImage();
                            },
                            icon: const Icon(
                              Icons.image,
                              size: 25,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 30,
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 5, crossAxisSpacing: 2, mainAxisSpacing: 3),
            //     itemCount: multipleImages.length,
            //     itemBuilder: (context, index) {
            //       return GridTile(
            //         child: Image.file(multipleImages[index]),
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        )),
      ),
    );
  }
}
