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

    private static SessionFactory sessionFactory;

    static {
        try {
            sessionFactory = new Configuration()
                    .addAnnotatedClass(User.class)
                    .configure("hibernate/hibernate.cfg.xml")
                    .buildSessionFactory();

        } catch (Exception e) {
            System.err.println("Failed to create sessionFactory object.\n" + e);
            throw new ExceptionInInitializerError(e);
        }
    }

    public HibernateManager() {

    }

    /**
     * @param username Benutzername
     * @param password Passwort
     * @param email    Email
     * @return eine {@link User} Instanz für den angemeldeten Benutzer, wenn er existert und Benutzername und Passwort stimmen<br>
     *     null, sonst
     */
    //TODO prüfen, ob benutzer schon existiert
    public User addUser(String username, String password, String email) {
        Transaction transaction = null;
        User user = null;

        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            user = new User(username, password, email);
            session.save(user);

            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null)
                transaction.rollback();

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
    
    public void updateUser(User user) {

        Transaction transaction = null;

        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();

        } catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void disconnect() {
        sessionFactory.close();
    }
}
