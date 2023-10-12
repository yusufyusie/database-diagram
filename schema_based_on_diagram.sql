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

-- Create invoice_items table