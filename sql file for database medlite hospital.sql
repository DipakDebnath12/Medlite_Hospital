create database Medlite_Hospital;
use Medlite_Hospital;
drop database medlite_hospital;
create table patients(
			id int auto_increment primary key,
            name varchar(100) Not null,
            email varchar(100) unique,
            contact varchar(15),
            age int,
            gender varchar(10),
            address text,
            password varchar(255) not null,
            created_at timestamp default current_timestamp
);
delete from patients where id =3 ;
select * from patients;
drop table patients;
drop table doctors;

CREATE TABLE doctors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  specialization VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(20)
);
ALTER TABLE doctors
ADD COLUMN description TEXT,
ADD COLUMN password VARCHAR(255);
ALTER TABLE doctors
ADD COLUMN consultant_fees DECIMAL(10,2);
drop table doctors;
INSERT INTO doctors (name, specialization, email, phone, description, password,consultant_fees)
VALUES (
  'Dr. Arjun Sen',
  'Cardiologist',
  'arjun.sen@example.com',
  '9876543210',
  'Expert in heart-related issues with 15+ years of experience in reputed hospitals.',
  'arjun123',
   500.00
);

INSERT INTO doctors (name, specialization, email, phone, description, password,consultant_fees)
VALUES (
  'Dr. Priya Das',
  'Neurologist',
  'priya.das@example.com',
  '9123456789',
  'Specialist in brain and nervous system disorders. Gold medallist from AIIMS.',
  'priya456',
   500.00
);
select * from doctors;

CREATE TABLE appointment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  patient_name VARCHAR(255),              
  patient_email VARCHAR(255),
  doctor_name VARCHAR(255),
  doctor_email VARCHAR(255),             
  appointment_date DATE,
  appointment_time varchar(30),
  status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);
delete from appointment where id =1;
drop table appointment;
select * from appointment;

CREATE TABLE admin (
    aid INT AUTO_INCREMENT PRIMARY KEY,
    aemail VARCHAR(100) NOT NULL UNIQUE,
    apassword VARCHAR(100) NOT NULL
);
INSERT INTO admin (aemail, apassword)
VALUES ('admin@medlite.com', 'admin@123');

select * from admin;

CREATE TABLE payment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  patient_email VARCHAR(100),
  doctor_name VARCHAR(100),
  appointment_date DATE,
  appointment_time VARCHAR(20),
  amount DECIMAL(10,2),
  status VARCHAR(50),
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select * from payment;



