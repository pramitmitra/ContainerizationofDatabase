# ContainerizationofDatabase
Containerization of Database


Oracle Docker Image for PL/SQL Development using SQL Developer on MacOS

Tools Required:
1.	Docker on Mac
2.	SQL Developer Client on Mac
3.	Oracle Docker image for Mac from DockerHub
4.	Mac Terminal / Iterms


Installation Links:
1.	Docker on Mac -> https://docs.docker.com/docker-for-mac/install/
2.	Oracle 12c Docker Image -> Docker Hub registry
3.	SQL Developer -> From Oracle Site 
4.	JDK 1.8 -> -> From Oracle Site

Steps:
1.	Download Docker for Local Mac from below link: https://hub.docker.com/editions/community/docker-ce-desktop-mac/
 


2.	Login to Docker with Docker hub account
 




3.	docker commands from Mac Console: 


>docker login
 

>docker run -d -p 1521:1521 --name oracle12c store/oracle/database-enterprise:12.2.0.1
 
>docker ps
 

>docker logs -f <container id>
 

>docker exec -it oracle12c bash -c "source /home/oracle/.bashrc; sqlplus /nolog" 

4.	SQL Command to connect as sysdba and create user to be used at SQL Developer:
 
SQL*Plus: Release 12.2.0.1.0 Production on Mon Mar 30 01:41:37 2020

Copyright (c) 1982, 2016, Oracle.  All rights reserved.

SQL> connect sys as sysdba
Enter password: Oradoc_DB1
Connected.
SQL> alter session set "_ORACLE_SCRIPT"=true;

Session altered.

SQL> create user dummy identified by dummy;

User created.

SQL> GRANT ALL PRIVILEGES TO dummy;

Grant succeeded.

SQL> quit();




5.	Launch SQL Developer and set the values as shown below:
 


6.	Write PL/SQL code and execute against Oracle Docker Image running locally
 

7.	Additional Reference Point: For any reason if default Oracle port (1521) is blocked then you can use docker -p (or -P) option to set your personalize port to be broadcasted to external world. Then use “docker port <container name> to make sure that your port has been resisted correctly or not.

