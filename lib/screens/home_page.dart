import 'package:app_commerce/screens/detail_screen.dart';
import 'package:app_commerce/screens/list_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_commerce/screens/products.dart';
final List<String> imgList = [
  'https://images.unsplash.com/photo-1542272605-15bd6a2bd4f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  'https://images.unsplash.com/photo-1593295149476-c9ceaf041cef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=467&q=80',
  'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
  'https://images.unsplash.com/photo-1610399214658-52b9fdea4627?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  'https://images.unsplash.com/photo-1599758918450-c0d699978e59?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  'https://images.unsplash.com/photo-1566024164372-0281f1133aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'
];

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool homeColor = false;
  bool cartColor = false;
  bool contactColor = false;
  bool aboutColor = false;
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${imgList.indexOf(item)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();


  Widget _buildFeaturedProduct ({required String name, required String price, required String image}){
    return Card(
                      child: Container(
                        height: 210,
                        width: 190,
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 135,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/$image"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              price +' vnđ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffDDBEBE)
                              ),
                            ),
                             Text(
                              name,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff6C4A4A),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                      ),
                    );
  }
  
  Widget _buildCategoryProduct({required String image, required int color}){
    return CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Color(color),
                    child: Image(
                      height: 50,
                      image: AssetImage("images/$image"),
                      fit: BoxFit.cover,
                    ),
                  );
  }
  Widget _buildDrawer(){
    return  Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/ava1.jfif"),
              ),
              decoration: BoxDecoration(
                color: Color(0xffC89595)
              ),
              accountName: Text(
                'Văn Huy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ), 
              accountEmail: Text(
                'nvhuy0702@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              )
              ),
              ListTile(
                selected: homeColor,
                onTap: (){
                  setState(() {
                    homeColor = true;
                    cartColor = false;
                    contactColor = false;
                    aboutColor = false;
                  });
                },
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  'Trang chủ',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              ListTile(
                selected: cartColor,
                onTap: (){
                   setState(() {
                     cartColor = true;
                    homeColor = false;
                    contactColor = false;
                    aboutColor = false;
                  });
                },
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                title: Text(
                  'Giỏ hàng',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              ListTile(
                selected: contactColor,
                onTap: (){
                   setState(() {
                     contactColor = true;
                    cartColor = false;
                    homeColor= false;
                    aboutColor = false;
                  });
                },
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                title: Text(
                  'Liên hệ',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              ListTile(
                selected: aboutColor,
                onTap: (){
                   setState(() {
                     aboutColor = true;
                    cartColor = false;
                    contactColor = false;
                    homeColor= false;
                  });
                },
                leading: Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                title: Text(
                  'Thông tin',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
              ListTile(
                onTap: (){},
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  'Thoát',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
          ],
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffC89595),
        elevation: 0,
        title: Text(
          'Trang chủ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: 18,
            color: Colors.white,
          ),
        ),
        actions: [
         IconButton(
           onPressed: (){},
           icon: Icon(
             Icons.search,
             color: Colors.white,
             size: 20,
           ),
         ),
         IconButton(
           onPressed: (){},
           icon: Icon(
             Icons.favorite,
             color: Colors.red,
             size: 20,
           ),
         )
        ],
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("product").doc("VAuqm48ylhL3SjW8eSdd").collection("featureproduct").get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
       
          return Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          enlargeCenterPage: true,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Xem tất cả',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                      Container(
                      height: 70,
                      child: Row(
                        children: [
                          _buildCategoryProduct(image: "dress1.jfif", color: 0xffB8E4F0),
                          _buildCategoryProduct(image: "dress2.jfif", color: 0xff98BAE7),
                          _buildCategoryProduct(image: "dress3.jfif", color: 0xff7267CB),
                          _buildCategoryProduct(image: "dress4.jfif", color: 0xff6E3CBC),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               'Đặc điểm',
                               style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold
                               ),
                             ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (ctx) => ListProduct(
                                      name: 'Đặc điểm',
                                    ))
                                  );
                                },
                                child: Text(
                                 'Xem tất cả',
                                 style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold
                                 ),
                                                       ),
                              ),
                           ],
                          )
                        ],
                      ),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (ctx) => DetailScreen(
                                        name: "Áo thun nam",
                                        price: "10 000 vnđ",
                                        image: "shirt.jfif",
                                      ))
                                    );
                                  },
                                  child: _buildFeaturedProduct(
                                    name:"Áo thun nam" , 
                                    price: "10 000", 
                                    image: "shirt.jfif"
                                    ),
                                ),
                                  SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (ctx)=> DetailScreen(
                                           name:"Đồng hồ" , 
                                           price: "10 000", 
                                           image: "watch.jfif"
                                        ))
                                      );
                                    },
                                    child: _buildFeaturedProduct(
                                    name:"Đồng hồ" , 
                                    price: "10 000", 
                                    image: "watch.jfif"
                                    ),
                                  ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                   
                    SizedBox(height: 10,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               'Đặc điểm',
                               style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold
                               ),
                             ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (ctx)=> ListProduct(
                                      name: 'Đặc điểm',
                                    ))
                                  );
                                },
                                child: Text(
                                 'Xem tất cả',
                                 style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold
                                 ),
                                                       ),
                              ),
                           ],
                          ),
                           Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                _buildFeaturedProduct(
                                  name:"Quần jeans" , 
                                  price: "10 000", 
                                  image: "jeans.jfif"
                                  ),
                                  SizedBox(width: 10,),
                                  _buildFeaturedProduct(
                                  name:"Giày Convers" , 
                                  price: "10 000", 
                                  image: "convers.jfif"
                                  ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}