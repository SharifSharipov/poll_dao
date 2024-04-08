import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poll_dao/src/core/colors/app_colors.dart';
import 'package:poll_dao/src/core/extentions/extentions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ChargePercentageIndicator extends StatefulWidget {
  final int chargePercentage;
  final String option;
  final String text;

  const ChargePercentageIndicator({Key? key, required this.chargePercentage, required this.option, required this.text})
      : super(key: key);

  @override
  State<ChargePercentageIndicator> createState() => _ChargePercentageIndicatorState();
}

class _ChargePercentageIndicatorState extends State<ChargePercentageIndicator> {
  bool tap = true;
  int count=0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ZoomTapAnimation(onTap: (){
      tap = !tap;
      setState(() {
       if(tap){
         count++;
       }else{
         count--;
       }
      });
    },
      child: Container(
        width: width,
        child: Row(
          children: [
            Container(
              height: (height / 23.15),
              width: (height / 23.15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: tap ? AppColors.c_5B6D83.withOpacity(0.1) : AppColors.c_5856D6
                      ),
              child: Center(
                  child: Text(
                widget.option,
                style: TextStyle(
                    color: tap ? AppColors.c_5856D6 : AppColors.white,
                    fontSize: (height / 48.7),
                    fontWeight: FontWeight.bold),
              )),
            ),
            (width / 30).pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: (width/1.5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                       Text(
                        widget.text,
                        style: TextStyle(fontSize: 17),
                       ),

                      Text(
                        '${widget.chargePercentage+count}%', // $chargePercentage o'rniga chargePercentage.toString() + '%' ishlatish
                        style: const TextStyle(
                            color: Colors.blueGrey, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 270,
                  height: 15,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(5),
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        tap ? AppColors.c_5B6D83.withOpacity(0.1) : AppColors.c_5856D6),
                    value: widget.chargePercentage / 100.0,
                  ),
                ),
                20.ph,
              ],
            )
          ],
        ),
      ),
    );
  }
}
