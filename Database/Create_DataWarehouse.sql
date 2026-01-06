CREATE DATABASE PolyclinicDW;
GO

USE PolyclinicDW;
GO

CREATE TABLE DimMedicines (
    MedicineKey INT IDENTITY(1,1) PRIMARY KEY,
    MedicineID_Source INT,
    MedicineName NVARCHAR(200),
    Price DECIMAL(10, 2)
);

CREATE TABLE DimDoctors (
    DoctorKey INT IDENTITY(1,1) PRIMARY KEY,
    DoctorID_Source INT,
    FullName NVARCHAR(200),
    Specialization NVARCHAR(100),
  HireDate DATE
);

CREATE TABLE DimPatients (
    PatientKey INT IDENTITY(1,1) PRIMARY KEY,
    PatientID_Source INT,
    FullName NVARCHAR(200),
    Gender CHAR(1),
    BirthDate DATE,
    Age INT,
    Address NVARCHAR(200)
);

CREATE TABLE DimDiseases (
    DiseaseKey INT IDENTITY(1,1) PRIMARY KEY,
    DiseaseID_Source INT,
    DiseaseName NVARCHAR(200),
  isChronic bit
);


CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Month INT,
    MonthName NVARCHAR(20),
    Day INT,
    DayOfWeekName NVARCHAR(20)
);

CREATE TABLE dbo.ETL_Audit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName NVARCHAR(100),
    TableName NVARCHAR(100),
    RowsInserted INT,
    ExecutionTime DATETIME DEFAULT GETDATE()
);

CREATE TABLE FactVisits (
    FactID BIGINT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT,                   
    DoctorKey INT,                  
    PatientKey INT,                     
    DiseaseKey INT,
  Diagnosis NVARCHAR(100),
    TreatmentResult NVARCHAR(50);
);

CREATE TABLE FactPrescriptions
  MedicineKey INT,
    PatientKey INT,
    DoctorKey INT,
    DateKey INT, 
    Dosage NVARCHAR(100),
  DurationDays INT
  );
GO