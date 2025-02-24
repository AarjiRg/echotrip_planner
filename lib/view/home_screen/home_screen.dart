import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int charge = 40 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack( 
              children: [
                 
                Container(
                  height: 280, 
                  width: double.infinity,
                  decoration: BoxDecoration(
                  ),
                 
                ),
                Positioned(
                     right: 0,
                     bottom: 0,
                  child: Container(
                    height: 200,
                    width:300 ,
                    decoration: BoxDecoration(
                    ),
                    child: Image.asset("assets/images/pngimg.com - scooter_PNG11297.png"),
                  ),
                ),
                Positioned(
                  top: 5,
                
                  left: 12 ,
                  child: Container(
                  decoration: BoxDecoration(
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("your Name",style:GoogleFonts.aBeeZee(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w800),),
                      Text("your vechile name ",style:GoogleFonts.aBeeZee(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  ),
                )
              ],
            ),
            
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 150,
                             decoration: BoxDecoration(
                              gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 9, 239, 21).withOpacity(0.60), 
              Color.fromARGB(255, 255, 196, 2).withOpacity(0.50), 
            ],
            stops: [charge / 100, charge / 100], 
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
                               borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2,color: Colors.grey.withOpacity(0.40))
                      ),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 19,), 
                              Text("battery enery",style: TextStyle(),),
                               Text("80%",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800),),
                                Text("power saving mode",style: TextStyle(),)
                            ],
                          )
                        ],
                      ),
                    ), 
                  ), 
                ),
                SizedBox(width: 2,),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Stack(
                       children: [                        
                        Container(
                          child: Column(
                          
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                            children: [
                              Text("\t\t\t\t\t\t\tRemaning \n distance and time" ,style: TextStyle(),maxLines: 3,) , 
                                Text("68km",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w800),) ,
                                  Text("1h 20m",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),) 
                            ],
                          ),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 2,color: Colors.grey.withOpacity(0.40))
                        ),
                        
                                       ),
              ]),
                   ),
                 )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 150,  
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.50)
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}