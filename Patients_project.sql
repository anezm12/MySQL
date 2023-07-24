CREATE DATABASE patient_diagnosis_report;
USE patient_diagnosis_report;

CREATE TABLE patients(
date DATE,
patient_id VARCHAR(20) PRIMARY KEY,
patient_name VARCHAR(25),
age INT,
weight INT,
gender VARCHAR(10),
location VARCHAR(25),
phone_number VARCHAR(50),
disease VARCHAR(50),
doctor_name VARCHAR(25),
doctor_id INT
);

SELECT * FROM patients;

-- display the total number of patients in the table--

SELECT *, (SELECT COUNT(*) FROM patients) AS total_patient
FROM patients;

-- display the patient id, patient name, gender, and disease of the patient whose age is maximum.--

SELECT patient_id, patient_name, gender, disease
FROM patients
WHERE age = (SELECT MAX(age) FROM patients);

-- display patient id and patient name with the current date.--

SELECT patient_id, patient_name, NOW() AS current_t
FROM patients;

-- display the old patient’s name and new patient's name in uppercase.--

SELECT p1.patient_name AS oldest_patient, p2.patient_name AS newest_patient
FROM patients p1
JOIN patients p2 ON p1.date = (SELECT MIN(date) FROM patients)
WHERE p2.date = (SELECT MAX(date) FROM patients);

-- display the patient’s name along with the length of their name.--

SELECT patient_name, LENGTH(patient_name) AS name_length
FROM patients;

-- display the patient’s name, and the gender of the patient must be mentioned as M or F.--

SELECT patient_name, IF(gender = 'Male', 'M', 'F') AS patient_gender
FROM patients;

-- combine the names of the patient and the doctor in a new column. --

SELECT CONCAT(patient_name, ' ', doctor_name) AS patient_doctor
FROM patients;

-- display the patients’ age along with the logarithmic value (base 10) of their age.--

SELECT age, LOG10(age) AS log10_age
FROM patients;

-- extract the year from the given date in a separate column. --

SELECT date, MID(date, 1, 4) AS extracted_year
FROM patients;

-- return NULL if the patient’s name and doctor’s name are similar else return the patient’s name. --
SELECT IF(p.patient_name = p.doctor_name, NULL, p.patient_name) AS result
FROM patients p;

-- return Yes if the patient’s age is greater than 40 else return No.-- 
SELECT IF(age > 40, 'Yes', 'No') AS old_patient
FROM patients;

-- display the doctor’s duplicate name from the table-- 

SELECT doctor_name
FROM patients
GROUP BY doctor_name
HAVING COUNT(*) >1;












