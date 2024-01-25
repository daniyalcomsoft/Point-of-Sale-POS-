using System;
using System.Text;
using System.IO;



 public class EncryptDecryptUser
    {

     static byte[] key = ASCIIEncoding.ASCII.GetBytes("89cs15wt");

        public static string Encrypt(string originalString)
        {
            byte[] bytes = key;
            try
            {
                if (String.IsNullOrEmpty(originalString))
                {
                    throw new ArgumentNullException("The string which needs to be encrypted can not be null.");
                }

            System.Security.Cryptography.DESCryptoServiceProvider cryptoProvider = new System.Security.Cryptography.DESCryptoServiceProvider();
                MemoryStream memoryStream = new MemoryStream();
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, cryptoProvider.CreateEncryptor(bytes, bytes), System.Security.Cryptography.CryptoStreamMode.Write);

                StreamWriter writer = new StreamWriter(cryptoStream);
                writer.Write(originalString);
                writer.Flush();
                cryptoStream.FlushFinalBlock();
                writer.Flush();

                return Convert.ToBase64String(memoryStream.GetBuffer(), 0, (int)memoryStream.Length);
            }
            catch (Exception ex)
            { throw ex; }
        }
        public static string Decrypt(string cryptedString)
        {
            byte[] bytes = key;
            try
            {
                cryptedString = cryptedString.Replace(" ", "+");

                if (String.IsNullOrEmpty(cryptedString))
                {
                    throw new ArgumentNullException("The string which needs to be decrypted can not be null.");
                }

            System.Security.Cryptography.DESCryptoServiceProvider cryptoProvider = new System.Security.Cryptography.DESCryptoServiceProvider();
                MemoryStream memoryStream = new MemoryStream(Convert.FromBase64String(cryptedString));
            System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, cryptoProvider.CreateDecryptor(bytes, bytes), System.Security.Cryptography.CryptoStreamMode.Read);
                StreamReader reader = new StreamReader(cryptoStream);

                return reader.ReadToEnd();
            }
            catch (Exception ex)
            { throw ex; }
        }
    }