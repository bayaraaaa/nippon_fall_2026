public class RPGCharacter
{
    private String name;
    private int lavel;
    private int hp;
    private int mana;
    private int attackCount;
    private boolean isAlive;

    public RPGCharacter()
    {
        level = 1;
        hp = 100;
        mana = 50;
        attackCount = 0;
        isAlive = true;
    }

    public void receiveDamage(int damage)
    {
        if (!isAlive) 
        {
            System.out.println(name + "  is already defeated!");
        } else {
            hp = hp - damage;
            if (hp <= 0)
            {
                hp = 0;
                isAlive = false;
                System.out.println(name + " has fallen in battle!");
            } else {
                System.out.println(name + " took " + damage + " dmg! HP left:  " + hp);
            }
        }
        
    }
    public void attack(RPGCharacter enemy)
    {
           
    }
    
}