import 'package:bad_protection/api/detection_model.dart';
import 'package:bad_protection/pages/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.workspace_premium_outlined),
        title: Text("Bad protection"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: Get.width * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 25, right: 30, bottom: 10),
                    child: TextFormField(
                      controller: controller.tcontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter text..',
                        border: InputBorder.none,
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    controller.verifiText();
                  },
                  height: 60,
                  minWidth: 90,
                  color: Colors.blueGrey,
                  shape: StadiumBorder(),
                  child: Text("Verifi"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 60,
              width: Get.width * 0.6,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 30, bottom: 10),
                child: TextFormField(
                  controller: controller.Urlcontroller,
                  decoration: InputDecoration(
                    hintText: 'Image url here....',
                    border: InputBorder.none,
                  ),
                  autofocus: false,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 140),
            child: MaterialButton(
              onPressed: () {
                controller.submitImage(controller.Urlcontroller.text);

                // controller.submitImage(controller.Urlcontroller.text);
              },
              height: 60,
              minWidth: 90,
              color: Colors.blueGrey,
              shape: StadiumBorder(),
              child: Text("Verifi"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: controller.state.showImage != true
                ? Container()
                : CachedNetworkImage(
                    imageUrl: controller.Urlcontroller.text,
                    imageBuilder: (context, ImageProvider) => Container(
                          height: 400,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: ImageProvider),
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    errorWidget: (context, url, error) => Container(
                          height: 400,
                          width: Get.width * 0.6,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "A problem with View image\n Use right Url....",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
          ),
        ],
      ),
    );
  }
}
