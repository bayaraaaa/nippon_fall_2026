

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class StepCounterTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class StepCounterTest
{
    
    @Test // annotation
    public void testaddStepsValidation()
    {
        StepCounter acc = new StepCounter();
        acc.addSteps(250);
        acc.addSteps(-50);
        assertEquals(250, acc.getSteps());
    }
    
    @Test
    public void testgetStepsIsZeroValidation(){
        StepCounter acc = new StepCounter();
        acc.reset();
        assertEquals(0, acc.getSteps());
    }
}