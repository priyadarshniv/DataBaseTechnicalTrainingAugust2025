public class Story {
    public static void main(String args[]){
        Person p1 = new Person();
        p1.name = "Tejas";
        p1.age = 22;
        p1.motto = "Build something nobody asked for:)";
        p1.introduce();
        System.out.println(p1.name + " starts building");
        p1.createInventions();

        p1.fc.run();
        p1.ec.run();
        p1.mc.run();

        System.out.println("---------- Inventions are ready ------------");
        System.out.println(">>>>>>>>>>> Time for crazy idea <<<<<<<<<<<<<\n");
        p1.crazyIdea();

        System.out.println("*************** MALL LAYOUT ********************");
        p1.mall.showDetails();
        System.out.println("*************************************************");

        System.out.println("Seeing the mall layout, engineering mind of tejas pulled out this weird comparison");

        Computer comp = new Computer();
        comp.runMallStory(p1.mall.name);
        System.out.println("*************************************************");

        System.out.println("He smirks at at own crazy brain, and proceeds to install stalls in the Electronics Section.");
        System.out.println("Now, here comes the twist..\n");

        BizarreEvents bz = new BizarreEvents();
        bz.insideMall();

        p1.mall.kickOutsideMall();

        bz.outsideMall();

        SmartUmbrella umbrella = p1.rescue.pleaseHelp();
        umbrella.message();

        System.out.println("So, drenched and defeated, Tejas just laughed along with the rain, realizing that sometimes, his inventions weren’t protecting him from the storm… THEY WERE THE STORM");




    }

}
