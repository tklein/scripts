
call axis2env.bat
set WSDL2JAVA=%AXIS2_HOME%/bin/wsdl2java.bat

set OPTIONS=-ss -t -sd -g -ssi -or -u

%WSDL2JAVA% %OPTIONS% -uri %1
