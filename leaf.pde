
class Leaf {
  float x;
  float y;


  Leaf() {
    x=(int)random(100, 600);
    y=(int)random(100, 600);
  }

  void show() {
    image(leaf, x, y);
  }
  
  void info(){
   
  }

  void move(int s, String d) {
    if (d.equals("N")) {
      x+=s*cos(radians(90));
      y-=s*sin(radians(90));
    } else if (d.equals("NNE")) {
      x+=s*cos(radians(67.5));
      y-=s*sin(radians(67.5));
    } else if (d.equals("NE")) {
      x+=s*cos(radians(45.0));
      y-=s*sin(radians(45.0));
    } else if (d.equals("ENE")) {
      x+=s*cos(radians(22.5));
      y-=s*sin(radians(22.5));
    } else if (d.equals("E")) {
      x+=s*cos(radians(0));
      y-=s*sin(radians(0));
    } else if (d.equals("ESE")) {
      x+=s*cos(radians(337.5));
      y-=s*sin(radians(337.5));
    } else if (d.equals("SE")) {
      x+=s*cos(radians(315.0));
      y-=s*sin(radians(315.0));
    } else if (d.equals("SSE")) {
      x+=s*cos(radians(292.5));
      y-=s*sin(radians(292.5));
    } else if (d.equals("S")) {
      x+=s*cos(radians(270.0));
      y-=s*sin(radians(270.0));
    } else if (d.equals("SSW")) {
      x+=s*cos(radians(247.5));
      y-=s*sin(radians(247.5));
    } else if (d.equals("SW")) {
      x+=s*cos(radians(225.0));
      y-=s*sin(radians(225.0));
    } else if (d.equals("WSW")) {
      x+=s*cos(radians(202.5));
      y-=s*sin(radians(202.5));
    } else if (d.equals("W")) {
      x+=s*cos(radians(180));
      y-=s*sin(radians(180));
    } else if (d.equals("WNW")) {
      x+=s*cos(radians(157.5));
      y-=s*sin(radians(157.5));
    } else if (d.equals("NW")) {
      x+=s*cos(radians(135.0));
      y-=s*sin(radians(135.0));
    } else if (d.equals("NNW")) {
      x+=s*cos(radians(112.5));
      y-=s*sin(radians(112.5));
    }

    if (x>700) {
      x=0;
    }
    if (y>755) {
      y=0;
    }
    if (x<0) {
      x=700;
    }
    if (y<0) {
      y=700;
    }
  }
}

