
/**
 * Write a description of class ParkingMeter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class ParkingMeter
{
    private int mins;
    private int minutes;
    

    /**
     * Constructor for objects of class ParkingMeter
     */
    public ParkingMeter()
    {
        // initialise instance variables
        mins = 0;
        minutes = 0;
    }

    public int getMinutes(int minutes)
    {
        // put your code here
        return minutes;
    }
    
    public void addTime(int mins)
    {
        if (mins > 0)
        {
            mins = mins + minutes;
        } else {
            System.out.println("Алдаа: 0-ээс их минут оруулна уу!");
        }
    }
    
    public void tick()
    {
        if (minutes > 0)
        {
            minutes = minutes - 1;
        } else {
            System.out.println("Алдаа: 0-ээс их минут оруулна уу!");
        }
    }
    
}