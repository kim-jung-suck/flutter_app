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
enum GoldType2 {
  //받은 금의 재질
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
enum ProgressType { progress, order, fac, office, custo, custo1 }
enum TradeType { tradetype, price, weight }

class PaymentPage extends StatefulWidget {
  static const id = 'payment_page';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  GoldType searchType = GoldType.metal;
  GoldType2 searchType2 = GoldType2.metal;
  LengthType choiceLength = LengthType.danwi;
  ModelType searchModel = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.don;
  ProgressType progressType = ProgressType.progress;
  TradeType tradeType = TradeType.tradetype;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결제'),
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
                          constraints: BoxConstraints.tight(
                            Size(delerWide, boxHeight),
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '거래처', //주문관리에서 입고에서 검색
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
                              labelText: '모델번호', //주문관리에서 입고에서 검색
                            ),
                          ),
                        ),
                        IconButton(icon: Icon(Icons.search), onPressed: () {})
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
                              labelText: '출고일', //당일 자동입력
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        Text(
                          '사진', //진행단계 입고 부분에서 검색
                          style: TextStyle(fontSize: 30),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(countWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '수량', //주문관리에서
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
                                value: searchType,
                                items: [
                                  DropdownMenuItem<GoldType>(
                                    child: Text('재질'), //주문관리에서
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
                            Size(weightWide, boxHeight),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '중량', //주문관리에서
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
                                    child: Text('단위'), //주문관리에서
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
                                  setState(() => choiceWeight = val);
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
                            Size(sizeWide, boxHeight),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '사이즈', //주문관리에서
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
                                    child: Text('단위'), //주문관리에서
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
                                  setState(() => choiceLength = val);
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
                              labelText: '공임', //주문관리에서
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 30, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              labelText: '장식중량', //주문관리에서
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 30, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              labelText: '장식공임', //주문관리에서
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: ddecowide,
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
                                    child: Text('장식'), //주문관리에서
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
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ddeco2,
                          height: dboxHeight,
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
                                    child: Text('재질'), //주문관리에서
                                    value: GoldType.metal,
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
                              Size(boxWide - 30, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              labelText: '줄중량', //주문관리에서
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
                              labelText: '줄공임', //주문관리에서
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              labelText: '추가비용', //주문관리에서
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 30, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              labelText: '순금중량', //재질 99.9, 99.5선택시 중량 그대로 사용
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 30, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                              labelText: '18k중량', //장식 + 여유줄 + 보조줄
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: boxWide,
                          height: boxHeight - 18,
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
                                    child: Text(
                                      '거래형태',
                                      style: TextStyle(color: Colors.red),
                                    ),
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
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '뒷시세', //당일 금시세, 거래형태에서 시세거래시 활성화
                              labelStyle: TextStyle(color: Colors.red),
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
                              labelText: '앞시세', //당일 금시세, 거래형태에서 시세거래시 활성화
                              labelStyle: TextStyle(color: Colors.red),
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
                              labelStyle: TextStyle(color: Colors.red),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: //99.9, 99.5목걸이,팔찌선택시 금중량*적용시세+ 공임 + 장식중량*18k금시세 + 장식공임 + 줄중량*18k금시세 + 줄공임 + 추가비용
                                  '공급가액', //거래형태 중량거래시 공임합계만
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
                              labelText: '세액', //앞시세시 적용
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide + 20, boxHeight)),
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
                              border: OutlineInputBorder(),
                              labelText:
                                  '돈당분석료', //거래형태에서 중량선택시 적용, 무땜 1,500원, 땜 2,500원, 칠보 5,000원
                              labelStyle: TextStyle(color: Colors.red),
                            ),
                            keyboardType: TextInputType.number,
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
                              labelText:
                                  '받은 금', //거래형태에서 중량선택시 적용, 무땜 1,500원, 땜 2,500원, 칠보 5,000원
                              labelStyle: TextStyle(color: Colors.red),
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
                          child: FormField<GoldType2>(
                            //GoldType와 내용은 같지만 변수를 달리하지 않은면 같이 연동되어 기재가 어렵다
                            builder: (FormFieldState<GoldType2> state) {
                              //거채처에서 거래형태를 중량으로 했을 경우 적용하고 금제품에 대한 금덩어리를 지불하여 교한하고 분석료, 공임등은 현금으로 지불한다.
                              return DropdownButton<GoldType2>(
                                value: searchType2,
                                items: [
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('재질'), //주문관리에서
                                    value: GoldType2.metal,
                                  ),
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('99.99'),
                                    value: GoldType2.fournine,
                                  ),
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('99.9'),
                                    value: GoldType2.threenine,
                                  ),
                                  DropdownMenuItem<GoldType2>(
                                    child: Text('99.5'),
                                    value: GoldType2.nintyine_five,
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
                                  setState(() => searchType2 = val);
                                },
                              );
                            },
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
                              labelStyle: TextStyle(color: Colors.red),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(bigoWide - 100, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '기타',
                                labelStyle: TextStyle(color: Colors.red)),
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
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(boxWide + 15, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              '거래내역전송', //확인버튼 클릭에서 나온 화면의 거래내역서를 전송하는 버튼
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
                            Size(boxWide + 15, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              //확인버튼 클릭시 거래내역서 화면에 출력.
                              '확인/저장', //주문관리 출고일결정,주문관리 리스트에서 삭제,보유 재고리스트에서 삭제, 판매완료 내역에 등재
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.teal,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      '거래내역서 출력',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
