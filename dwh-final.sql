

CREATE TABLE dim.aircrafts (
	aircraft_code varchar(30) PRIMARY KEY ,
	model text NOT NULL,
	"range" varchar(300) NOT NULL
);

CREATE TABLE dim.rejected_aircrafts (
	aircraft_code varchar(30) PRIMARY KEY ,
	model text NOT NULL,
	"range" varchar(300) NOT NULL
);

CREATE TABLE dim.airports (
	airport_code bpchar(3) PRIMARY KEY,
	airport_name text NOT NULL,
	city text NOT NULL,
	timezone text NOT NULL
);

CREATE TABLE dim.rejected_airports (
	airport_code bpchar(3) PRIMARY KEY,
	airport_name text NOT NULL,
	city text NOT NULL,
	timezone text NOT NULL
);

CREATE TABLE dim.passenger (
	passenger_id varchar(30)  PRIMARY KEY,
	passenger_name text NOT NULL,
	contact_data varchar(300) NULL
);

CREATE TABLE dim.rejected_passenger (
	passenger_id varchar(30)  PRIMARY KEY,
	passenger_name text NOT NULL,
	contact_data varchar(300) NULL
);

CREATE TABLE dim.tariff (
	ticket_no bpchar(13) not null ,
	flight_id int4 not null,
	fare_conditions varchar(10) NOT NULL,
	amount numeric(10, 2) NOT NULL,
	CONSTRAINT ticket_flights_fare_conditions_check CHECK (((fare_conditions)::text = ANY (ARRAY[('Economy'::character varying)::text, ('Comfort'::character varying)::text, ('Business'::character varying)::text]))),
	primary key (ticket_no,flight_id )
);

CREATE TABLE dim.rejected_tariff (
	ticket_no bpchar(13) not null ,
	flight_id int4 not null,
	fare_conditions varchar(10) NOT NULL,
	amount numeric(10, 2) NOT NULL,
	primary key (ticket_no,flight_id )
);

CREATE TABLE dim.calendar (
	"date" date primary KEY
);

insert into calendar (date)
select dd::date 
from  generate_series ('2017-01-01'::timestamp,'2020-12-31'::timestamp,'1 day') dd;

CREATE TABLE dim.fact_flights (
	passenger_name text null,
	actual_departure date NULL,
	actual_arrival date NULL,
	departure_delay varchar(30) NULL,
	arrival_delay varchar(30) NULL,
	aircraft_model text NULL,
	departure_airport text NULL,
	arrival_airport text NULL,
	fare_conditions text NULL,
	amount numeric(10, 2) NULL
);


CREATE TABLE dim.rejected_fact (
	passenger_name text null,
	actual_departure date NULL,
	actual_arrival date NULL,
	departure_delay varchar(30) NULL,
	arrival_delay varchar(30) NULL,
	aircraft_model text NULL,
	departure_airport text NULL,
	arrival_airport text NULL,
	fare_conditions text NULL,
	amount numeric(10, 2) NULL
);

