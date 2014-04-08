<%!
class Expense{
    int exId;
    int eId;
    int sId;
    String exTitle;
    String exDescription;
    String exDate;
    int amount;
    Expense(){}
    Expense(String exTitle_,String exDescription_,String amount_){
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        exDate=sdf.format(d);
        exTitle=exTitle_;
        exDescription=exDescription_;
        amount = Integer.parseInt(amount_);
    }
}
class ExpenseTable extends database{
    ExpenseTable()
    {
        createExTable();
    }
    //exId,eId,sId,exTitle,exDescripion,exDate,amount
    private void createExTable()
    {
        execute("create table exTable(exId int auto_increment,eId int,sId int,exTitle varchar(20),exDescripion varchar(50),exDate varchar(30),amount int,primary key(exId))");
    }
    int insertExpense(Expense ex,String sId,String eId)
    {
        ShowTable st = new ShowTable();
        Show s = st.queryShow(sId);
        if(s==null)
            return -1;
        prepareStat("insert into exTable values(exId,?,?,?,?,?,?)");
        try {
            pS.setInt(1,Integer.parseInt(eId));
            pS.setInt(2,Integer.parseInt(sId));
            pS.setString(3,ex.exTitle);
            pS.setString(4,ex.exDescription);
            pS.setString(5,ex.exDate);
            pS.setInt(6,ex.amount);
        } catch (SQLException et) {
            Logger.getLogger(ExpenseTable.class.getName()).log(Level.SEVERE, null, et);
        }
        executeP();
        r = query("select exId from exTable");
        ex.exId=1;
        try {
            if(r.next())
                r.last();
            ex.exId = r.getInt(1);
            r.close();
        } catch (SQLException et) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, et);
        }
        return ex.exId;
    }
    void deleteExpense(String exId)
    {
        execute("delete from exTable where exId="+Integer.parseInt(exId));
    }
    List<Expense> listExpense()
    {
        List<Expense> exList = new ArrayList();
        Expense temp;

        r = query("select * from exTable");
        try {
            if(r.next())
                r.first();
            do{
                temp = new Expense();
                temp.exId = r.getInt(1);
                temp.eId = r.getInt(2);
                temp.sId = r.getInt(3);
                temp.exTitle = r.getString(4);
                temp.exDescription = r.getString(5);
                temp.exDate = r.getString(6);
                temp.amount = r.getInt(7);
                exList.add(temp);
            }while(r.next());
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exList;
    }
    List<Expense> listSExpense(String sId)
    {
        List<Expense> exList = new ArrayList();
        Expense temp;

        r = query("select * from exTable where sId="+sId);
        try {
            if(r.next())
                r.first();
            do{
                temp = new Expense();
                temp.exId = r.getInt(1);
                temp.eId = r.getInt(2);
                temp.sId = r.getInt(3);
                temp.exTitle = r.getString(4);
                temp.exDescription = r.getString(5);
                temp.exDate = r.getString(6);
                temp.amount = r.getInt(7);
                exList.add(temp);
            }while(r.next());
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exList;
    }
    int totalExpense()
    {
        int totEx=0;
        r = query("select * from exTable");
        try {
            if(r.next())
                r.first();
            do{
                totEx += r.getInt(7);
            }while(r.next());
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totEx;
    }
    int totalSExpense(String sId)
    {
        int totEx=0;
        r = query("select * from exTable where sId="+sId);
        try {
            if(r.next())
                r.first();
            do{
                totEx += r.getInt(7);
            }while(r.next());
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totEx;
    }
    Expense queryExpense(int exId)
    {
        Expense temp = null;
        r = query("select * from exTable where exId="+exId);

        try {
            if(r.next())
                r.first();
            else return null;

            temp = new Expense();
            temp.exId = r.getInt(1);
            temp.eId = r.getInt(2);
            temp.sId = r.getInt(3);
            temp.exTitle = r.getString(4);
            temp.exDescription = r.getString(5);
            temp.exDate = r.getString(6);
            temp.amount = r.getInt(7);
            r.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return temp;
    }
}
%>