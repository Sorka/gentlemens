package hibernate;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;


/**
 * Created by Dennis on 18.08.2016.
 */
public class HibernateManager {

    private SessionFactory sessionFactory;

    public HibernateManager() {

        try {
            sessionFactory = new Configuration()
                    .setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect")
                    .setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver")
                    .setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/gentlemen")
                    //.setProperty("hibernate.connection.username", "root")
                    //.setProperty("hibernate.connection.password", "Passwort")
                    .addAnnotatedClass(User.class)
                    .buildSessionFactory();
        } catch (Exception e) {
            System.err.println("Failed to create sessionFactory object." + e);
            throw new ExceptionInInitializerError(e);
        }

    }

    /**
     * @param username Benutzername
     * @param password Passwort
     * @param email    Email
     * @return ID des Benutzers oder Exception
     */
    public User addUser(String username, String password, String email) {
        Transaction transaction = null;
        User user = null;

        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            user = new User(username, password, email);
            session.save(user);

            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return user;
    }

    public User login(String username, String password) {

        Session session = sessionFactory.openSession();

        User user = (User) session.createCriteria(User.class)
                .add(Restrictions.eq("username", username))
                .add(Restrictions.eq("password", password)).uniqueResult();

        return user;
    }
}
