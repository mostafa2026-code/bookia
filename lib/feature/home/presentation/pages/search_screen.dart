import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              return null;
            
              
            },
            decoration: InputDecoration(
              hintText: ""
            ),

          ),
          GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      )

    );
  }
}