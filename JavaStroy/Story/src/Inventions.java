public abstract class Inventions {
    String name;
    void run(){

    }
}

abstract  class Car extends Inventions {

}

class FuelCar extends Car{
    int budget;
    void run() {
        System.out.println("--- Inventions 1: Fuel based Car ---");
        if (budget >= 5000) {
            System.out.println(name + " is starting... Vroom Vroom!");
        } else {
            System.out.println(name + " refuses to start. Honk! Honk! *sulks*");
        }
    }
}

class ElectricCar extends Car{
    int charge;
    void run(){
        System.out.println("--- Inventions 2: Electric Car ---");
        if (charge >= 500) {
            System.out.println(name + " is starting... Shhhh Shhhh!");
        } else {
            System.out.println(name + " Where is my charger?? Where is my charger??... Im dying, Im dying");
        }
    }
}

class Watch extends Inventions {
    Belt belt;
    String type;
    CurrTime currTime;

    public Watch(String beltType, String type) {
        this.belt = new Belt(beltType);
        this.type = type;
        this.currTime = new CurrTime(0, 0, 0);
        this.name = type + " Watch";
    }
}

class Mechanical extends Watch {
    public Mechanical() {
        super("Leather", "Mechanical");
    }

    @Override
    void run() {
        System.out.println("--- Invention 3: Watch ---");
        System.out.println(name + " powers itself by your motion. Tick... Tock...");
        belt.displayType();
        currTime.displayTime(12, 45, " Lunch time!\n");
    }
}

class Belt {
    String typeOfWatch;

    public Belt(String typeOfWatch) {
        this.typeOfWatch = typeOfWatch;
    }

    void displayType() {
        System.out.println("Belt is made up of: " + typeOfWatch);
    }
}

class CurrTime {
    int sec, min, hour;

    public CurrTime(int s, int m, int h) {
        this.sec = s;
        this.min = m;
        this.hour = h;
    }

    void setTime(int s, int m, int h) {
        this.sec = s;
        this.min = m;
        this.hour = h;
    }

    void displayTime(int hour, int min, String msg) {
        System.out.println("IT'S " + hour + ":" + min + "! " + msg);
    }
}







