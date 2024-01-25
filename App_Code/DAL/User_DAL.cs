using System;
using System.Data;
using System.Data.SqlClient;
using SQLHelper;

/// <summary>
/// Summary description for User_DAL
/// </summary>
public class User_DAL
{
	public User_DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public virtual bool CheckUserExist()
    {
        bool IsValid = false;
        string key = GetKey();
        if (!string.IsNullOrEmpty(key))
        {
            try {

            string[] keys =EncryptDecryptUser.Decrypt(EncryptionDecryption.Decrypt(key)).Split('|');
                if (keys.Length == 3)
                {
                    string cpuID = keys[0];
                    string biosID = keys[1];
                    string expired = keys[2];

                    if (cpuID == getuid() && biosID == getusid())
                    {
                        DateTime curdate = Convert.ToDateTime(expired).AddHours(23).AddMinutes(59).AddSeconds(59);
                        if (DateTime.Now <= curdate)
                        { IsValid = true; }
                    }
                }
                else if (keys.Length == 2)
                {
                    string cpuID = keys[0];
                    string biosID = keys[1];
                    if (cpuID == getuid() && biosID == getusid())
                    { IsValid = true; }
                }
          

            }
            catch(Exception ex)
            {
               
            }

        }
        return IsValid;
    }

    private string getuid()
    {
        string cpuID = string.Empty;
        System.Management.ManagementClass mc = new System.Management.ManagementClass("win32_processor");
        System.Management.ManagementObjectCollection moc = mc.GetInstances();
        foreach (System.Management.ManagementObject mo in moc)
        {
            if (cpuID == "")
            {

                cpuID = mo.Properties["processorID"].Value.ToString();

            }
        }
        return cpuID;
    }
    private string getusid()
    {
        string biosID = string.Empty;
        System.Management.ManagementClass mclass = new System.Management.ManagementClass("Win32_BIOS");
        System.Management.ManagementObjectCollection moclass = mclass.GetInstances();

        foreach (System.Management.ManagementObject mo in moclass)
        {
            if (biosID == "")
            {

                biosID = mo.Properties["SerialNumber"].Value.ToString();

            }
        }

        return biosID;
    }
    public virtual int InsertUpdateUser(User_BLL BL)
    {
        SqlParameter[] param = {new SqlParameter("@UserID",BL.UserID)
                                    , new SqlParameter("@RoleID",BL.RoleID)
                                    ,new SqlParameter("@Name",BL.Name)
                                     ,new SqlParameter("@UserName",BL.UserName)
                                      ,new SqlParameter("@Password",BL.Password) 
                                      ,new SqlParameter("@Phone",BL.Phone)
                                       ,new SqlParameter("@Email",BL.Email) 
                                      ,new SqlParameter("@Address",BL.Address)
                                       ,new SqlParameter("@Status",BL.Status)
                                      ,new SqlParameter("@Date",BL.Date)
                                       ,new SqlParameter("@User",BL.UserID)
                               };
        return Convert.ToInt32(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_InsertUpdateUser", param));
    }



    public virtual DataTable GetUserByUserName(string UserName)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserName",UserName)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetUserByUserName", Gparam).Tables[0];
    }

    public virtual DataTable GetUserList(object UserID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetUserList", Gparam).Tables[0];
    }
    public virtual bool DeleteUser(int UserID)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@UserID",UserID)
                               };
        return Convert.ToBoolean(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_DeleteUsers", Gparam));
    }

    public virtual DataTable GetComList()
    {
        SqlParameter[] Gparam = {

                               };
        return SqlHelper.ExecuteDataset(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetCompanyList", Gparam).Tables[0];
    }
    public virtual string GetKey()
    {
      
        return Convert.ToString(SqlHelper.ExecuteScalar(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_GetKey"));
    }

    public virtual string AddKey(string Key)
    {
        SqlParameter[] Gparam = {
                                    new SqlParameter("@Key",Key)
                               };
        return Convert.ToString(SqlHelper.ExecuteNonQuery(ConnectionString.PSMS, CommandType.StoredProcedure, "SP_AddKey", Gparam));
    }
    public virtual bool AddUserKey(string key)
    {
        bool isRegistered = false;
        
        try
        {
           
            string[] keys = EncryptDecryptUser.Decrypt(EncryptionDecryption.Decrypt(key)).Split('|');
            if (keys.Length == 3)
            {
                string cpuID = keys[0];
                string biosID = keys[1];
                string expired = keys[2];

                if (cpuID == getuid() && biosID == getusid())
                {
                    DateTime curdate = Convert.ToDateTime(expired).AddHours(23).AddMinutes(59).AddSeconds(59);
                    if (DateTime.Now <= curdate)
                    { isRegistered = true; }
                }
            }
            else if (keys.Length == 2)
            {
                string cpuID = keys[0];
                string biosID = keys[1];
                if (cpuID == getuid() && biosID == getusid())
                { isRegistered = true; }
            }

            if(isRegistered)
            { AddKey(key); }
           

        }
        catch (Exception ex)
        {

        }
        
        return isRegistered;

    }
}