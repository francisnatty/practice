import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/getx/store_controller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
  }
}

class AddFollowerCount extends StatefulWidget {
  AddFollowerCount({super.key});

  @override
  State<AddFollowerCount> createState() => _AddFollowerCountState();
}

class _AddFollowerCountState extends State<AddFollowerCount> {
  final storeController = Get.put(StoreController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeController.followerController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Follower count'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have add these many followers to your store'),
              const SizedBox(
                height: 40.0,
              ),
              Obx(
                () => Text(
                  storeController.followerCount.value.toString(),
                ),
              ),
              Obx(() => Switch(
                    value: storeController.storeStatus.value,
                    activeColor: Colors.green,
                    onChanged: (value) =>
                        storeController.storeStatusOpen(value),
                  )),
              TextFormField(
                controller: storeController.followerController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: 'Enter Last Name',
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              // Obx(() => Text('${storeController.followerCount}')),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (storeController.followerController.text.isNotEmpty)
                              ? Colors.purple
                              : Colors.purple.withOpacity(0.1),
                    ),
                    onPressed: () {
                      log(storeController.followerController.text.toString());
                      Get.snackbar(
                        'Updated!!',
                        'Store name has been updated ton ${storeController.followerCount.value.toString()}',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: const Text('Test'),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        storeController.updateFollowerCount();
      }),
    );
  }
}
