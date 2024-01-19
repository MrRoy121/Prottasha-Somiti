import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../helpers/auth_service.dart';
import '../route.dart';


class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (!AuthService.to.isAuthenticated.value) {
      return const RouteSettings(name: authenticationPageRoute);
    }
    return null;
  }
}
