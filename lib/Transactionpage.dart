import 'package:finalpaymentapp/payment-service.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_stripe_payments/services/payment-service.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:dio/dio.dart';
class Transaction extends StatefulWidget {
  String amount;
  Transaction(this.amount);

  @override
  HomePageState createState() => HomePageState(amount);
}

class HomePageState extends State<Transaction> {
  String Amt;
  HomePageState(this.Amt);
  onItemPress(BuildContext context, int index) async {
    switch(index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, '/existing-cards');
        break;
    }
  }

  payViaNewCard(BuildContext context) async {
      ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(
        message: 'Please wait...'
    );
    await dialog.show();
    var response = await StripeService.payWithNewCard(

        amount: Amt,
        currency: 'INR',

    );
    print(response);
    await dialog.hide();
    Scaffold.of(context).showSnackBar(

        SnackBar(

          content: Text(response.message),
          duration: new Duration(milliseconds: response.success == true ? 1200 : 3000),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch(index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: theme.primaryColor);
                  text = Text('Pay via new card');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: theme.primaryColor);
                  text = Text('Pay via existing card');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: theme.primaryColor,
            ),
            itemCount: 2
        ),
      ),
    );;
  }

}
