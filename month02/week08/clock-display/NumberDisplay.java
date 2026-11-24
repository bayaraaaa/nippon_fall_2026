/**
 * NumberDisplay — 0-ээс (limit − 1) хүртэл тоолдог хоёр оронтой дэлгэц.
 * Цагийн хувьд limit = 24, минутын хувьд limit = 60.
 */
public class NumberDisplay {
    private int limit;
    private int value;

    /** limit хүрэхэд 0 руу буцдаг дэлгэц, эхний утга 0. */
    public NumberDisplay(int rollOverLimit) {
        limit = rollOverLimit;
        value = 0;
    }

    /** Одоогийн утга. */
    public int getValue() {
        return value;
    }

    /**
     * Утгыг тохируулна.
     * TODO: 0 ≤ newValue < limit үед л өөрчил, бусад үед хуучнаараа үлдээ.
     */
    public void setValue(int newValue) {
        if (newValue >= 0 && newValue < limit){
            value = newValue;
        }
        
    }

    /**
     * Хоёр оронтой текст: 5 → "05", 42 → "42".
     * TODO: 10-аас бага үед урд нь "0" нэм.
     */
    public String getDisplayValue() {
        if (value < 10){
            return "0" + value;
        } else {
            return "" + value;
        }
        
    }

    /**
     * Нэгээр нэмнэ; limit хүрвэл 0 болно (L7-ийн mod).
     * TODO: одоо limit-ээс хэтэрч байна.
     */
    public void increment() {
        
        value = (value + 1) % limit;
    }
}
