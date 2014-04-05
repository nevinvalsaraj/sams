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
    Transaction(String nBal_,String nOrd_)
    {
        Date d = new Date();
        bDate = d.toString();
        nBal = Integer.parseInt(nBal_);
        nOrd = Integer.parseInt(nOrd_);
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
    int insertTransaction(Transaction t,String sId,String eId)
    {
        ShowTable st = new ShowTable();
        if(!st.checkSeat(sId,t.nBal+"",t.nOrd+""))
            return -1;

        st.changeSeat(sId,t.nBal+"",t.nOrd+"");

        prepareStat("insert into tTable values(tId,?,?,?,?,?,?)");
        try {
            pS.setInt(1,Integer.parseInt(eId));
            pS.setInt(2,Integer.parseInt(sId));
            pS.setString(3,t.bDate);
            pS.setInt(4,t.nBal);
            pS.setInt(5,t.nOrd);
            t.amount = getAmount(t,sId);
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
    void deleteTransaction(String tId)
    {
        r = query("select * from tTable where tId="+Integer.parseInt(tId));
        ShowTable st = new ShowTable();
        try{
            if(r.next())
                r.first();
            st.changeSeat(r.getInt(3)+"",-r.getInt(5)+"",-r.getInt(6)+"");
        } catch (SQLException ex) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        execute("delete from tTable where tId="+Integer.parseInt(tId));
    }
    List<Transaction> listTransaction()
    {
        List<Transaction> tList = new ArrayList();
        Transaction temp;

        r = query("select * from exTable");
        try {
            if(r.next())
                r.first();
            do{
                temp = new Transaction();
                temp.tId = r.getInt(1);
                temp.eId = r.getInt(2);
                temp.sId = r.getInt(3);
                temp.bDate = r.getString(4);
                temp.nBal = r.getInt(5);
                temp.nOrd = r.getInt(6);
                temp.amount = r.getInt(7);
                tList.add(temp);
            }while(r.next());
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tList;
    }
    Transaction queryTransaction(String tId)
    {
        Transaction temp = null;
        r = query("select * from tTable where tId="+Integer.parseInt(tId));

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
    int getAmount(Transaction t,String sId)
    {
        ShowTable st = new ShowTable();
        Show s = st.queryShow(sId);
        return s.pBal*t.nBal + s.pOrd*t.nOrd;
    }
}
%>