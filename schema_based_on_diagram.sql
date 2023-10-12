/* Database schema to keep the structure of entire database. */

CREATE DATABASE clinic;
-- Create medical_histories table
CREATE TABLE medical_histories (
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status varchar(255)
);
-- Add autoincremented PRIMARY KEY of id
ALTER TABLE medical_histories
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
-- Create patients table
CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(255),
    date_of_birth DATE
);
-- Create treatments table
CREATE TABLE treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type varchar(255),
    name varchar(255),
);
-- Create invoices table
CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
     total_amount FLOAT,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);
-- Create invoice_items table
CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id),
);