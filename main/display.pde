void displayField(){
    // 背景
    fill(150);
    rect(0, 0, 800, 500);

    // ダクト
    drawDuct(60, 10);
    drawDuct(310, -10);
    drawDuct(560, 20);

     // デスク
    noStroke();
    fill(120, 80, 50);
    rect(0, 300, 800, 200);

    // 書類
    drawPaper(120, 340, -10);
    drawPaper(220, 370, 8);
    drawPaper(340, 330, -5);
    drawPaper(500, 360, 12);
    drawPaper(620, 320, -15);

    // ペン
    pushMatrix();

    stroke(0);
    strokeWeight(2);

    translate(650, 420);
    rotate(radians(20));

    fill(220, 220, 80);
    rect(0, 0, 90, 12);

    fill(255, 100, 100);
    rect(75, 0, 15, 12);

    popMatrix();

    // デジタル時計
    pushMatrix();

    translate(560, 320);

    // 本体
    fill(25);
    stroke(10);
    strokeWeight(4);
    rect(0, 0, 180, 100, 12);

    // 画面
    fill(20, 70, 20);
    rect(15, 15, 150, 60, 6);

    // 時間表示
    fill(120, 255, 120);

    textAlign(CENTER, CENTER);
    textSize(50);

    text(min + ":00", 90, 45);

    // ボタン
    fill(70);
    rect(25, 82, 25, 8);
    rect(130, 82, 25, 8);

    popMatrix();

    // コーヒーカップ
    fill(230);
    ellipse(90, 420, 60, 60);

    fill(80, 50, 30);
    ellipse(90, 420, 45, 45);

    drawPoster(20, 120);

    noFill();
    stroke(230);
    strokeWeight(5);
    arc(120, 420, 20, 25, -HALF_PI, HALF_PI);
}

void displayDocument() {
    fill(255);
    rect(0, 0, 800, 500);

    fill(0);
    textSize(80);
    textAlign(CENTER);
    text(jaWords[wordIndex], width/2, 220);

    textSize(40);
    if(typeCount > 0){
        for(int i=0; i<enWords[wordIndex].length(); i++){
            if(i <= typeCount - 1) fill(#ff0000);
            else fill(0);
            text(enWords[wordIndex].charAt(i), 250 + i*25, 320);
        }
    }
    else {
        fill(0);
        for(int i=0; i<enWords[wordIndex].length(); i++){
            text(enWords[wordIndex].charAt(i), 250 + i*25, 320);
        }
    } 
}

void displayPaperMonster() {
    if(!isDocumentWatched) return;
    
    stroke(0);
    strokeWeight(4);
    fill(#00ff00); 
    ellipse(150, 150, 100, 100); 
    fill(0); 
    ellipse(150, 150, 50, 50); 
    fill(255); 
    ellipse(140, 140, 15, 15);
}

void displayDuctMonster(float x, float y) {
  pushMatrix();

  translate(x, y);

  // 本体
  noStroke();
  fill(170, 20, 20);

  beginShape();

  vertex(20, 10);
  vertex(80, 5);
  vertex(95, 30);
  vertex(90, 80);
  vertex(60, 95);
  vertex(20, 90);
  vertex(5, 60);
  vertex(10, 25);

  endShape(CLOSE);

  // 模様
  fill(120, 0, 0);

  ellipse(30, 30, 15, 10);
  ellipse(70, 25, 20, 12);
  ellipse(50, 75, 18, 10);

  // 目
  drawEye(30, 45, 18);
  drawEye(55, 35, 22);
  drawEye(70, 60, 16);

  popMatrix();
}

void displayJumpScare(){
    background(120, 0, 0);

    // 画面揺れ
    float shakeX = random(-20, 20);
    float shakeY = random(-20, 20);

    pushMatrix();

    translate(shakeX, shakeY);

    // 顔
    fill(20);

    ellipse(width/2, height/2, 500, 500);

    // 目
    fill(255);

    ellipse(width/2 - 90, height/2 - 40, 120, 120);
    ellipse(width/2 + 90, height/2 - 40, 120, 120);

    // 瞳
    fill(255, 0, 0);

    ellipse(width/2 - 90, height/2 - 40, 60, 60);
    ellipse(width/2 + 90, height/2 - 40, 60, 60);

    // 口
    fill(180, 0, 0);

    arc(width/2, height/2 + 100, 220, 160, 0, PI);

    popMatrix();

    // ノイズ線
    stroke(255);

    for(int i=0; i<30; i++){

        line(
            random(width),
            random(height),
            random(width),
            random(height)
        );
    }
}

void displayClear(){
    // 空
    background(135, 206, 235);

    // 太陽
    noStroke();

    fill(255, 230, 120);
    ellipse(700, 80, 140, 140);

    // 地面
    fill(70, 120, 70);
    rect(0, 400, width, 100);

    // 建物
    fill(40);

    rect(80, 200, 120, 200);
    rect(250, 160, 150, 240);
    rect(470, 220, 100, 180);
    rect(620, 180, 140, 220);

    // 半透明パネル
    fill(0, 180);
    rect(140, 120, 520, 220, 20);

    // クリア文字
    fill(255);

    textAlign(CENTER, CENTER);

    textSize(65);
    text("CLEAR!", width/2, 180);

    // 説明
    textSize(28);

    text(
        "You survived the graveyard shift",
        width/2,
        250
    );

    text(
        "6:00 AM",
        width/2,
        295
    );

    // リスタート
    fill(255, 220, 120);

    if(frameCount % 60 < 30){

        textSize(30);

        text(
            "PRESS Esc TO RESTART",
            width/2,
            420
        );
    }
}

void displayTitle(){
    background(15);

    // ダクト
    drawDuct(60, 20);
    drawDuct(310, 0);
    drawDuct(560, 30);

    // タイトル
    fill(255, 0, 0);

    textAlign(CENTER, CENTER);

    textSize(70);
    text("GRAVEYARD SHIFT", width/2, 170);

    // サブタイトル
    fill(220);

    textSize(28);

    text("Typing Horror Game", width/2, 230);

    // 開始案内
    fill(120, 255, 120);

    textSize(35);

    if(frameCount % 60 < 30){
        text("PRESS SPACE", width/2, 380);
    }

    // 目玉
    drawCreepyEye(120, 100, 60);
    drawCreepyEye(700, 90, 80);
    drawCreepyEye(650, 420, 70);
}

void displayGameOver(){
    background(10);

    // 地面
    noStroke();

    fill(40, 50, 40);
    rect(0, 350, width, 150);

    // 月
    fill(220);
    ellipse(700, 90, 100, 100);

    // 墓石
    drawGrave(120, 260, 90, 120);
    drawGrave(280, 230, 110, 150);
    drawGrave(500, 250, 100, 130);
    drawGrave(660, 220, 120, 160);

    // タイトル
    fill(255, 0, 0);

    textAlign(CENTER, CENTER);

    textSize(75);
    text("YOU  DIED", width/2, 120);

    // サブ
    fill(220);

    textSize(25);

    text(
        "You became part of the graveyard...",
        width/2,
        190
    );

    // リスタート
    fill(120, 255, 120);

    if(frameCount % 60 < 30){

        textSize(30);

        text(
            "PRESS ESC TO RESTART",
            width/2,
            440
        );
    }

    // 不気味な目
    drawCreepyEye(60, 380, 70);
    drawCreepyEye(100, 420, 40);
}