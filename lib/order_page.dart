import 'package:flutter/material.dart';

enum LengthType { danwi, cm, ho }
enum WeightType { danwi, don, g }

class OrderPage extends StatefulWidget {
  static const id = 'order_page';
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();

  LengthType choiceLength = LengthType.danwi;

  WeightType choiceWeight = WeightType.don;

  bool choiceOrder = true;
  double boxWide = 100;
  double boxHeight = 75;
  double delerWide = 160;
  double telephoneWide = 170;

  void _getchoiceOrder() {
    setState(() {
      choiceOrder = !choiceOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문장'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints.tight(Size(boxWide + 120, boxHeight)),
                child: ListTile(
                  onTap: _getchoiceOrder,
                  title: Text('주문리스트 출력'), //체크박스로 선택하여 수정할 수 있게함
                  leading: choiceOrder
                      ? Icon(Icons.check_box_outline_blank)
                      : Icon(
                          Icons.check_box,
                        ),
                ),
              ), //추가주문 클릭시 주문내용 화면출력
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(delerWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: //자동 검색
                                '거래처', //신규가 아닌 경우 거래처 등록에서 내용을 가져오고 신규는 등록한다.
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                            Size(telephoneWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '전화번호',
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                            Size(boxWide + 150, boxHeight)),
                        child: TextFormField(
                          //15자 입력공간 필요
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '모델명', //주문확인 카톡
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide + 20, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: '      접수일',
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '수량', //주문확인 카톡
                          ),
                          keyboardType: TextInputType.number,
                        ),
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
                                labelText: '중량', //주문확인 카톡
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: boxWide - 10,
                            height: boxHeight - 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: FormField<WeightType>(
                              builder: (FormFieldState<WeightType> state) {
                                return DropdownButton<WeightType>(
                                  value: choiceWeight,
                                  items: [
                                    DropdownMenuItem<WeightType>(
                                      child: Text('   단위'),
                                      value: WeightType.danwi,
                                    ),
                                    DropdownMenuItem<WeightType>(
                                      child: Text('  돈'),
                                      value: WeightType.don,
                                    ),
                                    DropdownMenuItem<WeightType>(
                                      child: Text('g'),
                                      value: WeightType.g,
                                    ),
                                  ],
                                  onChanged: (WeightType val) {
                                    setState(
                                        () => choiceWeight = val); //주문확인 카톡
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    labelText: '사이즈', //주문확인 카톡
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              Container(
                                width: boxWide - 10,
                                height: boxHeight - 18,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: FormField<LengthType>(
                                  builder: (FormFieldState<LengthType> state) {
                                    return DropdownButton<LengthType>(
                                      value: choiceLength,
                                      items: [
                                        DropdownMenuItem<LengthType>(
                                          child: Text('   단위'),
                                          value: LengthType.danwi,
                                        ),
                                        DropdownMenuItem<LengthType>(
                                          child: Text('cm'),
                                          value: LengthType.cm,
                                        ),
                                        DropdownMenuItem<LengthType>(
                                          child: Text('호'),
                                          value: LengthType.ho,
                                        ),
                                      ],
                                      onChanged: (LengthType val) {
                                        setState(
                                            () => choiceLength = val); //주문확인 카톡
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(Size(boxWide, boxHeight)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '출고일',
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                        ],
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                            Size(boxWide + 150, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비고', //고객 요청사항 50자 미만
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
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
                        child: RaisedButton(
                          child: Text(
                            '추가주문', //버튼 클릭시 주문리스트 출력
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
                            '고객전송',
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
                            '저장',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.teal,
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
                            '주문취소',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepPurpleAccent,
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
