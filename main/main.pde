void setup() {
  size(800, 500);
  PFont font = createFont("Noto Sans JP", 80);
  textFont(font);
  initialTime = millis();
  lastTypeTime = initialTime;
  loadWords();
  changeWord();
  displayField();
}
void draw() {
    // ジャンプスケア
    if(isJumpScare){
        displayJumpScare();

        // 1.2秒後にゲームオーバーへ
        if(millis() - jumpScareTime >= 1200){

            isJumpScare = false;
            isGameOver = true;
        }
        return;
    }
    // タイトル
    if(isTitle){
        displayTitle();
        return;
    }
    // クリア
    if(isFinished){
        displayClear();
        return;
    }
    // ゲームオーバー
    if(isGameOver){
        displayGameOver();
        return;
    }

    if(isDocumentWatched){ // 画面表示分岐
        displayDocument();

        if(isPaperMonster){
            displayPaperMonster();
        }

    } else {
        displayField();

        if(isDuctMonster){
            displayDuctMonster(
                ductPlaces[ductNumber][0],
                ductPlaces[ductNumber][1]
            );
        }
    }

    time = millis() - initialTime;
    min = (int)(time / hour); 
    if(min >= 6) isFinished = true; // ゲームクリア(６時を迎える)

    // 経過時間によってゲームレベル変化
    if(min <= 1)      gameLevel = 1;
    else if(min <= 3) gameLevel = 2;
    else if(min <= 5) gameLevel = 3;
    
    // ダクトにモンスターが現れるか
    if(isDuct() <= ductRate() && !isDuctMonster){
        isDuctMonster = true;
        ductNumber = (int)random(0, 3);
        ductArrivedTime = millis();
    }

    typeInterval = millis() - lastTypeTime;
    if(typeInterval/1000 >= 5 && !isPaperMonster) {
        isPaperMonster = true; // ペーパーモンスター出現
        paperArrivedTime = millis();
    }

    // ゲームオーバー判定
    if(
        (isPaperMonster && (millis() - paperArrivedTime)/1000 >= 7) ||
        (isDuctMonster && (millis() - ductArrivedTime)/1000 >= 3)
    ){
        isJumpScare = true;
        jumpScareTime = millis();
    }
}

void keyPressed(){
    if(isTitle){
        if(key == ' '){
            isTitle = false;

            initialTime = millis();
            lastTypeTime = millis();
        }
        return;
    }
    // ESCキーでリスタート
    if(keyCode == ESC){
        key = 0; // Processing終了防止
        restartGame();
        return;
    }
    switch (key) {
        case ' ': //スペースキーで書類を見てるか切り替え
            isDocumentWatched = !isDocumentWatched;
            break;
        case '1': // ダクトのモンスターを追い払う
        case '2':
        case '3':
            hitMonster(key);
            break;
        default:
            typeWords(key);
            break;
    }
}

void restartGame() {
    if(!isGameOver && !isFinished) return;

    isGameOver = false;
    isFinished = false;

    isDocumentWatched = false;

    typeCount = 0;

    min = 0;

    paperArrivedTime = 0;
    ductArrivedTime = 0;

    typeInterval = 0;
    time = 0;

    initialTime = millis();
    lastTypeTime = millis();

    isPaperMonster = false;
    isDuctMonster = false;

    gameLevel = 1;

    changeWord();
}

void hitMonster(char key) {
    if(!isDuctMonster) return;

    if(key - '1' == ductNumber){
        ductArrivedTime = 0;
        isDuctMonster = false;
    }
}

void typeWords(char key) {
    if(!isDocumentWatched) return;

    // 文字数を超えていたら停止
    if(typeCount >= enWords[wordIndex].length()) return;

    // 正しい文字なら進む
    if(key == enWords[wordIndex].charAt(typeCount)) {
        typeCount++;
    }

    // 単語クリア
    if(typeCount >= enWords[wordIndex].length()) {
        typeCount = 0;

        changeWord();

        isPaperMonster = false;

        lastTypeTime = millis();

        typeInterval = 0;
    }
}

float ductRate() {
    float rate = 0;
    if(gameLevel == 1)      rate = 0.005;
    else if(gameLevel == 2) rate = 0.01;
    else if(gameLevel == 3) rate = 0.03;
    return rate;
}

float isDuct(){ //ダクトにモンスターが現れるか確率で判定
    return random(1);
}

void loadWords() {
  JSONArray json = loadJSONArray("words.json");
  jaWords = new String[json.size()];
  enWords = new String[json.size()];

  for (int i = 0; i < json.size(); i++) {
    JSONObject word = json.getJSONObject(i);
    jaWords[i] = word.getString("ja");
    enWords[i] = word.getString("en");
  }
}

void changeWord() { wordIndex = (int)random(jaWords.length); }