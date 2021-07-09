import "./../states/shipping.dart";

Shipping callCalculateFunction(String shippingName, double longSide, double shortSide, double thickness, double weight) {
  
  if (shippingName == "普通郵便") {
    return normalMailShippingCalculate(longSide, shortSide, thickness, weight);
  } else if (shippingName == "らくらくメルカリ便") {
    return rMercariShippingCalculate(longSide, shortSide, thickness, weight);
  } else if (shippingName == "ゆうゆうメルカリ便") {
    return yMercariShippingCalculate(longSide, shortSide, thickness, weight);
  } else {
    print("無効な発送方法です");
    return new Shipping("", "", -1);
  }

}

Shipping normalMailShippingCalculate(double longSide, double shortSide, double thickness, double weight) {

  String name = "普通郵便";
  String type = "";
  int fee = -1;

  if (longSide <= 23.5 && shortSide <= 12 && thickness <= 1 && weight <= 50) {
    type = "定形郵便";
    if (weight <= 25) {
      fee = 84;
    } else {
      fee = 94;
    }
  } else if (longSide <= 34 && shortSide <= 25 && thickness <= 3 && weight <= 1000) {
    type = "定形外郵便 規格内";
    if (weight <= 50) {
      fee = 120;
    } else if (weight <= 100) {
      fee = 140;
    } else if (weight <= 150) {
      fee = 210;
    } else if (weight <= 250) {
      fee = 250;
    } else if (weight <= 500) {
      fee = 390;
    } else {
      fee = 580;
    }
  } else {
    type = "定形外郵便 規格外";
    if (weight <= 50) {
      fee = 200;
    } else if (weight <= 100) {
      fee = 220;
    } else if (weight <= 150) {
      fee =  300;
    } else if (weight <= 250) {
      fee =  350;
    } else if (weight <= 500) {
      fee =  510;
    } else if (weight <= 1000) {
      fee =  710;
    } else if (weight <= 2000) {
      fee =  1040;
    } else if (weight <= 4000) {
      fee =  1350;
    } else {
      name = "該当なし";
      type = "";
    }
  }

  return new Shipping(name, type, fee);

}

Shipping rMercariShippingCalculate(double longSide, double shortSide, double thickness, double weight) {

  String name = "らくらくメルカリ便";
  String type = "";
  int fee = -1;

  if (longSide <= 31.2 && shortSide <= 22.8 && thickness <= 3 && weight <= 1000) {
    type = "ネコポス";
    fee = 175;
  } else if (longSide <= 25 && shortSide <= 20 && thickness <= 5) {
    type = "宅急便コンパクト箱型 別途専用資材(70円)の購入が必要";
    fee = 380;
  } else if (longSide <= 34 && shortSide <= 28) {
    type = "宅急便コンパクト薄型 別途専用資材(70円)の購入が必要";
    fee = 380;
  } else if (longSide + shortSide + thickness <= 60 && weight < 2000) {
    type = "宅急便 60サイズ";
    fee = 700;
  } else if (longSide + shortSide + thickness <= 80 && weight < 5000) {
    type = "宅急便 80サイズ";
    fee = 800;
  } else if (longSide + shortSide + thickness <= 100 && weight < 10000) {
    type = "宅急便 100サイズ";
    fee = 1000;
  } else if (longSide + shortSide + thickness <= 120 && weight < 15000) {
    type = "宅急便 120サイズ";
    fee = 1100;
  } else if (longSide + shortSide + thickness <= 140 && weight < 20000) {
    type = "宅急便 140サイズ";
    fee = 1300;
  } else if (longSide + shortSide + thickness <= 160 && weight < 25000) {
    type = "宅急便 160サイズ";
    fee = 1600;
  } else {
    name = "該当なし";
  }

  return new Shipping(name, type, fee);


}

Shipping yMercariShippingCalculate(double longSide, double shortSide, double thickness, double weight) {

  return new Shipping("ゆうゆうメルカリ便", "", -1);

}
