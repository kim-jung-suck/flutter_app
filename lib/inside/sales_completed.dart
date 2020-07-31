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
enum HoldingType { holding, rental }
enum ProductType { productType, ready, order }

//아래 내용은 양식이며 재고간리의 판매완료 클릭시 저장된 내용을 보여주는 개념임
class SalesComleted extends StatefulWidget {
  static const id = 'sales_completed';
  @override
  _SalesComletedState createState() => _SalesComletedState();
}

class _SalesComletedState extends State<SalesComleted> {
  final _formKey = GlobalKey<FormState>();

  GoldType searchType = GoldType.metal;
  LengthType choiceLength = LengthType.danwi;
  ModelType searchModel = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.danwi;
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
        title: Text('판매완료내역'),
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
                        BoxConstraints.tight(Size(boxWide + 120, boxHeight)),
                    child: ListTile(
                      onTap: _getchoiceOrder,
                      title: Text('판매완료 리스트 출력'),
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
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                '접수번호', //순서대로 자동입력 또눈 모델분류별 자동입력 가능한가? 예 반지=> r001,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        width: boxWide,
                        height: boxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
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
                                DropdownMenuItem<PeriodType>(
                                  child: Text('미완'), //반제품 입고시.예 보조줄 없는 팔찌.
                                  value: PeriodType.incomplete,
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
                        height: boxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
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
                                  child: Text('대여재고'), //주문에 의한 입고를 제외한 사항
                                  value: HoldingType.rental,
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
                            labelText: '입고일(접수일)', //
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
                            labelText: '출고일(변경일)', //주문장으로 부터
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
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
                        height: boxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
                        ),
                        child: FormField<ProductType>(
                          builder: (FormFieldState<ProductType> state) {
                            return DropdownButton<ProductType>(
                              value: productType,
                              items: [
                                DropdownMenuItem<ProductType>(
                                  child: Text('제품타입'),
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
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: //자동 검색
                                '매입처(제조사)', //주문장으로 부터
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '수량',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: boxWide,
                            height: boxHeight,
                            decoration:
                                BoxDecoration(border: Border.all(width: 1.0)),
                            child: FormField<ModelType>(
                              builder: (FormFieldState<ModelType> state) {
                                return DropdownButton<ModelType>(
                                  value: searchModel,
                                  items: [
                                    DropdownMenuItem<ModelType>(
                                      child: Text('모델구분'),
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
                          Container(
                            width: boxWide,
                            height: boxHeight,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
                            ),
                            child: FormField<GoldType>(
                              builder: (FormFieldState<GoldType> state) {
                                return DropdownButton<GoldType>(
                                  value: searchType,
                                  items: [
                                    DropdownMenuItem<GoldType>(
                                      child: Text('재질'), ////주문장으로 부터
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
                          Container(
                            width: boxWide,
                            height: boxHeight,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
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
                          ),
                        ],
                      ),
                      Row(
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
                          ),
                          Container(
                            width: boxWide,
                            height: boxHeight,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
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
                          ),
                        ],
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '공임',
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
                            labelText: '비고',
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
                        children: [
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tight(Size(boxWide, boxHeight)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '제조사',
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            width: boxWide,
                            height: boxHeight,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
                            ),
                            child: FormField<DecoType>(
                              builder: (FormFieldState<DecoType> state) {
                                return DropdownButton<DecoType>(
                                  value: choiceDeco,
                                  items: [
                                    DropdownMenuItem<DecoType>(
                                      child: Text('장식'),
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
                            constraints:
                                BoxConstraints.tight(Size(boxWide, boxHeight)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '장식중량', //확정상태임(판매단계에서 최종중량확정)
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
                            width: boxWide,
                            height: boxHeight,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
                            ),
                            child: FormField<GoldType>(
                              builder: (FormFieldState<GoldType> state) {
                                return DropdownButton<GoldType>(
                                  value: searchType,
                                  items: [
                                    DropdownMenuItem<GoldType>(
                                      child: Text('재질'),
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
                          ), //주문장으로 부터
                        ],
                      ),
                      Row(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints.tight(
                                Size(boxWide + 50, boxHeight)),
                            child: ListTile(
                              onTap: _getExtraLine,
                              title: Text('여유줄'), //결재시 공임 및 금중량기입
                              leading: extraLine
                                  ? Icon(Icons.check_box_outline_blank)
                                  : Icon(
                                      Icons.check_box,
                                      color: Colors.pink,
                                    ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tight(
                                Size(boxWide + 50, boxHeight)),
                            child: ListTile(
                              onTap: _getSubLine,
                              title: Text('보조줄'), //결재시 공임 및 금중량기입
                              leading: subLine
                                  ? Icon(Icons.check_box_outline_blank)
                                  : Icon(
                                      Icons.check_box,
                                      color: Colors.pink,
                                    ),
                            ),
                          ),
                        ],
                      ), //주문장으로 부터
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
                            labelText: '줄중량',
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
                            labelText: '매입단가', //매입단가는 오너만 볼 수 있게함
                            labelStyle: TextStyle(color: Colors.red),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
//                      ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: '적용시세', //당일 금시세
//                          ),
//                          keyboardType: TextInputType.number,
//                        ),
//                      ),
//                      ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText:
//                                '공급가액', // 카탈로그 상의 금액 + 장식중량*18k금시세 + 장식공임 + 줄중량*18k금시세 + 줄공임 + 추가비용
//                          ),
//                          keyboardType: TextInputType.number,
//                        ),
//                      ),
//                      ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: '세액',
//                          ),
//                          keyboardType: TextInputType.number,
//                        ),
//                      ),
//                      ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: '총액',
//                          ),
//                          keyboardType: TextInputType.number,
//                        ),
//                      ),
//                      ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: '계약금',
//                          ),
//                          keyboardType: TextInputType.number,
//                        ),
//                      ),
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
                      Container(
                        width: boxWide,
                        height: boxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
                        ),
                        child: FormField<ModifiedType>(
                          builder: (FormFieldState<ModifiedType> state) {
                            return DropdownButton<ModifiedType>(
                              value: modifiedType,
                              items: [
                                DropdownMenuItem<ModifiedType>(
                                  child: Text('수정항목'),
                                  value: ModifiedType.modi,
                                ),
                                DropdownMenuItem<ModifiedType>(
                                  child: Text('출고일'),
                                  value: ModifiedType.date,
                                ),
                                DropdownMenuItem<ModifiedType>(
                                  child: Text(''),
                                  value: ModifiedType.count,
                                ),
                                DropdownMenuItem<ModifiedType>(
                                  child: Text(''),
                                  value: ModifiedType.size,
                                ),
                                DropdownMenuItem<ModifiedType>(
                                  child: Text(''),
                                  value: ModifiedType.extraLine,
                                ),
                                DropdownMenuItem<ModifiedType>(
                                  child: Text(''),
                                  value: ModifiedType.subLine,
                                ),
                              ],
                              onChanged: (ModifiedType val) {
                                setState(() => modifiedType = val);
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
                            labelText: '수정내용', //주문장으로 부터
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //수정입력항목, 여유줄, 보조줄은 체크박스인데 수정할 방법이 마땅치 않음
            Container(
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      Size(boxWide, boxHeight),
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '제조사/모델명/모델번호',
                        ),
                        keyboardType: TextInputType.text),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(boxWide, boxHeight)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '검색시작일', //
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(boxWide, boxHeight)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '검색종료일',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  Container(
                    width: boxWide,
                    height: boxHeight,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0),
                    ),
                    child: FormField<GoldType>(
                      builder: (FormFieldState<GoldType> state) {
                        return DropdownButton<GoldType>(
                          value: searchType,
                          items: [
                            DropdownMenuItem<GoldType>(
                              child: Text('재질'), ////주문장으로 부터
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
                            '삭제', //삭제항목 선택, 수퍼관리자만 삭제가능
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
                            '저장',
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
