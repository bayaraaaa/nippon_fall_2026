import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * TicketMachine-ийн тест. Бүгд ногоон болтол TicketMachine-ийг засна.
 */
public class TicketMachineTest {
    private TicketMachine machine;

    @BeforeEach
    public void setUp() {
        machine = new TicketMachine(1000);
    }

    @Test
    public void insertMoneyAddsToBalance() {
        machine.insertMoney(500);
        machine.insertMoney(200);
        assertEquals(700, machine.getBalance());
    }

    @Test
    public void zeroAndNegativeMoneyAreRejected() {
        machine.insertMoney(0);
        machine.insertMoney(-100);
        assertEquals(0, machine.getBalance());
    }

    @Test
    public void ticketIsPrintedWhenBalanceIsEnough() {
        machine.insertMoney(1500);
        machine.printTicket();
        assertEquals(500, machine.getBalance());
        assertEquals(1000, machine.getTotal());
    }

    @Test
    public void exactBalanceIsEnough() {
        machine.insertMoney(1000);
        machine.printTicket();
        assertEquals(0, machine.getBalance());
        assertEquals(1000, machine.getTotal());
    }

    @Test
    public void noTicketWhenBalanceIsShort() {
        machine.insertMoney(500);
        machine.printTicket();
        assertEquals(500, machine.getBalance());
        assertEquals(0, machine.getTotal());
    }

    @Test
    public void refundReturnsBalanceAndEmptiesIt() {
        machine.insertMoney(700);
        assertEquals(700, machine.refundBalance());
        assertEquals(0, machine.getBalance());
    }
}
