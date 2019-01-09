DROP SCHEMA IF EXISTS `authentication`;
 CREATE SCHEMA `authentication`;
USE authentication;
CREATE TABLE IF NOT EXISTS user(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(10) NOT NULL,
    hashPassword VARCHAR(255) NOT NULL,
    CONSTRAINT login_only_digits CHECK (login LIKE '/^\d+$/')
);

DELIMITER //

CREATE PROCEDURE myproc() BEGIN
    set @i := 0;
    WHILE @i <= 50 DO
        INSERT INTO user (login, hashPassword) values (@i, '$2a$10$mKVcwAzisQnSpAYpszLReexOwPsIu238Hen05wOMVyxK.rpZvKSue');
                SET @i = @i+1;

END WHILE;
END; // 

DELIMITER ;

call myproc;
