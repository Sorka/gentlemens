package hibernate;

import javax.persistence.*;

/**
 * Created by jonas on 18.08.2016.
 */

@Entity
@SequenceGenerator(name="ID", initialValue=0, allocationSize=1)
@Table(name="gentusr")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int id;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "rang")
    private Rank rank;

    public User() {

    }

    public User(String username, String password, String email){
        this.username = username;
        this.password = password;
        this.email = email;
        this.rank = Rank.PARTICIPANT;
    }

    public static User register(String username, String password, String email) {

        HibernateManager hbm = new HibernateManager();

        return hbm.addUser(username, password, email);
    }

    public static User login(String username, String password) {

        HibernateManager hbm = new HibernateManager();

        return hbm.login(username, password);

    }


    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        this.rank = rank;
    }
}
