<%@ include file="database.jsp" %>
<%! 
public class Employee extends database{
    private database db;
    Employee()
    {
        db = new database();
        createETable();
    }
    void createETable()
    {
        db.execute("create table eTable(eId int auto_increment,eName varchar(40),ePassword varchar(40),eType int,eCommission varchar(40), primary key (eId))");
    }
    int insertEmployee(String eName,String ePassword,int eType)
    {
        db.prepareStat("insert into eTable values(eId,?,?,?,0)");
        try {
            db.pS.setString(1,eName);
            db.pS.setString(2,ePassword);
            db.pS.setInt(3,eType);
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.executeP();
        db.r = db.query("select eId from eTable");
        int eId=1;
        try {
            if(db.r.next())
                db.r.last();
            eId = db.r.getInt(1);
            db.r.close();
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eId;
    }
    void deleteEmployee(int eId)
    {
        db.execute("delete from eTable where eId="+eId);
    }
    void updateCommission(int eId,int incrementBy)
    {
        db.prepareStat("update eTable set eCommission=eCommission+? where eId=?");
        try {
            db.pS.setInt(1,incrementBy);
            db.pS.setInt(2,eId);
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.executeP();
    }
    int getCommission(int eId)
    {
        int com=-1;
        db.r = db.query("select eCommission from eTable where eId="+eId);
        try {
            if(db.r.next())
                db.r.first();
            com = db.r.getInt(1);
            db.r.close(); 
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return com;
    }
    int queryEmployee(int eId,String ePassword)
    {
        int exist=-1;
        db.prepareStat("select eType from eTable where eId=? and ePassword=?");
        try {
            db.pS.setInt(1,eId);
            db.pS.setString(2,ePassword);
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.r = db.queryP();
        try {
            if(db.r.next())
                db.r.first();
            exist = db.r.getInt(1);
            db.r.close();
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exist;
    }
}
%>