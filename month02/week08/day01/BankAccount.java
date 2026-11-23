
/**
 * Write a description of class BankAccount here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class BankAccount
{
    // balance field
    private double balance;
    
    public BankAccount()
    {
        balance = 0.0;
    }
    
    // getBalance
    public double getBalance()
    {
        return balance;
        // System.out.print("balance" + balance);
    }
    
    public void deposit(double amount)
    {
        if (amount > 0)
        {
            balance = balance + amount;
        } else {
            System.out.println("Алдаа: 0-ээс их дүн оруулна уу");
        }
    }
}