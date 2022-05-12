import 'dart:convert';
import 'dart:developer';

import 'package:cart/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  var data = [];
  var newdata = [].obs;
  var dropdownvalue = 'All'.obs;
  String a = "All";
  var items = [
    'All',
    'Premium',
    'Tamilnadu',
  ];
  readJson() async {
    final String response = await rootBundle.loadString('assets/list.json');
    data = await json.decode(response);
    newdata.value = data;
    // print(data.toString());
    // ...
  }

  @override
  Widget build(BuildContext context) {
    readJson();

    return Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: Column(children: [
          Container(
            height: 170,
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 4.0, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.short_text,
                            size: 35,
                          )),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text(
                        "Welcome \nback 😊",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('category'),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue.value,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    a = newValue!;
                    dropdownvalue.value = newValue;
                    // log(data.toString());
                    // newdata.clear();
                    // log(data.toString());
                    var ab = [];
                    log(data.length.toString());
                    for (int i = 0; i < data.length; i++) {
                      log(i.toString());

                      if (data[i]["p_category"] == dropdownvalue.value) {
                        ab.add(data[i]);
                      } else if (dropdownvalue.value == "All") {
                        ab.add(data[i]);
                      }
                      newdata.value = ab;
                    }
                  },
                ),
              ],
            ),
          ),
          Obx(() {
            // print(dropdownvalue.value);

            return Expanded(
                child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: newdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ProductDetails(
                                pic: newdata[index]["p_img"],
                                des: newdata[index]["p_details"],
                                name: newdata[index]["p_name"],
                              ));
                            },
                            child: customBox(newdata[index]["p_img"],
                                '${data[index]["p_name"]}'),
                          )
                        ],
                      ),
                    ]);
                  }),
            ));
          })
        ]));
  }
}

customBox(img, text) {
  return Container(
    margin: const EdgeInsets.all(12),
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 0.5,
            offset: const Offset(0, 4))
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            img,
          ),
          height: 80,
        ),
        Text(text)
      ],
    ),
  );
}
