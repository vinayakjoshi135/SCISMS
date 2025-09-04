
-- Create and Use the SCISMS Database
CREATE DATABASE SCISMS;
USE SCISMS;

-- Create Chemical Table
CREATE TABLE Chemical (
    ChemicalID INT PRIMARY KEY AUTO_INCREMENT,
    ChemicalName VARCHAR(100),
    CASNumber VARCHAR(50),
    HazardLevel VARCHAR(20),
    StorageRequirements TEXT
);

-- Create Supplier Table
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Create Lab Table
CREATE TABLE Lab (
    LabID INT PRIMARY KEY AUTO_INCREMENT,
    LabName VARCHAR(100),
    LabLocation VARCHAR(100),
    LabSupervisor VARCHAR(100)
);

-- Create Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ChemicalID INT,
    SupplierID INT,
    LabID INT,
    Quantity DECIMAL(10,2),
    Unit VARCHAR(20),
    ExpiryDate DATE,
    StorageLocation VARCHAR(100),
    FOREIGN KEY (ChemicalID) REFERENCES Chemical(ChemicalID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (LabID) REFERENCES Lab(LabID)
);

-- Create UsageRecord Table
CREATE TABLE UsageRecord (
    UsageID INT PRIMARY KEY AUTO_INCREMENT,
    ChemicalID INT,
    LabID INT,
    UsageDate DATE,
    QuantityUsed DECIMAL(10,2),
    FOREIGN KEY (ChemicalID) REFERENCES Chemical(ChemicalID),
    FOREIGN KEY (LabID) REFERENCES Lab(LabID)
);

-- Create DisposalRecord Table
CREATE TABLE DisposalRecord (
    DisposalID INT PRIMARY KEY AUTO_INCREMENT,
    ChemicalID INT,
    DisposalDate DATE,
    QuantityDisposed DECIMAL(10,2),
    Method VARCHAR(100),
    FOREIGN KEY (ChemicalID) REFERENCES Chemical(ChemicalID)
);

-- Create IncidentReport Table
CREATE TABLE IncidentReport (
    IncidentID INT PRIMARY KEY AUTO_INCREMENT,
    ChemicalID INT,
    LabID INT,
    IncidentDate DATE,
    Description TEXT,
    PeopleAffected INT,
    SeverityLevel VARCHAR(20),
    SafetyMeasuresTaken BOOLEAN,
    FOREIGN KEY (ChemicalID) REFERENCES Chemical(ChemicalID),
    FOREIGN KEY (LabID) REFERENCES Lab(LabID)
);

-- Insert Sample Data into Chemical
INSERT INTO Chemical (ChemicalName, CASNumber, HazardLevel, StorageRequirements) VALUES
('Acetone', '67-64-1', 'Medium', 'Cool, well-ventilated'),
('Sulfuric Acid', '7664-93-9', 'High', 'Corrosion-resistant cabinet'),
('Ethanol', '64-17-5', 'Low', 'Cool and dry'),
('Sodium Hydroxide', '1310-73-2', 'Medium', 'Sealed containers'),
('Hydrochloric Acid', '7647-01-0', 'High', 'Chemical storage cabinet'),
('Benzene', '71-43-2', 'High', 'Well-ventilated flammable cabinet'),
('Methanol', '67-56-1', 'Medium', 'Flammable storage cabinet'),
('Nitric Acid', '7697-37-2', 'High', 'Acid cabinet'),
('Ammonia', '7664-41-7', 'Medium', 'Ventilated area'),
('Chloroform', '67-66-3', 'High', 'Tightly closed containers');

-- Insert Sample Data into Supplier
INSERT INTO Supplier (SupplierName, ContactPerson, Phone, Email) VALUES
('ChemCorp', 'Rajiv Nair', '9876543210', 'rajiv@chemcorp.com'),
('LabSolutions', 'Anjali Mehta', '9823456789', 'anjali@labsol.com'),
('GreenChem', 'Sameer Reddy', '9812345670', 'sameer@greenchem.com'),
('PureChemicals', 'Divya Rao', '9898765432', 'divya@purechem.com'),
('SafeLab Suppliers', 'Vikas Jain', '9834567891', 'vikas@safelab.com'),
('EcoChem', 'Priya Shah', '9843217654', 'priya@ecochem.com'),
('LabEssentials', 'Rahul Kapoor', '9801234567', 'rahul@labess.com'),
('Advanced Reagents', 'Meena Kulkarni', '9865321478', 'meena@advreag.com'),
('GlobalChem', 'Alok Verma', '9876123450', 'alok@globalchem.com'),
('ChemServe', 'Sneha Pillai', '9856234789', 'sneha@chemserve.com');

-- Insert Sample Data into Lab
INSERT INTO Lab (LabName, LabLocation, LabSupervisor) VALUES
('Organic Lab', 'Block A, Floor 1', 'Dr. Shweta'),
('Inorganic Lab', 'Block B, Floor 2', 'Dr. Amit'),
('Physical Chemistry Lab', 'Block C, Floor 3', 'Dr. Neha'),
('Analytical Lab', 'Block D, Floor 1', 'Dr. Prakash'),
('Research Lab', 'Block E, Floor 4', 'Dr. Meera'),
('Toxicology Lab', 'Block F, Floor 2', 'Dr. Iqbal'),
('Materials Lab', 'Block G, Floor 5', 'Dr. Kavita'),
('Nanotech Lab', 'Block H, Floor 6', 'Dr. Suresh'),
('Environmental Lab', 'Block I, Floor 1', 'Dr. Anusha'),
('Pharma Lab', 'Block J, Floor 3', 'Dr. Varun');

-- Insert Sample Data into Inventory
INSERT INTO Inventory (ChemicalID, SupplierID, LabID, Quantity, Unit, ExpiryDate, StorageLocation) VALUES
(1, 1, 1, 50.00, 'Liters', '2025-12-31', 'Shelf A1'),
(2, 2, 2, 30.00, 'Liters', '2024-11-15', 'Cabinet B2'),
(3, 3, 3, 100.00, 'Liters', '2025-06-10', 'Shelf C3'),
(4, 4, 4, 20.00, 'Liters', '2024-10-05', 'Cabinet D4'),
(5, 5, 5, 40.00, 'Kg', '2025-09-20', 'Shelf E5'),
(6, 6, 6, 25.00, 'Liters', '2026-01-01', 'Vent Box'),
(7, 7, 7, 60.00, 'Liters', '2025-07-07', 'Cabinet G1'),
(8, 8, 8, 10.00, 'Liters', '2024-08-08', 'Shelf H2'),
(9, 9, 9, 5.00, 'Liters', '2024-12-12', 'Fridge I1'),
(10, 10, 10, 80.00, 'Liters', '2026-03-03', 'Cabinet J1');

INSERT INTO UsageRecord (ChemicalID, LabID, UsageDate, QuantityUsed) VALUES
(1, 1, '2024-04-01', 5.00),
(2, 2, '2024-04-02', 3.00),
(3, 3, '2024-04-03', 7.50),
(4, 4, '2024-04-04', 2.00),
(5, 5, '2024-04-05', 6.00),
(6, 6, '2024-04-06', 4.25),
(7, 7, '2024-04-07', 1.75),
(8, 8, '2024-04-08', 3.20),
(9, 9, '2024-04-09', 2.60),
(10, 10, '2024-04-10', 5.80);

INSERT INTO DisposalRecord (ChemicalID, DisposalDate, QuantityDisposed, Method) VALUES
(1, '2024-04-11', 1.00, 'Neutralization'),
(2, '2024-04-12', 0.50, 'Incineration'),
(3, '2024-04-13', 0.75, 'Dilution'),
(4, '2024-04-14', 1.20, 'Neutralization'),
(5, '2024-04-15', 2.00, 'Recycling'),
(6, '2024-04-16', 1.10, 'Neutralization'),
(7, '2024-04-17', 0.90, 'Evaporation'),
(8, '2024-04-18', 1.50, 'Incineration'),
(9, '2024-04-19', 0.80, 'Burial'),
(10, '2024-04-20', 1.00, 'Neutralization');

INSERT INTO IncidentReport (ChemicalID, LabID, IncidentDate, Description, PeopleAffected, SeverityLevel, SafetyMeasuresTaken) VALUES
(1, 1, '2024-04-12', 'Spill of sodium hydroxide on bench', 2, 'Medium', TRUE),
(2, 2, '2024-04-13', 'Minor sulfuric acid splash on gloves', 1, 'Low', TRUE),
(3, 3, '2024-04-14', 'Inhalation of ethanol fumes', 1, 'Low', TRUE),
(4, 4, '2024-04-15', 'Hydrochloric acid leak', 3, 'High', TRUE),
(5, 5, '2024-04-16', 'Exposure to benzene vapor', 2, 'High', TRUE),
(6, 6, '2024-04-17', 'Methanol fire', 1, 'High', TRUE),
(7, 7, '2024-04-18', 'Nitric acid splash on lab coat', 1, 'Medium', TRUE),
(8, 8, '2024-04-19', 'Glass breakage during ammonia handling', 2, 'Low', TRUE),
(9, 9, '2024-04-20', 'Chloroform spill on gloves', 1, 'Medium', TRUE),
(10, 10, '2024-04-21', 'Fume hood malfunction during test', 0, 'Low', TRUE);
