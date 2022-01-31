import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  List imageList = [
    'assets/images/watch.jpg',
    'assets/images/watch1.jpg',
    'assets/images/watch2.jpg',
    'assets/images/watch3.jpg',
  ];
  String displayImage = 'assets/images/watch.jpg';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'All images',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 55,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.imageList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.displayImage = widget.imageList[index];
                            selectedImage = index;
                          });
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: selectedImage == index
                                  ? Colors.redAccent
                                  : Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(widget.imageList[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 8,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        widget.displayImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
