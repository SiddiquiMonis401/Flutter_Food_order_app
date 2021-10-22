import 'package:bloc/bloc.dart';
import 'package:first_flutter_app/Cubit/Helpers/CartHelper.dart';
import 'package:first_flutter_app/Schemas/FoodCartData.dart';

part 'cartitemscubit_state.dart';

class CartitemscubitCubit extends Cubit<CartitemscubitState> {
  CartitemscubitCubit() : super(CartitemscubitState(cartItems: [], count: 0));

  void addItemToCart(FoodCartData cartItem) => {
    emit(CartitemscubitState(cartItems: CartHelper.addItemToCart(state.cartItems, cartItem, true), count: state.count + 1)),
  }; 
  void removeItemToCart(FoodCartData cartItem) => {
    emit(CartitemscubitState(cartItems: CartHelper.addItemToCart(state.cartItems, cartItem, false), count: state.count == 1 ? state.count : state.count - 1)),
  }; 
  void deleteItemFromList(FoodCartData cartItem) => {
    emit(CartitemscubitState(cartItems: CartHelper.deleteItemFromCartList(state.cartItems, cartItem), count: state.count - cartItem.itemsInCart)),
  }; 
}
