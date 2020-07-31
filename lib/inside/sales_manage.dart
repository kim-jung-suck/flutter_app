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
enum ProductType { productType, ready, order }

class SalesManage extends StatefulWidget {
  static const id = 'sales_manage';
  @override
  _SalesManageState createState() => _SalesManageState();
}

class _SalesManageState extends State<SalesManage> {
  final _formKey = GlobalKey<FormState>();

  GoldType searchType = GoldType.metal;
  LengthType choiceLength = LengthType.danwi;
  ModelType searchModel = ModelType.model;
  DecoType choiceDeco = DecoType.deco;
  WeightType choiceWeight = WeightType.danwi;
  ProgressType progressType = ProgressType.progress;
  TradeType tradeType = TradeType.tradetype;
  ProductType productType = ProductType.productType;

  bool extraLine = true;
  bool subLine = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('판매관리'),
      ),
      body: Form(
        key: _formKey,
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
                    children: [
//                      ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: '접수일',
//                          ),
//                          keyboardType: TextInputType.datetime,
//                        ),
//                      ),
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
                          Size(boxWide, boxHeight),
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '거래처명',
                            ),
                            keyboardType: TextInputType.number),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          //15자 입력공간 필요
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '모델번호',
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
                      Text(
                        '사진',
                        style: TextStyle(fontSize: 30),
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
                                setState(() => searchType = val);
                              },
                            );
                          },
                        ),
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
                    ],
                  ),
                  Row(
                    children: [
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
                            labelText: '공임', //카다로그 상의 공임
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
                            labelText: '장식중량',
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
                        width: boxWide - 10,
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
                        width: boxWide - 10,
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
                      ),
//                      ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: '비고', //필요한 설명기재
//                          ),
//                          keyboardType: TextInputType.text,
//                        ),
//                      ),
                    ],
                  ),
//                  Row(
//                    children: [
//                        ConstrainedBox(
//                        constraints:
//                            BoxConstraints.tight(Size(boxWide, boxHeight)),
//                        child: TextFormField(
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: '제조사',
//                          ),
//                          keyboardType: TextInputType.text,
//                        ),
//                    ),
//                      Container(
//                        width: boxWide - 10,
//                        height: boxHeight,
//                        decoration: BoxDecoration(
//                          border: Border.all(width: 1.0),
//                        ),
//                        child: FormField<ProgressType>(
//                          builder: (FormFieldState<ProgressType> state) {
//                            return DropdownButton<ProgressType>(
//                              value: progressType,
//                              items: [
//                                DropdownMenuItem<ProgressType>(
//                                  child: Text('진행단계'), //확정상태임.
//                                  value: ProgressType.progress,
//                                ),
//                                DropdownMenuItem<ProgressType>(
//                                  child: Text('주문접수'),
//                                  value: ProgressType.order,
//                                ),
//                                DropdownMenuItem<ProgressType>(
//                                  child: Text('공장발주'),
//                                  value: ProgressType.fac,
//                                ),
//                                DropdownMenuItem<ProgressType>(
//                                  child: Text('입고'),
//                                  value: ProgressType.office,
//                                ),
//                                DropdownMenuItem<ProgressType>(
//                                  child: Text('판매'),
//                                  value: ProgressType.custo,
//                                ),
//                                DropdownMenuItem<ProgressType>(
//                                  child: Text('직판'),
//                                  value: ProgressType.custo1,
//                                ),
//                              ],
//                              onChanged: (ProgressType val) {
//                                setState(() => progressType = val);
//                              },
//                            );
//                          },
//                        ),
//                      ),
//                    ],
//                  ),
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
                            BoxConstraints.tight(Size(boxWide + 50, boxHeight)),
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
                        constraints:
                            BoxConstraints.tight(Size(boxWide + 50, boxHeight)),
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
                    children: [
                      Container(
                        width: boxWide,
                        height: boxHeight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0),
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
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:
                                '돈당 분석료', //거래형태에서 중량선택시 적용, 무땜 1,500원, 땜 2,500원, 칠보 5,000원
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
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '계약금',
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
                        constraints:
                            BoxConstraints.tight(Size(boxWide, boxHeight)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '순금환산', //(순금중량 * 적용시세 + 공임)/적용시세(뒷시세)
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
                            labelText: '시세환산', //(순금중량 * 적용시세 + 공임)
                          ),
                          keyboardType: TextInputType.number,
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
                    constraints: BoxConstraints.tight(
                      Size(boxWide, boxHeight),
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '거래처/모델명/모델번호',
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
//                      ConstrainedBo
//                        constraints: BoxConstraints.tight(
//                          Size(boxWide, boxHeight),
//                        ),
//                        child: RaisedButton(
//                          child: Text(
//                            '추가주문', //버튼 클릭시 모델명 이하 라인이 한줄씩 더 생김
//                            style: TextStyle(color: Colors.white),
//                          ),
//                          color: Colors.orange,
//                          onPressed: () {},
//                        ),
//                      ),
//                      SizedBox(
//                        width: 10,
//                      ),
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
//                      SizedBox(
//                        width: 10,
//                      ),
//                      ConstrainedBox(
//                        constraints: BoxConstraints.tight(
//                          Size(boxWide, boxHeight),
//                        ),
//                        child: RaisedButton(
//                          child: Text(
//                            '주문취소',
//                            style: TextStyle(color: Colors.white),
//                          ),
//                          color: Colors.deepPurpleAccent,
//                          onPressed: () {},
//                        ),
//                      ),
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
