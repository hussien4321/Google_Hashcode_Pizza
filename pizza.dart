import './coord.dart';

enum Toppings {
  MUSHROOM, TOMATO
}

class Pizza {
  int minimumNumberOfEachIngridientPerSlice;
  int maxSizeOfSlice;
  int widthOfPizza;
  int heightOfPizza;
  List<String> pizzaData;

  Pizza(List<String> data){
    List<int> globalValues = data.removeAt(0).split(' ').map((stringVal) => int.parse(stringVal)).toList();
    heightOfPizza = globalValues[0];
    widthOfPizza = globalValues[1];
    minimumNumberOfEachIngridientPerSlice = globalValues[2];
    maxSizeOfSlice = globalValues[3];
    pizzaData = data;
  }

  @override
  String toString() => "Pizza with WxH ${widthOfPizza}x$heightOfPizza, min ingredients $minimumNumberOfEachIngridientPerSlice and max slice size $maxSizeOfSlice";

  bool isMushroom(String val) => val == "M";

  bool isValidToppingSlice(Coord slice){
    int numMs = 0;
    int numTs = 0;
    for(int x = slice.left; x<slice.right+1; x++){
      for(int y = slice.top; y<slice.bottom+1; y++){
        isMushroom(pizzaData[y][x]) ? numMs++ : numTs++;
        if(numMs >= minimumNumberOfEachIngridientPerSlice && numTs >= minimumNumberOfEachIngridientPerSlice){
          return true;
        } 
      } 
    }

    return false;
  }

  bool isValidSizeSlice(Coord slice){
    return slice.size <= maxSizeOfSlice;
  }

  bool isValidSlice(Coord slice){
    return  slice.left >= 0 && slice.left < widthOfPizza &&
            slice.right >= 0 && slice.right < widthOfPizza &&
            slice.top >= 0 && slice.top < heightOfPizza &&
            slice.bottom >= 0 && slice.bottom < heightOfPizza;
  }
}