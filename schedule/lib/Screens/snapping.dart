import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class SimpleSnappingSheet extends StatelessWidget {
  final ScrollController listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      child: Background(),
      lockOverflowDrag: true,
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.0,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          snappingCurve: Curves.elasticOut,
          snappingDuration: Duration(milliseconds: 1750),
          positionFactor: 0.5,
        ),
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.bottom,
          snappingCurve: Curves.easeInExpo,
          snappingDuration: Duration(seconds: 1),
          positionFactor: 0.9,
        ),
      ],
      grabbing: GrabbingWidget(),
      grabbingHeight: 75,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: listViewController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: listViewController,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                color: Colors.green[200],
                height: 100,
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Placeholder(
        color: Colors.green[200]!,
      ),
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 100,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 2,
            margin: const EdgeInsets.all(15).copyWith(top: 0, bottom: 0),
          )
        ],
      ),
    );
  }
}