import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

/**
 * NumberDisplay-ийн тест.
 */
public class NumberDisplayTest {

    @Test
    public void startsAtZero() {
        assertEquals(0, new NumberDisplay(60).getValue());
    }

    @Test
    public void incrementWrapsAtLimit() {
        NumberDisplay display = new NumberDisplay(60);
        display.setValue(59);
        display.increment();
        assertEquals(0, display.getValue());
    }

    @Test
    public void displayValueHasTwoDigits() {
        NumberDisplay display = new NumberDisplay(60);
        display.setValue(5);
        assertEquals("05", display.getDisplayValue());
        display.setValue(42);
        assertEquals("42", display.getDisplayValue());
    }

    @Test
    public void outOfRangeValuesAreIgnored() {
        NumberDisplay display = new NumberDisplay(24);
        display.setValue(7);
        display.setValue(24);
        display.setValue(-1);
        assertEquals(7, display.getValue());
    }
}
