# F-Shodan (Available at fshodan.com)

This projects is search engine which maintains a database consisting of ports, banners and ip address for the entire ipv4 address space(about 200 million database entries). It allows indexing using either ip or banner substring or port.

## Getting Started

Using the site is intuitive. If you would like to host your own or make modifications, script.sh will setup the environment including installing mysql,apache and scanning th einternet and indexing everything. Some required mysql commands are given below.

### Prerequisites

Installation of these are covered in the script.sh file but the prerequisites include masscan,mysql,apache and bootstrap.

### Mysql 

We can use the local data load functionality to load our scanning info into the mysql database.

```
DROP USER 'root'@'localhost';
CREATE USER 'root'@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
create databse scan;
use scan;
create table results (port VARCHAR(5) NOT NULL,ip VARCHAR(30) NOT NULL,banner VARCHAR(1000));
load data local infile '/home/ubuntu/b1.csv' into table results fields terminated by ',' lines terminated by '\n' ;
#add all the other files as needed.
```


## Should look something like this

![alt text](https://raw.githubusercontent.com/yashmundra/f-shodan/result2.jpg)



## Deployment

Add additional notes about how to deploy this on a live system




## Authors

* **Yash Mundra** - (https://github.com/yashmundra)


## License

This project is licensed under the MIT License 

## Acknowledgments

* Hat tip to masscan

