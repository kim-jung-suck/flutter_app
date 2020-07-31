import 'package:flutter/material.dart';
import 'order_page.dart';
import 'payment_page.dart';
import 'components/rounded_button.dart';
import 'inside/supplier.dart';
import 'inside/catalog.dart';
import 'inside/order_manage.dart';
import 'inside/sales_dealer.dart';
import 'inside/warehouse_management.dart';
import 'inside/sales_completed.dart';
import 'inside/sales_manage.dart';
import 'inside/receipt_history.dart';
import 'inside/i_o_management.dart';

class MyHomePage extends StatelessWidget {
  static const id = 'myhome_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        color: Colors.blueGrey[900],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedButton(
                  title: '주 문',
                  colour: Colors.orange,
                  onPressed: () {
                    Navigator.pushNamed(context, OrderPage.id);
                  }),
              RoundedButton(
                title: '결 제',
                colour: Colors.orange,
                onPressed: () {
                  Navigator.pushNamed(context, PaymentPage.id);
                },
              ),
            ]),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('주문관리'),
              onTap: () {
                Navigator.pushNamed(context, OrderManage.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('입고관리'),
              onTap: () {
                Navigator.pushNamed(context, ReceiptHistory.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('재고관리'),
              onTap: () {
                Navigator.pushNamed(context, WarehouseManagement.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('판매관리'), //당일 판매완료내역(추가항목있음)으로 손익계산에 활용하는 것이 좋을 듯함
              onTap: () {
                Navigator.pushNamed(context, SalesManage.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('판매완료내역'),
              onTap: () {
                Navigator.pushNamed(context, SalesComleted.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('입출관리'),
              onTap: () {
                Navigator.pushNamed(context, IOManagement.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('판매거래처 관리'),
              onTap: () {
                Navigator.pushNamed(context, SalesDealer.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('매입거래처 관리'),
              onTap: () {
                Navigator.pushNamed(context, Supplier.id);
              },
            ),
            ListTile(
              leading: Icon(Icons.looks_one),
              title: Text('카다로그'),
              onTap: () {
                Navigator.pushNamed(context, Catalog.id);
              },
            ),
            Text(
              '거래명세서',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
