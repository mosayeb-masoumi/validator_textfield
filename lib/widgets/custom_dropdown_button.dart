import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> list;
  final TextEditingController controller;
  final String label;

  const CustomDropDownButton({
    super.key,
    required this.list,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    if(list.isNotEmpty){
      controller.text = list[0];
    }

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: getBorder(),
        focusedBorder: getBorder(),
        enabledBorder: getBorder(),
        errorBorder: getBorder(),
        focusedErrorBorder: getBorder(),
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
        contentPadding: const EdgeInsets.all(16),
      ),
      readOnly: true,
      onTap: (){
        _showListBottomSheet(context);
      },
      cursorWidth: 2,
      cursorOpacityAnimates: true,
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 1, color: Colors.black),
      //gapPadding: 2,
    );
  }

  void _showListBottomSheet(BuildContext context) {

    Size size = MediaQuery.sizeOf(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {

        return FractionallySizedBox(
          heightFactor: 0.6,
          child: Container(
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: SizedBox(
                      width: 64.0,
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.black
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          // widget.callback(selectList[index]),
                          controller.text = list[index],
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
                          child: Text(list[index]),
                        )
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        indent: 24,
                        endIndent: 24,
                        color: Colors.blueGrey),
                    itemCount: list.length,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


