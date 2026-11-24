
/**
 * Write a description of class TargetDraver here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class TargetDraver
{
    public void drawTarget(int rings)
    {
        for (int i = 0; i < rings; i++)
        {
            
            int size = 200 - (i * 30);
            if (size <= 0){
                break;
            }
            
            Square square = new Square();
            square.changeSize(size);
            int targetX = 150 - (size / 2);
            int targetY = 150 - (size / 2);
            if (i % 2 == 0)
            {
                square.changeColor("green");
            } else {
                square.changeColor("yellow");
            }
            square.moveHorizontal(targetX - 60);
            square.moveVertical(targetY - 50);
            square.makeVisible();
        }
    }
}