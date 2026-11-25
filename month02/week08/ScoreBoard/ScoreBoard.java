/**
* Тоглоомын оноо болон үеийг (level) бүртгэх класс.
*
* @author Khangaikhuu
*/
public class ScoreBoard {
    private int score;
    private int level;
    public ScoreBoard() {
        // TODO 1: score = 0, level = 1 болгож эхлүүлнэ.
        score = 0;
        level = 1;
    }
    // TODO 2: getScore гэдэг нэртэй method бичнэ үү (() -> int)
    public int getScore(){
        return score;
    }
    // TODO 3: getLevel гэдэг нэртэй method бичнэ үү (() -> int)
    public int getLevel(){
        return level;
    }
    // TODO 4: addPoints гэдэг нэртэй method бичнэ үү
    // int -> void (points гэдэг параметр авна)
    // Хэрэв points > 0 бол score-ийг нэмнэ.
    // Хэрэв score нь 100-д хүрэх буюу давбал level = (score / 100) + 1 болж шинэчлэгдэнэ.
    public void addPoints(int points){
         if (points > 0){
             score = score + points;
         }
         if (score >= 100){
             level = (score / 100) + 1;
         }
     }
}