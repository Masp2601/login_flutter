import 'package:get/get.dart';
import 'package:latin_food_app/users/models/cart_model.dart';

class CartListController extends GetxController {
  RxList<Cart> _carlist = <Cart>[].obs;
  RxList<int> _selectedItemList = <int>[].obs;
  RxBool _isSelectedAll = false.obs;
  RxDouble _total = 0.0.obs;

  List<Cart> get carList => _carlist.value;
  List<int> get selectedItemList => _selectedItemList.value;
  bool get isSelectedAll => _isSelectedAll.value;
  double get total => _total.value;

  setList(List<Cart> list) {
    _carlist.value = list;
  }

  addSelectedItem(int selectedItemCartID) {
    _selectedItemList.value.add(selectedItemCartID);
    update();
  }

  deletedSelectedItem(int selectedItemCartID) {
    _selectedItemList.value.remove(selectedItemCartID);
    update();
  }

  setIsSeectedAllItems() {
    _isSelectedAll.value = !_isSelectedAll.value;
  }

  clearAllSelectedItems() {
    _selectedItemList.value.clear();
    update();
  }

  setTotal(double overallTotal) {
    _total.value = overallTotal;
  }
}
