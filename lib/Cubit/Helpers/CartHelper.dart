import 'package:first_flutter_app/Schemas/FoodCartData.dart';

class CartHelper {
  static List<FoodCartData> addItemToCart(List<FoodCartData> currentCartItems,
      FoodCartData newCartItem, bool addOperationToCart) {
    List<FoodCartData> copyOfCartItems = [...currentCartItems];
    bool isItemPresent = false;
    for (var i = 0; i < copyOfCartItems.length; i++) {
      FoodCartData currentElement = copyOfCartItems[i];
      if (currentElement.foodName == newCartItem.foodName) {
        // need to do comparsion based on id later!!
        isItemPresent = true;
        int count = addOperationToCart
            ? currentElement.itemsInCart + 1
            : currentElement.itemsInCart == 1
                ? currentElement.itemsInCart
                : currentElement.itemsInCart - 1;
        currentElement.itemsInCart = count;
      }
    }
    ;
    if (!isItemPresent) copyOfCartItems.add(newCartItem);
    return copyOfCartItems;
  }

  static double calculateCartItemPrice(List<FoodCartData> cartItems) {
    double sum = 0;
    cartItems.forEach((element) { 
      sum += element.foodPrice * element.itemsInCart;
    });
    return sum;
  }

  static List<FoodCartData> deleteItemFromCartList(List<FoodCartData> cartItems, FoodCartData itemToDelete) {
    List<FoodCartData> updatedListAfterDeletion = [];
    cartItems.forEach((element) { 
      if(element.foodName != itemToDelete.foodName) {
        updatedListAfterDeletion.add(element);
      }
    });
    return updatedListAfterDeletion;
  }
}
