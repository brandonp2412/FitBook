import 'package:fit_book/entries.dart';
import 'package:flutter/material.dart';

class EntriesState extends ChangeNotifier {
  late Stream<List<EntryWithFood>> _stream;

  EntriesState() {
    _stream = watchEntries('', 100);
  }

  Stream<List<EntryWithFood>> get stream => _stream;

  void setStream(String search, int limit) {
    _stream = watchEntries(search, limit);
    notifyListeners();
  }
}
