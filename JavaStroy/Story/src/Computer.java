class Computer {
    CPU cpu;
    Memory memory;
    DataBus databus;
    ALU alu;


    public Computer() {
        this.cpu = new CPU();
        this.memory = new Memory();
        this.databus = new DataBus();
        this.alu = new ALU();
    }


    public void runMallStory(String name) {
        String time="11 AM";
        System.out.println("Now, this " + name + " already ran like a computer:");
        cpu.describe();
        memory.describe(time);
        databus.describe();
        alu.describe();
    }
}


class CPU {
    public void describe() {
        System.out.println("The CPU was the mall manager - always overloaded.");
    }
}


class Memory {
    public void describe(String time) {
        System.out.println("The memory was the parking lot - full by " +time);
    }
}


class DataBus {
    public void describe() {
        System.out.println("The databus was the escalator - constantly jammed.");
    }
}


class ALU {
    public void describe() {
        System.out.println("And the ALU was the popcorn machine - crunching numbers and kernels nonstop.");
    }
}
