
/**
 * Write a description of class StaircaseBiulder here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class StaircaseBiulder
{
    public void biuldStairs(int steps) {
        for (int i = 0; i < steps; i++)
        {
            Square s = new Square();
            s.changeSize(25);
            s.changeColor("blue");
            int moveX = 50 + (i * 25);
            int moveY = 220 - (i * 25);
            s.moveHorizontal(moveX - 60);
            s.moveVertical(moveY - 50);
            s.makeVisible();
        }
    }
}