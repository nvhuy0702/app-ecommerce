import 'package:app_commerce/screens/cart_screen.dart';
import 'package:app_commerce/screens/home_page.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {
  late final String name;
  late final String price;
  late final String image;
  DetailScreen({required this.name, required this.image, required this.price});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
 Widget _buildSizeProduct({required String name}){
   return Container(
     height: 60,
     width: 60,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       color: Color(0xffDDBEBE),

     ),
     child: Center(
       child: Text(
         name,
         style: TextStyle(
           fontSize: 20,
         ),
       ),
     ),
   );
 }

 Widget _buildColorProduct({required Color color}){
   return Container(
     height: 30,
     width: 40,
     child: CircleAvatar(
       maxRadius: 30,
       backgroundColor: color,
     )
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
          'Chi tiết',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => HomePage())
            );
          },
          icon: Icon(
            Icons.arrow_back,
            size: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.search,
              size: 18,
            )
            ),
            IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.favorite,
              size: 18,
              color: Colors.red
            )
            )
        ],
        backgroundColor: Color(0xffC89595),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          offset: Offset(3,4),
                          color: Color(0xffC89595)
                        ),
                        
                      ],
                      color: Colors.purpleAccent,
                      image: DecorationImage(
                        image: AssetImage('images/${(widget.image)}'),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Column(
                    children:[
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                        Text(
                       widget.price,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Text(
                        'Giới thiệu :',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10, top:10),
                          child: Wrap(
                            children: [
                              Text(
                                'use a passage, you need to be sure there isnt anything embarrassing hidden in the middle of text.',
                                style: TextStyle(
                                  fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Size :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                     
                       Container(
                         height: 80,
                         width: 300,
                         child:   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSizeProduct(name: 'S'),
                            _buildSizeProduct(name: 'M'),
                            _buildSizeProduct(name: 'L'),
                            _buildSizeProduct(name: 'XXL'),
                          ],
                        ),
                       ),
                       Text(
                        'Color :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                       Container(
                         height: 60,
                         width: 240,
                         child:   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          _buildColorProduct(color: Colors.blue),
                           _buildColorProduct(color: Colors.red),
                            _buildColorProduct(color: Colors.green),
                             _buildColorProduct(color: Colors.yellow),
                          ],
                        ),
                       ),
                       Text(
                         'Số lượng',
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.w500
                         ),
                       ),
                       SizedBox(height: 5,),
                       Container(
                         height: 35,
                         width: 120,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                             color: Color(0xffDDBEBE),
                         ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               GestureDetector(
                                 onTap: (){
                                   setState(() {
                                     if(count > 0){
                                       count --;
                                     }
                                   });
                                 },
                                 child: Icon(
                                   Icons.remove
                                 ),
                               ),
                                 Text(
                                   count.toString(),
                                   style: TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.w500
                                   ),
                                 ),
                                 GestureDetector(
                                 onTap: (){
                                   setState(() {
                                     count ++;
                                   });
                                 },
                                 child: Icon(
                                   Icons.add
                                 ),
                               ),
                              
                             ],
                           ),
                       ),
                       SizedBox(height: 10,),
                        Container(
                                 height: 50,
                                 width: 200,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Color(0xffE5B299),
                                 ),
                                 child: GestureDetector(
                                   onTap: (){
                                     Navigator.of(context).pushReplacement(
                                       MaterialPageRoute(builder: (ctx)=> CartScreen(
                                         name: widget.name,
                                         price: widget.price,
                                         image: widget.image,
                                       ))
                                     );
                                   },
                                   child: Center(
                                     child: Text(
                                       'Mua hàng',
                                       style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.white
                                       ),
                                     ),
                                   ),
                                 ),
                               )
                    ]
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}