/**
 * Picture — хэд хэдэн дүрснээс бүтсэн зураг: байшин ба нар.
 */
public class Picture {
    private Square wall;
    private Square window;
    private Triangle roof;
    private Circle sun;

    /** Зургийн дүрсүүдийг үүсгэнэ (одоохондоо харагдахгүй). */
    public Picture() {
        wall = new Square(100, 150, 120, "red");
        window = new Square(130, 180, 40, "black");
        roof = new Triangle(160, 90, 60, 160, "green");
        sun = new Circle(350, 40, 70, "yellow");
    }

        /** Шөнийн өнгө: нар алга болж, цонх гэрэлтэнэ. */
    public void setNight() {
        wall.changeColor("gray");
        window.changeColor("yellow");
        roof.changeColor("black");
        sun.makeInvisible();
    }

    /** Өдрийн өнгө. */
    public void setDay() {
        wall.changeColor("red");
        window.changeColor("black");
        roof.changeColor("green");
        sun.makeVisible();
    }
    
    public Circle getSun() 
    { 
        return sun; 
    }
    
    /** (x, y)-д мод зурна: хүрэн их бие, ногоон титэм. */
    public void drawTree(int x, int y) {
        Square trunk = new Square(x, y, 20, "brown");
        Circle leaves = new Circle(x - 20, y - 50, 60, "green");
        trunk.makeVisible();
        leaves.makeVisible();
    }
    
    public void forest(int n) 
    { 
        for (int i = 0; i < n; i++) 
        { 
            drawTree(300 + 50 * i, 260); 
        } 
    }
    
    /** Бүх дүрсийг харуулна. */
    public void draw() {
        wall.makeVisible();
        window.makeVisible();
        roof.makeVisible();
        sun.makeVisible();
    }
}