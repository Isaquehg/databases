import DAO.UserDAO;
import Model.User;

public class Main {

    public static void main(String[] args) {
        UserDAO userDAO= new UserDAO();

        User u1 =  new User("Pedro", "123456789");
        User u2 = new User("Mario", "987654321");

        userDAO.insertUser(u1);
        userDAO.insertUser(u2);

        userDAO.selectUser();

        userDAO.deleteUser(2);

        userDAO.updateUser(1,u2);

    }
}