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
enum PeriodType { shotType, longType }
enum HoldingType { holding, rental, repair }
enum ProductType { productType, ready, order }

class WarehouseManagement extends StatefulWidget {
  static const id = 'warehouse_management';
  @override
  _WarehouseManagementState createState() => _WarehouseManagementState();
}

class _WarehouseManagementState extends State<WarehouseManagement> {
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
        title: Text('재고관리'),
      ),
      //모든 자료는 주문장으로 부터 서버를 통해 이곳의 리스트출력에 표기된다. 주문관리페이지의 입고등록버튼
      //클릭시 자동으로 아래로 등록이되고, 기존 매장의 보유재고를 등록하려면 여기서 그냥 입력한다.
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
                                      style: TextStyle(color: Colors.red),
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
                                      style: TextStyle(color: Colors.red),
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
                                labelText:
                                    '출고일(변경일)', //변경이 있을시 해당 리스트의 체크박스 체킁후 변경
                                labelStyle: TextStyle(color: Colors.red)),
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
                          width: dgisungWide,
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
                                    child: Text(' 타입'), //주문관리 => 입고관리로 부터
                                    value: ProductType.productType,
                                  ),
                                  DropdownMenuItem<ProductType>(
                                    child: Text(' 기성'),
                                    value: ProductType.ready,
                                  ),
                                  DropdownMenuItem<ProductType>(
                                    child: Text(' 주문'),
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
                              Size(delerWide - 60, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: //자동 검색
                                  '매입처', //주문관리 => 입고관리로 부터 제조사
                            ),
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(countWide, boxHeight)),
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
                                    child: Text(' 기타'),
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
                          width: dweightWide - 5,
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
                                labelText: '사이즈',
                                labelStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight:
                                        FontWeight.bold) //주문관리 => 입고관리로 부터
                                ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          width: dsizeWide - 5,
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
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 10, boxHeight)),
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
                              Size(bigoWide - 80, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '비고', //주문관리 => 입고관리로 부터
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
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 30, boxHeight)),
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
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '장식공임',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
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
                                    child: Text(
                                      '재질',
                                    ), //주문관리
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
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                    Row(
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
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '줄공임',
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
                              labelText: '입고공임', //카다로그로 부터 또는 입고관리의 입고단가와 같은 내용
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
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(delerWide, boxHeight),
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '제조사/모델번호',
                              ),
                              keyboardType: TextInputType.text),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        SizedBox(
                          width: 10,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(boxWide, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              '판매완료', //판매 내역으로 자료가 넘어감
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.deepPurpleAccent,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(boxWide, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              '반납', //체크된 보유재고 중 체크된 제품들을 반납할 경우 버튼을 클릭하여 보유재고에서 삭제한다
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.lightBlue,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tight(Size(boxWide + 120, boxHeight)),
                  child: ListTile(
                    onTap: _getchoiceOrder,
                    title: Text('보유 재고리스트 출력'), //체크박스로 선택하여 수정할 수 있게함
                    leading: choiceOrder
                        ? Icon(Icons.check_box_outline_blank)
                        : Icon(
                            Icons.check_box,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class Summary {
//  final String dealer; ////주문장 거래처
//  final String dealerPhone; //거래처 연락처
//  final String modelName; //모델명
//  final String firstDate; //접수일
//  final String count; //수량
//  final String weight; //중량
//  final WeightType weightType_don; //중량_돈
//  final WeightType weightType_g; //중량_g
//  final String length; //사이즈
//  final LengthType lengthType_cm; //사이즈_cm
//  final LengthType lengthType_ho; //사이즈_ho
//  final String secondDate; //출고일
//  final String bigo; //비고
//  final SpeedType speedType_nomal; ////주문관리부분 속도 일반
//  final SpeedType speedType_fast; // 속도 급
//  final SpeedType speedType_highfast; //속도 초급
//  final ProductType productType_ready; //기성
//  final ProductType productType_order; //주문
//  final ModelType modelType_necklace; //모델구분 목걸이
//  final ModelType modelType_ring; //반지
//  final ModelType modelType_earing; //귀걸이
//  final ModelType modelType_bracelet; //팔찌
//  final ModelType modelType_bar; //골드바
//  final ModelType modelType_key; //열쇠
//  final ModelType modelType_namecard; //명함
//  final ModelType modelType_golfball; //골프공
//  final ModelType modelType_etc; //기타
//  final GoldType goldType_fournine; //재질 99.99
//  final GoldType goldType_threenine; //99.9
//  final GoldType goldType_nintynine_five; //99.5
//  final GoldType goldType_eighteenk; //18k
//  final GoldType goldType_forteenk; //14k
//  final GoldType goldType_etc; //기타
//  final String Gongym; //공임
//  final String supplier; //제조사
//  final DecoType decoType_separate; //장식 별도
//  final DecoType decoType_exchange; //환산
//  final DecoType decoType_label; //라벨
//  final DecoType decoType_waxgu; //왁구
//  final String decoWeight; //장식중량
//  final String decoGongym; //장식공임
//  final String lingWeight; //줄중량
//  final String lineGongym; //줄공임
//  final String additionalCost; //추가비용
//  final ProgressType progressType_order; //진행단계 주문접수.
//  final ProgressType progressType_fac; //공장발주
//  final ProgressType progressType_office; //입고
//  final ProgressType progressType_custo; //판매
//  final ProgressType progressType_custo1; //직판
//  final String serialNo; ////입고관리
//  final String ypgoDate; //입고일
//  final String ypgogongym; //입고공임
//  final PeriodType periodType_shotType; ////재고관리 단기
//  final PeriodType periodType_longType; //단기
//  final HoldingType holdingType_holding; //보유재고
//  final HoldingType holdingType_rental; //대여재고
//  final HoldingType holdingType_repair; //수리재고
//  final String panmaedanga; // 판매단가
//  final String puregoldWeight; ////결재창 순금중량 중량과 같은 것임. 구분을 해야하나?
//  final String 18kWeight;//18k 중량
//  final TradeType tradeType_price; //거래형태 시세
//  final TradeType tradeType_weight;
//  final String backsise;//뒷시세
//  final String frontsise;//앞시세
//  final String applysise;//적용시세
//  final String supplyValue;//공급가액
//  final String tax;//세액
//  final String totalAmount;//총액
//  final String analysisFee;//돈당분석료
//  final String receivedGold;//받은 금        <====미완 재질2 부터 기록
//}
