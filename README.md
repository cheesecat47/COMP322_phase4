# COMP322_phase4

> 2020-2 [KNU][knu] [CSE][knucse] Database team project phase4
>
> Movie DB Website

---

## Environment

Name | Version | Link  
:---: | :---: | :---:  
Oracle | 12c(windows native), 11g(docker image) | [link](https://hub.docker.com/repository/docker/cheesecat47/comp322_phase4)  
Eclipse EE | 2019-12 | [link](https://www.eclipse.org/downloads/packages/release/kepler/sr2/eclipse-ide-java-ee-developers)
Tomcat | 9 | [link](https://tomcat.apache.org/download-90.cgi)  
DataTables | 1.10.22 | [link](https://datatables.net/)

---

## How to Use

```bash
git clone https://github.com/cheesecat47/COMP322_phase4.git
cd COMP322_phase4
```

1. Change DB Connection Info.  

    ```Java
    // line 19~21
    String URL = "jdbc:oracle:thin:@[host]:[sid]";
    String USER = "[user]";
    String USER_PW = "[password]";
    ```

1. Change path for Java library files.

    ![jar_path](https://github.com/cheesecat47/COMP322_phase4/blob/main/docs/img/jar_path.png?raw=true)

1. And run tomcat server on Eclipse EE.  

---

## Contributors' info
  
Shin Juyong – [cheesecat47](https://github.com/cheesecat47) – cheesecat47@gmail.com  
Hwang Gwihwan - [hgh1146](https://github.com/hgh1146) – hgh1146@naver.com  

[https://github.com/cheesecat47/COMP322_phase4](https://github.com/cheesecat47/COMP322_phase4)  

[knu]: http://www.knu.ac.kr/
[knucse]: http://computer.knu.ac.kr/
[Docker]: https://docs.docker.com/engine/install/
[Docker-compse]: https://docs.docker.com/compose/install/
