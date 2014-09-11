SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `mls_property`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mls_property` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `sysid` VARCHAR(15) NOT NULL ,
  `mlsnumb` VARCHAR(15) NOT NULL ,
  `type` VARCHAR(3) NOT NULL ,
  `statecode` VARCHAR(5) NOT NULL ,
  `statename` VARCHAR(30) NOT NULL ,
  `countyname` VARCHAR(30) NOT NULL ,
  `cityname` VARCHAR(30) NOT NULL ,
  `streetnumber` VARCHAR(15) NOT NULL ,
  `streetname` VARCHAR(30) NOT NULL ,
  `address` VARCHAR(255) NOT NULL ,
  `zipcode` INT(11) NOT NULL ,
  `beds` INT(11) NOT NULL ,
  `baths` INT(11) NOT NULL ,
  `price` DOUBLE NOT NULL ,
  `remarks` BLOB NULL DEFAULT NULL ,
  `yearbuilt` INT(11) NULL DEFAULT NULL ,
  `lotsize` DOUBLE NULL DEFAULT NULL ,
  `pets` VARCHAR(50) NULL DEFAULT NULL ,
  `appliances` VARCHAR(255) NULL DEFAULT NULL ,
  `intfeatures` VARCHAR(255) NULL DEFAULT NULL ,
  `extfeatures` VARCHAR(255) NULL DEFAULT NULL ,
  `pool` VARCHAR(50) NULL DEFAULT NULL ,
  `newconstruction` VARCHAR(50) NULL DEFAULT NULL ,
  `driving` VARCHAR(255) NULL DEFAULT NULL ,
  `listing_date` VARCHAR(45) NULL ,
  `status_change_date` VARCHAR(45) NULL ,
  `status` VARCHAR(10) NULL ,
  `agent_id` VARCHAR(10) NULL DEFAULT 0 ,
  `sold_agent_id` VARCHAR(10) NULL DEFAULT 0 ,
  `sold_date` VARCHAR(45) NULL DEFAULT 0 ,
  `sold_price` FLOAT NULL DEFAULT 0 ,
  `sold_office_id` VARCHAR(10) NULL DEFAULT 0 ,
  `selling_agent_id` VARCHAR(10) NULL DEFAULT 0 ,
  `selling_office_name` VARCHAR(100) NULL DEFAULT 0 ,
  `selling_agent_name` VARCHAR(45) NULL DEFAULT 0 ,
  `single_agent_comp` VARCHAR(10) NULL DEFAULT 0 ,
  `trans_broker_comp` VARCHAR(10) NULL DEFAULT 0 ,
  `record_status` INT NULL DEFAULT 1 COMMENT 'mls field system' ,
  PRIMARY KEY (`ID`) ,
  INDEX `sysid_x` (`sysid` ASC) ,
  INDEX `mls_x` (`mlsnumb` ASC) ,
  INDEX `type_state` (`type` ASC, `statecode` ASC) ,
  INDEX `agent_id` (`agent_id` ASC) ,
  INDEX `record_status_x` (`record_status` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


-- -----------------------------------------------------
-- Table `mls_property_image`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mls_property_image` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `number` VARCHAR(45) NULL ,
  `uid` VARCHAR(255) NULL ,
  `url` VARCHAR(255) NULL ,
  `location` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `uid_x` (`uid` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mls_field`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mls_field` (
  `id` INT NOT NULL ,
  `label` VARCHAR(150) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mls_field_value`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mls_field_value` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `sysid` VARCHAR(15) NULL ,
  `field_id` INT NOT NULL ,
  `value` BLOB NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_mls_field_value_mls_field1_idx` (`field_id` ASC) ,
  INDEX `mls_field_value_sysid_idx` (`sysid` ASC) ,
  INDEX `mls_field_value_sysid_field_id_idx` (`sysid` ASC, `field_id` ASC) ,
  CONSTRAINT `fk_mls_field_value_mls_field1`
    FOREIGN KEY (`field_id` )
    REFERENCES `mls_field` (`id` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
