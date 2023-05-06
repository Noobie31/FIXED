import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'materials.dart';

class MoreDetails extends StatefulWidget {
  final Materials material;
  const MoreDetails(this.material, {super.key});

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'images/${widget.material.img}.svg',
                  width: 80,
                  height: 80,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.material.title,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.material.count,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 191, 107),
                            borderRadius: BorderRadius.circular(10)),
                        height: 30,
                        width: 100,
                        alignment: Alignment.center,
                        child: const Text('Enquiry'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
                child: SingleChildScrollView(
              child: Text(
                widget.material.details,
                style: const TextStyle(fontSize: 20),
              ),
            )),
          )
        ],
      ),
    ));
  }
}
