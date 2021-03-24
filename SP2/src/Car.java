public abstract class Car
{
    String regNr;
    String brand;
    int årgang;
    int antalDøre;


    public Car(String regNr, String brand, int årgang, int antalDøre)
    {
        this.regNr = regNr;
        this.brand = brand;
        this.årgang = årgang;
        this.antalDøre = antalDøre;
    }

        public abstract double beregnGrønEjerafgift();




}