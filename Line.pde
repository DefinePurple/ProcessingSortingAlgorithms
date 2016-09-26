class Line {
  PVector top;
  PVector bottom;

  Line(PVector p1, PVector p2) {
    top = new PVector(p1.x, p1.y);
    bottom = new PVector(p2.x, p2.y);
  }

  void create(int pos_x, int pos_y) {
    line(top.x+pos_x, top.y+pos_y, bottom.x+pos_x, bottom.y+pos_y);
  }  

  float size() {
    return bottom.y - top.y;
  }
}