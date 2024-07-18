import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_showcase/controller/home_controller.dart';
import 'package:product_showcase/utils/app_colors.dart';
import 'package:product_showcase/utils/asset.dart';
import 'package:provider/provider.dart';

class SingleProductViewer extends StatelessWidget {
  const SingleProductViewer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    var screeenSize = MediaQuery.of(context).size;
    var width = screeenSize.width;
    var height = screeenSize.height;

    String getFirstTwoWords(String title) {

    List<String> words = title.split(' ');

    String result = words.take(3).join(' ');

    return result.length > 30 ? '${result.substring(0, 30)}...' : result; 
  }

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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: homeNotifier.product[index].image,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      getFirstTwoWords(homeNotifier.product[index].title),
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.010,
                  ),
                  Text(
                    "${homeNotifier.product[index].price}.00",
                    style: const TextStyle(
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
