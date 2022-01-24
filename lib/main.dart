import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Six(),
  ));
}

class Six extends StatefulWidget {
  const Six({Key? key}) : super(key: key);

  @override
  _SixState createState() => _SixState();
}

class _SixState extends State<Six> with TickerProviderStateMixin {
  late TabController _controller;

  final List<Tab> topTabs = <Tab>[
    const Tab(text: 'Products'),
    const Tab(text: 'Catogories'),
  ];
  @override
  void initState() {
    super.initState();

    _controller = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Container(
            padding: EdgeInsets.only(left: 15),
            child: const Center(
              child: Text(
                'Catalogue',
                style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: topTabs,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ListView(
              children: [
                products("assets/2.jpg", "Couch Potato | Men | BI", "₹799"),
                products("assets/3.jpg", "Mug | Explore", "₹399"),
                products("assets/5.jpg", "Combo Blahst 1 | Pack", "₹699"),
                products("assets/one.jpg", "Mug | Orchard", "₹449"),
                products("assets/5.jpg", "Combo Blahst 1 | Pack", "₹699"),
                products("assets/5.jpg", "Coo Blah 5 | Pack", "₹900"),
                products("assets/5.jpg", "bohst 1 | Pack", "₹1000"),
              ],
            ),
            Container(),
          ],
        ));
  }
}

products(img, text, amount) {
  bool val = false;
  return Container(
    height: 140,
    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 8,
                top: 12,
              ),
              child: Image.asset(
                img,
                height: 80,
                width: 80,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 10,
                    bottom: 2,
                  ),
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 3),
                  child: Text(
                    "1 piece",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 2),
                  child: Text(
                    amount,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 2),
                  child: Text(
                    "In stock",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15,right: 14),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.more_vert,
                        size: 22,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                 
                  Container(
                    padding: EdgeInsets.only(right: 15,top: 1),
                    child: Align(
                      alignment: Alignment.topRight,
                      child:
                       Switch(
                         
                        value: true,
                        activeColor: Colors.blue,
                        onChanged: (bool) {},
                        
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(
            left: 28,
            right: 28,
          ),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: Container(
                child: Icon(
                  Icons.share_outlined,
                  color: Colors.grey[700],
                  size: 25,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Share Product",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
