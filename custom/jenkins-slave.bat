copy C:\extra\jenkins_win2012.zip C:\

cd C:\
rmdir /s/ /q C:\jenkins
"C:\Program Files\7-Zip\7z" x jenkins_win2012.zip
C:\jenkins\bin\wrapper.exe -i C:\jenkins\conf\wrapper.conf
