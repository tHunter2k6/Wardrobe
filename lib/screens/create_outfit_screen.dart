import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wardrobe/hive/hive_methods.dart';
import 'package:wardrobe/screens/home.dart';
import 'package:wardrobe/widgets/creating_stuff.dart';

class Outfits extends StatefulWidget {
  const Outfits({super.key});

  @override
  State<Outfits> createState() => _OutfitsState();
}

List<Uint8List> tempOutfit = [];

class _OutfitsState extends State<Outfits> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //clear outfit
    void clearOutfit() {
      setState(() {
        tempOutfit.clear();
      });
    }

    return Consumer<WardrobeData>(
      builder: (context, value, child) {
        return tempOutfit.isEmpty
            ? Scaffold(
                backgroundColor: Colors.grey[300],
                appBar: AppBar(
                  backgroundColor: Colors.grey[300],
                  title: const Text(
                    "Your Outfit",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                ),
                body: const Center(
                  child: Text('create an outfit'),
                ),
                floatingActionButton: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const Home();
                      }),
                    );
                  },
                  backgroundColor: Colors.grey[100],
                  child: const Icon(Icons.add),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.grey[300],
                appBar: AppBar(
                  backgroundColor: Colors.grey[300],
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Your Outfit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        child: Text(
                          "Save",
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[600]),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return newOutfit(
                                  onSave: () {
                                    setState(() {
                                      value.outfits[_controller.text] =
                                          tempOutfit;
                                    });
                                    _controller.clear();
                                    value.updateOutfits();
                                    Navigator.of(context).pop();
                                    print(value.outfits);
                                  },
                                  controller: _controller,
                                );
                              });
                        },
                      ),
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Padding(
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
                      itemCount: tempOutfit.length,
                      itemBuilder: (context, index) {
                        //
                        // delete item
                        void deleteItem() {
                          setState(() {
                            tempOutfit.removeAt(index);
                          });

                          Navigator.of(context).pop();
                          print(tempOutfit.length);
                        }

                        //
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
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 70,
                                    ),
                                    Container(
                                      child: Image.memory(tempOutfit[index]),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: deleteItem,
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: Colors.grey[100],
                                          ),
                                        ),
                                      ],
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
                                    Image.memory(
                                      tempOutfit[index],
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
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: clearOutfit,
                        backgroundColor: Colors.grey[100],
                        child: const Icon(Icons.delete_outline),
                      ),
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const Home();
                              },
                            ),
                          );
                        },
                        backgroundColor: Colors.grey[100],
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
