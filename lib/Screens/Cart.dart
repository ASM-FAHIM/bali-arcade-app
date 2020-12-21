import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String shopId;
  final String proId;
  final String resId;
  final String menuId;
  final String name;
  final int quantity;
  final double price;
  var image;
  double discount;

  CartItem(
      {
        this.id,
        this.shopId,
        this.proId,
        this.resId,
        this.menuId,
        this.name,
        this.quantity,
        this.price,
        this.image,
        this.discount
      });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(
      String pdtid,
      String name,
      String shopId,
      String productId,
      String resId,
      String menuId,
      double price,
      int quantity,
      var image,
      double discount,
      ) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
              (existingCartItem) => CartItem(
            id: pdtid,
            shopId: existingCartItem.shopId,
            resId: existingCartItem.resId,
            menuId: existingCartItem.menuId,
            proId: existingCartItem.proId,
            //DateTime.now().toString(),
            name: existingCartItem.name,
            // quantity: quantity,
            quantity: existingCartItem.quantity + 1,
            image: image,
            discount: existingCartItem.discount,
            price: existingCartItem.price,
          ));
    } else {
      _items.putIfAbsent(
          pdtid,
              () => CartItem(
            name: name,
            id: pdtid,
            shopId: shopId,
            proId: productId,
            resId: resId,
            menuId: menuId,
            image: image,
            discount: discount,
            //DateTime.now().toString(),
            quantity: 1,
            price: price,
          ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(
      String pdtid,
      String shop_id,
      String pro_id,
      String res_id,
      String menu_id,
      String name,
      double price,
      int quantity,
      var image,
      var discount) {
    if (!_items.containsKey(pdtid)) {
      return;
    }

    if (_items[pdtid].quantity > 0) {
      _items.update(
          pdtid,
              (existingCartItem) => CartItem(
            id: pdtid,
            shopId: shop_id,
            proId: pro_id,
            resId: res_id,
            menuId: menu_id,
            //DateTime.now().toString(),
            name: name,
            discount: existingCartItem.discount,
            //quantity: quantity,
            image: image,
            quantity: existingCartItem.quantity - 1,
            price: existingCartItem.price,
          ));
    }

    if (_items[pdtid].quantity == 0) {
      _items.remove(pdtid);
    }

    notifyListeners();
  }

  int get totalQuantity {
    var totalQuan = 0;

    _items.forEach((key, cartItem) {
      totalQuan += cartItem.quantity;
    });
    return totalQuan;
  }

  double get totalAmount {
    var productPrice = 00.00;

    _items.forEach((key, cartItem) {
      productPrice += cartItem.price * cartItem.quantity;
    });
    return productPrice;
  }

  double get totalDiscount {
    var totalDiscount = 0.0;
    var sum = 0.0;
    _items.forEach((key, cartItem) {
      totalDiscount += cartItem.discount; // Quentity add korbo jodi lage.
    });
    // sum += totals;
    return totalDiscount;
  }

  //check this property
  double get grandAmount {
    var totalPrice = 0.0;

    //var grandTotal = 70.0;

    _items.forEach((key, cartItem) {
      totalPrice += cartItem.price * cartItem.quantity - cartItem.discount;
    });
    return totalPrice;
  }

  double get price {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = cartItem.price;
    });
    return total;
  }

  get productId {
    var no;
    var arr = [];
    _items.forEach((key, cartItem) {
      no = cartItem.proId;
      arr.add(no);
    });
    return arr;
  }

  get shopId {
    var sno;
    var sarr = [];
    _items.forEach((key, cartItem) {
      sno = cartItem.shopId;
      sarr.add(sno);
    });
    return sarr;
  }

  get resId {
    var resno;
    var resarr = [];
    _items.forEach((key, cartItem) {
      resno = cartItem.resId;
      resarr.add(resno);
    });
    return resarr;
  }

  get menuId {
    var menuNo;
    var menuArr = [];
    _items.forEach((key, cartItem) {
      menuNo = cartItem.menuId;
      menuArr.add(menuNo);
    });
    return menuArr;
  }

  get unitQuantity {
    var totalQuan = 0;
    List<int> arr = [];
    _items.forEach((key, cartItem) {
      totalQuan = cartItem.quantity;
      arr.add(totalQuan);
    });
    return arr;
  }

  get unitCost {
    double cost = 0;
    List<double> arr = [];
    _items.forEach((key, cartItem) {
      cost = cartItem.price;
      arr.add(cost);
    });
    return arr;
  }

  get unitTotal {
    double total = 0;
    List<double> arr = [];
    _items.forEach((key, cartItem) {
      total = cartItem.price * cartItem.quantity;
      arr.add(total);
    });
    return arr;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

// get pho {
//   return phone;
// }
}







