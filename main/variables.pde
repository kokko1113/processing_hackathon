String[] jaWords;
String[] enWords;
int[][] ductPlaces = {
    {80, 40},
    {330, 30},
    {580, 35}
};
int wordIndex = 0;
int typeCount = 0;
float initialTime = 0;
float time = 0;
int min = 0;
int hour = 15000; //一時間を何秒に設定するか(今回は15秒で1時間換算)
boolean isDocumentWatched = false;
boolean isFinished = false;
boolean isGameOver = false;
boolean isTitle = true;
float lastTypeTime = 0;
float typeInterval = 0;
boolean isDuctMonster = false;
boolean isPaperMonster = false;
int ductNumber = 0;
float paperArrivedTime = 0;
float ductArrivedTime = 0;
boolean isJumpScare = false;
float jumpScareTime = 0;
int gameLevel = 1;