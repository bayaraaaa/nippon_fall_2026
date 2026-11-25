

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
public class ElevatorTest {
 @Test
 public void testInitialState() {
 Elevator e = new Elevator(10);
 assertEquals(1, e.getCurrentFloor());
 assertFalse(e.isDoorOpen());
 }
 @Test
 public void testCannotMoveWhenDoorIsOpen() {
 Elevator e = new Elevator(10);
 e.openDoor();
 assertFalse(e.goToFloor(5));
 assertEquals(1, e.getCurrentFloor());
 }
 @Test
 public void testValidFloorMoveWhenDoorClosed() {
 // TODO: Хаалга хаалттай үед 7-р давхар руу очиход true буцааж, давхар 7 болохыг шалгана уу
 }
 @Test
 public void testInvalidFloorRejected() {
 // TODO: 0 болон 11-р давхар руу явах оролдлого false буцаахыг шалгана уу
 }
}