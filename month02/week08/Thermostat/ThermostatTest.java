

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ThermostatTest {
 @Test
 public void testDefaultTemperatureIs22() {
     Thermostat t = new Thermostat();
     assertEquals(22, t.getTemperature());
 }
 @Test
 public void testIncreaseTemp() {
     Thermostat t = new Thermostat();
     t.increaseTemp();
     assertEquals(23, t.getTemperature());
 }
 @Test
 public void testMaxTemperatureLimitIs30() {
     // TODO: 15 удаа increaseTemp() дуудахад 30-аас хэтрэхгүй байгааг
     Thermostat t = new Thermostat();
     for (int i = 0; i < 15; i++){
         t.increaseTemp();
     }
     assertEquals(30, t.getTemperature());
 }
 @Test
 public void testMinTemperatureLimitIs16() {
    // TODO: 15 удаа decreaseTemp() дуудахад 16-аас доош орохгүй байгааг шалгана уу
    Thermostat t = new Thermostat();
     for (int i = 0; i < 15; i++){
         t.decreaseTemp();
     }
     assertEquals(16, t.getTemperature());
 }
}