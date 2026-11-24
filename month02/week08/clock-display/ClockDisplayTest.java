import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

/**
 * ClockDisplay-ийн тест.
 */
public class ClockDisplayTest {

    @Test
    public void newClockShowsMidnight() {
        assertEquals("00:00", new ClockDisplay().getTime());
    }

    @Test
    public void timeIsFormattedWithLeadingZeros() {
        assertEquals("09:05", new ClockDisplay(9, 5).getTime());
    }

    @Test
    public void tickMovesOneMinute() {
        ClockDisplay clock = new ClockDisplay(10, 15);
        clock.timeTick();
        assertEquals("10:16", clock.getTime());
    }

    @Test
    public void tickRollsOverToTheNextHour() {
        ClockDisplay clock = new ClockDisplay(10, 59);
        clock.timeTick();
        assertEquals("11:00", clock.getTime());
    }

    @Test
    public void tickRollsOverAtMidnight() {
        ClockDisplay clock = new ClockDisplay(23, 59);
        clock.timeTick();
        assertEquals("00:00", clock.getTime());
    }
}
