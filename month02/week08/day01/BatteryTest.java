

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class BatteryTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class BatteryTest
{
    @Test // annotation
    public void testchargeBatteryValidation()
    {
        Battery acc = new Battery();
        acc.chargeBattery(80);
        assertEquals(100, acc.getCharge());
    }
    
    @Test
    public void testgetChargeIsZeroValidation(){
        Battery acc = new Battery();
        acc.chargeBattery(0);
        acc.chargeBattery(-20);
        assertEquals(50, acc.getCharge());
    }
    
    
  
}