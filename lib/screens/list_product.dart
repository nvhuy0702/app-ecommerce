import 'package:app_commerce/screens/home_page.dart';
import 'package:flutter/material.dart';
class ListProduct extends StatelessWidget {
 final String name;
 ListProduct({required this.name});
 

  Widget _buildFeaturedProduct ({required String name, required String price, required String image}){
    return Card(
                      child: Container(
                        height: 170,
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 150,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC89595),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx)=> HomePage())
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.search,
              
            )
            ),
             IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.favorite,
             
              color: Colors.red,
            )
            ),
        ],
      ),
      body: Container(
       child: Padding(
         padding: const EdgeInsets.only(top:10),
         child: ListView(
           children: [
             Column(
               children: [
                 Container(
                   child: Column(
                     children: [
                        Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                  name,
                                 style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold
                                 ),
                               ),
                             ],
                            ),
                            SizedBox(height: 10,),
                          Container(
                            height: 500,
                            child: GridView.count(
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                              scrollDirection: Axis.vertical,
                              children: [
                                _buildFeaturedProduct(
                                    name:"Áo thun nam" , 
                                    price: "10 000", 
                                    image: "shirt.jfif"
                                    ),
                                    
                                    _buildFeaturedProduct(
                                    name:"Đồng hồ" , 
                                    price: "10 000", 
                                    image: "watch.jfif"
                                    ),
                                    _buildFeaturedProduct(
                                    name:"Áo thun nam" , 
                                    price: "10 000", 
                                    image: "shirt.jfif"
                                    ),
                                    
                                    _buildFeaturedProduct(
                                    name:"Đồng hồ" , 
                                    price: "10 000", 
                                    image: "watch.jfif"
                                    ),
                                    _buildFeaturedProduct(
                                    name:"Áo thun nam" , 
                                    price: "10 000", 
                                    image: "shirt.jfif"
                                    ),
                                    
                                    _buildFeaturedProduct(
                                    name:"Đồng hồ" , 
                                    price: "10 000", 
                                    image: "watch.jfif"
                                    ),
                              ],
                            ),
                            
                          )
                     ],
                   ),
                 )
               ],
             ),
           ],
         ),
       )
      ),
    );
  }
}