
/**
 * Write a description of class ParkingMeter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class ParkingMeter
{
    private int minutesRemaining;
    private int totalCoinsInserted;


    public ParkingMeter()
    {
        minutesRemaining = 0;
        totalCoinsInserted = 0;
    }

    public void insertQuarter()
    {
        minutesRemaining = minutesRemaining + 15;
        totalCoinsInserted = totalCoinsInserted + 1;
    }
    public void insertDollar()
    {
        minutesRemaining = minutesRemaining + 60;
        totalCoinsInserted = totalCoinsInserted + 4;
    }
    public void waitTime(int minutesPassed)
    {
        minutesRemaining = minutesRemaining - minutesPassed;
    }
    
    public double getHoursRemaining()
    {
        return minutesRemaining / 60.0;
    }
}