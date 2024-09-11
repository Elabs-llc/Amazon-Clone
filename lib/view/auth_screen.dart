import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:shopify/constants/helpers.dart';
import 'package:shopify/uitils/colors.dart';
import 'package:shopify/uitils/theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  var defaultCountryCode = '+233';
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/amazon_logo.png'),
          height: height*0.04,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(vertical: height*0.02, horizontal: width*0.03,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text("Welcome", style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),),
          
                Helpers.blankSpace(height*0.02, 0),
          
                // Login statrted here
                //SignIn(width, height, textTheme, context),
                // End Login statrted here
                inLogin ? SignIn(width, height, textTheme, context):SignUp(width, height, textTheme, context),
                // SignUp setion
                //SignUp(width, height, textTheme, context),
                // End SignUp setion
          
                // Space
                Helpers.blankSpace(height*0.05, 0),
                ///Space
                ///
                
                /// Buttom text
                ButtomAuthScreenWidget(width: width, height: height, textTheme: textTheme),
                /// buttom text
          
          
              ],
            ),
          ),
        ),
        ),
    );
  }

  // SignIn Conatiner
  Container SignIn(double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3),),
      child: Column(
        children: [
          // creat account section
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            height: height*0.06,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width*0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height*0.03,
                    width: height*0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    child: Icon(
                      Icons.circle, 
                      size: height*0.015,
                      color: inLogin ? transparent : secondaryColor,
                    ),
                  
                  ),
                ),
                Helpers.blankSpace(0, width*0.02),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Create account", 
                          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                        ), 
                        
                        TextSpan(
                          text: " New to shopify", 
                          style: textTheme.bodyMedium,
                        ), 
                    ],
                  ),
                  
                ), 
                
              ],
            ),
          ),
          // end create account section

          // login section
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width*0.03, 
              vertical: height*0.02,
              
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height*0.03,
                    width: height*0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    child: Icon(
                      Icons.circle, 
                      size: height*0.015,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  
                  ),
                ),
                Helpers.blankSpace(0, width*0.02),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Sign in. ", 
                          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                        ), 
                        
                        TextSpan(
                          text: " Already a customer", 
                          style: textTheme.bodyMedium,
                        ), 
                    ],
                  ),
                  
                ), 
              ],
            ),
            
          ),
          Helpers.blankSpace(height*0.02, 0),

          // phone number section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Helpers.blankSpace(0, width*0.01),
              // country code unit
              InkWell(
                onTap: () {
                  showCountryPicker(context: context, onSelect: (value){
                    setState(() {
                      defaultCountryCode = '+${value.phoneCode}';
                    });
                  });
                },
                child: Container(
                  width: width*0.2,
                  height: height*0.06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(5), color: greyShade1),
                  child: Text(defaultCountryCode, style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),),
                ),
                
              ),
              // end country code unit

              // phone number
              SizedBox(
                width: width*0.65, height: height*0.06,
                child: TextFormField(
                  controller: mobileNumber,
                  cursorColor: black,
                  style: textTheme.bodySmall,
                  keyboardType: TextInputType.number,
                  
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    hintStyle: textTheme.bodySmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                    
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: secondaryColor,
                      ),
                    ),
                
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                
                
                  ),
                
                ),
              ),
              //end phone number

            ],
          ),
          // end phone number section

          /// space
          Helpers.blankSpace(height*0.02, 0),
          /// 
          
          /// login button
          ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width*0.88, height*0.06),
              backgroundColor: amber,
            ), 
            child: Text('Continue', style: textTheme.displaySmall,),
          ),
          /// end login button
          /// 
            /// space
          Helpers.blankSpace(height*0.02, 0),
          /// 
          
          /// Agreement text
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By continuing, you agree to ${Helpers.AppName}'s ",
                  style: textTheme.labelMedium,
                ),
                TextSpan(
                  text: "Conditions of use",
                  style: textTheme.labelMedium!.copyWith(color: blue),
                ),
                TextSpan(
                  text: " and ",
                  style: textTheme.labelMedium,
                ),
                TextSpan(
                  text: " Privacy policy",
                  style: textTheme.labelMedium!.copyWith(color: blue),
                ),
              ],
            ),
          ),
          /// end aggreement text 
          
          /// space
          Helpers.blankSpace(height*0.02, 0),
          ///

          // end login section

        ],
        
      ),
    );

  }
  // End SignIn Container

  // SignUp Conatiner
  Container SignUp(double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(border: Border.all(color: greyShade3),),
      child: Column(
        children: [

          // login section
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width*0.03, 
              vertical: height*0.02,
              
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height*0.03,
                    width: height*0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    child: Icon(
                      Icons.circle, 
                      size: height*0.015,
                      color: inLogin ? transparent : secondaryColor,
                    ),
                  
                  ),
                ),
                Helpers.blankSpace(0, width*0.02),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Create account. ", 
                          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                        ), 
                        
                        TextSpan(
                          text: " New to amazon?", 
                          style: textTheme.bodyMedium,
                        ), 
                    ],
                  ),
                  
                ), 
              ],
            ),
            
          ),
          Helpers.blankSpace(height*0.02, 0),

          // name filed
          TextField(
            controller: fullName,
            style: textTheme.bodySmall,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: "Enter your full name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: secondaryColor,
                ),
              ),
            ),
          ),
          // end name field

          Helpers.blankSpace(height*0.02, 0),

          // phone number section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Helpers.blankSpace(0, width*0.01),
              // country code unit
              InkWell(
                onTap: () {
                  showCountryPicker(context: context, onSelect: (value){
                    setState(() {
                      defaultCountryCode = '+${value.phoneCode}';
                    });
                  });
                },
                child: Container(
                  width: width*0.2,
                  height: height*0.06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(5), color: greyShade1),
                  child: Text(defaultCountryCode, style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),),
                ),
                
              ),
              // end country code unit

              // phone number
              SizedBox(
                width: width*0.65, height: height*0.06,
                child: TextFormField(
                  controller: mobileNumber,
                  cursorColor: black,
                  style: textTheme.bodySmall,
                  keyboardType: TextInputType.number,
                  
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    hintStyle: textTheme.bodySmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                    
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: secondaryColor,
                      ),
                    ),
                
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: grey,
                      ),
                    ),
                
                
                  ),
                
                ),
              ),
              //end phone number

            ],
          ),
          // end phone number section

          /// space
          Helpers.blankSpace(height*0.02, 0),
          /// 
          
          /// login button
          ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width*0.88, height*0.06),
              backgroundColor: amber,
            ), 
            child: Text('Verify phone number', style: textTheme.displaySmall,),
          ),
          /// end login button
          /// 
          /// space
          Helpers.blankSpace(height*0.02, 0),
          /// 
          /// 
          /// Agreement text
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "By continuing, you agree to ${Helpers.AppName}'s ",
                  style: textTheme.labelMedium,
                ),
                TextSpan(
                  text: "Conditions of use",
                  style: textTheme.labelMedium!.copyWith(color: blue),
                ),
                TextSpan(
                  text: " and ",
                  style: textTheme.labelMedium,
                ),
                TextSpan(
                  text: " Privacy policy",
                  style: textTheme.labelMedium!.copyWith(color: blue),
                ),
              ],
            ),
          ),
          /// end aggreement text 
          /// 
          /// space
          Helpers.blankSpace(height*0.02, 0),
          ///
          
          // creat account section
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: greyShade3),
              ),
              color: greyShade1,
            ),
            height: height*0.06,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width*0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height*0.03,
                    width: height*0.03,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),
                    child: Icon(
                      Icons.circle, 
                      size: height*0.015,
                      color: inLogin ? secondaryColor : transparent,
                    ),
                  
                  ),
                ),

                /// space
                Helpers.blankSpace(height*0.02, 0),
                ///

                Helpers.blankSpace(0, width*0.02),
                // Already have account login
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "SignIn", 
                          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                        ), 
                        
                        TextSpan(
                          text: " Already have account?", 
                          style: textTheme.bodyMedium,
                        ), 
                    ],
                  ),
                  
                ), 
                // End Already have account login
                
              ],
            ),
          ),
          // end create account section

          // end login section

        ],
        
      ),
    );

  }
      
  // End SignUp Container



}

class ButtomAuthScreenWidget extends StatelessWidget {
  const ButtomAuthScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    /// will be used if design is to be chnaged
    Row row = Row(
          children: [
            Container(
              height: 1,
              width: width*0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [white, grey, white]),
              ),
            ),
            Text("New To ${Helpers.AppName}", style: textTheme.labelSmall,),
            Container(
              height: 1,
              width: width*0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [white, grey, white]),
              ),
            ),

          ],
    );
    return Column(
      children: [
        
        //row,
        Container(
          height: 1,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [white, grey, white]),
          ),
          child: Text("New To ${Helpers.AppName}"),
        ),
    
        /// space
        Helpers.blankSpace(height*0.02, 0),
        ///
        ///
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Condition of use", style: textTheme.labelMedium!.copyWith(color: blue),),
            Text("privacy policy", style: textTheme.labelMedium!.copyWith(color: blue),),
            Text("Help", style: textTheme.labelMedium!.copyWith(color: blue),),
          ],
        ),
        
        /// space
        Helpers.blankSpace(height*0.01, 0),
        ///
        ///
        
        Text(Helpers.CopyRightNotice, style: textTheme.labelMedium!.copyWith(color: grey),),
    
      ],
    );
  }
}