void drawCreepyEye(float x, float y, float size){   
    noStroke();

    fill(150, 0, 0);
    ellipse(x, y, size, size);

    fill(240);
    ellipse(x, y, size * 0.7, size * 0.7);

    fill(255, 0, 0);
    ellipse(x, y, size * 0.35, size * 0.35);

    fill(0);
    ellipse(x, y, size * 0.15, size * 0.15);
}

void drawGrave(float x, float y, float w, float h){
    pushMatrix();

    translate(x, y);

    // 墓石
    fill(120);

    stroke(70);
    strokeWeight(4);

    rect(0, h*0.2, w, h*0.8, 8);

    arc(
        w/2,
        h*0.2,
        w,
        h*0.4,
        PI,
        TWO_PI
    );

    // 十字架
    stroke(30);

    line(w/2, h*0.3, w/2, h*0.7);
    line(w*0.35, h*0.45, w*0.65, h*0.45);

    popMatrix();
}

void drawEye(float x, float y, float size) {
  // 白目
  fill(230);
  ellipse(x, y, size, size);

  // 赤目
  fill(255, 0, 0);
  ellipse(x, y, size * 0.6, size * 0.6);

  // 黒目
  fill(0);
  ellipse(x, y, size * 0.25, size * 0.25);
}

void drawDuct(float x, float y) {
  pushMatrix();

  translate(x, y);

  // 外枠
  fill(85);
  stroke(40);
  strokeWeight(5);

  rect(0, 0, 180, 140, 12);

  // 内側
  fill(55);
  rect(12, 12, 156, 116, 8);

  // 奥の暗闇
  noStroke();
  fill(15);
  rect(25, 25, 130, 90, 6);

  popMatrix();
}

void drawPaper(float x, float y, float angle) {
  pushMatrix();

  translate(x, y);
  rotate(radians(angle));

  fill(240);
  stroke(180);

  rect(0, 0, 120, 80);

  // 線
  stroke(200);

  for (int i = 15; i < 70; i += 12) {
    line(10, i, 100, i);
  }

  popMatrix();
}

void drawPoster(float x, float y){
  pushMatrix();

  translate(x, y + 40); // ← 40下に移動

  // ポスター本体
  stroke(40);
  strokeWeight(4);

  fill(230, 220, 170);

  rect(0, 0, 180, 210, 8);

  // タイトル
  fill(120, 0, 0);

  textAlign(CENTER, CENTER);

  textSize(22);

  text("DUCT NOTICE", 90, 30);

  // 区切り線
  stroke(100);

  line(20, 50, 160, 50);

  // ダクト番号説明
  fill(30);

  textSize(26);

  text("LEFT  : 1", 90, 90);
  text("CENTER: 2", 90, 135);
  text("RIGHT : 3", 90, 180);
  
  popMatrix();
}