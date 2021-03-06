CREATE TABLE BodyParts (
  part varchar(30) NOT NULL,
  mod_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted int(11) DEFAULT '0',
  PRIMARY KEY (part)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Exercises (
  exercise varchar(30) NOT NULL,
  mod_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int(11) DEFAULT '0',
  PRIMARY KEY (exercise)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Measurements (
  name varchar(30) DEFAULT NULL,
  part varchar(30) DEFAULT NULL,
  measurement float DEFAULT NULL,
  date_taken date DEFAULT NULL,
  mod_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted int(11) DEFAULT NULL,
  CONSTRAINT BodyParts_ibfk_1 FOREIGN KEY (part) REFERENCES BodyParts (part)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE Sets (
  name varchar(30),
  exercise varchar(30),
  set_num int(11),
  reps_done int(11) NOT NULL,
  weight int(11) NOT NULL,
  date_done date NOT NULL,
  mod_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted int(11) DEFAULT '0',
  PRIMARY KEY (exercise,set_num,date_done),
  CONSTRAINT Sets_ibfk_1 FOREIGN KEY (exercise) REFERENCES Exercises (exercise)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Foods(
  name VARCHAR(30),
  protein FLOAT,
  carbs FLOAT,
  note VARCHAR(30),
  mod_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted int(11) DEFAULT '0',
  PRIMARY KEY (name)
);

CREATE TABLE Diet(
  name VARCHAR(30) REFERENCES Foods,
  servings FLOAT,
  date_done date NOT NULL,
  mod_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted int(11) DEFAULT '0'
);

-- Convenient view for daily sums
CREATE VIEW protein AS 
  SELECT d.date_done, sum(f.protein*d.servings) as protein
  FROM Diet d, Foods f
  WHERE d.name = f.name
  GROUP BY d.date_done
  ORDER BY d.date_done DESC;

