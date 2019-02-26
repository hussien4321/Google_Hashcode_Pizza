class Coord {
  int left,top,right,bottom;

  Coord({this.left, this.top, this.right, this.bottom});

  get size => (right-left+1) * (bottom-top+1);

  @override
  String toString() => "$left $top $right $bottom";
}  