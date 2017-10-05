*** Settings ***
Resource        resource.robot
Library         HttpLibrary.HTTP

*** Test Cases ***
Valid Email
  Create HTTP Context  ${URL}
	Set Request Body             [{"email": "test1@example.com","errorCount": 1,"errorCode": "5.1.2"},{"email": "test2@example.com","errorCount": 2,"errorCode": "5.1.2"},{"email": "test3@example.com","errorCount": 3,"errorCode": "5.1.2"}]
  Set Request Header            Content-Type    application/json
  Set Request Header            Account    34
  POST                        /sys/emailErrors/bulk  
  Response Status Code Should Equal   201

    
