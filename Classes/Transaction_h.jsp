<%!
class Transaction{
    int tId;
    int eId;
    int sId;
    String bDate;
    int nBal;
    int nOrd;
    int amount;
    Transaction(){}
    Transaction(int nBal_,int nOrd_)
    {
        Date d = new Date();
        bDate = d.toString();
        nBal = nBal_;
        nOrd = nOrd_;
    }
}
public class TransactionTable extends database{
    TransactionTable()
    {
        createtTable();
    }
    //tId,eId,sId,bDate,nBal,nOrd,amount
    private void createtTable()
    {
        execute("create table tTable(tId int auto_increment, eId int,sId int,bDate varchar(30),nBal int,nOrd int,amount int,primary(tId))");
    }
    int insertTransaction(Transaction t,Show s,Employee e)
    {
        prepareStat("insert into tTable values(tId,?,?,?,?,?,?)");
        try {
            pS.setInt(1,e.eId);
            pS.setInt(2,s.sId);
            pS.setString(3,t.bDate);
            pS.setInt(4,t.nBal);
            pS.setInt(5,t.nOrd);
            t.amount = getAmount(t,s);
            pS.setInt(6,t.amount);
        } catch (SQLException ex) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        executeP();
        r = query("select tId from tTable");
        t.tId=1;
        try {
            if(r.next())
                r.last();
            t.tId = r.getInt(1);
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t.tId;
    }
    void deleteTransaction(int tId)
    {
        execute("delete from tTable where tId="+tId);
    }
    Transaction queryTransaction(int tId)
    {
        Transaction temp = null;
        r = query("select * from tTable where tId="+tId);

        try {
            if(r.wasNull())
                return null;
            if(r.next())
                r.first();
            temp = new Transaction();
            temp.tId = r.getInt(1);
            temp.eId = r.getInt(2);
            temp.sId = r.getInt(3);
            temp.bDate = r.getString(4);
            temp.nBal = r.getInt(5);
            temp.nOrd = r.getInt(6);
            temp.amount = r.getInt(7);
            
        } catch (SQLException ex) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return temp;
    }
    int getAmount(Transaction t,Show s)
    {
        ShowTable st = new ShowTable();
        s = st.queryShow(s.sId);
        return s.pBal*t.nBal + s.pOrd*t.nOrd;
    }
}
%>