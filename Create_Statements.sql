CREATE TABLE regions
   ( region_id NUMBER 
   CONSTRAINT region_id_nn NOT NULL 
   , region_name VARCHAR2(25) 
   );
   
   
CREATE UNIQUE INDEX reg_id_pk
         ON regions (region_id);
ALTER TABLE regions
         ADD ( CONSTRAINT reg_id_pk
   PRIMARY KEY (region_id)
   ) ;
   
   
CREATE TABLE countries 
   ( country_id CHAR(2) 
   CONSTRAINT country_id_nn NOT NULL 
   , country_name VARCHAR2(40) 
   , region_id NUMBER 
   , CONSTRAINT country_c_id_pk 
   PRIMARY KEY (country_id) 
   ) 
   ORGANIZATION INDEX; 
   
   
ALTER TABLE countries
         ADD ( CONSTRAINT countr_reg_fk
   FOREIGN KEY (region_id)
   REFERENCES regions(region_id) 
   ) ;
   
   
   
   CREATE TABLE locations
   ( location_id NUMBER(4)
   , street_address VARCHAR2(40)
   , postal_code VARCHAR2(12)
   , city VARCHAR2(30)
   CONSTRAINT loc_city_nn NOT NULL
   , state_province VARCHAR2(25)
   , country_id CHAR(2)
   ) ;
   
CREATE UNIQUE INDEX loc_id_pk
         ON locations (location_id) ;
ALTER TABLE locations
         ADD ( CONSTRAINT loc_id_pk
   PRIMARY KEY (location_id)
   , CONSTRAINT loc_c_id_fk
   FOREIGN KEY (country_id)
   REFERENCES countries(country_id) 
   ) ;