
/**
 * Write a description of class elevator here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class elevator
{
    private int floors;
    private int currentFloor;
    private int totalTrips;
    public elevator()
    {
        currentFloor = 1;
        totalTrips = 0;
    }
    
    public void goUp(int floors)
    {
        currentFloor = currentFloor + floors;
        totalTrips = totalTrips + 1;
    }
    public void goDown(int floors)
    {
        currentFloor = currentFloor - floors;
        totalTrips = totalTrips + 1;
    }
    public int getCurrentFloor()
    {
        return currentFloor;
    }
    
    
    public void getStatus()
    {
        int floor = getCurrentFloor(); // function call
        int trips = totalTrips;
        System.out.println("Elevator is on floor " + floor + " (Total trips: " + trips +  ")");
    }
}