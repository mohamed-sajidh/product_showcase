import 'package:flutter/material.dart';
import 'package:product_showcase/utils/app_colors.dart';
import 'package:product_showcase/utils/asset.dart';

class SingleProductViewer extends StatelessWidget {
  const SingleProductViewer({super.key});

  @override
  Widget build(BuildContext context) {
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.boxBorderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                width: width * 0.35,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "apple iphone 14",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  const Text(
                    "40.00",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => print("minus button tapped"),
                        child: Container(
                          height: height * 0.040,
                          width: width * 0.090,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.boxBorderColor,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                color: AppColors.black,
                                // fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.030,
                      ),
                      const Text(
                        "0",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.030,
                      ),
                      InkWell(
                        onTap: () => print("plus button tapped"),
                        child: Container(
                          height: height * 0.040,
                          width: width * 0.090,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.boxBorderColor,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                color: AppColors.black,
                                // fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: () => print("buy now button tapped"),
                      child: Container(
                        width: width * 0.20,
                        height: height * 0.060,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
