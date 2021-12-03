import 'package:cached_network_image/cached_network_image.dart';
import 'package:utopia_mobile/shared/widgets/palette.dart';
import 'package:flutter/material.dart';

class BetWidget extends StatelessWidget {
  String etheurumPrice;
  String? icon;
  Color? arrowColor;
  BetWidget({Key? key, required this.etheurumPrice, this.icon, this.arrowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.black12, width: 2.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.0),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: Colors.black12, width: 2.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1200px-Ethereum_logo_2014.svg.png"))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  etheurumPrice,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 40.0,
              color: Palette.appMainColor,
            ),
          )
        ],
      ),
    );
  }
}
