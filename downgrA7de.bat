@echo off
Title Version 1.3.1 ,downgA7de , by hacks4live. By the community. 
echo Welcome to downgA7de 
echo Make Sure TO Have Your Blob .shsh2 On The DESTKOP! Otherwise it WILL FAIL! 
echo Make sure to have the target ipsw this can be anything 10.0--11.1.2 YES YOU CAN DOWNGRADE FROM 10.3.x to 10.x.x !
echo Copying Extract files....
COPY C:\users\%USERNAME%\Desktop\7z.dll c:\windows\system32\7z.dll
COPY C:\users\%USERNAME%\Desktop\7z.exe c:\windows\system32\7z.exe
echo Make sure you have 'blob.shsh2' on your destkop ..
echo Checking for blob.shsh2 on your desktop... 
if exist c:\users\%USERNAME%\desktop\blob.shsh2 (echo Done checking blob.) else (echo Failed to check for blob , make sure that you've your blob on the desktop.)    
echo Checking for Target.ipsw on your desktop...
if exist c:\users\%USERNAME%\desktop\target.ipsw (echo You've an ipsw, continueing.... ) else (if not exist C:\Users\%USERNAME%\Desktop\Firmwarechooser.bat cscript /nologo wget.js https://www.dropbox.com/s/5luvxtg3uflwjj8/Firmwarechooser.bat?dl=1 C:\Users\%USERNAME%\Desktop\Firmwarechooser.bat)
if exist c:\users\%USERNAME%\desktop\target.ipsw (echo Done checkig no need for downloading an ipsw ) else (START C:\Users\%USERNAME%\Desktop\Firmwarechooser.bat) 
echo Making a folder for the ipa's on your Desktop...
if not exist 'c:\users\%USERNAME%\desktop\Nonceipa' mkdir c:\users\%USERNAME%\desktop\Nonceipa
Pause 
cls
echo First , We will Download Cydia Impactor , And then Your choosen IPA.
echo Downloading Cydiaimpactor...
if exist C:\Users\%USERNAME%\Desktop\Impactor.zip (echo Found Cydia Impactor, Skipping this part... ) else (cscript /nologo wget.js https://cache.saurik.com/impactor/win/Impactor_0.9.43.zip  C:\Users\%USERNAME%\Desktop\Impactor.zip) 
7z x "C:\Users\%USERNAME%\Desktop\Impactor.zip" -oC:\Users\%USERNAME%\Desktop\impactor -y>nul
echo Which IPA do you want ?
echo 1) Nonceset1112 11.0-11.1.2	 
echo 2) V0rtexnonce 10.3-10.3.3
set /p ipa=Enter a number:
if %ipa%==1 if exist C:\Users\%USERNAME%\Desktop\impactor\Sideloadthisipa.ipa (echo Sideload Nonceset1112, Skipping this part... ) else (cscript /nologo wget.js https://github.com/julioverne/NonceSet112/raw/master/NonceSet1112_v1.3.ipa C:\Users\%USERNAME%\Desktop\Nonceipa\Sideloadthisipa.ipa) 
if %ipa%==2 if exist C:\Users\%USERNAME%\Desktop\impactor\v0rtex.ipa (echo Sideload v0rtexnonce, Skipping this part... )else (cscript /nologo wget.js http://hacks4liveprojects.com/v0rtexNonce_v1.ipa C:\Users\%USERNAME%\Desktop\Nonceipa\v0rtex.ipa)
echo Okay .... make sure that you have your blob on the destkop... 
echo We will pause this, SIGN THE IPA , AND OPEN IT ... IGNORE ANY ERRORS
cls
START C:\Users\%USERNAME%\Desktop\impactor\impactor.exe
Pause
cls
echo Make sure you have 'blob.shsh2' on your destkop ..
echo Showing nonce now...
FIND  /i "0x" C:\Users\%USERNAME%\Desktop\blob.shsh2
echo Type the nonce inside  the app, and click the ok button 
pause >null
echo Which DEVICE do you have ? 
echo 1) 6.1 N51AP IPhone 5S
echo 2) 6.2 N53AP IPhone 5S
echo 3) IPad Mini 2 
echo 4) IPad Air 1 
echo 5) Download Futurerestore only ...
set /p ios=Enter a number:
if %ios%==1 cscript /nologo wget.js https://www.dropbox.com/s/w4l1l591sipxmyr/n51ap%206%2C1.zip?dl=1 C:\Users\%USERNAME%\Desktop\Downfiles.zip
if %ios%==2 cscript /nologo wget.js https://www.dropbox.com/s/ob2y3rqppjqzvom/Downfiles.zip?dl=1 C:\Users\%USERNAME%\Desktop\Downfiles.zip
if %ios%==3 cscript /nologo wget.js https://www.dropbox.com/s/r30y82rrkjxbt3h/Mini2.zip?dl=1 C:\Users\%USERNAME%\Desktop\Downfiles.zip
if %ios%==4 cscript /nologo wget.js https://www.dropbox.com/s/87tf3blckwcrp1k/Air.zip?dl=1 C:\Users\%USERNAME%\Desktop\Downfiles.zip
if %ios%==5 cscript /nologo wget.js https://www.dropbox.com/s/7a5ot15l8b12r7u/futurerestore.exe?dl=1 C:\users\%USERNAME%\desktop\futurerestore.exe 
7z x "C:\Users\%USERNAME%\Desktop\Downfiles.zip" -oC:\Users\%USERNAME%\Desktop\ -y>nul
pause
cls
cd C:\Users\%USERNAME%\Desktop\
if exist c:\users\%USERNAME%\desktop\bb.bbfw  (futurerestore -t blob.shsh2 -b bb.bbfw -p 12.plist -s SEP.im4p -m 12.plist target.ipsw ) else (futurerestore -t blob.shsh2 -p 12.plist -s SEP.im4p -m 12.plist target.ipsw)
echo Done ! If you have any error, please ask on reddit for help ! u/hacks4live
echo Program by Hacks4live , Files and restore data by @saurik, @alitek123 @tihmstar.
pause
