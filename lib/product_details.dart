import 'dart:convert';

import 'package:cart/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  var pic;
  var des;
  var name;

  ProductDetails(
      {Key? key, required this.pic, required this.des, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context, builder: (builder) => buy(context));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 0.5,
                  offset: const Offset(0, 4))
            ],
          ),
          height: 60,
          width: width - 100,
          child: const Center(
              child: Text(
            'Buy',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          )),
        ),
      ),
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(12),
      //     color: Colors.blue,
      //     boxShadow: [
      //       BoxShadow(
      //           color: Colors.grey.shade300,
      //           blurRadius: 0.5,
      //           offset: const Offset(0, 4))
      //     ],
      //   ),
      //   height: 60,
      //   width: width - 100,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.remove_circle,
      //               color: Colors.white,
      //               size: 35,
      //             )),
      //         Text(
      //           "1",
      //           style: TextStyle(color: Colors.white, fontSize: 30),
      //         ),
      //         IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.add_circle,
      //               color: Colors.white,
      //               size: 35,
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
      body: ListView(
        children: [
          Container(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage(
                  pic,
                ),
                height: 80,
              )),
          Center(
              child: Text(
            name,
            style: const TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
          )),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(des,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }

  Widget buy(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height - 600,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Please select Your Quantity'),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 0.5,
                    offset: const Offset(0, 4))
              ],
            ),
            height: 60,
            width: width - 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                        size: 35,
                      )),
                  const Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: 35,
                      )),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.offAll(Dashboard());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Order Confirmed'),
                ),
              );
            },
            child: Container(
              height: 60,
              width: width - 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 0.5,
                      offset: const Offset(0, 4))
                ],
              ),
              child: const Center(child: Text('Buy')),
            ),
          )
        ],
      ),
    );
  }
}
