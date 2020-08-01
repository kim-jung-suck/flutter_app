import 'package:flutter/material.dart';
import 'order_page.dart';
import 'payment_page.dart';
import 'inside/sales_dealer.dart';
import 'myhome_page.dart';
import 'inside/supplier.dart';
import 'inside/catalog.dart';
import 'inside/order_manage.dart';
import 'inside/warehouse_management.dart';
import 'inside/sales_completed.dart';
import 'inside/sales_manage.dart';
import 'inside/receipt_history.dart';
import 'inside/i_o_management.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gold Wang",
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        OrderPage.id: (context) => OrderPage(),
        PaymentPage.id: (context) => PaymentPage(),
        SalesDealer.id: (context) => SalesDealer(),
        Supplier.id: (context) => Supplier(),
        Catalog.id: (context) => Catalog(),
        OrderManage.id: (context) => OrderManage(),
        WarehouseManagement.id: (context) => WarehouseManagement(),
        SalesCompleted.id: (context) => SalesCompleted(),
        SalesManage.id: (context) => SalesManage(),
        ReceiptHistory.id: (context) => ReceiptHistory(),
        IOManagement.id: (context) => IOManagement(),
      },
    );
  }
}
