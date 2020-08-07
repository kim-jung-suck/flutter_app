import 'package:flutter/material.dart';

enum LengthType { danwi, cm, ho }
enum WeightType { danwi, don, g }

class OrderPage extends StatefulWidget {
  static const id = 'order_page';
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final Map<String, dynamic> _searchForm = <String, dynamic>{
    'dealer': "",
    'dealerPhone': "",
    'modelName': "",
    'firstDate': "",
    'count': "",
    'weight': "",
    'weightDanwi': WeightType.don,
    'length': "",
    'lengthDanwi': LengthType.danwi,
    'secondDate': "",
    'bigo': "",
  };

  final _formKey = GlobalKey<FormState>();

  TextEditingController firstDateController = TextEditingController();

  LengthType choiceLength = LengthType.danwi;

  WeightType choiceWeight = WeightType.don;

  bool choiceOrder = true;
  double boxWide = 100;
  double boxHeight = 75;
  double dboxHeight = 57;
  double delerWide = 160;
  double phoneWide = 130;
  double modelWide = 180;
  double countWide = 55;
  double weightWide = 70;
  double dweightWide = 70;
  double sizeWide = 70;
  double dsizeWide = 70;
  double bigoWide = 250;
  double buttonHeight = 45;

  void _getchoiceOrder() {
    setState(() {
      choiceOrder = !choiceOrder;
    });
  }

  void reset() {
    setState(() => _searchForm.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문장'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(delerWide, boxHeight)),
                          child: TextFormField(
                            initialValue: _searchForm['dealer'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: //자동 검색
                                  '거래처', //신규가 아닌 경우 매입거래처 등록에서 내용을 가져오고 신규는 등록한다.
                            ),
                            onChanged: (String val) {
                              setState(() => _searchForm['dealer'] = val);
                            },
                            onSaved: (String val) {},
                            validator: (String val) {
                              if (val.isEmpty) {
                                return '거래처를 입력하세요';
                              }
                              return null;
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(phoneWide, boxHeight)),
                          child: TextFormField(
                            initialValue: _searchForm['dealerPhone'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  '전화번호', //신규가 아닌 경우 매입거래처 등록에서 내용을 가져오고 신규는 등록한다.
                            ),
                            keyboardType: TextInputType.phone,
                            onChanged: (String val) {
                              setState(() => _searchForm['dealerPhone'] = val);
                            },
                            onSaved: (String val) {},
                            validator: (String val) {
                              if (val.isEmpty) {
                                return '전화번호를 입력하세요';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(modelWide, boxHeight)),
                          child: TextFormField(
                            //15자 입력공간 필요
                            initialValue: _searchForm['modelName'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '모델명', //카다로그에서 리스트컴색
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (String val) {
                              setState(() => _searchForm['modelName'] = val);
                            },

                            validator: (String val) {
                              if (val.isEmpty) {
                                return '모델명을 입력하세요';
                              }
                              return null;
                            },
                            onSaved: (String val) {},
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            initialValue: _searchForm['firstDate'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),

                              labelText: '    접수일', //자동 당일날짜 입력
                            ),
                            onChanged: (String val) {
                              setState(() => _searchForm['firstDate'] = val);
                            },
                            onSaved: (String val) {},
                            validator: (String val) {
                              if (val.isEmpty) {
                                return '접수일을 입력하세요';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(countWide, boxHeight)),
                          child: TextFormField(
                            initialValue: _searchForm['count'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '수량', //주문확인 카톡
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String val) {
                              setState(() => _searchForm['count'] = val);
                            },
                            onSaved: (String val) {},
                            validator: (String val) {
                              if (val.isEmpty) {
                                return '수량을 입력하세요';
                              }
                              return null;
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(weightWide, boxHeight),
                          ),
                          child: TextFormField(
                            initialValue: _searchForm['weight'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '중량', //주문확인 카톡
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String val) {
                              setState(() => _searchForm['weight'] = val);
                            },
                            onSaved: (String val) {},
                            validator: (String val) {
                              if (val.isEmpty) {
                                return '중량을 입력하세요';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: dweightWide,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<WeightType>(
                            builder: (FormFieldState<WeightType> state) {
                              return DropdownButton<WeightType>(
                                value: _searchForm['weightDanwi'],
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
                                    child: Text('  g'),
                                    value: WeightType.g,
                                  ),
                                ],
                                onChanged: (WeightType val) {
                                  setState(() => _searchForm['weightDanwi'] =
                                      val); //주문확인 카톡
                                },
                              );
                            },
                            onSaved: (WeightType val) {},
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(sizeWide, boxHeight),
                          ),
                          child: TextFormField(
                            initialValue: _searchForm['length'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '사이즈', //주문확인 카톡
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String val) {
                              setState(() => _searchForm['length'] = val);
                            },
                            onSaved: (String val) {},
                            validator: (String val) {
                              if (val.isEmpty) {
                                return '사이즈를 입력하세요';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: dsizeWide,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<LengthType>(
                            builder: (FormFieldState<LengthType> state) {
                              return DropdownButton<LengthType>(
                                value: _searchForm['lengthDanwi'],
                                items: [
                                  DropdownMenuItem<LengthType>(
                                    child: Text('   단위'),
                                    value: LengthType.danwi,
                                  ),
                                  DropdownMenuItem<LengthType>(
                                    child: Text('  cm'),
                                    value: LengthType.cm,
                                  ),
                                  DropdownMenuItem<LengthType>(
                                    child: Text('  호'),
                                    value: LengthType.ho,
                                  ),
                                ],
                                onChanged: (LengthType val) {
                                  setState(() => _searchForm['lengthDanwi'] =
                                      val); //주문확인 카톡
                                },
                              );
                            },
                            onSaved: (LengthType val) {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            initialValue: _searchForm['secondDate'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '출고일',
                            ),
                            keyboardType: TextInputType.datetime,
                            onChanged: (String val) {
                              setState(() => _searchForm['secondDate'] = val);
                            },
                            onSaved: (String val) {},
                            validator: (String val) {
                              if (val.isEmpty) {
                                return '출고일을 입력하세요';
                              }
                              return null;
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(bigoWide, boxHeight)),
                          child: TextFormField(
                            initialValue: _searchForm['bigo'],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '비고', //고객 요청사항 50자 미만
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String val) {
                              setState(() => _searchForm['bigo'] = val);
                            },
                            onSaved: (String val) {},
                          ),
                        ),
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
                            Size(boxWide, buttonHeight),
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
                            Size(boxWide, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              '저장',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.teal,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState
                                    .save(); //TODO 추후변수에 저장하고 이내용을 출력한다.
                                print(_searchForm['dealer']);
                                print(_searchForm['dealerPhone']);
                                print(_searchForm['modelName']);
                                print(_searchForm['firstDate']);
                                print(_searchForm['count']);
                                print(_searchForm['weight']);
                                print(_searchForm['weightDanwi']);
                                print(_searchForm['length']);
                                print(_searchForm['lengthDanwi']);
                                print(_searchForm['secondDate']);
                                print(_searchForm['bigo']);
                              }
                            },
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
                              '주문취소',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.deepPurpleAccent,
                            onPressed: () {
//                              setState(() {
//                                _formKey.currentState.reset();
//                              });
                              _searchForm['dealer'] = "";
                              _searchForm['dealerPhone'] = "";
                              _searchForm['modelName'] = "";
                              _searchForm['firstDate'] = "";
                              _searchForm['count'] = "";
                              _searchForm['weight'] = "";
                              _searchForm['weightDanwi'] = WeightType.don;
                              _searchForm['length'] = "";
                              _searchForm['lengthDanwi'] = LengthType.danwi;
                              _searchForm['secondDate'] = "";
                              _searchForm['bigo'] = "";
                            }, //TODO reset메서드 만들어 반영
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
