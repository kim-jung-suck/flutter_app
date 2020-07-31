import 'package:flutter/material.dart';

enum GoldType {
  metal,
  forteenk,
  eighteenk,
  fournine,
  threenine,
  nintyine_five,
  etc
}
enum LengthType { danwi, cm, ho }
enum WeightType { danwi, don, g }
enum ModelType {
  model,
  necklace,
  ring,
  earing,
  bracelet,
  bar,
  key,
  namecard,
  golfBall,
  etc
}
enum DecoType { deco, separate, exchange, label, waxgu }
enum SpeedType { speed, nomal, fast, highfast }
enum ProductType { productType, ready, order }

class OrderPage extends StatefulWidget {
  static const id = 'order_page';
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();

  GoldType searchType = GoldType.metal;
  LengthType choiceLength = LengthType.danwi;
  ModelType searchModel = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.danwi;
  SpeedType speedType = SpeedType.speed;
  ProductType productType = ProductType.productType;

  bool extraLine = true;
  bool subLine = true;
  bool choiceOrder = true;
  double boxWide = 100;
  double boxHeight = 75;
  double delerWide = 160;
  double telephoneWide = 170;

  void _getExtraLine() {
    setState(() {
      extraLine = !extraLine;
    });
  }

  void _getSubLine() {
    setState(() {
      subLine = !subLine;
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
                  Row(
                    children: [],
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
                            Size(boxWide + 150, boxHeight)),
                        child: TextFormField(
                          //15자 입력공간 필요
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '모델명', //주문확인 카톡
                          ),
                        ),
                      ),
//                      Container(
//                        width: boxWide - 10,
//                        height: boxHeight,
//                        decoration:
//                            BoxDecoration(border: Border.all(width: 1.0)),
//                        child: FormField<ModelType>(
//                          builder: (FormFieldState<ModelType> state) {
//                            return DropdownButton<ModelType>(
//                              value: searchModel, //주문확인 카톡
//                              items: [
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('모델구분'),
//                                  value: ModelType.model,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('반지'),
//                                  value: ModelType.ring,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('목걸이'),
//                                  value: ModelType.necklace,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('팔찌'),
//                                  value: ModelType.bracelet,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('귀걸이'),
//                                  value: ModelType.earing,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('열쇠'),
//                                  value: ModelType.key,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('골드바'),
//                                  value: ModelType.bar,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('골프공'),
//                                  value: ModelType.golfBall,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('명함'),
//                                  value: ModelType.namecard,
//                                ),
//                                DropdownMenuItem<ModelType>(
//                                  child: Text('기타'),
//                                  value: ModelType.etc,
//                                ),
//                              ],
//                              onChanged: (ModelType val) {
//                                setState(() => searchModel = val);
//                              },
//                            );
//                          },
//                        ),
//                      ),
//                      Container(
//                        width: boxWide - 10,
//                        height: boxHeight,
//                        decoration: BoxDecoration(
//                          border: Border.all(width: 1.0),
//                        ),
//                        child: FormField<ProductType>(
//                          builder: (FormFieldState<ProductType> state) {
//                            return DropdownButton<ProductType>(
//                              value: productType,
//                              items: [
//                                DropdownMenuItem<ProductType>(
//                                  child: Text('제품타입'),
//                                  value: ProductType.productType,
//                                ),
//                                DropdownMenuItem<ProductType>(
//                                  child: Text('기성'),
//                                  value: ProductType.ready,
//                                ),
//                                DropdownMenuItem<ProductType>(
//                                  child: Text('주문'),
//                                  value: ProductType.order,
//                                ),
//                              ],
//                              onChanged: (ProductType val) {
//                                setState(() => productType = val); //주문확인 카톡
//                              },
//                            );
//                          },
//                        ),
//                      ),
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
                                      child: Text('돈'),
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
                    //모델구분에서 팔찌, 목걸이 선택과 재질에서 99.5 일경우만 이라인 입력
                    children: [
                      Row(
                        children: [
//                          Container(
//                            width: boxWide - 10,
//                            height: boxHeight - 18,
//                            decoration: BoxDecoration(
//                              border: Border.all(color: Colors.grey),
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(5.0)),
//                            ),
//                            child: FormField<DecoType>(
//                              builder: (FormFieldState<DecoType> state) {
//                                return DropdownButton<DecoType>(
//                                  value: choiceDeco,
//                                  items: [
//                                    DropdownMenuItem<DecoType>(
//                                      child: Text('장식'),
//                                      value: DecoType.deco,
//                                    ),
//                                    DropdownMenuItem<DecoType>(
//                                      child: Text('별도'),
//                                      value: DecoType.separate,
//                                    ),
//                                    DropdownMenuItem<DecoType>(
//                                      child: Text('환산'),
//                                      value: DecoType.exchange,
//                                    ),
//                                    DropdownMenuItem<DecoType>(
//                                      child: Text('라벨'),
//                                      value: DecoType.label,
//                                    ),
//                                    DropdownMenuItem<DecoType>(
//                                      child: Text('왁구'),
//                                      value: DecoType.waxgu,
//                                    ),
//                                  ],
//                                  onChanged: (DecoType val) {
//                                    setState(() => choiceDeco = val); //주문확인 카톡
//                                  },
//                                );
//                              },
//                            ),
//                          ),
                        ],
                      ),
                      Row(
                        children: [
//                          ConstrainedBox(
//                            constraints: BoxConstraints.tight(
//                                Size(boxWide + 40, boxHeight)),
//                            child: ListTile(
//                              onTap: _getExtraLine, //주문확인 카톡
//                              title: Text('여유줄'), //결재시 공임 및 금중량기입
//                              leading: extraLine
//                                  ? Icon(Icons.check_box_outline_blank)
//                                  : Icon(
//                                      Icons.check_box,
//                                      color: Colors.pink,
//                                    ),
//                            ),
//                          ),
//                          ConstrainedBox(
//                            constraints: BoxConstraints.tight(
//                                Size(boxWide + 40, boxHeight)),
//                            child: ListTile(
//                              onTap: _getSubLine, //주문확인 카톡
//                              title: Text('보조줄'), //결재시 공임 및 금중량기입
//                              leading: subLine
//                                  ? Icon(Icons.check_box_outline_blank)
//                                  : Icon(
//                                      Icons.check_box,
//                                      color: Colors.pink,
//                                    ),
//                            ),
//                          ),
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
//                          Container(
//                            width: boxWide - 10,
//                            height: boxHeight - 18,
//                            decoration: BoxDecoration(
//                              border: Border.all(color: Colors.grey),
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(5.0)),
//                            ),
//                            child: FormField<SpeedType>(
//                              builder: (FormFieldState<SpeedType> state) {
//                                return DropdownButton<SpeedType>(
//                                  value: speedType,
//                                  items: [
//                                    DropdownMenuItem<SpeedType>(
//                                      child: Text('속도'),
//                                      value: SpeedType.speed,
//                                    ),
//                                    DropdownMenuItem<SpeedType>(
//                                      child: Text('일반'),
//                                      value: SpeedType.nomal,
//                                    ),
//                                    DropdownMenuItem<SpeedType>(
//                                      child: Text('급'),
//                                      value: SpeedType.fast,
//                                    ),
//                                    DropdownMenuItem<SpeedType>(
//                                      child: Text('초급'),
//                                      value: SpeedType.highfast,
//                                    ),
//                                  ],
//                                  onChanged: (SpeedType val) {
//                                    setState(() => speedType = val); //주문확인 카톡
//                                  },
//                                );
//                              },
//                            ),
//                          ),
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
                            '확인/저장',
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
