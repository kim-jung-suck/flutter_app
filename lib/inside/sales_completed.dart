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
enum PeriodType { shotType, longType, incomplete }
enum HoldingType { holding, rental, repair, returning }
enum ProductType { productType, ready, order }

class SalesCompleted extends StatefulWidget {
  static const id = 'sales_completed';
  @override
  _SalesCompletedState createState() => _SalesCompletedState();
}

class _SalesCompletedState extends State<SalesCompleted> {
  final _formKey = GlobalKey<FormState>();

  GoldType goldType = GoldType.metal;
  LengthType choiceLength = LengthType.danwi;
  ModelType modelType = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.don;
  ProgressType progressType = ProgressType.progress;
  ModifiedType modifiedType = ModifiedType.modi;
  PeriodType periodType = PeriodType.shotType;
  HoldingType holdingType = HoldingType.holding;
  ProductType productType = ProductType.productType;

  bool extraLine = true;
  bool subLine = true;
  bool choiceOrder = true;

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

  void _getchoiceOrder() {
    setState(() {
      choiceOrder = !choiceOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('판매완료내역'),
      ),
      //모든 재품관련 자료는 주문장=>주문관리=>입고관리=>재고관리=>결재=>판매완료로 정리되고 순차적으로 입력이 추가된다.(빨간색)
      //덩어리금은 재품대로 지불하거나, 교환 등에 사용되며 이에 대한 입력은 입출관리에 의해 이루어진다.
      //계산에 관련된 것은 파란색 끌씨로 표기된다.
      //판매완료내역의 양식은 주문관리와 거의 같다 단지 제조사와 입력내용의 유무의 차이이다. 이양식의 용도는 현황파악을 위함이고 여기서
      //발전시킨다면 월간거래처별 거래내역, 3개월간 거래내역
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: // 입고관리로 부터
                                  '시리얼No', //순서대로 자동입력 또눈 모델분류별 자동입력 가능한가? 예 반지=> r001,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: dpriodwide,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<PeriodType>(
                            builder: (FormFieldState<PeriodType> state) {
                              return DropdownButton<PeriodType>(
                                value: periodType,
                                items: [
                                  DropdownMenuItem<PeriodType>(
                                    child: Text(
                                      '단기',
                                    ), //주문에 의한 입고
                                    value: PeriodType.shotType,
                                  ),
                                  DropdownMenuItem<PeriodType>(
                                    child: Text('장기'), //주문에 의한 입고를 제외한 사항
                                    value: PeriodType.longType,
                                  ),
                                ],
                                onChanged: (PeriodType val) {
                                  setState(() => periodType = val);
                                },
                              );
                            },
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
                          child: FormField<HoldingType>(
                            builder: (FormFieldState<HoldingType> state) {
                              return DropdownButton<HoldingType>(
                                value: holdingType,
                                items: [
                                  DropdownMenuItem<HoldingType>(
                                    child: Text(
                                      '보유재고',
                                    ), //매장에 보유한 재고
                                    value: HoldingType.holding,
                                  ),
                                  DropdownMenuItem<HoldingType>(
                                    child: Text('대여재고'), //거래처에 대여한 재고
                                    value: HoldingType.rental,
                                  ),
                                  DropdownMenuItem<HoldingType>(
                                    child: Text('수리재고'), //수리업체에 수리중인 재고
                                    value: HoldingType.repair,
                                  ),
                                ],
                                onChanged: (HoldingType val) {
                                  setState(() => holdingType = val);
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
                              labelText: '입고일', //입고관리로 부터
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '판매일',
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
                              Size(modelWide - 30, boxHeight)),
                          child: TextFormField(
                            //15자 입력공간 필요
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '모델번호', //입고관리로 부터
                            ),
                          ),
                        ),
                        Container(
                          width: dgisungWide - 10,
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
                                    child: Text('타입'), //주문관리 => 입고관리로 부터
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
                          constraints: BoxConstraints.tight(
                              Size(delerWide - 50, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: //자동 검색
                                  '거래처', //주문관리
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(countWide, boxHeight),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '수량', //주문관리 => 입고관리로 부터
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: boxWide - 10,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<ModelType>(
                            builder: (FormFieldState<ModelType> state) {
                              return DropdownButton<ModelType>(
                                value: modelType,
                                items: [
                                  DropdownMenuItem<ModelType>(
                                    child: Text(
                                      '모델구분',
                                      style: TextStyle(fontSize: 13),
                                    ), //주문관리
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
                                  setState(() => modelType = val);
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
                                    child: Text(' 재질'), //주문관리로 부터
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
                              labelText: '중량', //주문관리 => 입고관리로 부터
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
                                    child: Text('단위'), //주문관리 => 입고관리로 부터
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
                              labelText: '사이즈', //주문관리 => 입고관리로 부터
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
                                    child: Text('단위'), //주문관리 => 입고관리로 부터
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
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '공임', //주문관리
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
                              Size(bigoWide - 100, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '비고', //주문관리 => 입고관리로 부터
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
                              labelText: '제조사', //주문관리 => 입고관리로 부터
                            ),
                            keyboardType: TextInputType.text,
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
                                    child: Text(
                                      '장식',
                                    ), //주문관리 => 입고관리로 부터
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
                        ), //확정상태임(판매단계에서 최종중량확정).
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 20, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '장식중량',
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
                              labelText: '장식공임',
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
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
                                value: goldType,
                                items: [
                                  DropdownMenuItem<GoldType>(
                                    child: Text('재질'), //주문관리
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
                                  setState(() => goldType = val);
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
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
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
                              labelText:
                                  '추가비용', //24k 적정 길이를 초과할 경우 비용이 증대된다.다이아 등 14k, 18k의 추가비용 기재
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
                              labelText: '판매단가', //공임합계
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
                              labelText: '입고단가', //카다로그로 부터 또는 입고관리의 입고단가와 같은 내용
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
                              labelText: '시작일', //
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
                              labelText: '종료일', //
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
                            Size(boxWide, boxHeight),
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '제조사/모델번호',
                              ),
                              keyboardType: TextInputType.text),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(weightWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '중량', //
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: dpriodwide,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<PeriodType>(
                            builder: (FormFieldState<PeriodType> state) {
                              return DropdownButton<PeriodType>(
                                value: periodType,
                                items: [
                                  DropdownMenuItem<PeriodType>(
                                    child: Text('단기'), //주문에 의한 입고
                                    value: PeriodType.shotType,
                                  ),
                                  DropdownMenuItem<PeriodType>(
                                    child: Text('장기'), //주문에 의한 입고를 제외한 사항
                                    value: PeriodType.longType,
                                  ),
                                ],
                                onChanged: (PeriodType val) {
                                  setState(() => periodType = val);
                                },
                              );
                            },
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
                          child: FormField<HoldingType>(
                            builder: (FormFieldState<HoldingType> state) {
                              return DropdownButton<HoldingType>(
                                value: holdingType,
                                items: [
                                  DropdownMenuItem<HoldingType>(
                                    child: Text('보유재고'), //주문에 의한 입고
                                    value: HoldingType.holding,
                                  ),
                                  DropdownMenuItem<HoldingType>(
                                    child: Text('대여재고'), //거래처에 대여한 재고
                                    value: HoldingType.rental,
                                  ),
                                  DropdownMenuItem<HoldingType>(
                                    child: Text('수리재고'), //수리를 맡긴 재고
                                    value: HoldingType.repair,
                                  ),
                                ],
                                onChanged: (HoldingType val) {
                                  setState(() => holdingType = val);
                                },
                              );
                            },
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
                                    child: Text('재질'),
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
                        IconButton(icon: Icon(Icons.search), onPressed: () {})
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
                            Size(boxWide, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              '삭제', //체크박스로 선택한 내용삭제
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
              ),
              Container(
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(boxWide + 150, boxHeight)),
                      child: ListTile(
                        onTap: _getchoiceOrder,
                        title: Text('판매완료리스트 출력'), //체크박스로 선택하여 수정할 수 있게함
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
            ],
          ),
        ),
      ),
    );
  }
}
