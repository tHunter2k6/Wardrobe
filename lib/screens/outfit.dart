// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors_in_immutables

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wardrobe/hive/hive_methods.dart';

class OutfitPage extends StatefulWidget {
  OutfitPage({super.key, required this.outfitName});
  //
  final String outfitName;

  @override
  State<OutfitPage> createState() => _OutfitPageState();
}

class _OutfitPageState extends State<OutfitPage> {
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    Provider.of<WardrobeData>(context, listen: false).getOutfits();
    //
    return Consumer<WardrobeData>(
      builder: (context, value, child) {
        //click image from camera
        Future<void> clickImage() async {
          ImagePicker imagePicker = ImagePicker();
          XFile? image =
              await imagePicker.pickImage(source: ImageSource.camera);
          if (image == null) {
            return;
          }
          Uint8List imageBytes = await image.readAsBytes();
          setState(() {
            _image = imageBytes;
          });

          if (value.outfits[widget.outfitName] != null) {
            value.outfits[widget.outfitName]!.add(_image!);
          } else {
            value.outfits[widget.outfitName] = [_image!];
          }

          Navigator.of(context).pop();
          value.updateOutfits();
        }

        //select Image from gallery
        Future<void> selectImage() async {
          ImagePicker imagePicker = ImagePicker();
          XFile? image =
              await imagePicker.pickImage(source: ImageSource.gallery);
          if (image == null) {
            return;
          }
          Uint8List imageBytes = await image.readAsBytes();
          setState(() {
            _image = imageBytes;
          });

          if (value.outfits[widget.outfitName] != null) {
            value.outfits[widget.outfitName]!.add(_image!);
          } else {
            value.outfits[widget.outfitName] = [_image!];
          }

          Navigator.of(context).pop();
          value.updateOutfits();
        }

        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            title: Text(
              widget.outfitName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body:
              //check for empty outfit

              value.outfits[widget.outfitName]!.isEmpty
                  ? const Center(
                      child: Text("Put something here bud"),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 170),
                          itemCount: value.outfits[widget.outfitName]!.length,
                          itemBuilder: (context, index) {
                            //
                            //getting imagesss

                            Uint8List imageData =
                                value.outfits[widget.outfitName]![index];

                            // void addToOutfit() {
                            //   setState(() {
                            //     outfit.add(imageData);
                            //   });
                            //   Navigator.of(context).pop();
                            // }

                            void deleteItem() {
                              setState(() {
                                value.outfits[widget.outfitName]!
                                    .remove(imageData);
                              });
                              value.updateCollections();
                              Navigator.of(context).pop();
                            }

                            // void removeFromOutfit() {
                            //   setState(() {
                            //     outfit.remove(imageData);
                            //   });
                            //   Navigator.of(context).pop();
                            // }

                            //
                            BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            );
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return imageData == null
                                        ? const Column()
                                        : Column(
                                            children: [
                                              Container(
                                                child: Image.memory(imageData),
                                              ),
                                              IconButton(
                                                onPressed: deleteItem,
                                                icon: Icon(
                                                  Icons.delete_outline_sharp,
                                                  color: Colors.grey[100],
                                                ),
                                              )
                                            ],
                                          );
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(14.0),
                                    ),
                                    child: Column(
                                      children: [
                                        imageData == null
                                            ? const Column()
                                            : Image.memory(
                                                imageData,
                                                height: 170,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      backgroundColor: Colors.grey[200],
                      children: [
                        SimpleDialogOption(
                          padding: const EdgeInsets.all(20),
                          onPressed: clickImage,
                          child: const Text('Take a photo'),
                        ),
                        SimpleDialogOption(
                          padding: const EdgeInsets.all(20),
                          onPressed: selectImage,
                          child: const Text('Choose from gallery'),
                        ),
                        SimpleDialogOption(
                          padding: const EdgeInsets.all(20),
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            print(value.collections);
                          },
                        ),
                      ],
                    );
                  });
            },
            backgroundColor: Colors.grey[100],
            child: Icon(
              Icons.upload_rounded,
              size: 50,
              color: Colors.grey[500],
            ),
          ),
        );
      },
    );
  }
}
