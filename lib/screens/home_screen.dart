import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wardrobe/hive/hive_methods.dart';
import 'package:wardrobe/widgets/creating_stuff.dart';
import 'package:wardrobe/widgets/collections_gridview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  final _mybox = Hive.box('WARDROBE');
  // WardrobeData db = WardrobeData();

  @override
  void initState() {
    if (_mybox.get('collections') == null) {
      Provider.of<WardrobeData>(context).initCollections();
    } else {
      Provider.of<WardrobeData>(context).loadCollections();
    }
    if (_mybox.get('Outfits') == null) {
      Provider.of<WardrobeData>(context).initOufits();
    } else {
      Provider.of<WardrobeData>(context).loadOutfits();
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    //

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
                  //search collections
                  // TextField(
                  //   controller: searchcontroller,
                  //   decoration: InputDecoration(
                  //     hintText: "Search for collections",
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
                    'Your Collections:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  value.collections.isEmpty
                      ? const Column(
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                              child: Text(
                                'Sike you have no collections yet :/',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      : const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: gridB(),
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
                    return newCollection(
                      onSave: () {
                        value.collections[_controller.text] = [];
                        _controller.clear();
                        Navigator.of(context).pop();
                        Provider.of<WardrobeData>(context, listen: false)
                            .updateCollections();
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
