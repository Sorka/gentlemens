package cms;

import javax.swing.text.AbstractDocument;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URISyntaxException;

/**
 * Created by jonas on 19.09.2016.
 */
public class ContentSaver {

    private String jsonname;
    private String content;

    private static File CONTENT_DIRECTORY_PATH = null;

    public ContentSaver(String jsonname, String content){
        this.jsonname = jsonname;
        this.content = content;

        if(CONTENT_DIRECTORY_PATH == null) {
            try {
                CONTENT_DIRECTORY_PATH = new File(getClass().getResource("content/").toURI());
            } catch (URISyntaxException e) {
                e.printStackTrace();
            }
        }
    }

    public void save(){

        try(FileWriter fw = new FileWriter(CONTENT_DIRECTORY_PATH + "/" + jsonname + ".json")) {
            
            fw.write(content);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
