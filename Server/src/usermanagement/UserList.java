package usermanagement;

import hibernate.User;

import javax.persistence.Transient;
import java.util.HashMap;
import java.util.Observable;

/**
 * Created by jonas on 08.09.2016.
 */
public class UserList extends Observable {
    private static UserList ourInstance = new UserList();

    public static UserList getInstance() {
        return ourInstance;
    }

    private HashMap<Integer, User> userList;

    public HashMap<Integer, User> getUserList() {
        return userList;
    }

    private UserList() {
        this.userList = new HashMap<>();
    }

    public void add(Integer integer, User user){
        this.userList.put(integer, user);
        setChanged();
        notifyObservers();
    }

    public User remove(Integer id){
        User user = this.userList.remove(id);
        setChanged();
        notifyObservers();

        return user;
    }
}
