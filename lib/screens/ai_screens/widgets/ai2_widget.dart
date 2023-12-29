
import 'package:final_project/cubits/cubit/ai_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AITextField extends StatelessWidget {
  final TextEditingController controller;

  const AITextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                context.read<AiCubit>().sendMessage(controller.text);
                controller.clear();
              },
              child: Text(
                'ارسال',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.white,
                  hintText: 'اكتب الرسالة',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}