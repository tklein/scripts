set URL=%1
set NAME=%2

REM ################# Proxy settings ##################
set http_proxy=http://192.168.0.2:8080
set ftp_proxy=http://192.168.0.2:8080
REM ###################################################

set CALIBRE_PATH=c:\Program Files (x86)\Calibre2\
set DOWNLOAD_PATH=c:\temp\articles
set EPUB_PATH=c:\Users\Thorsten_Klein\Dropbox\manuals\articles\


"%CALIBRE_PATH%\web2disk" -d %DOWNLOAD_PATH% %URL%

dir unenc /b %DOWNLOAD_PATH%\*.*html > %DOWNLOAD_PATH%\dir.txt
set /p ARTICLE_FILE=<%DOWNLOAD_PATH%\dir.txt

"%CALIBRE_PATH%\ebook-convert" %DOWNLOAD_PATH%\%ARTICLE_FILE% %EPUB_PATH%\%NAME%.epub --output-profile sony --max-level 0
