

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * The test class BankAccountTest.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class BankAccountTest
{
    @Test // annotation
    public void testDepositValidation()
    {
        BankAccount acc = new BankAccount();
        acc.deposit(5000);
        acc.deposit(-1000);
        assertEquals(5000, acc.getBalance());
        acc.deposit(3000);
        assertEquals(8000, acc.getBalance());
    }
    
    @Test
    public void testNewAccountIsZeroValidation(){
        BankAccount acc = new BankAccount();
        assertEquals(0.0, acc.getBalance());
    }

}