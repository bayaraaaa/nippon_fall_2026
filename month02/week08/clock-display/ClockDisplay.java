/**
 * ClockDisplay — 24 цагийн дижитал цаг.
 * Хоёр NumberDisplay объектоос бүтнэ: цаг ба минут.
 */
public class ClockDisplay {
    private NumberDisplay hours;
    private NumberDisplay minutes;

    /** 00:00-ээс эхлэх цаг. */
    public ClockDisplay() {
        hours = new NumberDisplay(24);
        minutes = new NumberDisplay(60);
    }

    /** hour:minute-ээс эхлэх цаг. */
    public ClockDisplay(int hour, int minute) {
        hours = new NumberDisplay(24);
        minutes = new NumberDisplay(60);
        hours.setValue(hour);
        minutes.setValue(minute);
    }

    /** Цагийг тохируулна. */
    public void setTime(int hour, int minute) {
        hours.setValue(hour);
        minutes.setValue(minute);
    }
    
    /** "HH:MM" хэлбэрийн текст. */
    public String getTime() {
        return hours.getDisplayValue() + ":" + minutes.getDisplayValue();
    }

    /**
     * Нэг минут урагшилна.
     * TODO: минут 0 руу эргэх үед цагийг ч нэмэх ёстой.
     */
    public void timeTick() {
        minutes.increment();
        if (minutes.getValue() == 0){
            hours.increment();
        }
    }
}
