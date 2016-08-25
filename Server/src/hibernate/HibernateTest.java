package hibernate;

/**
 * Created by Dennis on 18.08.2016.
 */
public class HibernateTest {

    public static void main(String[] args) {

        User user = User.login("dknoop", "pass");

        if(user != null) {
            System.out.println(user.getUsername());
            System.out.println(user.getPassword());
            System.out.println(user.getRank());
            System.out.println(user.getId());
        }

        user = new HibernateManager().addUser("testUser", "Passwort123", "test@testmail.com");

        System.out.print("user added, username = " + user.getUsername());

    }
}
