import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/assets.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black26],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 200),
        child: Column(children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                // color: Colors.red,
                child: Image.asset(Assets.faq, height: 300, width: 400),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Column(
                  children: [
                    Container(
                      child: const Text('NEED HELP?',
                          style: TextStyle(
                              color: AppColors.faqTextHeadingColor,
                              fontSize: 30)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      width: 330,
                      padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderColor),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const TextField(
                          style: TextStyle(color: AppColors.borderColor),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              hintStyle:
                                  TextStyle(color: AppColors.borderColor),
                              hintText: 'What can we help you with?')),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            alignment: Alignment.centerLeft,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'QUICK ASSISTS',
                  style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: AppColors.faqTextHeadingColor),
                ),
                Text(
                  'Answers to our most frequently asked questions are just one click away',
                  style: GoogleFonts.inter(
                      fontSize: 15, color: AppColors.faqTextColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.borderColor,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DISPATCH & DELIVERY',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.faqTextHeadingColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'How can I get free delivery on my order?',
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "What are AntiqueHouse's delivery options?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "Can my order be dispatched internationally?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RETURNS',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.faqTextHeadingColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'How do I return my order?',
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "What is AntiqueHouse's returns policy?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "Where is my refund?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDERS',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.faqTextHeadingColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Can i track my order?',
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "Can I cancel or change my order?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "What payment options can I use on my order?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PRODUCT INFO',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.faqTextHeadingColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "How do I get Nike’s newest sneaker releases?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "How do I find the right size and fit?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                    Text(
                      "Do Nike shoes have a warranty?",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.faqTextColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: AppColors.borderColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'MORE INFO',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.faqTextHeadingColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "More about AntiqueHouse,  Inc \n More about our offline outlet",
                  style: GoogleFonts.inter(
                      fontSize: 15, color: AppColors.faqTextColor),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
