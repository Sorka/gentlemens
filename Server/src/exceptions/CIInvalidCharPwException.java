package exceptions;

/**
 * Created by Ilja on 28.05.2016 22:17.
 */
public class CIInvalidCharPwException extends Exception{
    public String getMessage(){
        return "Das Passwort enthält ein ungültiges Zeichen";
    }
}
