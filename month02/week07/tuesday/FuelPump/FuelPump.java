
/**
 * Write a description of class FuelPump here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class FuelPump
{
    private double pricePerLiter;
    private double litersDispensed;
    
    public FuelPump()
    {
        pricePerLiter = 4000; // АИ - 92 
        litersDispensed = 0.0;
    }
    
    public void pumpFual(double liters)
    {
        litersDispensed = litersDispensed + liters;
    }
    
    public double getTotalCost()
    {
        return litersDispensed * pricePerLiter;
    }
    
    public void restPump()
    {
        litersDispensed = 0.0;
    }
    
}