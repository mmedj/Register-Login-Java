import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUser {
    private String dbUrl = "jdbc:mysql://localhost:3306/etudiant";
    private String dbName = "root";
    private String dbPwd = "azerty";
    private String dbDriver = "com.mysql.cj.jdbc.Driver";

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);
        return DriverManager.getConnection(dbUrl, dbName, dbPwd);
    }

    public String insert(User user) {
        String result = "success";

        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO user (Name, Email, Password) VALUES (?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, user.getNom());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getPassword());

                ps.execute();
                result = "success";

            } catch (SQLException e) {
                e.printStackTrace();
                result = "failed";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            result = "connection failed";
        }

        return result;
    }
    public boolean login(String email, String password) {
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM user WHERE Email = ? AND Password = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // User with the provided email and password exists in the database
                        return true;
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        // User with the provided email and password does not exist in the database
        return false;
    }
    public int updatePassword(String email, String newPassword) {
        int rowCount = 0;
        try (Connection conn = getConnection()) {
            String sql = "UPDATE user SET Password = ? WHERE Email = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, newPassword);
                ps.setString(2, email);
                rowCount = ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return rowCount;
    }

}
