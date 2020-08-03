import 'package:flutter/material.dart';

enum DealerType { salesType, factory, wholeSale, etc }
enum WeightType { weighttype, don, g }
enum GoldType { goldType, fournine, threenine, nintynine }

//아래와 같은 형식으로 데이터가 저장되어 보여준다는 의미임.(양식의 개념)
class Supplier extends StatefulWidget {
  static const id = 'supplier';
  @override
  _SupplierState createState() => _SupplierState();
}

class _SupplierState extends State<Supplier> {
  final _formKey = GlobalKey<FormState>();

  DealerType choiceDealer = DealerType.salesType;
  WeightType weightType = WeightType.don;
  GoldType goldType = GoldType.fournine;

  double boxWide = 100;
  double boxHeight = 75;
  double dboxHeight = 57;
  double delerWide = 160;
  double phoneWide = 130;
  double modelWide = 180;
  double countWide = 55;
  double weightWide = 55;
  double dweightWide = 65; //중량드랍다운박스(d~ 는 드랍박스)
  double sizeWide = 70;
  double dsizeWide = 65;
  double bigoWide = 250; // 비고
  double dspeedWide = 68;
  double dgisungWide = 70; // 기성/주문
  double dmetalWide = 67;
  double ddecowide = 70;
  double buttonHeight = 45;
  double dpriodwide = 70;
  double ddeco2 = 70;
  double nicknameWide = 120;
  double licenceNumWide = 150;
  double uptaeWide = 80;
  double addressWide = 280;
  double checkboxWide = 120;
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
                          Size(delerWide, boxHeight),
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
                          Size(nicknameWide, boxHeight),
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
                          Size(licenceNumWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '사업자 번호',
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
                          Size(uptaeWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '업태',
                            ),
                            keyboardType: TextInputType.text),
                      ),
                      Container(
                        width: boxWide - 20,
                        height: dboxHeight,
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
                                  child: Text(' 구분'),
                                  value: DealerType.salesType,
                                ),
                                DropdownMenuItem<DealerType>(
                                  child: Text(' 총판'),
                                  value: DealerType.wholeSale,
                                ),
                                DropdownMenuItem<DealerType>(
                                  child: Text(' 공장'),
                                  value: DealerType.factory,
                                ),
                                DropdownMenuItem<DealerType>(
                                  child: Text(' 기타'),
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
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(addressWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '주소',
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
                          Size(boxWide + 20, boxHeight),
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
                          Size(boxWide - 30, boxHeight),
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
                          Size(phoneWide, boxHeight),
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
                          Size(checkboxWide, boxHeight - 18),
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
                          Size(boxWide - 30, boxHeight),
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
                          Size(phoneWide, boxHeight),
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
                          Size(checkboxWide, dboxHeight),
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
                          Size(boxWide - 20, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '주력품',
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
                          Size(boxWide - 10, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              labelText: '전월거래액', //판매완료내역으로 부터 자동계산
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
                          Size(boxWide - 30, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '관리자',
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
                              labelText:
                                  '선지급24K', //입력의 통일을 위해 입출관리에 기록하면 기록된 것이 넘어온다
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      Container(
                        width: boxWide - 20,
                        height: dboxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<WeightType>(
                          builder: (FormFieldState<WeightType> state) {
                            return DropdownButton<WeightType>(
                              value: weightType,
                              items: [
                                DropdownMenuItem<WeightType>(
                                  child: Text(' 단위'),
                                  value: WeightType.weighttype,
                                ),
                                DropdownMenuItem<WeightType>(
                                  child: Text(' 돈'),
                                  value: WeightType.don,
                                ),
                                DropdownMenuItem<WeightType>(
                                  child: Text(' g'),
                                  value: WeightType.g,
                                ),
                              ],
                              onChanged: (WeightType val) {
                                setState(() => weightType = val);
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
                      Container(
                        width: boxWide - 20,
                        height: dboxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<GoldType>(
                          builder: (FormFieldState<GoldType> state) {
                            return DropdownButton<GoldType>(
                              value: goldType,
                              items: [
                                DropdownMenuItem<GoldType>(
                                  child: Text(' 99.99'),
                                  value: GoldType.fournine,
                                ),
                                DropdownMenuItem<GoldType>(
                                  child: Text(' 99.9'),
                                  value: GoldType.threenine,
                                ),
                                DropdownMenuItem<GoldType>(
                                  child: Text(' 99.5'),
                                  value: GoldType.nintynine,
                                ),
                              ],
                              onChanged: (GoldType val) {
                                setState(() => goldType = val);
                              },
                            );
                          },
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  '선지급액', //입력의 통일을 위해 입출관리에 기록하면 기록된 것이 넘어온다
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
                              labelText:
                                  '차입24K', //입력의 통일을 위해 입출관리에 기록하면 기록된 것이 넘어온다
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      Container(
                        width: boxWide - 20,
                        height: dboxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<WeightType>(
                          builder: (FormFieldState<WeightType> state) {
                            return DropdownButton<WeightType>(
                              value: weightType,
                              items: [
                                DropdownMenuItem<WeightType>(
                                  child: Text(' 단위'),
                                  value: WeightType.weighttype,
                                ),
                                DropdownMenuItem<WeightType>(
                                  child: Text(' 돈'),
                                  value: WeightType.don,
                                ),
                                DropdownMenuItem<WeightType>(
                                  child: Text(' g'),
                                  value: WeightType.g,
                                ),
                              ],
                              onChanged: (WeightType val) {
                                setState(() => weightType = val);
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        width: boxWide - 20,
                        height: dboxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<GoldType>(
                          builder: (FormFieldState<GoldType> state) {
                            return DropdownButton<GoldType>(
                              value: goldType,
                              items: [
                                DropdownMenuItem<GoldType>(
                                  child: Text(' 99.99'),
                                  value: GoldType.fournine,
                                ),
                                DropdownMenuItem<GoldType>(
                                  child: Text(' 99.9'),
                                  value: GoldType.threenine,
                                ),
                                DropdownMenuItem<GoldType>(
                                  child: Text(' 99.5'),
                                  value: GoldType.nintynine,
                                ),
                              ],
                              onChanged: (GoldType val) {
                                setState(() => goldType = val);
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
                              labelText:
                                  '차입금', //입력의 통일을 위해 입출관리에 기록하면 기록된 것이 넘어온다
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
                          Size(bigoWide - 80, boxHeight),
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
                          Size(boxWide, buttonHeight),
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
                          Size(boxWide, buttonHeight),
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
                          Size(boxWide, buttonHeight),
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
