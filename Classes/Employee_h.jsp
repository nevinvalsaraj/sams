<%!
class Employee{
    int eId;
    String eName;
    String ePassword;
    int eType;
    int eCommission;
    int ePaid;
    Employee(){}
    Employee(String eName_,String ePassword_,String eType_)
    {
        eName = eName_;
        ePassword = ePassword_;
        eType = Integer.parseInt(eType_);
    }
}
public class EmployeeTable extends database{
    EmployeeTable()
    {
        createETable();
    }
    private void createETable()
    {
        execute("create table eTable(eId int auto_increment,eName varchar(40),ePassword varchar(40),eType int,eCommission int,ePaid int, primary key (eId))");
    }
    int insertEmployee(Employee e)
    {
        prepareStat("insert into eTable values(eId,?,?,?,0,0)");
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
    void deleteEmployee(String eId)
    {
        execute("delete from eTable where eId="+Integer.parseInt(eId));
    }
    void updateCommission(String eId,String sId,String incrementBy)
    {
        ShowTable st = new ShowTable();
        Show s = st.queryShow(sId);
        int eComm = (Integer.parseInt(incrementBy)*s.pCommission)/100;
        prepareStat("update eTable set eCommission=eCommission+? where eId=?");
        try {
            pS.setInt(1,eComm);
            pS.setInt(2,Integer.parseInt(eId));
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        executeP();
    }
    void updatePaid(String eId,String incrementBy)
    {
        prepareStat("update eTable set ePaid=ePaid+? where eId=?");
        try {
            pS.setInt(1,Integer.parseInt(incrementBy));
            pS.setInt(2,Integer.parseInt(eId));
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        executeP();
    }
    void updatePassword(String eId,String newePassword)
    {
        prepareStat("update eTable set ePassword=? where eId=?");
        try {
            pS.setString(1,newePassword);
            pS.setInt(2,Integer.parseInt(eId));
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        executeP();
    }
    Employee validate(String eId,String ePassword)
    {
        Employee temp = null;
        prepareStat("select * from eTable where eId=? and ePassword=?");
        try {
            pS.setInt(1,Integer.parseInt(eId));
            pS.setString(2,ePassword);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        r = queryP();
        try {
            if(r.next())
                r.first();
            else return null;
            temp = new Employee();
            temp.eId = r.getInt(1);
            temp.eName = r.getString(2);
            temp.ePassword = r.getString(3);
            temp.eType = r.getInt(4);
            temp.eCommission = r.getInt(5);
            temp.ePaid = r.getInt(6);
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }
    List<Employee> listEmployee()
    {
        List<Employee> eList = new ArrayList();
        Employee temp;

        r = query("select * from eTable");
        try {
            if(r.next())
                r.first();
            do{
                temp = new Employee();
                temp.eId = r.getInt(1);
                temp.eName = r.getString(2);
                temp.ePassword = r.getString(3);
                temp.eType = r.getInt(4);
                temp.eCommission = r.getInt(5);
                temp.ePaid = r.getInt(6);
                eList.add(temp);
            }while(r.next());
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eList;
    }
    int netProfit()
    {
        int netPro;
        ExpenseTable ext = new ExpenseTable();
        TransactionTable tt = new TransactionTable();
        netPro = tt.totalTransaction()-(ext.totalExpense()+totalCommission());
        return netPro;
    }
    int totalCommission()
    {
        int totComm=0;
        r = query("select * from eTable");
        try {
            if(r.next())
                r.first();
            do{
                totComm += r.getInt(5);
            }while(r.next());
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totComm;
    }
    Employee queryEmployee(String eId)
    {
        Employee temp = null;
        r = query("select * from eTable where eId="+Integer.parseInt(eId));
        
        try {
            if(r.next())
                r.first();
            else return null;
            temp = new Employee();
            temp.eId = r.getInt(1);
            temp.eName = r.getString(2);
            temp.ePassword = r.getString(3);
            temp.eType = r.getInt(4);
            temp.eCommission = r.getInt(5);
            temp.ePaid = r.getInt(6);
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }
}
%>