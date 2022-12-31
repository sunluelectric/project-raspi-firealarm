/*select database*/
USE smart_home;

/*create resources tables*/
CREATE TABLE asset (
    PRIMARY KEY (serial_num),
    serial_num          VARCHAR(50)     NOT NULL,
    type_id             INT(5)          NOT NULL,
    brand_id            INT(5)          NOT NULL,
    product_name        VARCHAR(50)     NOT NULL,
    receipt_num         VARCHAR(50),
    procured_date       DATE            NOT NULL DEFAULT (CURRENT_DATE),
    procured_price      DECIMAL(10,2),
    payment_method_id   INT(5)          NOT NULL,
    warranty_date_1     DATE            NOT NULL DEFAULT procured_date,
    warranty_date_2     DATE            NOT NULL DEFAULT procured_date,
    expire_date         DATE            NOT NULL DEFAULT '9999-12-31',
                        CONSTRAINT warranty_after_procured
                        CHECK(warranty_date_1 >= procured_date AND warranty_date_2 >= warranty_date_1),
                        CONSTRAINT expire_after_procured
                        CHECK(expire_date >= procured_date)
);

CREATE TABLE accessory (
    PRIMARY KEY (item_id),
    item_id             INT(5)          NOT NULL,
    type_id             INT(5)          NOT NULL,
    brand_id            INT(5)          NOT NULL,
    product_name        VARCHAR(50)     NOT NULL,
    receipt_num         VARCHAR(50),
    procured_date       DATE            NOT NULL DEFAULT (CURRENT_DATE),
    procured_number     DECIMAL(10,2)   NOT NULL DEFAULT 1.00,
    procured_unit_price DECIMAL(10,2),
    procured_price      DECIMAL(10,2),
    payment_method_id   INT(5)          NOT NULL,
    expire_date         DATE            NOT NULL DEFAULT '9999-12-31',
                        CONSTRAINT expire_after_procured
                        CHECK(expire_date >= procured_date)
);

CREATE TABLE consumable (
    PRIMARY KEY (item_id),
    item_id             INT(5)          NOT NULL,
    type_id             INT(5)          NOT NULL,
    brand_id            INT(5)          NOT NULL,
    product_name        VARCHAR(50)     NOT NULL,
    receipt_num         VARCHAR(50),
    procured_date       DATE            NOT NULL DEFAULT (CURRENT_DATE),
    procured_number     DECIMAL(10,2)   NOT NULL DEFAULT 1.00,
    procured_unit_price DECIMAL(10,2),
    procured_price      DECIMAL(10,2),
    payment_method_id   INT(5)          NOT NULL,
    expire_date         DATE            NOT NULL DEFAULT procured_date,
                        CONSTRAINT expire_after_procured
                        CHECK(expire_date >= procured_date)
);

CREATE TABLE service (
    PRIMARY KEY (item_id),
    item_id             INT(5)          NOT NULL,
    type_id             INT(5)          NOT NULL,
    brand_id            INT(5)          NOT NULL,
    product_name        VARCHAR(50)     NOT NULL,
    receipt_num         VARCHAR(50),
    procured_date       DATE            NOT NULL DEFAULT (CURRENT_DATE),
    procured_price      DECIMAL(10,2),
    payment_method_id   INT(5)          NOT NULL,
    expire_date         DATE            NOT NULL DEFAULT procured_date,
                        CONSTRAINT expire_after_procured
                        CHECK(expire_date >= procured_date)
);