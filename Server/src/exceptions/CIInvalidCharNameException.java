package exceptions;

/**
 * Created by Ilja on 28.05.2016 22:15.
 */
public class CIInvalidCharNameException extends Exception {
    private String username;

    public CIInvalidCharNameException(String username) {

        this.username = username;
    }
    public String getMessage(){
        return "Der Benutzername " + username + " enthält ein ungültiges Zeichen";
    }

}
