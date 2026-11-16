import java.awt.Rectangle;

/**
 * Square — canvas дээр зурж, хөдөлгөж болох квадрат.
 */
public class Square {
    private int size;
    private int xPosition;
    private int yPosition;
    private String color;
    private boolean isVisible;

    /** Шинэ квадрат: тал 60, байрлал (310, 120), улаан. */
    public Square() {
        size = 60;
        xPosition = 310;
        yPosition = 120;
        color = "red";
        isVisible = false;
    }

    /** Квадратыг харагддаг болгоно. */
    public void makeVisible() {
        isVisible = true;
        draw();
    }

    /** Квадратыг нууна. */
    public void makeInvisible() {
        erase();
        isVisible = false;
    }

    /** Баруун тийш 20 пиксел. */
    public void moveRight() {
        moveHorizontal(20);
    }

    /** Зүүн тийш 20 пиксел. */
    public void moveLeft() {
        moveHorizontal(-20);
    }

    /** Дээш 20 пиксел. */
    public void moveUp() {
        moveVertical(-20);
    }

    /** Доош 20 пиксел. */
    public void moveDown() {
        moveVertical(20);
    }

    /** Хэвтээ чиглэлд distance пиксел (сөрөг бол зүүн тийш). */
    public void moveHorizontal(int distance) {
        erase();
        xPosition = xPosition + distance;
        draw();
    }

    /** Босоо чиглэлд distance пиксел (сөрөг бол дээш). */
    public void moveVertical(int distance) {
        erase();
        yPosition = yPosition + distance;
        draw();
    }

    /** Хэвтээ чиглэлд аажмаар хөдөлнө. */
    public void slowMoveHorizontal(int distance) {
        int step = 1;
        if (distance < 0) {
            step = -1;
            distance = -distance;
        }
        for (int i = 0; i < distance; i++) {
            xPosition = xPosition + step;
            draw();
            Canvas.getCanvas().wait(10);
        }
    }

    /** Талын уртыг newSize болгоно. */
    public void changeSize(int newSize) {
        erase();
        size = newSize;
        draw();
    }

    /** Өнгийг солино: "red", "blue", "green", "yellow", "black", ... */
    public void changeColor(String newColor) {
        color = newColor;
        draw();
    }

    /** Зүүн дээд булангийн x. */
    public int getX() {
        return xPosition;
    }

    /** Зүүн дээд булангийн y. */
    public int getY() {
        return yPosition;
    }

    private void draw() {
        if (isVisible) {
            Canvas.getCanvas().draw(this, color, new Rectangle(xPosition, yPosition, size, size));
        }
    }

    private void erase() {
        if (isVisible) {
            Canvas.getCanvas().erase(this);
        }
    }
}
