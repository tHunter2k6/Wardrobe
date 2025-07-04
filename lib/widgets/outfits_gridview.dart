import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wardrobe/hive/hive_methods.dart';
import 'package:wardrobe/screens/outfit.dart';
import 'package:wardrobe/widgets/Buttons.dart';

class SavedFits extends StatefulWidget {
  const SavedFits({super.key});

  @override
  State<SavedFits> createState() => SsavedFitStates();
}

class SsavedFitStates extends State<SavedFits> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<WardrobeData>(context, listen: false).getOutfits();

    return Consumer<WardrobeData>(
      builder: (context, value, child) {
        value.getOutfits();
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 210),
          itemCount: value.outfits.length,
          itemBuilder: (context, index) {
            // delete outfits
            void deleteFit() {
              setState(() {
                value.outfits.remove(
                  value.outfits.keys.toList()[index],
                );
              });
              Provider.of<WardrobeData>(context, listen: false).updateOutfits();
              Navigator.of(context).pop();
            }
            //confirm delete

            void confirmDel() {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey[200],
                    content: Container(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              'Delete outfits ${(
                                value.outfits.keys.toList()[index],
                              )}?',
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              //save button
                              MyButton(onPressed: deleteFit, text: "Delete"),

                              const SizedBox(width: 4),
                              //cancel button
                              MyButton(
                                  onPressed: Navigator.of(context).pop,
                                  text: "Cancel"),
                              const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OutfitPage(
                          outfitName: value.outfits.keys.toList()[index]);
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Column(
                        children: [
                          value.outfits[value.outfits.keys.toList()[index]]!
                                  .isEmpty
                              ? Image.asset('lib/images/empty.png')
                              : Image.memory(
                                  value.outfits[value.outfits.keys
                                      .toList()[index]]![index],
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            Center(
                              child: Text(
                                value.outfits.keys.toList()[index],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            IconButton(
                              onPressed: confirmDel,
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
