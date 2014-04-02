<%!
class Employee{
    int eId;
    String eName;
    String ePassword;
    int eType;
    int eCommission;
    Employee(){}
    Employee(int eId_,String ePassword_)
    {
        eId = eId_;
        ePassword = ePassword_;
    }
    Employee(String eName_,String ePassword_)
    {
        eName = eName_;
        ePassword = ePassword_;
    }
}
class EmployeeTable extends database{
    EmployeeTable()
    {
        createETable();
    }
    private void createETable()
    {
        execute("create table eTable(eId int auto_increment,eName varchar(40),ePassword varchar(40),eType int,eCommission int, primary key (eId))");
    }
    int insertEmployee(Employee e)
    {
        prepareStat("insert into eTable values(eId,?,?,?,0)");
        try {
            pS.setString(1,e.eName);
            pS.setString(2,e.ePassword);
            pS.setInt(3,e.eType);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        executeP();
        r = query("select eId from eTable");
        e.eId=1;
        try {
            if(r.next())
                r.last();
            e.eId = r.getInt(1);
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e.eId;
    }
    void deleteEmployee(int eId)
    {
        execute("delete from eTable where eId="+eId);
    }
    void updateCommission(int eId,int incrementBy)
    {
        prepareStat("update eTable set eCommission=eCommission+? where eId=?");
        try {
            pS.setInt(1,incrementBy);
            pS.setInt(2,eId);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        executeP();
    }
    Employee queryEmployee(Employee e)
    {
        Employee temp = null;
        prepareStat("select * from eTable where eId=? and ePassword=?");
        try {
            pS.setInt(1,e.eId);
            pS.setString(2,e.ePassword);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        r = queryP();
        try {
            if(r.wasNull())
                return null;
            if(r.next())
                r.first();
            temp = new Employee();
            temp.eId = r.getInt(1);
            temp.eName = r.getString(2);
            temp.ePassword = r.getString(3);
            temp.eType = r.getInt(4);
            temp.eCommission = r.getInt(5);
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }
}
%>