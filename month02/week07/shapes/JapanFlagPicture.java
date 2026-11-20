public class JapanFlagPicture
{
    private Square background;
    private Square flagLeft;
    private Square flagRight;
    private Circle redSun;

    public JapanFlagPicture()
    {
        // initialise instance variables
        background = new Square();
        flagLeft = new Square();
        flagRight = new Square();
        redSun = new Circle();
    }
    
    public void draw()
    {
        background.changeColor("black");
        background.changeSize(300);
        background.moveHorizontal(-60);
        background.moveVertical(-50);
        background.makeVisible();
        
        flagLeft.changeColor("white");
        flagLeft.changeSize(160);
        flagLeft.moveHorizontal(-30);
        flagLeft.moveVertical(20);
        flagLeft.makeVisible();
        
        flagRight.changeColor("white");
        flagRight.changeSize(160);
        flagRight.moveHorizontal(50);
        flagRight.moveVertical(20);
        flagRight.makeVisible();
        
        redSun.changeColor("red");
        redSun.changeSize(96);
        redSun.moveHorizontal(332);
        redSun.moveVertical(112);
        redSun.makeVisible();
    }
}