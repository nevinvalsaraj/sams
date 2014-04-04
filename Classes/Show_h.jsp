<%!
class Show{
    int sId;
    String sName;
    String sDate;
    String eDate;
    int mBal;
    int mOrd;
    int lBal;
    int lOrd;
    int pBal;
    int pOrd;
    Show(){}
    Show(String sName_,String sDate_,String eDate_,String mBal_,String mOrd_,String pBal_,String pOrd_)
    {
        sName = sName_;
        sDate = sDate_;
        eDate = eDate_;
        mBal = Integer.parseInt(mBal_);
        mOrd = Integer.parseInt(mOrd_);
        pBal = Integer.parseInt(pBal_);
        pOrd = Integer.parseInt(pOrd_);
    }
}
public class ShowTable extends database{
    ShowTable()
    {
        createSTable();
    }
    private void createSTable()
    {
        //sId,sName,sDate,eDate,mBal,mOrd,lBal,lOrd,pBal,pOrd
        execute("create table sTable(sId int auto_increment,sName varchar(30),sDate varchar(30),eDate varchar(30),mBal int,mOrd int,lBal int,lOrd int,pBal int,pOrd int,primary key(sId))");
    }
    int insertShow(Show s)
    {
        prepareStat("insert into sTable values(sId,?,?,?,?,?,0,0,?,?)");
        try {
            pS.setString(1,s.sName);
            pS.setString(2,s.sDate.toString());
            pS.setString(3,s.eDate.toString());
            pS.setInt(4,s.mBal);
            pS.setInt(5,s.mOrd);
            pS.setInt(6,s.pBal);
            pS.setInt(7,s.pOrd);
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        executeP();
        r = query("select sId from sTable");
        int sId=1;
        try {
            if(r.next())
                r.last();
            sId = r.getInt(1);
            r.close();
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        s.sId = sId;
        return sId;
    }
    void deleteShow(String sId)
    {
        execute("delete from sTable where sId="+Integer.parseInt(sId));
    }
    Show queryShow(String sId)
    {
        Show temp=null;
        r = query("select * from sTable where sId="+Integer.parseInt(sId));
        try {
            if(r.wasNull())
                return null;
            if(r.next())
                r.first();
            temp = new Show();
            temp.sId = sId;
            temp.sName = r.getString(2);
            temp.sDate = r.getString(3);
            temp.eDate = r.getString(4);
            temp.mBal = r.getInt(5);
            temp.mOrd = r.getInt(6);
            temp.lBal = r.getInt(7);
            temp.lOrd = r.getInt(8);
            temp.pBal = r.getInt(9);
            temp.pOrd = r.getInt(10);
        } catch (SQLException ex) {
            Logger.getLogger(ShowTable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return temp;
    }
}
%>