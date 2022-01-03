import 'package:flutter/material.dart';

class ModalTrigger extends StatelessWidget {
  const ModalTrigger({Key? key}) : super(key: key);

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 1200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        _showModalBottomSheet(context);
      },
      fillColor: Colors.black,
      constraints: const BoxConstraints(minHeight: 50),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontFamily: 'OpenSans',
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      child: const Text('Show More'),
    );
  }
}
