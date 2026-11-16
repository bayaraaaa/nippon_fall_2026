import java.awt.Polygon;

/**
 * Triangle — canvas дээр зурж, хөдөлгөж болох гурвалжин.
 * (xPosition, yPosition) нь дээд оройн цэг.
 */
public class Triangle {
    private int height;
    private int width;
    private int xPosition;
    private int yPosition;
    private String color;
    private boolean isVisible;

    /** Шинэ гурвалжин: өндөр 60, суурь 70, орой (210, 140), ногоон. */
    public Triangle() {
        height = 60;
        width = 70;
        xPosition = 210;
        yPosition = 140;
        color = "green";
        isVisible = false;
    }

    /** Гурвалжинг харагддаг болгоно. */
    public void makeVisible() {
        isVisible = true;
        draw();
    }

    /** Гурвалжинг нууна. */
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

    /** Өндөр, суурийг шинэчилнэ. */
    public void changeSize(int newHeight, int newWidth) {
        erase();
        height = newHeight;
        width = newWidth;
        draw();
    }

    /** Өнгийг солино: "red", "blue", "green", "yellow", "black", ... */
    public void changeColor(String newColor) {
        color = newColor;
        draw();
    }

    /** Оройн x. */
    public int getX() {
        return xPosition;
    }

    /** Оройн y. */
    public int getY() {
        return yPosition;
    }

    private void draw() {
        if (isVisible) {
            int[] xs = {xPosition, xPosition + width / 2, xPosition - width / 2};
            int[] ys = {yPosition, yPosition + height, yPosition + height};
            Canvas.getCanvas().draw(this, color, new Polygon(xs, ys, 3));
        }
    }

    private void erase() {
        if (isVisible) {
            Canvas.getCanvas().erase(this);
        }
    }
}
