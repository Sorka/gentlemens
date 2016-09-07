package hibernate;

import javax.persistence.*;
import java.util.HashMap;
import exceptions.*;
import usermanagement.CheckInput;


/**
 * Created by jonas on 18.08.2016.
 */

@Entity
@SequenceGenerator(name="ID", initialValue=0, allocationSize=1)
@Table(name="gentusr")
public class User {

    @Transient
    private static HashMap<Integer, User> userList = new HashMap<>();

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

    @Transient
    private String sessionId;

    public User() {

    }

    public User(String username, String password, String email){
        this.username = username;
        this.password = password;
        this.email = email;
        this.rank = Rank.PARTICIPANT;
        this.sessionId = "";
    }

    public static User register(String username, String password, String email) throws CIInvalidCharNameException, CITooShortNameException, CIInvalidCharPwException, CITooShortPwException {

        CheckInput.checkName(username);
        CheckInput.checkPassword(password);

        HibernateManager hbm = new HibernateManager();

        return hbm.addUser(username, password, email);
    }

    public static User login(String username, String password, String sessionId) {

        HibernateManager hbm = new HibernateManager();
        User user = hbm.getUser(username, password);

        if(user != null) {
            user.setSessionId(sessionId);
            User.userList.put(user.getId(), user);
        }

        return user;

    }

    public static boolean isLoggedIn(int id, String sessionId) {

        return userList.containsKey(id) && userList.get(id).getSessionId().equals(sessionId);
    }

    public static boolean isLoggedIn(Object id, String sessionId) {
        return isLoggedIn((int) id, sessionId);
    }

    public static void logout(int id) {

        User user = User.userList.remove(id);
        if(user != null) {
            user.setSessionId("");
        }
    }

    public void delete() {
        new HibernateManager().removeUser(this);
    }

    public static final User getUser(int id) {
        return User.userList.get(id);
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

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
}
