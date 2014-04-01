<%@ page import="java.sql.Connection,java.sql.DriverManager
,java.sql.PreparedStatement
,java.sql.ResultSet
,java.sql.SQLException
,java.sql.Statement
,java.util.List
,java.util.logging.Level
,java.util.logging.Logger
,sun.security.ssl.Debug" %>

<%! public class database {
    
    private final String url = "jdbc:mysql://localhost:3305/samsdb";
    private String user = "root";
    private String password = "root";
    private Connection conn = null;
    Statement s;
    PreparedStatement pS;
    ResultSet r=null;
    
    public database()
    {        
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, user, password);
            Debug.println("Connection","Success");
            s = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        }
        catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
                Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch(SQLException e)
        {
                Debug.println("Connection",e.getMessage());
        }
    }
    
    public void close()
    {
        try{
            if (r != null) {
                r.close();
            }
            if (s != null) {
                s.close();
            }
            if (pS != null) {
                pS.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        catch(SQLException e){}
        
    }
    
    public ResultSet query(String stat)
    {
        Debug.println("Query",stat);
        ResultSet ret=null;
        try {
            ret = s.executeQuery(stat);
        } catch (SQLException ex) {
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    public ResultSet queryP()
    {
        ResultSet ret=null;
        try {
            ret = pS.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    public void prepareStat(String stat)
    {
        Debug.println("Prepare",stat);
        try {
            pS = conn.prepareStatement(stat);
        } catch (SQLException ex) {
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void executeP()
    {
        try {
            pS.execute();
        } catch (SQLException ex) {
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void execute(String stat)
    {
        Debug.println("Execute",stat);
        try {
            s.execute(stat);
        } catch (SQLException ex) {
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void update(String stat)
    {
        Debug.println("Update",stat);
        try {
            s.executeUpdate(stat);
        } catch (SQLException ex) {
            Logger.getLogger(database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
} %>
