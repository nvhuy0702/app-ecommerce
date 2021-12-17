import 'package:app_commerce/screens/check_out.dart';
import 'package:app_commerce/screens/detail_screen.dart';
import 'package:app_commerce/screens/home_page.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatefulWidget {
 late final String name;
 late final String image;
 late final String price;
 CartScreen({required this.image, required this.name, required this.price});


  @override
  State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  int count = 1;
  Widget _buildSingleProduct(){
    return  Container(
            height: 170,
            width: double.infinity,
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/${widget.image}"),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Container(
                        height: 140,
                        width: 200,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.name,
                                 style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff6C4A4A),
                                    fontWeight: FontWeight.bold
                                  ),
                              ),
                              Text(
                                'Quần áo',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                               Text(
                                widget.price,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
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
                            ],
                          ),
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 70),
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx)=> CheckOut(
                image: widget.image,
                price: widget.price,
                name: widget.name,
              ))
            );
          },
          color:Color(0xffE5B299),
          child: Text(
            'Tiếp tục',
             style: TextStyle(
              fontSize: 18,
              color: Colors.white
             ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Giỏ hàng',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => DetailScreen(
                image: widget.image,
                price: widget.price,
                name: widget.name,
              ))
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
      body: Column(
        children: [
         _buildSingleProduct(),
         _buildSingleProduct(),
        
        ],
      ),
    );
  }
}