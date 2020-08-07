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
enum GoldType2 { metal, forteenk, eighteenk, etc }
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
enum ProgressType { progress, order, fac, office, custo, custo1 }
enum TradeType { tradetype, price, weight }
enum ProductType { productType, ready, order }

class SalesManage extends StatefulWidget {
  static const id = 'sales_manage';
  @override
  _SalesManageState createState() => _SalesManageState();
}

class _SalesManageState extends State<SalesManage> {
  final _formKey = GlobalKey<FormState>();

  GoldType goldType = GoldType.metal;
  GoldType2 goldType2 = GoldType2.eighteenk;
  LengthType choiceLength = LengthType.danwi;
  ModelType modelType = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.don;
  ProgressType progressType = ProgressType.progress;
  TradeType tradeType = TradeType.tradetype;
  ProductType productType = ProductType.productType;

  bool extraLine = true;
  bool subLine = true;
  double boxWide = 90;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('판매관리'),
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
                    Text('당일판매내역 출력'), //당일 판매완료내역(추가항목있음)으로 손익계산에 활용하는 것이 좋을 듯함
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
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(delerWide, boxHeight),
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '거래처',
                              ),
                              keyboardType: TextInputType.number),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(modelWide, boxHeight)),
                          child: TextFormField(
                            //15자 입력공간 필요
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '모델번호',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: dpriodwide - 10,
                          height: dboxHeight,
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
                                    child: Text('타입'),
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
                                  setState(() => productType = val); //주문확인 카톡
                                },
                              );
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(countWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '수량',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: dmetalWide,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<GoldType>(
                            builder: (FormFieldState<GoldType> state) {
                              return DropdownButton<GoldType>(
                                value: goldType,
                                items: [
                                  DropdownMenuItem<GoldType>(
                                    child: Text('재질'), //확정상태임
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
                                  setState(() => goldType = val);
                                },
                              );
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(weightWide, boxHeight),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '중량',
                            ),
                            keyboardType: TextInputType.number,
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
                                value: choiceWeight,
                                items: [
                                  DropdownMenuItem<WeightType>(
                                    child: Text('단위'),
                                    value: WeightType.danwi,
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
                                  setState(() => choiceWeight = val);
                                },
                              );
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(sizeWide, boxHeight),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '사이즈',
                            ),
                            keyboardType: TextInputType.number,
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
                                value: choiceLength,
                                items: [
                                  DropdownMenuItem<LengthType>(
                                    child: Text('단위'),
                                    value: LengthType.danwi,
                                  ),
                                  DropdownMenuItem<LengthType>(
                                    child: Text(' cm'),
                                    value: LengthType.cm,
                                  ),
                                  DropdownMenuItem<LengthType>(
                                    child: Text(' 호'),
                                    value: LengthType.ho,
                                  ),
                                ],
                                onChanged: (LengthType val) {
                                  setState(() => choiceLength = val);
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
                              Size(boxWide - 20, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '공임', //카다로그 상의 공임
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 20, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              labelText: '장식중량',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 15, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '장식공임',
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: ddecowide - 10,
                          height: dboxHeight,
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
                                    child: Text('장식'), //확정상태임.
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
                          width: ddeco2 - 10,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<GoldType2>(
                            builder: (FormFieldState<GoldType2> state) {
                              return DropdownButton<GoldType2>(
                                value: goldType2,
                                items: [
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('재질'),
                                    value: GoldType2.metal,
                                  ),
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('18k'),
                                    value: GoldType2.eighteenk,
                                  ),
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('14k'),
                                    value: GoldType2.forteenk,
                                  ),
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('기타'),
                                    value: GoldType2.etc,
                                  ),
                                ],
                                onChanged: (GoldType2 val) {
                                  setState(() => goldType2 = val);
                                },
                              );
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(bigoWide - 150, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '비고', //주문관리로부터
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 30, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '줄중량',
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 20, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '줄공임',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 10, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              labelText:
                                  '추가비용', //24k 적정 길이를 초과할 경우 비용이 증대된다.다이아 등 14k, 18k의 추가비용 기재
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 10, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '순금중량', //재질 99.9, 99.5선택시 중량 그대로 사용
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 10, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '18k중량', //장식 + 여유줄 + 보조줄
                              labelStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: boxWide,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<TradeType>(
                            builder: (FormFieldState<TradeType> state) {
                              return DropdownButton<TradeType>(
                                value: tradeType,
                                items: [
                                  DropdownMenuItem<TradeType>(
                                    child: Text('거래형태'),
                                    value: TradeType.tradetype,
                                  ),
                                  DropdownMenuItem<TradeType>(
                                    child: Text('시세'),
                                    value: TradeType.price,
                                  ),
                                  DropdownMenuItem<TradeType>(
                                    child: Text('중량'),
                                    value: TradeType.weight,
                                  ),
                                ],
                                onChanged: (TradeType val) {
                                  setState(() => tradeType = val);
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
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '뒷시세', //당일 금시세
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '앞시세', //당일 금시세
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 20, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  '분석료', //거래형태에서 중량선택시 적용, 무땜 1,500원, 땜 2,500원, 칠보 5,000원
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '적용시세', //당일 금시세
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: //99.9, 99.5목걸이,팔찌선택시 금중량*적용시세+ 공임 + 장식중량*18k금시세 + 장식공임 + 줄중량*18k금시세 + 줄공임 + 추가비용
                                  '공급가액', //
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 10, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '세액', //앞시세시 적용
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide + 10, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '총액', //앞시세시 공급가액 + 세액
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border:
                                  OutlineInputBorder(), //용도는 순금으로 환산했을 때 자산확인용
                              labelText: '순금환산', //(순금중량 * 적용시세 + 공임)/적용시세
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border:
                                  OutlineInputBorder(), //용도는 현금으로 환산했을 때 자산확인용
                              labelText: '시세환산', //(순금중량 * 적용시세 + 공임)/적용시세
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
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
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '종료일',
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ],
                    ),
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
                                labelText: '거래처/모델번호',
                              ),
                              keyboardType: TextInputType.text),
                        ),
                        Container(
                          width: boxWide,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<GoldType>(
                            builder: (FormFieldState<GoldType> state) {
                              return DropdownButton<GoldType>(
                                value: goldType,
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
                                  setState(() => goldType = val);
                                },
                              );
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(weightWide, boxHeight),
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
                            Size(boxWide, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              '수정', //최고관리자만 수정권한을 부여
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
                              '확인저장',
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
      ),
    );
  }
}
