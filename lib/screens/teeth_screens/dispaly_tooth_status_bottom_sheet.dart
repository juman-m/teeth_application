import 'package:final_project/screens/teeth_screens/display_image_widget.dart';
import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';

class DisplayToothStatusBottomSheet extends StatelessWidget {
  const DisplayToothStatusBottomSheet({
    super.key,
    required this.toothNum,
  });
  final String toothNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 20,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      height: 570,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height14(),
          Center(
            child: Container(
              width: 120,
              height: 5,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 3),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 29.05,
                decoration: const ShapeDecoration(
                  color: Color(0xFFE7E6E8),
                  shape: OvalBorder(),
                ),
                child: const Icon(
                  Icons.clear,
                  size: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 19.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 19, left: 53),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'رقم السن $toothNum',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        '2022-9-10',
                        style: TextStyle(
                          color: Color(0xFF868585),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                height20(),
                const Text(
                  'اسم الدكتور',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                height10(),
                SizedBox(
                  width: 325,
                  height: 38,
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE7E6E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                    ),
                  ),
                ),
                height14(),
                const Text(
                  'اسم المستشفى',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                height10(),
                SizedBox(
                  width: 325,
                  height: 38,
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE7E6E8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                    ),
                  ),
                ),
                height34(),
                const Padding(
                  padding: EdgeInsets.only(right: 10.0, left: 37),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DisplayImageWidget(
                        title: 'وصفة طبية',
                      ),
                      DisplayImageWidget(
                        title: 'تقرير',
                      ),
                      DisplayImageWidget(
                        title: 'أشعة سينية',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          height24(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 243.61,
                  height: 47.88,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF008BDB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.02),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'تعديل ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.05,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                width14(),
                const Icon(
                  Icons.delete_outline_rounded,
                  color: Color.fromARGB(206, 244, 67, 54),
                  size: 42,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}