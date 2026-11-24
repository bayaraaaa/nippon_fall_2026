
/**
 * Write a description of class ShapeDrawer here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class ShapeDrawer
{
    public void drawCircleRow(int count)
    {
        for (int i = 0; i < count; i++)
        {
            Circle circle = new Circle();
            circle.changeSize(30);
            int moveX = (40 + i * 45) - 20;
            int moveY = 100 - 20;
            circle.moveHorizontal(moveX);
            circle.moveVertical(moveY);
            circle.makeVisible();
            
        }
    }
}