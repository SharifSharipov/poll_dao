import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivePollsNavigate extends StatefulWidget {
  final double radius;
  final Color color;
  final Color textColorOne;
  final Color textColorTwo;
  final VoidCallback onTap;
  final String icon;
  final String textOne;
  final String textTwo;
  final double textSizeOne;
  final double textSizeTwo;
  final FontWeight fontWeightTextOne;
  final FontWeight fontWeightTextTwo;
  const ActivePollsNavigate({
    super.key,
    required this.radius,
    required this.color,
    required this.textColorOne,
    required this.textColorTwo,
    required this.onTap,
    required this.icon,
    required this.textOne,
    required this.textTwo,
    required this.textSizeOne,
    required this.textSizeTwo,
    required this.fontWeightTextOne,
    required this.fontWeightTextTwo,
  });

  @override
  State<ActivePollsNavigate> createState() => _ActivePollsNavigateState();
}

class _ActivePollsNavigateState extends State<ActivePollsNavigate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(left: 20, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.textOne,
                      style: TextStyle(
                        color: widget.textColorOne,
                        fontWeight: widget.fontWeightTextOne,
                        fontSize: widget.textSizeOne,
                      ),
                    ),
                    TextSpan(
                      text: '\n${widget.textTwo}',
                      style: TextStyle(
                        color: widget.textColorTwo,
                        fontWeight: widget.fontWeightTextTwo,
                        fontSize: widget.textSizeTwo,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: widget.onTap, icon: SvgPicture.asset(widget.icon)),
            ],
          ),
        ),
      ),
    );
  }
}
