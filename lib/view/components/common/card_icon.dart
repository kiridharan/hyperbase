import 'package:flutter/material.dart';

class CategoryCardMallika1 extends StatelessWidget {
  final String title;
  final String image;
  final Function() onTap;
  final bool selected;
  const CategoryCardMallika1(
      {required this.title,
      required this.image,
      required this.onTap,
      this.selected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: selected ? 2 : 0, color: const Color(0xffFF8527)),
                  borderRadius: BorderRadius.circular(20.0)),
              child: image != "null"
                  ? ClipRRect(
                      child: Image.network(
                        image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xffF2F2F2),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xffC4C4C4),
                      ),
                    ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: selected ? const Color(0xffFF8527) : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
