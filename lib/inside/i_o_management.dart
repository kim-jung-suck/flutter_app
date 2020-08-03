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
enum IOType {
  ioType,
  pro_sale,
  income,
  repair,
  prepay1,
  buy,
  sale,
  exchange,
  borrowing,
  returning,
  prepay,
  attempt,
  etc
}

class IOManagement extends StatefulWidget {
  static const id = 'i_o_management';
  @override
  _IOManagementState createState() => _IOManagementState();
}

class _IOManagementState extends State<IOManagement> {
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
  IOType ioType = IOType.ioType;

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
  double moneyWide = 120;
  double vatWide = 100;

  void _getchoiceOrder() {
    setState(() {
      choiceOrder = !choiceOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('입출관리'),
      ),
      //금재품의 거래와 금덩어리의 지불관계, 현금의 사용집계를 보기의한 종합창이다.
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        title: Text('입출 리스트 출력'), //체크박스로 선택하여 수정할 수 있게함
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(boxWide - 30, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'No', //순서대로 자동입력
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
                              labelText: '날짜', //
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(delerWide, boxHeight)),
                          child: TextFormField(
                            //15자 입력공간 필요
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '거래처/제조사',
                            ),
                          ),
                        ),
                        Container(
                          width: boxWide - 18,
                          height: dboxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: FormField<IOType>(
                            builder: (FormFieldState<IOType> state) {
                              return DropdownButton<IOType>(
                                value: ioType,
                                items: [
                                  DropdownMenuItem<IOType>(
                                    child: Text(' 구분'),
                                    value: IOType.ioType,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text(
                                      '판매', //재품 판매
                                      style: TextStyle(
                                          color: Colors.purple[
                                              800]), //재품에 관계된 색은 보라색으로 설정
                                    ),
                                    value: IOType.pro_sale,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text(
                                      '입고', //재품 입고
                                      style:
                                          TextStyle(color: Colors.purple[800]),
                                    ),
                                    value: IOType.income,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text(
                                      '수리', //재품 수리
                                      style:
                                          TextStyle(color: Colors.purple[800]),
                                    ),
                                    value: IOType.repair,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text(
                                      '선입', //거래처에서 현금, 금 등을 먼저 입금
                                      style:
                                          TextStyle(color: Colors.purple[800]),
                                    ),
                                    value: IOType.prepay1,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text('매입'), //덩어리 금 매입
                                    value: IOType.buy,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text('매출'), //덩어리 금 판매
                                    value: IOType.sale,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text('교환'), //고금과 교환
                                    value: IOType.exchange,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text('차입'), //덩어리 금 또는 현금을 빌려옴
                                    value: IOType.borrowing,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text('반환'), //빌려온 것을 돌려줌
                                    value: IOType.returning,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text(
                                        '선지급'), //제조사에 금, 현금을 먼저 지급, 제조사에 선지급항목으로 금액표기
                                    value: IOType.prepay,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text(
                                        '미수'), //거래처에서 재품대를 수금하지 못함, 거래처에 미수항목으로 금액표기
                                    value: IOType.attempt,
                                  ),
                                  DropdownMenuItem<IOType>(
                                    child: Text('기타'), //위 항목이외의 지불 또는 입금
                                    value: IOType.etc,
                                  ),
                                ],
                                onChanged: (IOType val) {
                                  setState(() => ioType = val);
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
                              Size(bigoWide - 60, boxHeight)),
                          child: TextFormField(
                            //15자 입력공간 필요
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '내용',
                            ),
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
                                  setState(() => searchType = val);
                                },
                              );
                            },
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tight(Size(moneyWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  '입 현금', //현금이 들어옴, 입출 현황을 구분하기위해 임의로 만든 항목
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
                                  '입 중량', //24k 들어옴, 입출 현황을 구분하기위해 임의로 만든 항목
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
                          constraints:
                              BoxConstraints.tight(Size(moneyWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '매입공급액',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(vatWide, boxHeight),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '매입부가세',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                            Size(moneyWide, boxHeight),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '매입총액',
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
                          constraints:
                              BoxConstraints.tight(Size(boxWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  '출 현금', //현금이 나감, 입출 현황을 구분하기위해 임의로 만든 항목
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
                                  '출 중량', //24k가 나감, 입출 현황을 구분하기위해 임의로 만든 항목
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
                          constraints:
                              BoxConstraints.tight(Size(moneyWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '매출공급액',
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
                              labelText: '매출부가세',
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
                          constraints:
                              BoxConstraints.tight(Size(moneyWide, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '매출총액',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(moneyWide - 20, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '시재잔고',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tight(
                              Size(moneyWide - 20, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '통장잔고',
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
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              labelText: '제품총중량', //24K 재품
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
                              Size(boxWide - 10, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              labelText: '재고중량', //재품이외 24k
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
                              labelStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              labelText: '금지금중량', //VAT 24k
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
                              labelText: '18K중량',
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
                              Size(boxWide + 50, boxHeight)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '비고', //제품이외 24k
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
                child: Row(
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
                    Text('~'),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(boxWide, boxHeight)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '종료일', //주문장으로 부터
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
                            labelText: '거래처/제조사',
                          ),
                          keyboardType: TextInputType.text),
                    ),
                    Container(
                      width: boxWide,
                      height: boxHeight - 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: FormField<IOType>(
                        builder: (FormFieldState<IOType> state) {
                          return DropdownButton<IOType>(
                            value: ioType,
                            items: [
                              DropdownMenuItem<IOType>(
                                child: Text('구분'),
                                value: IOType.ioType,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text(
                                  '판매',
                                  style: TextStyle(color: Colors.purple[800]),
                                ),
                                value: IOType.pro_sale, //제품판매
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text(
                                  '입고',
                                  style: TextStyle(color: Colors.purple[800]),
                                ),
                                value: IOType.income, //제품입고, 입고확인으로 부터 가져온다
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text(
                                  '수리',
                                  style: TextStyle(color: Colors.purple[800]),
                                ),
                                value: IOType.repair, //수리비용 입력
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text(
                                  '선입',
                                  style: TextStyle(color: Colors.purple[800]),
                                ),
                                value: IOType.prepay1,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('매입'),
                                value: IOType.buy,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('매출'),
                                value: IOType.sale,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('교환'),
                                value: IOType.exchange,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('차입'),
                                value: IOType.borrowing,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('반환'),
                                value: IOType.returning,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('선지급'),
                                value: IOType.prepay,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('미수'),
                                value: IOType.attempt,
                              ),
                              DropdownMenuItem<IOType>(
                                child: Text('기타'),
                                value: IOType.etc,
                              ),
                            ],
                            onChanged: (IOType val) {
                              setState(() => ioType = val);
                            },
                          );
                        },
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
                            Size(boxWide, buttonHeight),
                          ),
                          child: RaisedButton(
                            child: Text(
                              '수정', //수정항목에서 선택, 수정내용입력란에 입력,버튼 클릭시 수정내용으로 변경,
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
//구분에 의한 값을 표기할 부분을 고려할 것.
