package exceptions;

/**
 * Created by Ilja on 27.05.2016 02:42.
 */
public class CITooShortNameException extends Exception {
    private String username;

    public CITooShortNameException(String username) {

        this.username = username;
    }
     public String getMessage(){
         return "Der Benutzername " + username + " ist zu kurz";
     }
}
