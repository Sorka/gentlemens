package hibernate;

/**
 * Created by Dennis on 18.08.2016.
 */
public enum Rank {
    PARTICIPANT("participant"), ADMINISTRATOR("administrator");

    private String name;

    Rank(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
