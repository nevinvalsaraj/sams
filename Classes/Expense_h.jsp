<%!
class Expense{
    int exId;
    int eId;
    int sId;
    String exTitle;
    String exDescripion;
    String exDate;
    int amount;
    Expense(){}
    Expense(String exTitle_,String exDescription_,String amount_){
        Date d = new Date();
        exTitle=exTitle_;
        exDescripion=exDescription_;
        exDate = d.toString();
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
        prepareStat("insert into exTable values(exId,?,?,?,?,?,?)");
        try {
            pS.setInt(1,Integer.parseInt(eId));
            pS.setInt(2,Integer.parseInt(sId));
            pS.setString(3,ex.exTitle);
            pS.setString(4,ex.exDescripion);
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
    void deleteExpense(int exId)
    {
        execute("delete from exTable where exId="+exId);
    }
    Expense queryExpense(int exId)
    {
        Expense temp = null;
        r = query("select * from exTable where exId="+exId);

        try {
            if(r.wasNull())
                return null;
            if(r.next())
                r.first();
            temp = new Expense();
            temp.exId = r.getInt(1);
            temp.eId = r.getInt(2);
            temp.sId = r.getInt(3);
            temp.exTitle = r.getString(4);
            temp.exDescripion = r.getString(5);
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