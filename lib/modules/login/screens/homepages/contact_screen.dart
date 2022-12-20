import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_string.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 600,
            height: 450,
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(50),
                  color: AppColors.menubarButtonColor,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(AppStrings.letsGetInTouch,
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 30,
                                fontFamily: 'Libre',
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 17,
                        ),
                        const Text(
                            "We're open for any suggestions ot just to have a chat",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                height: 1.5,
                                fontSize: 15,
                                fontFamily: 'Libre')),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.share_location_rounded,
                                color: AppColors.whiteColor,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Address : 198 Apollo Bandar,Colaba,\nMumbai,Maharashtra 400001",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    height: 1.5,
                                    fontSize: 15,
                                    fontFamily: 'Libre',
                                  ))
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.phone,
                                color: AppColors.whiteColor,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    String telephoneNumber = '+9874563210';

                                    if (await canLaunch(telephoneNumber)) {
                                      await launch(telephoneNumber);
                                    } else {
                                      throw "Error occured trying to call that number.";
                                    }
                                  },
                                  child: const Text("9874563210",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        height: 1.5,
                                        fontSize: 15,
                                        fontFamily: 'Libre',
                                      )))
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                color: AppColors.whiteColor,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    String email = 'this.is.tijani@gmail.com';
                                    String emailUrl = "mailto:$email";

                                    if (await canLaunch(emailUrl)) {
                                      await launch(emailUrl);
                                    } else {
                                      throw "Error occured sending an email";
                                    }
                                  },
                                  child: const Text("User@gmail.com",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        height: 1.5,
                                        fontSize: 15,
                                        fontFamily: 'Libre',
                                      )))
                            ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.computer_outlined,
                                color: AppColors.whiteColor,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    const url = 'https://Antique_homes.com';
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: const Text("https://Antique_homes.com",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        height: 1.5,
                                        fontSize: 15,
                                        fontFamily: 'Libre',
                                      )))
                            ]),
                      ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
