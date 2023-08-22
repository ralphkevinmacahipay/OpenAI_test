import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatServicesController extends GetxController {
  TextEditingController messageController = TextEditingController();
  Rx<bool> isLoading = true.obs;
}
