import 'package:bookia/core/utils/styles/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        title: SvgPicture.asset("assets/images/logo 2.svg"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("name"),
                Text(
                  "Best Seller",
                  style: MytextStyles.main24_400().copyWith(fontSize: 30),
                ),
                GridView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      
                      
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
