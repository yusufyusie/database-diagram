/* Database schema to keep the structure of entire database. */

CREATE DATABASE clinic;
-- Create a table named medical_histories with the following columns
CREATE TABLE medical_histories (
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status varchar(255),
    FOREIGN KEY (patient_id)
    REFERENCES patients (id)
);
-- Add autoincremented PRIMARY KEY of id
ALTER TABLE medical_histories
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
-- Create a table named patients with the following columns
CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    date_of_birth DATE
);
CREATE INDEX patient_id_index ON medical_histories(patient_id);
-- Create a table named treatments with the following columns
CREATE TABLE treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type varchar(255),
    name varchar(255)
);
-- Create a table named invoices with the following columns
CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
);
CREATE INDEX medical_history_id_index ON invoices(medical_history_id);
-- Create a table named invoice_items with the following columns
CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (id)
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
);
CREATE INDEX invoice_id_index ON invoice_items(invoice_id);
CREATE INDEX treatment_id_index ON invoice_items(treatment_id);
-- Join medical_histories and treatments tables from many-to-many relationships
CREATE TABLE medical_histories_treatments(
    medical_histories_id INT,
    treatments_id INT,
    FOREIGN KEY (medical_histories_id)
    REFERENCES medical_histories (id)
    FOREIGN KEY (treatments_id)
    REFERENCES treatments (id)
    PRIMARY KEY (medical_histories_id, treatments_id)
);

--Creating index for the joined table to improve performance
CREATE INDEX medical_histories_id_index ON medical_histories_treatments(medical_histories_id);
CREATE INDEX treatments_id_index ON medical_histories_treatments(treatments_id);