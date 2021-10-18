

import 'dart:convert';

import 'package:arsenic_flutter_ecommerce/domain/home/store_item.dart';

class HomeResponse {
  final List<StoreItem> storeItems;

  const HomeResponse({
    required this.storeItems,
  });


  // factory HomeResponse.fromUser(User user) {
  //   final appUser = AppUser(
  //     uid: user.uid,
  //     userName: user.displayName ?? "WAQAR",
  //   );

  //   return AuthResponse(
  //     refreshToken: user.refreshToken,
  //     accessToken: "",
  //     tokenExpiry: DateTime.now(),
  //     appUser: appUser,
  //   );
  // }
}
