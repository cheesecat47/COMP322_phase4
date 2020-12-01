# COMP322_phase4
> 2020-2 [KNU][knu] [CSE][knucse] Database team project phase4
>
> Movie DB Website

## How to Use
```bash
$ git clone https://github.com/cheesecat47/COMP322_phase4.git
$ cd COMP322_phase4
```

### Frontend  

### Api server  
#### Prerequisites
* [Docker][Docker] ^19.03.13  
* [Docker-compse][Docker-compse] ^1.27.4  
  
```bash
$ cd api_src
$ docker-compose -f docker-compose.api.yml -f docker-compose.oracle.yml up -d
```

#### REST API examples
* [Go to ./api_src/README.md](./api_src/README.md)

## Dev Environment  
### Frontend  
* Tomcat  
* Datatables  

### Api server  
* [Docker][Docker] & [Docker-compse][Docker-compse]  
* [node:15](https://hub.docker.com/_/node)  
* [Oracle 11g](https://hub.docker.com/repository/docker/cheesecat47/comp322_phase4)  


## Contributors' info
  
Shin Juyong – [cheesecat47](https://github.com/cheesecat47) – cheesecat47@gmail.com  
황귀환 - [hgh1146](https://github.com/hgh1146) – hgh1146@naver.com  

[https://github.com/cheesecat47/COMP322_phase4](https://github.com/cheesecat47/COMP322_phase4)  

[knu]: http://www.knu.ac.kr/
[knucse]: http://computer.knu.ac.kr/
[Docker]: https://docs.docker.com/engine/install/
[Docker-compse]: https://docs.docker.com/compose/install/