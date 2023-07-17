import 'package:flutter/material.dart';

import '../../utils/constants_size.dart';

class RoundUserImage extends StatelessWidget {
  final String path;
  final bool fromNetwork;
  final double widthHeight;

  RoundUserImage(
      {super.key,
      required this.path,
      required this.fromNetwork,
      this.widthHeight = ConstantSize.chatImageSize});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(855),
      child: fromNetwork
          ? Image.network(
              path,
              fit: BoxFit.cover,
              width: widthHeight,
              height: widthHeight,
            )
          : Image.asset(
              path,
              fit: BoxFit.cover,
              width: widthHeight,
              height: widthHeight,
            ),
    );
  }
}
