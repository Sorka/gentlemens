package hibernate;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;


/**
 * This class provides all methods necessary for database interaction with hibernate
 *
 * Created by Dennis on 18.08.2016.
 */
public class HibernateManager {

    /**
     * SessionFactory instance that delivers session objects for all performed actions<br>
     * and contains database configurations
     */
    private static final SessionFactory sessionFactory;

    // initialize session factory
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

    /**
     * creates a new instance of {@link HibernateManager}
     */
    public HibernateManager() {

    }

    /**
     * adds a user to the database
     * @param username the name of the user
     * @param password the password of the user
     * @param email the valid email of the user
     * @return a new instance of {@link  User} if there is no user with the same username and email<br>
     *     null, else
     */
    public User addUser(String username, String password, String email) {

        if(userExists(username, email))
            return null;

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

    /**
     * searches a user in the database
     * @param username the name of the user
     * @param password the password of the user
     * @return a new instance of {@link User}, if there exists an entry in the database with the given name and password<br>
     *     null, else
     */
    public User getUser(String username, String password) {

        List<User> result = getUsersByParams("username", username, "password", password, true);

        if(result  != null && result.size() == 1) {
            return result.get(0);
        } else {
            return null;
        }
    }

    /**
     * checks if an user with the given name <b>or</b> email exists
     * @param username the name of the user
     * @param email the email of the user
     * @return true if an user with the given name <b>or</b> email exists<br>
     *     false, else
     */
    private boolean userExists(String username, String email) {
        return getUsersByParams("username", username, "email", email, false) != null;
    }

    /**
     * searches all users that match the given param/value pairs
     * @param param1 first parameter
     * @param value1 value to match for first parameter
     * @param param2 second parameter
     * @param value2 value to match for second parameter
     *
     * @return a {@link List} of all users that match the given param/value pairs
     */
    private List<User> getUsersByParams(String param1, String value1, String param2, String value2, boolean doAnd) {

        if(param1 == null || value1 == null || param2 == null || value2 == null)
            return null;

        try(Session session = sessionFactory.openSession()) {

            EntityManagerFactory emf = session.getEntityManagerFactory();
            CriteriaBuilder builder = emf.getCriteriaBuilder();
            CriteriaQuery<User> query = builder.createQuery(User.class);
            Root<User> root = query.from(User.class);

            if(doAnd) {
                query.where(builder.and(builder.equal(root.get(param1), value1), builder.equal(root.get(param2), value2)));
            } else {
                query.where(builder.or(builder.equal(root.get(param1), value1), builder.equal(root.get(param2), value2)));
            }

            List result =  emf.createEntityManager().createQuery(query).getResultList();

            return result.size() > 0 ? result : null;

        } catch(NoResultException e) {

            System.err.println("No users with matching parameters found.");
            e.printStackTrace();
            return null;
        }
    }

    /**
     * updates a user in the database<br>
     *     writes the data of the given {@link User} instance to the corresponding entry in the database
     * @param user the {@link User} instance whose data shall be updated
     */
    public void updateUser(User user) {

        Transaction transaction = null;

        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();

        } catch (HibernateException e) {

            if (transaction != null)
                transaction.rollback();
            e.printStackTrace();
        }
    }

    /**
     * deletes the given user from the database
     * @param user the user that shall be deleted
     */
    public void removeUser(User user) {

        Transaction transaction = null;

        try(Session session = sessionFactory.openSession()) {

            transaction = session.beginTransaction();
            session.remove(user);
            transaction.commit();

        } catch(HibernateException e) {

            if(transaction != null)
                transaction.rollback();
            e.printStackTrace();
        }
    }
}
