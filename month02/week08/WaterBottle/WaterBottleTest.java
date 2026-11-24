

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class WaterBottleTest {
 @Test
 public void testInitialStateIsEmpty() {
     WaterBottle bottle = new WaterBottle(1000);
     assertEquals(0, bottle.getWaterMl());
 }
 @Test
 public void testFillCapsAtCapacity() {
     WaterBottle bottle = new WaterBottle(500);
     bottle.fill(700);
     assertEquals(500, bottle.getWaterMl());
 }
 @Test
 public void testDrinkFloorsAtZero() {
 // TODO: 500мл савыг 200мл усаар дүүргээд 300мл уухад 0 үлдэхийг шалгана уу
     WaterBottle bottle = new WaterBottle(500);
     bottle.fill(200);
     bottle.drink(300);
     assertEquals(0, bottle.getWaterMl());
 }
 @Test
 public void testNegativeFillAndDrinkIgnored() {
 // TODO: Сөрөг тоо өгөхөд усны хэмжээ өөрчлөгдөхгүй байгааг шалгана уу
     WaterBottle bottle = new WaterBottle(500);
     bottle.fill(200);
     bottle.fill(-300);
     assertEquals(200, bottle.getWaterMl());
 }
}