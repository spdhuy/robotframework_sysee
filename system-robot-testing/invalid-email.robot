*** Settings ***
Resource        resource.robot
Library         HttpLibrary.HTTP

*** Test Cases ***
Invalid Email
  Create HTTP Context  ${URL}
  Set Request Body     [{"email": "test3","errorCount": 1,"errorCode": "5.1.2"},{"email": "test4@","errorCount": 2,"errorCode": "5.1.2"},{"email": "test5@example.com","errorCount": 3,"errorCode": "5.1.2"}]
  Set Request Header          Content-Type    application/json
  Set Request Header          Account    34
  Next Request Should Not Succeed
  POST        /sys/emailErrors/bulk  
    
