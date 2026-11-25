/**
* 1-ээс maxFloor хүртэлх давхарт явдаг цахилгаан шатны класс.
*
* @author Khangaikhuu
*/
public class Elevator {
    private int currentFloor;
    private int maxFloor;
    private boolean doorOpen;
    
    public Elevator(int topFloor) {
        // TODO 1: currentFloor = 1, doorOpen = false байна.
        currentFloor = 1;
        doorOpen = false;
        // Хэрэв topFloor >= 2 бол maxFloor = topFloor, үгүй бол maxFloor = 5 болгоно.
        if (topFloor >= 2){
            maxFloor = topFloor;
        } else {
            maxFloor = 5;
        }
        
    }
        // TODO 2: getCurrentFloor (() -> int), isDoorOpen (() -> boolean) бичнэ үү
    public int getCurrentFloor(){
        return currentFloor;
    }
    
    public boolean isDoorOpen(){
        return doorOpen;
    }
        
        // TODO 3: openDoor (() -> void) ба closeDoor (() -> void) бичнэ үү
    public void openDoor(){
        doorOpen = true;
    }
    public void closeDoor(){
        doorOpen = false;
    }
        // TODO 4: goToFloor гэдэг нэртэй method бичнэ үү
        // int -> boolean (targetFloor гэдэг параметр авна)
        // Хаалга хаалттай (doorOpen == false) БА targetFloor нь 1..maxFloor хооронд байвал
        // currentFloor-ийг өөрчлөөд true буцаана. Бусад үед хөдлөхгүй ба false буцаана.
    public boolean goToFloor(int targetFloor){
        if (doorOpen == false && targetFloor <= maxFloor && targetFloor >= 1 ){
            currentFloor = targetFloor;
            return true;
        } else {
            return false;
        }
    }
}