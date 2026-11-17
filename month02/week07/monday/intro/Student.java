
/**
 * Write a description of class student here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Student
{
    private String studentName;
    private int age; 
    private boolean isMale;
    private double grades;

    public Student(String name)
    {
        studentName = name;
        age = 18;
        isMale = true;
        grades = 0.0;
    }

    public Student(String name, int studentAge)
    {
        studentName = name;
        age = studentAge;
        isMale = false;
        grades = 0.0;
    }

    public Student(String name, int studentAge, boolean isStudentMale)
    {
        studentName = name;
        age = studentAge;
        isMale = isStudentMale;
        grades = 0.0;
    }

    public Student(String name, int studentAge, boolean isStudentMale, double studentGrades)
    {
        studentName = name;
        age = studentAge;
        isMale = isStudentMale;
        grades = studentGrades;
    }

    public void calculateGrades()
    {
        if (grades > 0 && grades < 60)
        {
            System.out.println('F');
            
        } else if (grades >= 60 && grades < 70) {
            System.out.println('D');
        } else if (grades >= 60 && grades < 70) {
            System.out.println('C');
        } else if (grades >= 80 && grades < 90) {
            System.out.println('B');
        } else if (grades >= 90 && grades <= 100) {
            System.out.println('A');
        } else {
            System.out.println("No grades");
        }
    }
    
    public int getAge()
    {
        return age;
    }
    public String getName()
    {
        return studentName;
    }
    
    public void printInfo()
    {
        String name = getName(); // function call
        int age = getAge();
        System.out.println(name + "is" + age + " years old. " + " has grades of" + grades);
    }
}

