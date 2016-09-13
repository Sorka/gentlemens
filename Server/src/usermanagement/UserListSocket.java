package usermanagement;

import hibernate.User;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;

/**
 * Created by jonas on 25.08.2016.
 */
@ServerEndpoint( value="/userlist")
public class UserListSocket implements Observer {

    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

    private HashMap<Integer, User> userList;


    public UserListSocket() {

       UserList listObj = UserList.getInstance();
       this.userList = listObj.getUserList();
       listObj.addObserver(this);
    }

    @OnOpen
    public void onOpen (Session session){
        clients.add(session);

        JSONObject initMsg = new JSONObject();
        initMsg.put("userlist", getUserListAsJsonObject());

        sendToSingleClient(session, initMsg.toJSONString());
    }

    @OnMessage
    public void OnMessage(String message, Session session)
            throws IOException{
    }


    @OnClose
    public void OnClose(Session session){
        clients.remove(session);
    }

    @Override
    public void update(Observable o, Object arg) {

        JSONObject initMsg = new JSONObject();
        initMsg.put("userlist", getUserListAsJsonObject());
        sendToAll(initMsg.toJSONString());
    }

    /**
     * Sendet eine gegebene Nachricht an einen einzigen Client
     * @param client Websocket-Session des empfangenden Clients
     * @param jsonData Nachricht als Json-String
     */
    public void sendToSingleClient(Session client, String jsonData) {
        try {
            client.getBasicRemote().sendText(jsonData);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Sendet eine gegebene Nachricht an alle verbundenen Clients
     * @param jsonData Nachricht als Json-String
     */
    public void sendToAll(String jsonData) {

        synchronized(clients) {
            for (Session client : clients) {
                try {
                    client.getBasicRemote().sendText(jsonData);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public JSONArray getUserListAsJsonObject() {

        JSONArray userNames = new JSONArray();

        for(User user : userList.values()) {

            JSONObject obj = new JSONObject();
            obj.put("username", user.getUsername());
            userNames.add(obj);
        }
        return userNames;
    }

}
