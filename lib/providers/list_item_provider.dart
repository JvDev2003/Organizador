import 'package:flutter/foundation.dart';
import 'package:organizador/classes/list_item_class.dart';

class ListItemProvider extends ChangeNotifier {
  final List<ListItem> _list = [];

  void insert(ListItem item) {
    _list.add(item);
    notifyListeners(); 
  }

  void delete(ListItem item){
    _list.remove(item);
    notifyListeners(); 
  }

  List<ListItem> getAll (){
    return _list;
  }
}