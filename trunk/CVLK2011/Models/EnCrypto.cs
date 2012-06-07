using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
namespace CVLK2011.Models
{
 public class EnCrypto
    {
        #region --enums,contants
             public enum CryptoTypes
             {
                 encTypeDES =0,
                 encTypeRC2 ,
				 encTypeRijndael,
				 encTypeTripleDES
             }
             private const String CRYPT_DEFAULT_PASSWORD = "thienhong";
             private const CryptoTypes CRYPT_DEFAULT_METHOD = CryptoTypes.encTypeRijndael;
             private byte[] mKey ={ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 };
             private byte[] mIV ={ 65, 110, 68, 26,69, 178, 200, 219 };
             private byte[] SaltByteArray ={0x49,0x76,0x61,0x6e,0x20,0x4d,0x65,0x64,0x76,0x65,0x64,0x65,0x76 };
             private CryptoTypes mCryptoType = CRYPT_DEFAULT_METHOD;
             private String mPassword =CRYPT_DEFAULT_PASSWORD;
        #endregion

#region --Properties--
     public CryptoTypes CryptoType
     {
         get { return mCryptoType; }
         set
         {
             if (mCryptoType!=value)
             {
                 mCryptoType = value;
                 CalculateNewKeyAndIV();
             }
         }
     }
     public String Password
     {
         get { return mPassword; }
         set
         {
             if (mPassword!=value)
             {
                 mPassword=value;
                 CalculateNewKeyAndIV();
             }
         }
     }
#endregion
#region --Constractor--
     public EnCrypto()
     {
         CalculateNewKeyAndIV();
        
     }
     public EnCrypto(CryptoTypes cryptotype)
     {
         this.CryptoType = cryptotype;
     }
#endregion
#region --EnCryption--
     /// <summary>
     ///   Encryption method
     /// </summary>
     /// 
     public String Encrypt(String strInputString)
     {
         UTF8Encoding encodeing = new UTF8Encoding();
         byte[] inputByte = encodeing.GetBytes(strInputString);
         return Convert.ToBase64String(EnCryptDecrypt(inputByte, true));
     }
     /// <summary>
     ///   encrypt password
     /// </summary>
     /// 
     public String Encrypt(String strInputString,String strPassword)
     {
         this.Password = strPassword;
         return this.Encrypt(strInputString);
     }

     public String Encrypt(String strInputString,String strPassword,CryptoTypes cryptoType)
     {
         this.mCryptoType = cryptoType;
         this.Password = strPassword;
         return this.Encrypt(strInputString);
     }
#endregion
#region --Decryption--
     public String Decrypt(String strInputString)
     {

         UTF8Encoding encoding = new UTF8Encoding();
         byte[] intPutBytes = Convert.FromBase64String(strInputString);
         return encoding.GetString(EnCryptDecrypt(intPutBytes,false));
     }

     public String Decrypt (String strInputString,String strPassword)
     {
         this.Password = strPassword;
         return Decrypt(strInputString);
     }

     public String Decrypt(String strInputString ,String strPassword,CryptoTypes cryptType)
     {
         this.mCryptoType = cryptType;
         this.Password = strPassword;
         return Decrypt(strInputString);
     }
#endregion
#region --Functions--
     /// <summary>
     ///   Select SymmetricAlgorithm
     /// 
     /// </summary>
     /// 
     private SymmetricAlgorithm SelectAlgorithm()
     {
         SymmetricAlgorithm SA;
         switch(mCryptoType)
         {
             case CryptoTypes.encTypeDES:
                 SA = DES.Create();
                 break; ;
             case CryptoTypes.encTypeRC2:
                 SA = RC2.Create();
                 break;
             case CryptoTypes.encTypeRijndael:
                 SA = Rijndael.Create();
                 break;
             case CryptoTypes.encTypeTripleDES:
                 SA = TripleDES.Create();
                 break;
             default:
                 SA = TripleDES.Create();
                 break;
         }
         return SA;
     }
     /// <summary>
     ///   calculate new key
     /// </summary>
     /// 
     private void CalculateNewKeyAndIV()
     {
         PasswordDeriveBytes pwdb = new PasswordDeriveBytes(mPassword, SaltByteArray);
         SymmetricAlgorithm alg = SelectAlgorithm();
         mKey = pwdb.GetBytes(alg.KeySize / 8);
         mIV = pwdb.GetBytes(alg.BlockSize / 8);

     }
     private ICryptoTransform GetCryptTransform(bool encrypt)
     {
         SymmetricAlgorithm sa = SelectAlgorithm();
         sa.Key = mKey;
         sa.IV = mIV;
         if (encrypt)
             return sa.CreateEncryptor();
         else
             return sa.CreateDecryptor();
     }
     private byte[] EnCryptDecrypt(byte[] inputByte,bool isEncrypt)
     {
         ICryptoTransform cryptTranform = GetCryptTransform(isEncrypt);
         MemoryStream mStream  = new MemoryStream();
         try
         {
             CryptoStream cryptStream = new CryptoStream(mStream, cryptTranform, CryptoStreamMode.Write);
             cryptStream.Write(inputByte, 0, inputByte.Length);
             cryptStream.FlushFinalBlock();
             byte[] outPut = mStream.ToArray();
             cryptStream.Close();
             return outPut;
         }
         catch (System.Exception ex)
         {
             throw new Exception(" Error in Symmetric engine. Error : " + ex.Message);
         }
     }
#endregion
    }
}
