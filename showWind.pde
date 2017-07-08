import de.bezier.data.sql.*;
SQLite db;

PImage mapImage, leaf;
Leaf leaves[];
int[] month_day=new int[12];
String windD[];
int windS[];

int m, d;
int temp;
int count; //秒数を計測するために使う
int countD; //日数の総計

void setup() {
  
  size( 700, 755 );
  frameRate(30);
  smooth();
  
  //データ読み込み
  db = new SQLite( this, "weather.db" );

  //フォント読み込み
  PFont font=createFont("Meiryo-48", 28);
  textFont(font);

  //画像読み込み
  mapImage = loadImage( "data/japan_map.png" );
  leaf=loadImage("data/leaf.png");
  
  // 15個 草オブジェクトを用意する
  leaves=new Leaf[15];
  for (int i=0; i<leaves.length; i++) {
    leaves[i]=new Leaf();
  }
  
  //風の方向,速度を格納する配列を用意
  windD=new String[0];
  windS=new int[0];
  
  if ( db.connect() ) {

    String sql = "SELECT month,day,wind_direction,wind_speed FROM weather_table where year=2008 AND prefecture_id=11";
    db.query( sql );
    int temp;

    while ( db.next () ) {
      println(db.getInt("month")+"/"+db.getInt("day")+":"+db.getString("wind_direction")+","+db.getInt("wind_speed"));
      month_day[db.getInt("month")-1]++;

      windD=append(windD, db.getString("wind_direction"));
      windS=append(windS, db.getInt("wind_speed"));
    }
  }
}

void draw() {

  background(255, 0, 0);
  image( mapImage, 0, 0 );

  for (int i=0; i<leaves.length; i++) {
    leaves[i].show();
    leaves[i].move(windS[countD], windD[countD]);
  }

  fill(255, 50, 0);
  rect(10, 10, 100, 100/4);

  fill(255);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("2008年"+(m+1)+"月", 10+100/2, 10+100/8);

  fill(255);
  rect(10, 10+100/4, 100, 3*100/4);

  fill(0);
  textSize(50);
  text((d+1), 10+100/2, 10+3*100/5);

  if (d>month_day[m]-1) {
    m++;
    d=0;
  }
  temp=d;

  //スペースキーを押された回数で倍速を決める
  if (count>2*(30-10*(u%4)) && countD<364) {
    d++;
    countD++;
    count=0;
  } else if (countD>=364) {
    exit();
  }

  count++;

  textSize(15);
  text("倍速 x"+(u%4+1), 200, 50);
  text("press the 'space' key to fast forward (1~4)",300,70); 
}


int u;
void keyPressed() {
  if (keyCode==' ') {
    u++;
  }
}

