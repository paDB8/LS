DROP TABLE IF EXISTS STG_LS_RAW;
DROP TABLE IF EXISTS STG_LS_BAD;
DROP TABLE IF EXISTS STG_LS;
DROP TABLE IF EXISTS FACTS;
DROP TABLE IF EXISTS DIM_LOCATION;
DROP TABLE IF EXISTS DIM_DATE;
DROP TABLE IF EXISTS DIM_TIME;
DROP TABLE IF EXISTS DIM_SOURCING;
DROP TABLE IF EXISTS DIM_EQUIPMENT;
DROP TABLE IF EXISTS DIM_CARRIER;
DROP TABLE IF EXISTS DIM_SHIPPER;
DROP TABLE IF EXISTS DIM_TRACKING;
DROP TABLE IF EXISTS DIM_LOAD;


CREATE TABLE STG_LS_RAW
(
loadsmart_id                 BIGINT,
lane                         VARCHAR(150),    
quote_date                   VARCHAR(16),
book_date                    VARCHAR(16), 
source_date                  VARCHAR(16), 
pickup_date                  VARCHAR(16), 
delivery_date                VARCHAR(16), 
book_price                   DECIMAL(9,2), 
source_price                 DECIMAL(9,2), 
pnl                          DECIMAL(9,2), 
mileage                      DECIMAL(6,1), 
equipment_type               VARCHAR(3),   
carrier_rating               TINYINT, 
sourcing_channel             VARCHAR(30),   
vip_carrier                  VARCHAR(5),    
carrier_dropped_us_count     INT,
carrier_name                 VARCHAR(30),  
shipper_name                 VARCHAR(30),   
carrier_on_time_to_pickup    VARCHAR(5), 
carrier_on_time_to_delivery  VARCHAR(5), 
carrier_on_time_overall      VARCHAR(5), 
pickup_appointment_time      VARCHAR(16), 
delivery_appointment_time    VARCHAR(16), 
has_mobile_app_tracking      VARCHAR(5),   
has_macropoint_tracking      VARCHAR(5),   
has_edi_tracking             VARCHAR(5),   
contracted_load              VARCHAR(5),   
load_booked_autonomously     VARCHAR(5),   
load_sourced_autonomously    VARCHAR(5),   
load_was_cancelled           VARCHAR(5),
processing_date              DATETIME
);


CREATE TABLE STG_LS_BAD
(
loadsmart_id                 BIGINT,
lane                         VARCHAR(150),    
quote_date                   VARCHAR(16),
book_date                    VARCHAR(16), 
source_date                  VARCHAR(16), 
pickup_date                  VARCHAR(16), 
delivery_date                VARCHAR(16), 
book_price                   DECIMAL(9,2), 
source_price                 DECIMAL(9,2), 
pnl                          DECIMAL(9,2), 
mileage                      DECIMAL(6,1), 
equipment_type               VARCHAR(3),   
carrier_rating               TINYINT, 
sourcing_channel             VARCHAR(30),   
vip_carrier                  VARCHAR(5),    
carrier_dropped_us_count     INT,
carrier_name                 VARCHAR(30),  
shipper_name                 VARCHAR(30),   
carrier_on_time_to_pickup    VARCHAR(5), 
carrier_on_time_to_delivery  VARCHAR(5), 
carrier_on_time_overall      VARCHAR(5), 
pickup_appointment_time      VARCHAR(16), 
delivery_appointment_time    VARCHAR(16), 
has_mobile_app_tracking      VARCHAR(5),   
has_macropoint_tracking      VARCHAR(5),   
has_edi_tracking             VARCHAR(5),   
contracted_load              VARCHAR(5),   
load_booked_autonomously     VARCHAR(5),   
load_sourced_autonomously    VARCHAR(5),   
load_was_cancelled           VARCHAR(5),
processing_date              DATETIME
);


CREATE TABLE STG_LS
(
loadsmart_id                 BIGINT,
lane_origin_id               BIGINT,
lane_origin_city             VARCHAR(50),    
lane_origin_state            VARCHAR(2),    
lane_destination_id          BIGINT,
lane_destination_city        VARCHAR(50),    
lane_destination_state       VARCHAR(2), 
quote_date_id                BIGINT,
quote_date                   DATE,
quote_time_id                BIGINT,   
quote_time                   TIME,
book_date_id                 BIGINT,
book_date                    DATE, 
book_time_id                 BIGINT,   
book_time                    TIME, 
source_date_id               BIGINT,
source_date                  DATE, 
source_time_id               BIGINT,
source_time                  TIME, 
pickup_date_id               BIGINT,
pickup_date                  DATE, 
pickup_time_id               BIGINT,
pickup_time                  TIME,
delivery_date_id             BIGINT,
delivery_date                DATE, 
delivery_time_id             BIGINT, 
delivery_time                TIME, 
book_price                   DECIMAL(9,2), 
source_price                 DECIMAL(9,2), 
pnl                          DECIMAL(9,2), 
mileage                      DECIMAL(6,1), 
equipment_id                 BIGINT,
equipment_type               VARCHAR(3),   
shipper_id                   BIGINT,
shipper_name                 VARCHAR(30),   
carrier_id                   BIGINT,
carrier_name                 VARCHAR(30),  
carrier_rating               TINYINT, 
vip_carrier                  TINYINT,    
carrier_dropped_us_count     INT,
sourcing_id                  BIGINT,
sourcing_channel             VARCHAR(30),   
carrier_on_time_to_pickup    TINYINT, 
carrier_on_time_to_delivery  TINYINT, 
carrier_on_time_overall      TINYINT, 
pickup_appointment_date_id   BIGINT,
pickup_appointment_date      DATE, 
pickup_appointment_time_id   BIGINT,
pickup_appointment_time      TIME, 
delivery_appointment_date_id BIGINT,
delivery_appointment_date    DATE, 
delivery_appointment_time_id BIGINT,
delivery_appointment_time    TIME, 
tracking_id                  BIGINT,
has_mobile_app_tracking      TINYINT,    
has_macropoint_tracking      TINYINT,   
has_edi_tracking             TINYINT,
load_id                      BIGINT,   
contracted_load              TINYINT,   
load_booked_autonomously     TINYINT,   
load_sourced_autonomously    TINYINT,   
load_was_cancelled           TINYINT,
processing_date              DATETIME
);


CREATE TABLE DIM_LOCATION
(
location_id                  BIGINT NOT NULL AUTO_INCREMENT,
city                         VARCHAR(50),
state                        VARCHAR(2),
processing_date              DATETIME,
CONSTRAINT dim_location_pk PRIMARY KEY (location_id),
CONSTRAINT location_ui UNIQUE (city, state)
);


CREATE TABLE DIM_DATE
(
date_id                      BIGINT NOT NULL AUTO_INCREMENT,
date                         DATE, 
fulldate                     VARCHAR(10),
day                          TINYINT,
day_suffix                   VARCHAR(4),
day_name                     VARCHAR(9),
day_name_short               VARCHAR(3),
day_of_week                  TINYINT,
day_of_year                  SMALLINT,
week_of_year                 TINYINT,
month                        TINYINT,
month_name                   VARCHAR(9),
month_name_short             VARCHAR(3),
quarter                      TINYINT,
quarter_name                 VARCHAR(9),
year                         SMALLINT,
MMYYYY                       VARCHAR(6),
first_day_of_month           DATE,
last_day_of_month            DATE,
is_weekend                   TINYINT,
processing_date              DATETIME,
CONSTRAINT dim_date_pk PRIMARY KEY (date_id),
CONSTRAINT date_ui UNIQUE (date)
);


CREATE TABLE DIM_TIME
(
time_id                      BIGINT NOT NULL AUTO_INCREMENT,
time                         TIME,
hour                         TINYINT,
minute                       TINYINT,
time_12                      VARCHAR(7),
processing_date              DATETIME,
CONSTRAINT dim_time_pk PRIMARY KEY (time_id),
CONSTRAINT time_ui UNIQUE (time)
);


CREATE TABLE DIM_SOURCING
(
sourcing_id                  BIGINT NOT NULL AUTO_INCREMENT,
sourcing_channel             VARCHAR(30),
processing_date              DATETIME,
CONSTRAINT dim_sourcing_pk PRIMARY KEY (sourcing_id),
CONSTRAINT sourcing_ui UNIQUE (sourcing_channel)
);


CREATE TABLE DIM_EQUIPMENT
(
equipment_id                 BIGINT NOT NULL AUTO_INCREMENT,
equipment_type               VARCHAR(3),
processing_date              DATETIME,
CONSTRAINT dim_equipment_pk PRIMARY KEY (equipment_id),
CONSTRAINT equipment_ui UNIQUE (equipment_type)
);


CREATE TABLE DIM_CARRIER
(
carrier_id                   BIGINT NOT NULL AUTO_INCREMENT,
carrier_name                 VARCHAR(30),
carrier_rating               TINYINT,
vip_carrier                  TINYINT,
carrier_dropped_us_count     INT,
processing_date              DATETIME,
CONSTRAINT dim_carrier_pk PRIMARY KEY (carrier_id),
CONSTRAINT carrier_ui UNIQUE (carrier_name, carrier_rating, vip_carrier, carrier_dropped_us_count)
);


CREATE TABLE DIM_SHIPPER
(
shipper_id                   BIGINT NOT NULL AUTO_INCREMENT,
shipper_name                 VARCHAR(30),
processing_date              DATETIME,
CONSTRAINT dim_shipper_pk PRIMARY KEY (shipper_id),
CONSTRAINT shipper_ui UNIQUE (shipper_name)
);


CREATE TABLE DIM_TRACKING
(
tracking_id                  BIGINT NOT NULL AUTO_INCREMENT,
has_mobile_app_tracking      TINYINT, 
has_macropoint_tracking      TINYINT, 
has_edi_tracking             TINYINT,
processing_date              DATETIME,
CONSTRAINT dim_tracking_pk PRIMARY KEY (tracking_id),
CONSTRAINT tracking_ui UNIQUE (has_mobile_app_tracking, has_macropoint_tracking, has_edi_tracking)
);


CREATE TABLE DIM_LOAD
(
load_id                      BIGINT NOT NULL AUTO_INCREMENT,
contracted_load              TINYINT,
load_booked_autonomously     TINYINT,
load_sourced_autonomously    TINYINT,
processing_date              DATETIME,
CONSTRAINT dim_load_pk PRIMARY KEY (load_id),
CONSTRAINT load_ui UNIQUE (contracted_load, load_booked_autonomously, load_sourced_autonomously)
);


CREATE TABLE FACTS
(
id                           BIGINT NOT NULL AUTO_INCREMENT,
loadsmart_id                 BIGINT, 
lane_origin_id               BIGINT,
lane_destination_id          BIGINT,
quote_date_id                BIGINT,
quote_time_id                BIGINT,
book_date_id                 BIGINT,
book_time_id                 BIGINT,
source_date_id               BIGINT,
source_time_id               BIGINT,
pickup_date_id               BIGINT,
pickup_time_id               BIGINT,
delivery_date_id             BIGINT,
delivery_time_id             BIGINT,
book_price                   DECIMAL(9,2), 
source_price                 DECIMAL(9,2), 
pnl                          DECIMAL(9,2), 
mileage                      DECIMAL(6,1),
shipper_id                   BIGINT,
carrier_id                   BIGINT,
equipment_id                 BIGINT,
sourcing_id                  BIGINT,
tracking_id                  BIGINT,
pickup_appointment_date_id   BIGINT,
pickup_appointment_time_id   BIGINT,
delivery_appointment_date_id BIGINT,
delivery_appointment_time_id BIGINT,
carrier_on_time_to_pickup    TINYINT,
carrier_on_time_to_delivery  TINYINT,
carrier_on_time_overall      TINYINT,
load_id                      BIGINT,
load_was_cancelled           TINYINT,
processing_date              DATETIME,
CONSTRAINT fact_pk PRIMARY KEY (id),
CONSTRAINT loadsmart_ui UNIQUE (loadsmart_id),
CONSTRAINT lane_origin_fk FOREIGN KEY (lane_origin_id) REFERENCES DIM_LOCATION(location_id),
CONSTRAINT lane_destination_fk FOREIGN KEY (lane_destination_id) REFERENCES DIM_LOCATION(location_id),
CONSTRAINT quote_date_fk FOREIGN KEY (quote_date_id) REFERENCES DIM_DATE(date_id),
CONSTRAINT quote_time_fk FOREIGN KEY (quote_time_id) REFERENCES DIM_TIME(time_id),
CONSTRAINT book_date_fk FOREIGN KEY (book_date_id) REFERENCES DIM_DATE(date_id),
CONSTRAINT book_time_fk FOREIGN KEY (book_time_id) REFERENCES DIM_TIME(time_id),
CONSTRAINT source_date_fk FOREIGN KEY (source_date_id) REFERENCES DIM_DATE(date_id),
CONSTRAINT source_time_fk FOREIGN KEY (source_time_id) REFERENCES DIM_TIME(time_id),
CONSTRAINT pickup_date_fk FOREIGN KEY (pickup_date_id) REFERENCES DIM_DATE(date_id),
CONSTRAINT pickup_time_fk FOREIGN KEY (pickup_time_id) REFERENCES DIM_TIME(time_id),
CONSTRAINT delivery_date_fk FOREIGN KEY (delivery_date_id) REFERENCES DIM_DATE(date_id),
CONSTRAINT delivery_time_fk FOREIGN KEY (delivery_time_id) REFERENCES DIM_TIME(time_id),
CONSTRAINT shipper_fk FOREIGN KEY (shipper_id) REFERENCES DIM_SHIPPER(shipper_id),
CONSTRAINT carrier_fk FOREIGN KEY (carrier_id) REFERENCES DIM_CARRIER(carrier_id),
CONSTRAINT equipment_fk FOREIGN KEY (equipment_id) REFERENCES DIM_EQUIPMENT(equipment_id),
CONSTRAINT sourcing_fk FOREIGN KEY (sourcing_id) REFERENCES DIM_SOURCING(sourcing_id),
CONSTRAINT tracking_fk FOREIGN KEY (tracking_id) REFERENCES DIM_TRACKING(tracking_id),
CONSTRAINT pickup_appointment_date_fk FOREIGN KEY (pickup_appointment_date_id) REFERENCES DIM_DATE(date_id),
CONSTRAINT pickup_appointment_time_fk FOREIGN KEY (pickup_appointment_time_id) REFERENCES DIM_TIME(time_id),
CONSTRAINT delivery_appointment_date_fk FOREIGN KEY (delivery_appointment_date_id) REFERENCES DIM_DATE(date_id),
CONSTRAINT delivery_appointment_time_fk FOREIGN KEY (delivery_appointment_time_id) REFERENCES DIM_TIME(time_id),
CONSTRAINT load_fk FOREIGN KEY (load_id) REFERENCES DIM_LOAD(load_id)
);

SHOW WARNINGS














