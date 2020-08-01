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
  LengthType choiceLength = LengthType.danwi;
  ModelType searchModel = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.don;
  ProgressType progressType = ProgressType.progress;
  TradeType tradeType = TradeType.tradetype;

  double boxWide = 100;
  double boxHeight = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결제'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text('주문리스트 출력'),
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
                          Size(boxWide + 150, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '거래처', //재고관리 단기 보유재고 리스트부분에서 검색
                            ),
                            keyboardType: TextInputType.number),
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
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                            Size(boxWide + 150, boxHeight)),
                        child: TextFormField(
                          //15자 입력공간 필요
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '모델번호', //재고관리 단기 보유재고 리스트부분에서
                          ),
                        ),
                      ),
                      Text(
                        '사진', //진행단계 입고 부분에서 검색
                        style: TextStyle(fontSize: 30),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '수량', //재고관리 단기 보유재고 리스트부분에서
                          ),
                          keyboardType: TextInputType.number,
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
                                  child: Text('재질'), //재고관리 단기 보유재고 리스트부분에서
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
                            labelText: '중량', //재고관리 단기 보유재고 리스트부분에서
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        width: boxWide,
                        height: boxHeight - 18,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<WeightType>(
                          builder: (FormFieldState<WeightType> state) {
                            return DropdownButton<WeightType>(
                              value: choiceWeight,
                              items: [
                                DropdownMenuItem<WeightType>(
                                  child: Text('단위'), //재고관리 단기 보유재고 리스트부분에서
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
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '사이즈', //재고관리 단기 보유재고 리스트부분에서
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        width: boxWide,
                        height: boxHeight - 18,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<LengthType>(
                          builder: (FormFieldState<LengthType> state) {
                            return DropdownButton<LengthType>(
                              value: choiceLength,
                              items: [
                                DropdownMenuItem<LengthType>(
                                  child: Text('단위'), //재고관리 단기 보유재고 리스트부분에서
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
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '공임', //재고관리 단기 보유재고 리스트부분에서
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
                            labelText: '장식중량', //재고관리 단기 보유재고 리스트부분에서
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
                            labelText: '장식공임', //재고관리 단기 보유재고 리스트부분에서
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        width: boxWide - 10,
                        height: boxHeight - 18,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: FormField<DecoType>(
                          builder: (FormFieldState<DecoType> state) {
                            return DropdownButton<DecoType>(
                              value: choiceDeco,
                              items: [
                                DropdownMenuItem<DecoType>(
                                  child: Text('장식'), //재고관리 단기 보유재고 리스트부분에서
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
                        width: boxWide - 10,
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
                                  child: Text('재질'), //재고관리 단기 보유재고 리스트부분에서
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
                            Size(boxWide + 150, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '비고', //재고관리 단기 보유재고 리스트부분에서
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '줄중량', //재고관리 단기 보유재고 리스트부분에서
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
                            labelText: '줄공임', //재고관리 단기 보유재고 리스트부분에서
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
                            labelText: '추가비용', //재고관리 단기 보유재고 리스트부분에서
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
                            labelText: '순금중량(중량)', //재질 99.9, 99.5선택시 중량 그대로 사용
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
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                    children: [
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
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '총액', //앞시세시 공급가액 + 세액
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
                            '거래내역전송',
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
                            '확인/저장', //주문관리 출고일결정,주문관리 리스트에서 삭제,보유 재고리스트에서 삭제, 판매완료 내역에 등재
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
