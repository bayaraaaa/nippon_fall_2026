/**
 * Write a description of class Battery here.
 *
 * @author Khangaikhuu
 * @version (a version number or a date)
 */
public class Battery
{
    private int charge; // 0-ээс 100 хооронд байх цэнэгийн хувь

    public Battery() {
        charge = 50;
    }

    // getCharge гэдэг нэртэй charge-ийг буцаадаг method бичнэ үү
    // () -> int
    
    public int getCharge()
    {
        return charge;
    }


    // chargeBattery гэдэг нэртэй
    // int -> void (amount гэдэг параметр авдаг байна)
    // хэрвээ amount > 0 бол charge-ийг amount-аар нэмнэ
    // хэрвээ charge нь 100-аас их болбол charge = 100 болгоно
    // хэрвээ amount <= 0 бол "Алдаа: 0-ээс их утга оруулна уу!" гэж хэвлэнэ

    public void chargeBattery(int amount)
    {
        if (amount > 0)
        {
            charge = charge + amount;
        }
        else {
            System.out.println("Алдаа: 0-ээс их утга оруулна уу!");
        }
        
        if (charge > 100){
            charge = 100;
        } 

    }

    // useBattery гэдэг нэртэй
    // int -> void (usage гэдэг параметр авдаг байна)
    // хэрвээ usage > 0 бол charge-ийг usage-аар хорогдуулна
    // хэрвээ charge нь 0-ээс бага болбол charge = 0 болгоно
    
    public void useBattery(int usage)
    {
        if (usage > 0){
            charge = charge - usage;
        }
        if (charge < 0){
            charge = 0;
        }
    }
    
}