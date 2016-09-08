package cms;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;

/**
 * Created by Dennis on 08.09.2016.
 */
public class ContentLoader {

    private static File CONTENT_DIRECTORY_PATH = null;

    String pageName;

    public ContentLoader(String pageName) {
        this.pageName = pageName;

        if(CONTENT_DIRECTORY_PATH == null) {
            try {
                CONTENT_DIRECTORY_PATH = new File(getClass().getResource("content/").toURI());
            } catch (URISyntaxException e) {
                e.printStackTrace();
            }
        }
    }

    public JSONObject load() {

        File file = null;

        try {
            JSONParser parser = new JSONParser();
            file = new File(CONTENT_DIRECTORY_PATH, pageName + ".json");
            return (JSONObject) parser.parse(new FileReader(file));
        } catch (FileNotFoundException e) {
            System.out.println(file.getAbsolutePath());
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
