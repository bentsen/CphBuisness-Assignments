import java.util.ArrayList;

public class Garage
{

    String garageName;
    ArrayList<Car> cars = new ArrayList<>();


    public Garage(String garageName)
    {
        this.garageName = garageName;
    }


    public void beregnGrønAfgiftForBilpark()
    {
        double res = 0;
        for (Car b : cars)
        {
            res += b.beregnGrønEjerafgift();
        }

        System.out.println("\nSamlet grøn afgift for bilpark: "+res);
    }


    public void addCar(Car car)
    {
        cars.add(car);
    }

    @Override
    public String toString()
    {
        return garageName + " has " + cars.size()  +  " cars: " + cars;

    }
}


