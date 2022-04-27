CREATE TABLE "room" (
  "name" varchar NOT NULL,
  "size" int NOT NULL,
  "id" int PRIMARY KEY NOT NULL
);

CREATE TABLE "ventilator" (
  "id" int PRIMARY KEY NOT NULL,
  "room_id" int NOT NULL
);

CREATE TABLE "door" (
  "id" int PRIMARY KEY NOT NULL
);

CREATE TABLE "window" (
  "id" int PRIMARY KEY NOT NULL,
  "room_id" int NOT NULL
);

CREATE TABLE "door_connects_room" (
  "door_id" int NOT NULL,
  "room_id" int NOT NULL
);

CREATE TABLE "people_in_room" (
  "timestamp" timestamp NOT NULL,
  "room_id" int NOT NULL,
  "nopeopleinroom" int NOT NULL
);

CREATE TABLE "window_open" (
  "timestamp" timestamp NOT NULL,
  "window_id" int NOT NULL,
  "isopen" boolean NOT NULL
);

CREATE TABLE "door_open" (
  "timestamp" timestamp NOT NULL,
  "door_id" int NOT NULL,
  "isopen" boolean NOT NULL
);

CREATE TABLE "ventilator_on" (
  "timestamp" timestamp NOT NULL,
  "ventilator_id" int NOT NULL,
  "isopen" boolean NOT NULL
);

Select *
From Room;


ALTER TABLE "ventilator" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id");

ALTER TABLE "window" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id");

ALTER TABLE "door_connects_room" ADD FOREIGN KEY ("door_id") REFERENCES "door" ("id");

ALTER TABLE "door_connects_room" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id");

ALTER TABLE "people_in_room" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("id");

ALTER TABLE "window_open" ADD FOREIGN KEY ("window_id") REFERENCES "window" ("id");

ALTER TABLE "door_open" ADD FOREIGN KEY ("door_id") REFERENCES "door" ("id");

ALTER TABLE "ventilator_on" ADD FOREIGN KEY ("ventilator_id") REFERENCES "ventilator" ("id");
