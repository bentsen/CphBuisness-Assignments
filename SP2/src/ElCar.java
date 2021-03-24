public class ElCar extends Car
{
    int batterikapacitetKWh;
    int maxKm;
    int whPrKm;

    public ElCar(String regNr, String brand, int årgang, int antalDøre, int batterikapacitetKWh, int maxKm, int whPrKm)
    {
        super(regNr, brand, årgang, antalDøre);
        this.batterikapacitetKWh = batterikapacitetKWh;
        this.maxKm = maxKm;
        this.whPrKm = whPrKm;
    }

    @Override
    public double beregnGrønEjerafgift()
    {
        double temp = 100/(whPrKm/91.25);

        if (temp >= 20 || temp <= 50)
        {
            return 330  ;
        }
        else if (temp >= 15 || temp < 20)
        {
            return 1050;
        }
        else if (temp >= 10 || temp < 15)
        {
            return 2340;
        }
        else if (temp >= 5 || temp < 10)
        {
            return 5500;
        }
        else if (temp < 5)
        {
            return 5;
        }
        else
            System.out.println("Not valid whPrKm");
            return -1;
    }

    @Override
    public String toString() {
        return  "\n________________________"+
                "\nELECTRIC CAR" + "\n" +
                "regNr= " + regNr + "\n" +
                "brand= " + brand + "\n" +
                "årgang= " + årgang + "\n" +
                "antalDøre= " + antalDøre + "\n" +
                "batterikapacitetKWh= " + batterikapacitetKWh + "\n" +
                "maxKm= " + maxKm + "\n" +
                "whPrKm= " + whPrKm;
    }
}
