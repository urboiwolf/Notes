import 'package:flutter/material.dart';
import '../../const/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.isLoading});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Text(
                'Save',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              )
        // : Container(
        //     width: MediaQuery.of(context).size.width / 2,
        //     height: 55,
        //     decoration: BoxDecoration(
        //         color: kPrimaryColor,
        //         borderRadius: BorderRadius.circular(15)),
        //     child: const Center(
        //       child: Text(
        //         'Add Note',
        //         style: TextStyle(color: Colors.black, fontSize: 22),
        //       ),
        //     ),
        //   ),
        );
  }
}
