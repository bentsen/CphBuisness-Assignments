public class DieselCar extends Car
{
    boolean harPartikelfilter;
    int kmPrl;

    public DieselCar(String regNr, String brand, int årgang, int antalDøre, boolean harPartikelfilter, int kmPrl)
    {
        super(regNr, brand, årgang, antalDøre);
        this.harPartikelfilter = harPartikelfilter;
        this.kmPrl = kmPrl;
    }

    @Override
    public double beregnGrønEjerafgift()
    {
        if (kmPrl >= 20 || kmPrl <= 50)
        {
            return 330 + 130 + paticleFilter();
        }
        else if (kmPrl >= 15 || kmPrl < 20)
        {
            return 1050 + 1390 + paticleFilter();
        }
        else if (kmPrl >= 10 || kmPrl < 15)
        {
            return 2340 + 1850 + paticleFilter();
        }
        else if (kmPrl >= 5 || kmPrl < 10)
        {
            return 5500 + 2770 + paticleFilter();
        }
        else if (kmPrl < 5)
        {
            return 10470 + 15260 + paticleFilter();
        }
        else
            System.out.println("Not valid kmPrl");
            return -1;
    }

    public int paticleFilter()
    {
        if (!harPartikelfilter)
        {
            return 1000;
        }
        else
        return 0;
    }

    @Override
    public String toString() {
        return  "\n________________________"+
                "\nDIESELCAR " + "\n" +
                "regNr: " + regNr + "\n" +
                "brand: " + brand + "\n" +
                "årgang: " + årgang + "\n" +
                "antalDøre: " + antalDøre + "\n" +
                "harPartikelfilter: " + harPartikelfilter + "\n" +
                "kmPrl: " + kmPrl;
    }
}
