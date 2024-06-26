import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

import '../../../core/utils/image_constant.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_outlined_button.dart';

class SuccessDialog {
  static void showCustomDialog(
      BuildContext context, String heading, Widget widget) {
    showDialog(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(25),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,

          title: Center(child: Text(heading)),
          content: Container(
            child: widget,
          ),

          actions: [
            Center(
              child: CustomOutlinedButton(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor:theme.primaryColor
                  ),
                  width: 100.h,
                  text: "lbl_ok".tr,
                  onPressed:(){
                    Get.back();
                  }



              ),
            )
          ],
        );


        //   AlertDialog(
        //   backgroundColor: Colors.white,
        //   surfaceTintColor: Colors.white,
        //   contentPadding: EdgeInsets.zero,
        //   actionsPadding: EdgeInsets.only(bottom: 0, right: 5),
        //   buttonPadding: EdgeInsets.zero,
        //   iconPadding: EdgeInsets.zero,
        //   insetPadding: EdgeInsets.zero,
        //   titlePadding: EdgeInsets.zero,
        //   content: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       // CustomImageView(
        //       //   imagePath: ImageConstant.imgGIF,
        //       //   height: 170.v,
        //       //   width: 172.h,
        //       //   alignment: Alignment.topCenter,
        //       // ),
        //       Container(
        //         width: 225.h,
        //         margin: EdgeInsets.only(bottom: 5.v),
        //         child: RichText(
        //           text: TextSpan(
        //             children: [
        //               TextSpan(
        //                 text: heading,
        //                 style: CustomTextStyles.headlineSmallBold,
        //               ),
        //               TextSpan(
        //                 text: text,
        //                 style: theme.textTheme.bodyLarge,
        //               ),
        //             ],
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //       SizedBox(height: 16),
        //     ],
        //   ),
        //   actions: [
        //     Center(
        //       child: TextButton(
        //         onPressed: () {
        //
        //           Get.back(); // Close the dialog
        //         },
        //         child: Text(
        //           'OK',
        //           style: TextStyle(fontSize: 15),
        //         ),
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}
