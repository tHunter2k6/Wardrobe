import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class WardrobeData extends ChangeNotifier {
  Map<String, List<Uint8List>> collections = {};
  Map<String, List<Uint8List>> outfits = {};

  //collection methods
  final _mybox = Hive.box('WARDROBE');
  initCollections() {
    collections = {};
  }

  loadCollections() {
    if (_mybox.get('collections') != null) {
      collections = _mybox.get('collections');
    } else {
      collections = {};
    }
    notifyListeners();
  }

  updateCollections() {
    _mybox.put('collections', collections);
    notifyListeners();
  }

  Map<String, List<Uint8List>> getCollections() {
    loadCollections();
    return collections;
  }

  //outfit methods
  initOufits() {
    outfits = {};
  }

  loadOutfits() {
    if (_mybox.get('Outfits') != null) {
      outfits = _mybox.get('Outfits');
    } else {
      outfits = {};
    }
    notifyListeners();
  }

  updateOutfits() {
    _mybox.put('Outfits', outfits);
    notifyListeners();
  }

  Map<String, List<Uint8List>> getOutfits() {
    loadOutfits();
    return outfits;
  }
}
