package Action;
 
import java.io.DataInputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Random;

import org.apache.commons.codec.binary.Base64;
 
public class RSA 
{
    private BigInteger p;
    private BigInteger q;
    private BigInteger N;
    private BigInteger phi;
    private BigInteger e;
    private BigInteger d;
    private int       bitlength = 1024;
    private Random     r;
 
    public RSA()
    {
        r = new Random();
        p = BigInteger.probablePrime(bitlength, r);
        q = BigInteger.probablePrime(bitlength, r);
        N = p.multiply(q);
        phi = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));
        e = BigInteger.probablePrime(bitlength / 2, r);
        while (phi.gcd(e).compareTo(BigInteger.ONE) > 0 && e.compareTo(phi) < 0)
        {
            e.add(BigInteger.ONE);
        }
        d = e.modInverse(phi);
    }
 
    public RSA(BigInteger e, BigInteger d, BigInteger N)
    {
        this.e = e;
        this.d = d;
        this.N = N;
    }
 
    @SuppressWarnings("deprecation")
    public static void main(String[] args) throws IOException
    {
        RSA rsa = new RSA();
        DataInputStream in = new DataInputStream(System.in);
        String teststring;
        System.out.println("Enter the plain text:");
        teststring = in.readLine();
        System.out.println("Encrypting String: " + teststring);
        System.out.println("String in Bytes: "
                + bytesToString(teststring.getBytes()));
        
        
        String encryp= rsa.encrypt(teststring);
        System.out.println("E:"+encryp);
        // encrypt
       byte[] encrypted = rsa.encrypt(teststring.getBytes());
        
       String decrypt=rsa.decrypt(encryp);

       System.out.println("E:"+decrypt);

        // decrypt
        byte[] decrypted = rsa.decrypt(encrypted);
        System.out.println("Decrypting Bytes: " + bytesToString(decrypted));
        System.out.println("Decrypted String: " + new String(decrypted));
    }
    
    
    
    public String encrypt(String unencryptedString) {
        String encryptedString = null;
        try {
          
            byte[] plainText =unencryptedString.getBytes();
                    byte[] encryptedText = (new BigInteger(plainText)).modPow(e, N).toByteArray();
                    encryptedString = new String(Base64.encodeBase64(encryptedText));
                } catch (Exception e) {
                    e.printStackTrace();
        }
        return encryptedString;
    }
    public String decrypt(String encryptedString) {
        String decryptedText=null;
        try {
            
            byte[] encryptedText = Base64.decodeBase64(encryptedString);
            byte[] plainText =  (new BigInteger(encryptedText)).modPow(d, N).toByteArray();
            decryptedText= new String(plainText);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return decryptedText;
    }
    
    
    public static String bytesToString(byte[] encrypted)
    {
        String test = "";
        for (byte b : encrypted)
        {
            test += Byte.toString(b);
        }
        return test;
    }
 
    // Encrypt message
    public byte[] encrypt(byte[] message)
    {
        return (new BigInteger(message)).modPow(e, N).toByteArray();
    }
 
    // Decrypt message
    public byte[] decrypt(byte[] message)
    {
        return (new BigInteger(message)).modPow(d, N).toByteArray();
    }
}