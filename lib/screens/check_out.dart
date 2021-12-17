import 'package:app_commerce/screens/cart_screen.dart';
import 'package:app_commerce/screens/detail_screen.dart';
import 'package:flutter/material.dart';
class CheckOut extends StatefulWidget {
  late String image;
  late String name;
  late String price;
  CheckOut({required this.name, required this.price, required this.image});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
                                  Text(
                                    'Số lương :',
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                   Text(
                                    ' 1',
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  )
                                  
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
  Widget _buildBottomDetail({required String Sname, required String Ename }){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Sname,
          style: TextStyle(
            fontSize: 18
          ),
        ),
        Text(
          Ename,
          style: TextStyle(
            fontSize: 18
          ),
        ),
        
        
      ],
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
            'Mua',
             style: TextStyle(
              fontSize: 18,
              color: Colors.white
             ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Hoá đơn',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx)=>CartScreen(
                image: widget.image,
                name: widget.name,
                price: widget.price,
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
           SizedBox(height: 20,),
          Container(
            height: 100,
            width: 400,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBottomDetail(Sname: "Giá :", Ename:"20 000vnđ" ),
                
                    _buildBottomDetail(Sname: "Ship :", Ename:"20 000vnđ" ),
                     _buildBottomDetail(Sname: "Tổng :", Ename:"39 400 vnđ" ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}