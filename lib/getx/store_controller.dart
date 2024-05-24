import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  final storeName = 'NattyStore'.obs;
  final followerCount = 0.obs;
  final storeStatus = true.obs;
  final followerList = [].obs;

  final storeNameEdittingController = TextEditingController();
  final reviewEditingController = TextEditingController();
  final followerController = TextEditingController();
  final reviewNameController = TextEditingController();

  updateStoreName(String name) {
    storeName(name);
  }

  updateFollowerCount() {
    followerCount(followerCount.value + 1);
  }

  void storeStatusOpen(bool isOpen) {
    storeStatusOpen(isOpen);
  }
}
