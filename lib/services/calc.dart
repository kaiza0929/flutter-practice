class CalculateService {

  static ShippingCalculator shippingCalculator = new NormalMailShippingCalculator();

  static void setShippingCalculator(String shippingName) {
    if (shippingName == "NormalMail") {
      CalculateService.shippingCalculator = new NormalMailShippingCalculator();
    } else if (shippingName == "RMercari") {
      CalculateService.shippingCalculator = new RMercariShippingCalculator();
    } else if (shippingName == "YMercari") {
      CalculateService.shippingCalculator = new YMercariShippingCalculator();
    } else {
      print("無効な発送方法です");
    }
  }

  static int calc(double longSide, double shortSide, double thickness, double weight) {
    return shippingCalculator.calc(longSide, shortSide, thickness, weight);
  }

}

/* 送料計算クラス */
abstract class ShippingCalculator {
  int calc(double longSide, double shortSide, double thickness, double weight);
}

/* 定形・定形外 */
class NormalMailShippingCalculator extends ShippingCalculator {

  @override
  int calc(double longSide, double shortSide, double thickness, double weight) {

    print("run");

    if (longSide <= 23.5 && shortSide <= 12 && thickness <= 1 && weight <= 50) {
      if (weight <= 25) {
        return 84;
      } else {
        return 94;
      }
    } else if (longSide <= 34 && shortSide <= 25 && thickness <= 3 && weight <= 1000) {
      if (weight <= 50) {
        return 120;
      } else if (weight <= 100) {
        return 140;
      } else if (weight <= 150) {
        return 210;
      } else if (weight <= 250) {
        return 250;
      } else if (weight <= 500) {
        return 390;
      } else {
        return 580;
      }
    } else {
      if (weight <= 50) {
        return 200;
      } else if (weight <= 100) {
        return 220;
      } else if (weight <= 150) {
        return 300;
      } else if (weight <= 250) {
        return 350;
      } else if (weight <= 500) {
        return 510;
      } else if (weight <= 1000) {
        return 710;
      } else if (weight <= 2000) {
        return 1040;
      } else if (weight <= 4000) {
        return 1350;
      } else {
        return -1;
      }
    }

  }

}

/* らくらくメルカリ */
class RMercariShippingCalculator  extends ShippingCalculator {

  @override
  int calc(double longSide, double shortSide, double thickness, double weight) {
    return 0;
  }

}

/* ゆうゆうメルカリ */
class YMercariShippingCalculator extends ShippingCalculator {

  @override
  int calc(double longSide, double shortSide, double thickness, double weight) {
    return 0;
  }

}
