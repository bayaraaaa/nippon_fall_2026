public class Home
{
    private Square wall;
    private Square window;
    private Triangle roof;
    private Circle sun;
    private Circle moon;
    

    public Home()
    {
        wall = new Square();
        window = new Square();
        roof = new Triangle();

        sun = new Circle();
        moon = new Circle();
    }
    
    public void draw()
    {
        wall.changeColor("red");
        wall.changeSize(120);
        wall.moveHorizontal(-130);
        wall.moveVertical(150);
        wall.makeVisible();
        
        window.changeColor("black");
        window.changeSize(40);
        window.moveHorizontal(-100);
        window.moveVertical(180);
        window.makeVisible();
        
        roof.changeColor("green");
        roof.changeSize(60, 160);
        roof.moveHorizontal(30);
        roof.moveVertical(70);
        roof.makeVisible();
        
        sun.changeColor("yellow");
        sun.changeSize(70);
        sun.moveHorizontal(350);
        sun.moveVertical(40);
        sun.makeVisible();
        
        moon.changeColor("blue");
        moon.changeSize(50);
        moon.moveHorizontal(250);
        moon.moveVertical(60);
        moon.makeVisible();
    }

}