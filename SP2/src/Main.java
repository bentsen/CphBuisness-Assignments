public class Main {

    public static void main(String[] args)
    {
        Car car1 = new DieselCar("23232","Bmw",2001,5,true,10);
        Car car2 = new PetrolCar("23232","Mercedes",2020,5,10,10);
        Car car3 = new ElCar("323232","Toyota",2009,3,15,150,15);

        Garage garage = new Garage("Mikkels Garage");

        garage.addCar(car1);
        garage.addCar(car2);
        garage.addCar(car3);
        System.out.println(garage);

        garage.beregnGrønAfgiftForBilpark();

    }
}
