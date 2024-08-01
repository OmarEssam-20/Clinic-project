CREATE TABLE "patients" (
  "patient_id" SERIAL,
  "patient_first_name" varchar(25),
  "patient_last_name" varchar(25),
  "patient_phone_no" varchar(20),
  "patient_insurance" varchar(20),
  "patient_medical_history" text,
  PRIMARY KEY ("patient_id")
);

CREATE TABLE "Doctor" (
  "Doctor_id" SERIAL,
  "Doctor_first_name" varchar(30) NOT NULL,
  "Doctor_last_name" varchar(30) NOT NULL,
  "Doctor_speciality" text,
  PRIMARY KEY ("Doctor_id")
);

CREATE TABLE "appointments" (
  "appointments_id" SERIAL,
  "patient_id" int NOT NULL,
  "Doctor_id" int NOT NULL,
  "appointment_time" timestamp,
  "reason_for_visit" text
);

CREATE TABLE "prescriptions" (
  "prescriptions_id" SERIAL,
  "appointment" timestamp,
  "Doctor_name" text,
  "Doctor_id" int,
  "patient_name" varchar(25),
  "medication_namee" text NOT NULL,
  "Doctor_instraction" text NOT NULL,
  PRIMARY KEY ("prescriptions_id")
);

CREATE TABLE "followup" (
  "appointment" timestamp,
  "patient_id" int,
  "Doctor_id" int,
  "follow_up" text
);

ALTER TABLE "appointments" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("patient_id");

ALTER TABLE "appointments" ADD FOREIGN KEY ("Doctor_id") REFERENCES "Doctor" ("Doctor_id");

ALTER TABLE "prescriptions" ADD FOREIGN KEY ("Doctor_id") REFERENCES "Doctor" ("Doctor_id");

ALTER TABLE "followup" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("patient_id");

ALTER TABLE "followup" ADD FOREIGN KEY ("Doctor_id") REFERENCES "Doctor" ("Doctor_id");
