Follow the steps below to create an Institutional Recovery Key without a private key

Find in the bottom all links I have used. 

#Creation of IRK
1. On a computer with admin privileges, open Terminal and type in the following command
   
`sudo security create-filevaultmaster-keychain /Library/Keychains/FileVaultMaster.keychain`

2. Enter a password for the new keychain when prompted. A keychain FileVaultMaster.keychain is created in the following location: 

/Library/Keychains/

3. Unlock the keychain by opening Terminal and executing:

`security unlock-keychain /Library/Keychains/FileVaultMaster.keychain`
   
4. Open Keychain Access.


5. From the menu bar, choose "Add Keychain" from the File pop-up menu. Then, add the FileVaultMaster.keychain file located in /Library/Keychains/.


6. Select FileVaultMaster under the Keychains heading in the sidebar, and then select All Items under the Category heading.


7. Select the certificate. Do not select the private key associated with the certificate.


8. From the menu bar, choose "Export Items" from the File pop-up menu. Then, save the recovery key as a .pem file or .cer file.
You will need to upload this file to Jamf Pro when creating the disk encryption configuration.


9. Quit Keychain Access.


10. Store the keychain (FileVaultMaster.keychain) in a secure location so you can use it to access encrypted data at a later time.

----

#Deployment of IRK

Next, in your Jamf Pro instance, create a new configuration profile to deploy the payload 

1. Click on Security and Privacy and create a new payload. In the FileVault tab, make sure the following is set: 
- Require FileVault 2
    - Use Institutional Recovery key
        - Certificate = none (this will change in a bit)
    - Create individual recovery key
  
- Enable Escrow Personal Recovery Key
    - Escrow Location Description: fill in a message to display to the user
    - This is the description that is visible in the Record itself
    - Personal Recovery Key Encryption Method: Automatically encrypt and decrypt recovery key

2. Click on Certificate to create a new payload. You will see that automatically, Jamf Pro will add the JSS FileVault Recovery Key Escrow Certificate. Leave this as is and 
   

3. Upload your earlier created certificate and provide a name for it. Leave the rest untouched


4. Go back to Security and Privacy and in the certificate section under "Use Institutional Recovery key", select the certificate that you have uploaded


5. Provide a scope and deploy




[Jamf documentation](https://docs.jamf.com/technical-papers/jamf-pro/administering-filevault-macos/10.7.1/Creating_and_Exporting_an_Institutional_Recovery_Key.html)
