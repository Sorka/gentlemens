package usermanagement;

import exceptions.*;

/**
 * Created by Sergen on 02.05.2016 10:49
 */
public class CheckInput {
    private static String LaengePattern = "^.{3,}$";


    public static boolean checkName(String username) throws CITooShortNameException, CIInvalidCharNameException {
        //teste ob der Name dem Pattern entspricht
        String usernamepattern = "^[a-zA-Z0-9._-]{3,}$";

        if(!username.matches(LaengePattern)){
            throw new CITooShortNameException(username);
        } else if(!username.matches(usernamepattern)){
            throw new CIInvalidCharNameException(username);
        }else{
            return true;
        }
        //return username.matches(usernamepattern);
    }

    public static boolean checkPassword(String password) throws CITooShortPwException, CIInvalidCharPwException {
        //teste ob das Passwort dem Pattern entspricht
        String passwordpattern = "^[a-zA-Z0-9@#$%^&+=._-]{3,}$";

        if(!password.matches(LaengePattern)){
            throw new CITooShortPwException();
        }else if(!password.matches(passwordpattern)){
            throw new CIInvalidCharPwException();
        }else{
            return true;
        }

        //return password.matches(passwordpattern);
    }


}