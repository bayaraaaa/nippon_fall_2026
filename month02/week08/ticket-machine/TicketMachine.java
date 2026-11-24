/**
 * TicketMachine — автобусны тасалбарын машин.
 * Мөнгө хүлээж авч, хүрэлцэхүйц бол тасалбар хэвлэж, үлдэгдлийг буцаана.
 */
public class TicketMachine {
    private int price;    // нэг тасалбарын үнэ (төгрөг)
    private int balance;  // одоо хийсэн, хараахан зарцуулаагүй мөнгө
    private int total;    // зарагдсан тасалбаруудаас нийт цуглуулсан мөнгө

    /** ticketPrice үнэтэй тасалбарын машин. */
    public TicketMachine(int ticketPrice) {
        price = ticketPrice;
        balance = 0;
        total = 0;
    }

    /** Тасалбарын үнэ. */
    public int getPrice() {
        return price;
    }

    /** Одоогийн үлдэгдэл. */
    public int getBalance() {
        return balance;
    }

    /** Нийт цуглуулсан мөнгө. */
    public int getTotal() {
        return total;
    }

    /**
     * amount төгрөг хийнэ.
     * TODO: 0 ба сөрөг дүнг хүлээж авахгүй, алдааны мэдээ хэвлэ.
     */
    public void insertMoney(int amount) {
        if (amount > 0){
            balance = balance + amount;
        } else {
            System.out.println("Эерэг дүн оруулна уу!" + amount);
        }
    }

    /**
     * Тасалбар хэвлэнэ.
     * TODO: үлдэгдэл үнээс бага бол хэвлэхгүй, хэдэн төгрөг дутууг хэвлэ.
     */
    public void printTicket() {
        if (balance >= price){
            System.out.println("+------------------+");
            System.out.println("|  iCode Bus Line  |");
            System.out.println("|  Тасалбар        |");
            System.out.println("|  " + price + " ₮");
            System.out.println("+------------------+");
            total = total + price;
            balance = balance - price;
        } else {
            System.out.println((price - balance) + "₮ дутуу байна!");
        }
    }

    /**
     * Үлдэгдлийг буцааж, машины үлдэгдлийг 0 болгоно.
     * TODO: одоо үргэлж 0 буцааж байна.
     */
    public int refundBalance() {
        int refund = balance;
        balance = 0;
        return refund;
    }
}
