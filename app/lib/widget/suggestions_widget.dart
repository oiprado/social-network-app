import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
          child: Text('Suggestions', textAlign: TextAlign.left),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Text("Profile")
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
