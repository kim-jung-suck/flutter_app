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
enum SetType { settype, ring, neck, barcelet, ering, etc }
enum OpenType { opentype, open, close }

//아래와 같은 형식으로 데이터가 저장되어 보여준다는 의미임.(양식의 개념)
class Catalog extends StatefulWidget {
  static const id = 'catalog';
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final _formKey = GlobalKey<FormState>();

  GoldType searchType = GoldType.metal;
  LengthType choiceLength = LengthType.danwi;
  ModelType searchModel = ModelType.model;
  WeightType choiceWeight = WeightType.don;
  SetType setType = SetType.settype;
  OpenType openType = OpenType.opentype;

  double boxWide = 100;
  double boxHeight = 75;
  bool stopLine = true;

  void _getExtraLine() {
    setState(() {
      stopLine = !stopLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카다로그'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('사진 640(w)*480(h), 업로드 최대500kb, jpg,jpeg,gif,png1'),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(boxWide + 100, boxHeight)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: //자동 검색 기존 입력비교
                              '제조사', //
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(boxWide + 150, boxHeight)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: //자동 검색 기존 입력비교
                              '모델명', //
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(boxWide + 150, boxHeight)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '모델번호',
                        ),
                        keyboardType: TextInputType.text,
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
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(boxWide, boxHeight)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '공임1', //판매금액임.
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
                          labelText: '공임2', //판매금액임.
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
                          labelText: '공임3', //판매금액임.
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
                          labelText: '매입공임', //매입단가는 오너만 볼 수 있게함
                          labelStyle: TextStyle(color: Colors.red),
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
                          BoxConstraints.tight(Size(boxWide, boxHeight)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '등록일',
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
                          labelText: '비고',
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tight(
                            Size(boxWide + 40, boxHeight - 18)),
                        child: ListTile(
                          onTap: _getExtraLine, //모델명을 문자 중앙에 라인이 그어지게 작업
                          title: Text('단종'),
                          leading: stopLine
                              ? Icon(Icons.check_box_outline_blank)
                              : Icon(
                                  Icons.check_box,
                                  color: Colors.pink,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(
                        Size(boxWide + 50, boxHeight),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '세트관련번호',
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
                      child: FormField<SetType>(
                        builder: (FormFieldState<SetType> state) {
                          return DropdownButton<SetType>(
                            value: setType,
                            items: [
                              DropdownMenuItem<SetType>(
                                child: Text('세트구분'),
                                value: SetType.settype,
                              ),
                              DropdownMenuItem<SetType>(
                                child: Text('목걸이'),
                                value: SetType.neck,
                              ),
                              DropdownMenuItem<SetType>(
                                child: Text('귀걸이'),
                                value: SetType.ering,
                              ),
                              DropdownMenuItem<SetType>(
                                child: Text('팔찌'),
                                value: SetType.barcelet,
                              ),
                              DropdownMenuItem<SetType>(
                                child: Text('반지'),
                                value: SetType.ring,
                              ),
                              DropdownMenuItem<SetType>(
                                child: Text('기타'),
                                value: SetType.etc,
                              ),
                            ],
                            onChanged: (SetType val) {
                              setState(() => setType = val);
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
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: FormField<OpenType>(
                        builder: (FormFieldState<OpenType> state) {
                          return DropdownButton<OpenType>(
                            value: openType,
                            items: [
                              DropdownMenuItem<OpenType>(
                                child: Text('공개여부'),
                                value: OpenType.opentype,
                              ),
                              DropdownMenuItem<OpenType>(
                                child: Text('외부공개'),
                                value: OpenType.open,
                              ),
                              DropdownMenuItem<OpenType>(
                                child: Text('비공개'),
                                value: OpenType.close,
                              ),
                            ],
                            onChanged: (OpenType val) {
                              setState(() => openType = val);
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      keyboardType: TextInputType.number),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(
                    Size(boxWide + 60, boxHeight),
                  ),
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '제조사/모델명/모델번호',
                      ),
                      keyboardType: TextInputType.text),
                ),
                IconButton(icon: Icon(Icons.search), onPressed: () {})
              ], //검색이 중량, 제조사, 모델명, 모델번호로 된다. 제조사, 모델명, 모델번호는 같은 란에서 검색
            ),
            Container(
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tight(
                      Size(boxWide, boxHeight),
                    ),
                    child: RaisedButton(
                      child: Text(
                        '중량추가', //버튼 클릭시 중량, 사이즈, 공임 한줄씩 더 생김
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
                        '등록',
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
                        '멀티등록', //여러 줄을 만들어 준다. 사진입력은 없고 한번에 여러 제품을 입력하게 하여 입력자의 수고를 덜어준다.
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.teal,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
