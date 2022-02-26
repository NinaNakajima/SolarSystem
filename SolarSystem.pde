float angle;  //アングルを自動的に変えるための変数
float s1;
float s2;
float s3;
float s4;
float s5;
float s6;
float s7;
float s8;

void setup() {
  size(1000, 1000, P3D);  //3D
  angle = 0;
}

void draw() {
  background(0);  //背景は黒
  translate(width / 2, height / 2);  //中央に表示
  
  //光
  ambientLight(100, 100, 100);  //環境光
  directionalLight(255, 250, 211, 0, 0, -20);  //指向性ライト

  //アングルの指定
  angle += 0.1;
  if (angle > 360) {
    angle = 0;
  }
  rotateX(radians(angle));  //自動的にアングルを変える
  rotateX(mouseX / 200.0);  //マウスの動きでアングルを変える
  rotateY(mouseY / 200.0);
  objPlanet();  //objPlanetの呼び出し
  objSun();  //objSunの呼び出し
  objSaturn();  //土星の輪
 
  //惑星の公転速度
  s1 += 0.4/2;
  s2 += 0.157/2;
  s3 += 0.095/2;
  s4 += 0.05/2;
  s5 += 0.0082/2;
  s6 += 0.0033/2;
  s7 += 0.0029/2;
  s8 += 0.00058/2;
}

void objSun(){
  noStroke();
  fill(255, 100, 0);
  sphere(70);
}

void objPlanet(){
  Planet(234, 215, 166, 8, 200, 1);  //水星
  Planet(234, 202, 114, 13, 250, 2);  //金星
  Planet(50, 200, 200, 15, 320, 3);  //地球
  Planet(200, 112, 80, 12, 390, 4);  //火星
  Planet(220, 185, 145, 40, 520, 5);  //木星
  Planet(245, 230, 180, 22, 650, 6);  //土星
  Planet(170, 210, 205, 18, 800, 7);  //天王星
  Planet(85, 150, 200, 17, 940, 8);  //海王星
}

void Planet(int red, int green, int blue, int radius, int diameter, int number) {
  //惑星
  pushMatrix();
  noStroke();
  float x,y;
  switch(number){
    case 1:
      x = diameter*cos(s1)/2;  //回る diameter=周回軌道の直径(幅)
      y = diameter*sin(s1)/2;  //s1～s8=角度,スピード　直径なので2で割る        
      translate(x, y);  //位置指定
      break;
    case 2:
      x = diameter*cos(s2)/2;  
      y = diameter*sin(s2)/2;         
      translate(x, y);
      break;
    case 3:
      x = diameter*cos(s3)/2;  
      y = diameter*sin(s3)/2;         
      translate(x, y);
      break;
    case 4:
      x = diameter*cos(s4)/2;  
      y = diameter*sin(s4)/2;         
      translate(x, y);
      break;
    case 5:
      x = diameter*cos(s5)/2;  
      y = diameter*sin(s5)/2;         
      translate(x, y);
      break;
    case 6:
      x = diameter*cos(s6)/2;  
      y = diameter*sin(s6)/2;         
      translate(x, y);
      break;
    case 7:
      x = diameter*cos(s7)/2;  
      y = diameter*sin(s7)/2;         
      translate(x, y);
      break;
    case 8:
      x = diameter*cos(s8)/2;  
      y = diameter*sin(s8)/2;         
      translate(x, y);
      break;
  }
  fill(red, green, blue);  //色の指定
  sphere(radius);  //半径radiusの球体
  popMatrix();
  
  //周回軌道
  pushMatrix();
  stroke(100);
  strokeWeight(1);
  noFill();
  ellipse(0, 0, diameter, diameter);  //周回軌道は円(球体でない)，(x座標，y座標，幅，高さ)
  popMatrix();
}

void objSaturn() {
  pushMatrix();
  stroke(240, 210, 80);
  strokeWeight(4);
  noFill();
  float a, b ;
  a = 650*cos(s6)/2;  
  b = 650*sin(s6)/2;         
  ellipse(a, b, 60, 60);
  popMatrix();
}
