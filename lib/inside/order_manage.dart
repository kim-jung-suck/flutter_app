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
enum ModifiedType { modi, date, count, size, extraLine, subLine }
enum DecoType { deco, separate, exchange, label, waxgu }
enum ProgressType { progress, order, fac, office, custo, custo1 }
enum SpeedType { speed, nomal, fast, highfast }
enum ProductType { productType, ready, order }

//아래와 같은 형식으로 데이터가 저장되어 보여준다는 의미임.(양식의 개념)
class OrderManage extends StatefulWidget {
  static const id = 'order_manage';
  @override
  _OrderManageState createState() => _OrderManageState();
}

class _OrderManageState extends State<OrderManage> {
  final _formKey = GlobalKey<FormState>();

  GoldType searchType = GoldType.metal;
  LengthType choiceLength = LengthType.danwi;
  ModelType searchModel = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.don;
  ProgressType progressType = ProgressType.progress;
  ModifiedType modifiedType = ModifiedType.modi;
  SpeedType speedType = SpeedType.speed;
  ProductType productType = ProductType.productType;

  bool choiceOrder = true;
  double boxWide = 90;
  double boxHeight = 75;

  void _getchoiceOrder() {
    setState(() {
      choiceOrder = !choiceOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문관리'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(boxWide + 130, boxHeight)),
                      child: ListTile(
                        onTap: _getchoiceOrder,
                        title: Text('주문리스트 출력'),
                        leading: choiceOrder
                            ? Icon(Icons.check_box_outline_blank)
                            : Icon(
                                Icons.check_box,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
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
                            labelText: '접수일', //주문장으로 부터
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(Size(boxWide, boxHeight)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '출고일', //주문장으로 부터
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                          Container(
                            width: boxWide,
                            height: boxHeight - 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: FormField<SpeedType>(
                              builder: (FormFieldState<SpeedType> state) {
                                return DropdownButton<SpeedType>(
                                  value: speedType,
                                  items: [
                                    DropdownMenuItem<SpeedType>(
                                      child: Text(
                                        '   속도',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      value: SpeedType.speed,
                                    ),
                                    DropdownMenuItem<SpeedType>(
                                      child: Text('일반'),
                                      value: SpeedType.nomal,
                                    ),
                                    DropdownMenuItem<SpeedType>(
                                      child: Text('급'),
                                      value: SpeedType.fast,
                                    ),
                                    DropdownMenuItem<SpeedType>(
                                      child: Text('초급'),
                                      value: SpeedType.highfast,
                                    ),
                                  ],
                                  onChanged: (SpeedType val) {
                                    setState(() => speedType = val);
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
                            labelText: //자동 검색
                                '거래처', //주문장으로 부터
                          ),
                        ),
                      ),
                      Text(
                        '사진', //카탈로그로 부터
                        style: TextStyle(fontSize: 30),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints.tight(
                                Size(boxWide + 150, boxHeight)),
                            child: TextFormField(
                              //15자 입력공간 필요
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '모델번호', //주문장으로 부터
                              ),
                            ),
                          ),
                          Container(
                            width: boxWide,
                            height: boxHeight - 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: FormField<ProductType>(
                              builder: (FormFieldState<ProductType> state) {
                                return DropdownButton<ProductType>(
                                  value: productType,
                                  items: [
                                    DropdownMenuItem<ProductType>(
                                      child: Text(
                                        '제품타입',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      value: ProductType.productType,
                                    ),
                                    DropdownMenuItem<ProductType>(
                                      child: Text('기성'),
                                      value: ProductType.ready,
                                    ),
                                    DropdownMenuItem<ProductType>(
                                      child: Text('주문'),
                                      value: ProductType.order,
                                    ),
                                  ],
                                  onChanged: (ProductType val) {
                                    setState(() => productType = val);
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: boxWide,
                            height: boxHeight - 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: FormField<ModelType>(
                              builder: (FormFieldState<ModelType> state) {
                                return DropdownButton<ModelType>(
                                  value: searchModel,
                                  items: [
                                    DropdownMenuItem<ModelType>(
                                      child: Text(
                                        '모델구분',
                                        style: TextStyle(color: Colors.red),
                                      ), //주문장으로 부터
                                      value: ModelType.model,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('반지'),
                                      value: ModelType.ring,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('목걸이'),
                                      value: ModelType.necklace,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('팔찌'),
                                      value: ModelType.bracelet,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('귀걸이'),
                                      value: ModelType.earing,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('열쇠'),
                                      value: ModelType.key,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('골드바'),
                                      value: ModelType.bar,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('골프공'),
                                      value: ModelType.golfBall,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('명함'),
                                      value: ModelType.namecard,
                                    ),
                                    DropdownMenuItem<ModelType>(
                                      child: Text('기타'),
                                      value: ModelType.etc,
                                    ),
                                  ],
                                  onChanged: (ModelType val) {
                                    setState(() => searchModel = val);
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
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(Size(boxWide, boxHeight)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '수량', //주문장으로 부터
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: boxWide,
                            height: boxHeight - 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: FormField<GoldType>(
                              builder: (FormFieldState<GoldType> state) {
                                return DropdownButton<GoldType>(
                                  value: searchType,
                                  items: [
                                    DropdownMenuItem<GoldType>(
                                      child: Text('재질'), //주문장=>카다로그로 부터
                                      value: GoldType.metal,
                                    ),
                                    DropdownMenuItem<GoldType>(
                                      child: Text('99.99'),
                                      value: GoldType.fournine,
                                    ),
                                    DropdownMenuItem<GoldType>(
                                      child: Text('99.9'),
                                      value: GoldType.threenine,
                                    ),
                                    DropdownMenuItem<GoldType>(
                                      child: Text('99.5'),
                                      value: GoldType.nintyine_five,
                                    ),
                                    DropdownMenuItem<GoldType>(
                                      child: Text('18k'),
                                      value: GoldType.eighteenk,
                                    ),
                                    DropdownMenuItem<GoldType>(
                                      child: Text('14k'),
                                      value: GoldType.forteenk,
                                    ),
                                    DropdownMenuItem<GoldType>(
                                      child: Text('기타'),
                                      value: GoldType.etc,
                                    ),
                                  ],
                                  onChanged: (GoldType val) {
                                    setState(() => searchType = val);
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
                                labelText: '중량', //주문장으로 부터
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            width: boxWide,
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
                                      child: Text('단위'),
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
                                    setState(() => choiceWeight = val);
                                  },
                                );
                              },
                            ),
                          ), //주문장으로 부터
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
                                labelText: '사이즈',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ), //주문장으로 부터
                          Container(
                            width: boxWide,
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
                                      child: Text('단위'),
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
                                    setState(() => choiceLength = val);
                                  },
                                );
                              },
                            ),
                          ), //주문장으로 부터
                        ],
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '공임', //주문장 => 카다로그로부터
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ), //주문장으로 부터
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                            Size(boxWide + 120, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비고', //주문장으로 부터
                          ),
                          keyboardType: TextInputType.text,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(Size(boxWide, boxHeight)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '제조사', //주문장 => 카다로그로부터
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ), //주문장 모델번호로 부터
                          Container(
                            width: boxWide,
                            height: boxHeight - 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: FormField<DecoType>(
                              builder: (FormFieldState<DecoType> state) {
                                return DropdownButton<DecoType>(
                                  value: choiceDeco,
                                  items: [
                                    DropdownMenuItem<DecoType>(
                                      child: Text(
                                        '   장식', //주문장으로부터
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      value: DecoType.deco,
                                    ),
                                    DropdownMenuItem<DecoType>(
                                      child: Text('별도'),
                                      value: DecoType.separate,
                                    ),
                                    DropdownMenuItem<DecoType>(
                                      child: Text('환산'),
                                      value: DecoType.exchange,
                                    ),
                                    DropdownMenuItem<DecoType>(
                                      child: Text('라벨'),
                                      value: DecoType.label,
                                    ),
                                    DropdownMenuItem<DecoType>(
                                      child: Text('왁구'),
                                      value: DecoType.waxgu,
                                    ),
                                  ],
                                  onChanged: (DecoType val) {
                                    setState(() => choiceDeco = val);
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            width: boxWide,
                            height: boxHeight - 18,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: FormField<ProgressType>(
                              builder: (FormFieldState<ProgressType> state) {
                                return DropdownButton<ProgressType>(
                                  value: progressType,
                                  items: [
                                    DropdownMenuItem<ProgressType>(
                                      child: Text(
                                        '진행단계',
                                        style: TextStyle(color: Colors.red),
                                      ), //확정상태임.
                                      value: ProgressType.progress,
                                    ),
                                    DropdownMenuItem<ProgressType>(
                                      child: Text('주문접수'),
                                      value: ProgressType.order,
                                    ),
                                    DropdownMenuItem<ProgressType>(
                                      child: Text('공장발주'),
                                      value: ProgressType.fac,
                                    ),
                                    DropdownMenuItem<ProgressType>(
                                      child: Text('입고'),
                                      value: ProgressType.office,
                                    ),
                                    DropdownMenuItem<ProgressType>(
                                      child: Text('판매'),
                                      value: ProgressType.custo,
                                    ),
                                    DropdownMenuItem<ProgressType>(
                                      child: Text('직판'), //주문판매가 아닌 손님이 직접구매
                                      value: ProgressType.custo1,
                                    ),
                                  ],
                                  onChanged: (ProgressType val) {
                                    setState(() => progressType = val);
                                  },
                                );
                              },
                            ),
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(Size(boxWide, boxHeight)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                      '입고단가', //일일 입고 내역을 통한 결재처리를 위한 정보(카다로그로 부터 받을 수도 있으나 직접입력을 권장)
                                  labelStyle: TextStyle(color: Colors.red)),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      Size(boxWide, boxHeight),
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '거래처/모델번호',
                        ),
                        keyboardType: TextInputType.text),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(boxWide, boxHeight)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '시작일',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  Container(
                    child: Text('~'),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(boxWide, boxHeight)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '종료일',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  Container(
                    width: boxWide,
                    height: boxHeight - 18,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: FormField<GoldType>(
                      builder: (FormFieldState<GoldType> state) {
                        return DropdownButton<GoldType>(
                          value: searchType,
                          items: [
                            DropdownMenuItem<GoldType>(
                              child: Text('   재질'), ////주문장으로 부터
                              value: GoldType.metal,
                            ),
                            DropdownMenuItem<GoldType>(
                              child: Text('99.99'),
                              value: GoldType.fournine,
                            ),
                            DropdownMenuItem<GoldType>(
                              child: Text('99.9'),
                              value: GoldType.threenine,
                            ),
                            DropdownMenuItem<GoldType>(
                              child: Text('99.5'),
                              value: GoldType.nintyine_five,
                            ),
                            DropdownMenuItem<GoldType>(
                              child: Text('18k'),
                              value: GoldType.eighteenk,
                            ),
                            DropdownMenuItem<GoldType>(
                              child: Text('14k'),
                              value: GoldType.forteenk,
                            ),
                            DropdownMenuItem<GoldType>(
                              child: Text('기타'),
                              value: GoldType.etc,
                            ),
                          ],
                          onChanged: (GoldType val) {
                            setState(() => searchType = val);
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
                        labelText: '중량',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  IconButton(icon: Icon(Icons.search), onPressed: () {})
                ],
              ),
            ), //수정입력항목, 여유줄, 보조줄은 체크박스인데 수정할 방법이 마땅치 않음
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
                            '수정', //체크박스로 선정된 리스트는 수정버튼을 눌렀을 경우 빨간색의 내용들을 수정할 수 있다.
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
                            '단계변경', //진행단계 변경
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlue,
                          onPressed: () {}, //클릭시 진행단계 변경
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
                            '확인저장',
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
                            '주문취소', //주문취소는 모델명 변경과 같은 중요사항의 변경시, 주문초기에 가능,취소후 재주문
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepPurpleAccent,
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
                            '입고등록', //제조사의 입고 합계 중량과 입고단가 합이 나온다.=>당일 결재를 위한버튼
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepOrange[800],
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
