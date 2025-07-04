import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wardrobe/hive/hive_methods.dart';
import 'package:wardrobe/widgets/creating_stuff.dart';
import 'package:wardrobe/widgets/outfits_gridview.dart';

class MyOutfits extends StatefulWidget {
  const MyOutfits({super.key});

  @override
  State<MyOutfits> createState() => _MyOutfits();
}

class _MyOutfits extends State<MyOutfits> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WardrobeData>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset(
                    'assets/title.svg',
                    color: Colors.black,
                    height: 50,
                  ),
                  const Divider(),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  //search outfits
                  // TextField(
                  //   controller: searchcontroller,
                  //   decoration: InputDecoration(
                  //     hintText: "Search for outfits",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     icon: Icon(Icons.search),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Your Outfits:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  value.outfits.isEmpty
                      ? const Column(
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                              child: Text(
                                'Time to make some cool fits mate!',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      : const Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: SavedFits(),
                        ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[100],
            onPressed: () {
              print(value.collections);

              showDialog(
                  context: context,
                  builder: (context) {
                    return newOutfit(
                      onSave: () {
                        value.outfits[_controller.text] = [];
                        _controller.clear();
                        Navigator.of(context).pop();
                        Provider.of<WardrobeData>(context, listen: false)
                            .updateOutfits();
                      },
                      controller: _controller,
                    );
                  });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
