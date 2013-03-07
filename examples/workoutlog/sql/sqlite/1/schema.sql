create table Exercises(
  exercise VARCHAR(30) PRIMARY KEY,
  mod_ts DATETIME , -- metacolumn
  deleted INTEGER  -- metacolumn
);

create table Sets(
  name VARCHAR(30),
  exercise VARCHAR(30),
  set_num INTEGER ,
  reps_done INTEGER ,
  weight INTEGER ,
  date_done DATE,
  mod_ts DATETIME, -- metacolumn
  deleted INTEGER -- metacolumn
);

