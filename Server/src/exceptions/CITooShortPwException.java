package exceptions;

/**
 * Created by Ilja on 27.05.2016 02:53.
 */
public class CITooShortPwException extends Exception {

    public String getMessage(){
        return "Das Passwort ist zu kurz";
    }
}
