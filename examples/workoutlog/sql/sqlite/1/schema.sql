create table Exercises(
  exercise VARCHAR(30) PRIMARY KEY,
  mod_ts DATETIME , 
  deleted INTEGER  
);

create table Sets(
  name VARCHAR(30),
  exercise VARCHAR(30),
  set_num INTEGER ,
  reps_done INTEGER ,
  weight INTEGER ,
  date_done DATE,
  mod_ts DATETIME, 
  deleted INTEGER 
);

-- added in v2
create table BodyParts(
  part VARCHAR(30) PRIMARY KEY,
  mod_ts DATETIME,
  deleted INTEGER
);

--added in v2
create table Measurements(
  name VARCHAR(30),
  part VARCHAR(30),
  measurement FLOAT,
  date_taken DATE,
  mod_ts TIMESTAMP,
  deleted INTEGER
);

-- added in v3
CREATE TABLE Foods(
  name VARCHAR(30),
  protein FLOAT,
  carbs FLOAT,
  note VARCHAR(30),
  mod_ts DATETIME,
  deleted INTEGER,
);

CREATE TABLE Diet(
  name VARCHAR(30),
  servings FLOAT,
  date_done date,
  mod_ts DATETIME,
  deleted INTEGER
);

