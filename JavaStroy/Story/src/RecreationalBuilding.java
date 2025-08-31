public class RecreationalBuilding {
        String name;
        String location;

}

class Mall extends RecreationalBuilding {
    String openingTime = "10.00 AM";
    Section sections[] = {
            new Section("FoodCourt", "2nd", "East Wing"),
            new Section("Theatre", "3rd", "West Wing"),
            new Section("Shopping", "1st", "Central Zone"),
            new Section("Electronics", "4th", "North Wing")
    };

    Movie eveningMovie = new Movie();
    {
        eveningMovie.name = "Avengers : Endgame";
    }
    public void showDetails() {
        System.out.println("Name: " + name);
        System.out.println("Located at: " + location);
        System.out.println("Opens at: " + openingTime);
        System.out.println("--- Mall Sections ---");
        for (Section section : sections) {
            section.showSectionDetails();
        }
        eveningMovie.showEveningMovie();
    }
    public void kickOutsideMall() {

        System.out.println("When security finally dragged Tejas out of the mall, his inventions were still causing chaos\n");
    }

}


class Section {
    String name;
    String floor;
    String zone;


    public Section(String name, String floor, String zone) {
        this.name = name;
        this.floor = floor;
        this.zone = zone;
    }


    public void showSectionDetails() {
        System.out.println("Section: " + name + ", Floor: " + floor + ", Zone: " + zone);
    }
}

class Movie {
    String name;

    public void showEveningMovie() {
        System.out.print("with movie: ");
        System.out.println("\n--- Evening Movie ---");
        System.out.println("Tonight's movie: " + name);
        System.out.println("The show starts at 6:00 PM.");
        System.out.println("Tickets are available at the theatre section.");

    }


}

