public class Person {
    String name;
    int age;
    String role;
    String motto;

    void introduce(){
        System.out.println(name + " is a " + age + " year old junior engineer, working with a motto -> " + motto);
    }
    void createInventions(){
        System.out.println(" *) Blue print ready...");
        System.out.println(" *) Materials ready...");
        System.out.println(" Let the world go gaga over my inventions!!!\n");
    }

    FuelCar fc = new FuelCar();
    {
        fc.name = "FC - 400";
        fc.budget = 4000;
    }
    ElectricCar ec = new ElectricCar();
    {
        ec.name = "Tesla Clone";
        ec.charge = 200;
    }

    Mechanical mc = new Mechanical();
    {
        mc.name = "Omega";
    }

    Mall mall = new Mall();
    {
        mall.name = "RCity";
        mall.location = "Ghatkopar";

    }
    void crazyIdea(){
        System.out.println("Tejas plans to display his inventions in the " + mall.name + " mall located in " + mall.location + "???!!!" );
        System.out.println("Getting the mall details...LOADING");
    }

    ResuceMe rescue = new ResuceMe();








}
