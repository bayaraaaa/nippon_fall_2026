import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GraphicsEnvironment;
import java.awt.RenderingHints;
import java.awt.Shape;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Canvas — дүрсүүдийг зурдаг цонх. Програмд ганц canvas байна:
 * Canvas.getCanvas() үргэлж нэг л canvas буцаана.
 *
 * Энэ класс зөвхөн зурах ажлыг хийнэ. Circle, Square, Triangle-ийн
 * кодыг уншиж ойлгоход энэ классыг ойлгох шаардлагагүй.
 */
public class Canvas {
    private static Canvas canvas;

    /** Ганц canvas-ийг буцаана (байхгүй бол үүсгэнэ). */
    public static Canvas getCanvas() {
        if (canvas == null) {
            canvas = new Canvas("BlueJ зураг", 500, 400);
        }
        return canvas;
    }

    private final Map<Object, Shape> shapes = new LinkedHashMap<>();
    private final Map<Object, Color> colors = new LinkedHashMap<>();
    private JFrame frame;
    private JPanel panel;

    private Canvas(String title, int width, int height) {
        if (GraphicsEnvironment.isHeadless()) {
            return;
        }
        panel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g;
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                for (Object owner : shapes.keySet()) {
                    g2.setColor(colors.get(owner));
                    g2.fill(shapes.get(owner));
                }
            }
        };
        panel.setBackground(Color.WHITE);
        panel.setPreferredSize(new Dimension(width, height));
        frame = new JFrame(title);
        frame.setContentPane(panel);
        frame.pack();
    }

    /** owner дүрсийг өгсөн өнгөөр зурна (өмнө нь зурсан бол шинэчилнэ). */
    public void draw(Object owner, String color, Shape shape) {
        shapes.put(owner, shape);
        colors.put(owner, toColor(color));
        refresh();
    }

    /** owner дүрсийг canvas-аас арилгана. */
    public void erase(Object owner) {
        shapes.remove(owner);
        colors.remove(owner);
        refresh();
    }

    /** Одоо харагдаж байгаа дүрсийн тоо. */
    public int visibleCount() {
        return shapes.size();
    }

    /** milliseconds хугацаагаар хүлээнэ (хөдөлгөөнт зураг). */
    public void wait(int milliseconds) {
        try {
            Thread.sleep(milliseconds);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    private void refresh() {
        if (frame != null) {
            frame.setVisible(true);
            panel.repaint();
        }
    }

    private static Color toColor(String name) {
        switch (name) {
            case "red": return Color.RED;
            case "black": return Color.BLACK;
            case "blue": return Color.BLUE;
            case "yellow": return Color.YELLOW;
            case "green": return new Color(0, 160, 0);
            case "magenta": return Color.MAGENTA;
            case "orange": return Color.ORANGE;
            case "gray": return Color.GRAY;
            case "brown": return new Color(139, 90, 43);
            case "white": return Color.WHITE;
            default: return Color.BLACK;
        }
    }
}
