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
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        bDate=sdf.format(d);
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
        Show s = st.queryShow(sId);
        if(s==null)
            return -1;
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
        EmployeeTable et = new EmployeeTable();
        et.updateCommission(eId,sId,t.amount+"");
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
    void deleteTransaction(String tId,String eId)
    {
        TransactionTable tt = new TransactionTable();
        Transaction t = tt.queryTransaction(tId);
        if(t==null) return;

        r = query("select * from tTable where tId="+tId+" and eId="+eId);
        ShowTable st = new ShowTable();
        try{
            if(r.next())
                r.first();
            else return;
            st.changeSeat(r.getInt(3)+"","-"+r.getInt(5),"-"+r.getInt(6));
        } catch (SQLException ex) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        EmployeeTable et = new EmployeeTable();
        et.updateCommission(t.eId+"",t.sId+"",-t.amount+"");
        execute("delete from tTable where tId="+tId+" and eId="+eId);
    }
    List<Transaction> listAllTransaction()
    {
        List<Transaction> tList = new ArrayList();
        Transaction temp;

        r = query("select * from tTable");
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
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tList;
    }
    List<Transaction> listETransaction(String eId)
    {
        List<Transaction> tList = new ArrayList();
        Transaction temp;

        r = query("select * from tTable where eId="+eId);
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
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tList;
    }
    List<Transaction> listSTransaction(String sId)
    {
        List<Transaction> tList = new ArrayList();
        Transaction temp;

        r = query("select * from tTable where sId="+sId);
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
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tList;
    }
    int totalTransaction()
    {
        int totTr=0;
        r = query("select * from tTable");
        try {
            if(r.next())
                r.first();
            do{
                totTr += r.getInt(7);
            }while(r.next());
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totTr;
    }
    Transaction queryTransaction(String tId)
    {
        Transaction temp = null;
        r = query("select * from tTable where tId="+Integer.parseInt(tId));

        try {
            if(r.next())
                r.first();
            else return null;

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
    int refundAmount(Transaction t)
    {
        ShowTable st = new ShowTable();
        Show s = st.queryShow(t.sId+"");
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date dsDate = new Date();
        Date dcDate = new Date();
        try {
            dsDate = sdf.parse(s.sDate);
        } catch (ParseException ex) {
            Logger.getLogger(TransactionTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        double diff = (dsDate.getTime()-dcDate.getTime())/(1000.0*60*60*24);

        if(diff>3)
            return t.amount-10;
        else if(diff>=1)
            return t.amount-50;
        else if(diff>=0) return t.amount/2;
        else return 0;
    }
}
%>