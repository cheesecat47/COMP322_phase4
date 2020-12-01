# COMP322_phase4
> 2020-2 [KNU][knu] [CSE][knucse] Database team project phase4
>
> REST APIs

## REST API examples  
### sign-up  
#### Request  
`POST /api/sign-up`  
```json
{
    "account_id": "testid1",
    "account_pw": "testpw",
    "account_name": "testname",
    "account_bday": "1995-01-01",
    "account_sex": "f",
    "account_phone": "123-1231"
}
```  

#### Response  
```json
# if success, returns affected rows count
{"data":1}
```  
```json
# if fail
{"data":"sign-up: Error exists, rollback: ORA-00001: unique constraint (TEAM9.SYS_C007048) violated"}
```  

### log-in  
#### Request  
`POST /api/log-in`  
```json
{
    "account_id": "testid1",
    "account_pw": "testpw"
}
```  

#### Response
```json
# if success, returns account info
{
    "data": [
        {
            "ACCOUNT_ID": "testid6",
            "ACCOUNT_PW": "testpw",
            "ACCOUNT_NAME": "testname",
            "ACCOUNT_BDAY": "01-JAN-95",
            "ACCOUNT_SEX": "F",
            "ACCOUNT_ADDRESS": "null",
            "ACCOUNT_PHONE": "123-1231",
            "ACCOUNT_IDENTITY": "customer",
            "ACCOUNT_JOB": "null",
            "ACCOUNT_MEMBERSHIP": "Basic"
        }
    ]
}
```  
```json
# if fail
{
    "data": []
}
```  

[knu]: http://www.knu.ac.kr/
[knucse]: http://computer.knu.ac.kr/