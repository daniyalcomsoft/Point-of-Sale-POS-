using System;
using System.Text;
using System.IO;


 public class EncryptionDecryption
{

     static string key = "WE2019b8tech3853";

    public static string Encrypt(string plainText)
    {
        byte[] iv = new byte[16];
        byte[] array;

        using (System.Security.Cryptography.Aes aes = System.Security.Cryptography.Aes.Create())
        {
            aes.Key = Encoding.UTF8.GetBytes(key);
            aes.IV = iv;

            System.Security.Cryptography.ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

            using (MemoryStream memoryStream = new MemoryStream())
            {
                using (System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream((Stream)memoryStream, encryptor, System.Security.Cryptography.CryptoStreamMode.Write))
                {
                    using (StreamWriter streamWriter = new StreamWriter((Stream)cryptoStream))
                    {
                        streamWriter.Write(plainText);
                    }

                    array = memoryStream.ToArray();
                }
            }
        }

        return Convert.ToBase64String(array);
    }

    public static string Decrypt(string cipherText)
    {
        byte[] iv = new byte[16];
        byte[] buffer = Convert.FromBase64String(cipherText);

        using (System.Security.Cryptography.Aes aes = System.Security.Cryptography.Aes.Create())
        {
            aes.Key = Encoding.UTF8.GetBytes(key);
            aes.IV = iv;
            System.Security.Cryptography.ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

            using (MemoryStream memoryStream = new MemoryStream(buffer))
            {
                using (System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream((Stream)memoryStream, decryptor, System.Security.Cryptography.CryptoStreamMode.Read))
                {
                    using (StreamReader streamReader = new StreamReader((Stream)cryptoStream))
                    {
                        return streamReader.ReadToEnd();
                    }
                }
            }
        }
    }

    }