import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymentapps/theme.dart';
import 'theme.dart';

void main() {
  runApp(PaymentApps());
}

class PaymentApps extends StatefulWidget {
  @override
  _PaymentAppsState createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 22, right: 22, bottom: 40),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/Achive_goal.png',
                width: 250,
                height: 200,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Pro',
                  style: titleBlueTextStyle,
                )
              ],
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget Option(int index, String plan, String desc, String price) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff007DFF)
                  : Color(0xff4D5B7C),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/images/check_true.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/images/check.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(plan, style: planTextStyle,),
                      Text(desc, style: descTextStyle,)
                    ],
                  ),
                  SizedBox(width: 90,),
                  Text(price, style: priceTextStyle,)
                ],
              ),
              
            ],
          ),
        ),
      );
    }

    Widget Checkout(){
      return Container(
        width: 300,
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff007DFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(71))),
              onPressed: (){},
               child: Text('Checkout Now', style: GoogleFonts.poppins(
                 color: Color(0xffFFFFFF),
                 fontWeight: FontWeight.w600,
                 fontSize: 14,
               )),
        ),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xff04112F),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                Option(0, 'Monthly', 'Good for starting up', '\$20'),
                Option(1, 'Quarterly', 'Focusing on building', '\$55'),
                Option(2, 'Yearly', 'Steady company', '\$220'),
                selectedIndex == -1 ? SizedBox(height: 10,) : Checkout(), 
              ],
            ),
          )),
    );
  }
}
