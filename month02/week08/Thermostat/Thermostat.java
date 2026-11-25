/**
* Өрөөний дулаан тохируулагч ($16^\circ\text{C} - 30^\circ\text{C}$
хооронд ажиллана).
*
* @author Khangaikhuu
*/
public class Thermostat {
    private int temperature;
    
    public Thermostat() {
        temperature = 22;
         // TODO 1: Анхны температур 22 градус байна.
    }
    
 // TODO 2: getTemperature гэдэг нэртэй method бичнэ үү
 // () -> int 02-tuesday-oop-exercises.md 2026-11-24 2 / 15
    public int getTemperature()
    {
        return temperature;
    }
 // TODO 3: increaseTemp гэдэг нэртэй method бичнэ үү
 // () -> void
 // temperature-ийг 1-ээр нэмнэ (хамгийн ихдээ 30 байна).
    public void increaseTemp(){
        if (temperature < 30){
            temperature = temperature + 1;
        }
    }
 // TODO 4: decreaseTemp гэдэг нэртэй method бичнэ үү
 // () -> void
 // temperature-ийг 1-ээр хасна (хамгийн багадаа 16 байна).
    public void decreaseTemp(){
        if (temperature > 16){
            temperature = temperature - 1;
        }
    }
}