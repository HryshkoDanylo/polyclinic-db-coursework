CREATE DATABASE PolyclinicDB;
GO

USE PolyclinicDB;
GO

CREATE TABLE Specializations (
    SpecializationID INT IDENTITY(1,1) PRIMARY KEY,
    SpecializationName NVARCHAR(100) NOT NULL
);

CREATE TABLE Diseases (
    DiseaseID INT IDENTITY(1,1) PRIMARY KEY,
    DiseaseName NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL
);

CREATE TABLE Medicines (
    MedicineID INT IDENTITY(1,1) PRIMARY KEY,
    MedicineName NVARCHAR(200) NOT NULL,
    Manufacturer NVARCHAR(200) NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Patients (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),
    Phone NVARCHAR(20) NULL,
    Address NVARCHAR(200) NULL
);

CREATE TABLE Doctors (
    DoctorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    SpecializationID INT NOT NULL,
    Phone NVARCHAR(20) NULL,
    Email NVARCHAR(100) NULL,
    CONSTRAINT FK_Doctors_Specializations FOREIGN KEY (SpecializationID) 
        REFERENCES Specializations(SpecializationID)
);

CREATE TABLE Visits (
    VisitID BIGINT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    DiseaseID INT NOT NULL,
    VisitDate DATETIME NOT NULL,
    DiagnosisType NVARCHAR(100) NULL,
    TreatmentResult NVARCHAR(200) NULL,
    
    CONSTRAINT FK_Visits_Patients FOREIGN KEY (PatientID) 
        REFERENCES Patients(PatientID),
    CONSTRAINT FK_Visits_Doctors FOREIGN KEY (DoctorID) 
        REFERENCES Doctors(DoctorID),
    CONSTRAINT FK_Visits_Diseases FOREIGN KEY (DiseaseID) 
        REFERENCES Diseases(DiseaseID)
);

CREATE TABLE Prescriptions (
    PrescriptionID BIGINT IDENTITY(1,1) PRIMARY KEY,
    VisitID BIGINT NOT NULL,
    MedicineID INT NOT NULL,
    Dosage NVARCHAR(200) NULL,
    DurationDays INT NULL,
    
    CONSTRAINT FK_Prescriptions_Visits FOREIGN KEY (VisitID) 
        REFERENCES Visits(VisitID) ON DELETE CASCADE,
    CONSTRAINT FK_Prescriptions_Medicines FOREIGN KEY (MedicineID) 
        REFERENCES Medicines(MedicineID)
);
    
GO