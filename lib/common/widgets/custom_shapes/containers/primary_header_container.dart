import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height = 320,
  });

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          width: THelperFunctions.screenWidth(),
          child: Stack(
            children: [
              Positioned(
                  top: -200,
                  right: -250,
                  child: CircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1),
                  )),
              Positioned(
                  top: 50,
                  right: -300,
                  child: CircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1),
                  )),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
