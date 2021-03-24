public class PetrolCar extends Car
{

    int oktantal;
    int kmPrl;

    public PetrolCar(String regNr, String brand, int årgang, int antalDøre, int oktantal, int kmPrl)
    {
        super(regNr, brand, årgang, antalDøre);
        this.kmPrl = kmPrl;
        this.oktantal = oktantal;
    }


    @Override
    public double beregnGrønEjerafgift()
    {
        if (kmPrl >= 20 || kmPrl <= 50)
        {
            return 330;
        }
        else if (kmPrl >= 15 || kmPrl < 20)
        {
            return 1050;
        }
        else if (kmPrl >= 10 || kmPrl < 15)
        {
            return 2340;
        }
        else if (kmPrl >= 5 || kmPrl < 10)
        {
            return 5500;
        }
        else if (kmPrl < 5)
        {
            return 10470;
        }
        else
            System.out.println("Not valid kmPrl");
            return -1;
    }



    @Override
    public String toString() {
        return  "\n________________________"+
                "\nPETROLCAR" + "\n" +
                "regNr: " + regNr + "\n" +
                "brand: " + brand + "\n" +
                "årgang: " + årgang + "\n" +
                "antalDøre: " + antalDøre + "\n" +
                "oktantal:" + oktantal + "\n" +
                "kmPrl: " + kmPrl;

    }
}
