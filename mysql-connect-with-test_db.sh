#!/bin/bash

mysql -ubox -h127.0.0.1 -P3306 -paZ%34sdfDFtr test_base

# UPDATE migrator SET  value = 0 WHERE  name= 'last_position';

# UPDATE `user` SET  `group` = 'admin_super' WHERE  `login`='admin';
# UPDATE `user` SET  `group` = 'admin_super' WHERE  id=1;