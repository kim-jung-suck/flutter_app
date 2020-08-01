import 'package:flutter/material.dart';

enum DealerType { salesType, factory, wholeSale, etc }

//아래와 같은 형식으로 데이터가 저장되어 보여준다는 의미임.(양식의 개념)
class Supplier extends StatefulWidget {
  static const id = 'supplier';
  @override
  _SupplierState createState() => _SupplierState();
}

class _SupplierState extends State<Supplier> {
  final _formKey = GlobalKey<FormState>();

  DealerType choiceDealer = DealerType.salesType;

  double boxWide = 100;
  double boxHeight = 75;
  bool ceoPhone = true;
  bool managerPhone = true;
  bool choiceOrder = true;

  void _getceoPhone() {
    setState(() {
      ceoPhone = !ceoPhone;
    });
  }

  void _getmanagerPhone() {
    setState(() {
      managerPhone = !managerPhone;
    });
  }

  void _getchoiceOrder() {
    setState(() {
      choiceOrder = !choiceOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('매입거래처 관리'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tight(Size(boxWide + 180, boxHeight)),
                    child: ListTile(
                      onTap: _getchoiceOrder,
                      title: Text('등록된 거래처리스트 출력'), //체크박스로 선택하여 수정할 수 있게함
                      leading: choiceOrder
                          ? Icon(Icons.check_box_outline_blank)
                          : Icon(
                              Icons.check_box,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 150, boxHeight),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '제조사',
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 50, boxHeight),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '별명',
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 50, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '사업자 번호',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '업태',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      Container(
                        width: boxWide,
                        height: boxHeight - 18,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<DealerType>(
                          builder: (FormFieldState<DealerType> state) {
                            return DropdownButton<DealerType>(
                              value: choiceDealer,
                              items: [
                                DropdownMenuItem<DealerType>(
                                  child: Text('구분'),
                                  value: DealerType.salesType,
                                ),
                                DropdownMenuItem<DealerType>(
                                  child: Text('총판'),
                                  value: DealerType.wholeSale,
                                ),
                                DropdownMenuItem<DealerType>(
                                  child: Text('공장'),
                                  value: DealerType.factory,
                                ),
                                DropdownMenuItem<DealerType>(
                                  child: Text('기타'),
                                  value: DealerType.etc,
                                ),
                              ],
                              onChanged: (DealerType val) {
                                setState(() => choiceDealer = val);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '거래개시일',
                            ),
                            keyboardType: TextInputType.datetime),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 150, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '주소',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '대표자',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 50, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '대표연락처',
                            ),
                            keyboardType: TextInputType.phone),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 40, boxHeight - 18),
                        ),
                        child: ListTile(
                          onTap: _getceoPhone,
                          title: Text('카톡'),
                          leading: ceoPhone
                              ? Icon(Icons.check_box_outline_blank)
                              : Icon(
                                  Icons.check_box,
                                  color: Colors.pink,
                                ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '담당',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 50, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '담당연락처',
                            ),
                            keyboardType: TextInputType.phone),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 40, boxHeight - 18),
                        ),
                        child: ListTile(
                          onTap: _getmanagerPhone, //주문확인 카톡
                          title: Text('카톡'),
                          leading: managerPhone
                              ? Icon(Icons.check_box_outline_blank)
                              : Icon(
                                  Icons.check_box,
                                  color: Colors.pink,
                                ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '주력품',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '1개월 거래금액',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '통상처',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '관리자',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '선지급금액',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '선지급 금(g)',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '차입금액',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '차입 금(g)',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '적용해리',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide + 150, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '비고',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '제조사',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                  ),
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: RaisedButton(
                          child: Text(
                            '등록',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.orange,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: RaisedButton(
                          child: Text(
                            '수정',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlue,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: RaisedButton(
                          child: Text(
                            '삭제',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.teal,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
