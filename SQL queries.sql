#1. Chemical Inventory with Supplier Info
SELECT c.ChemicalName, i.Quantity, i.Unit, s.SupplierName
FROM Inventory i
JOIN Chemical c ON i.ChemicalID = c.ChemicalID
JOIN Supplier s ON i.SupplierID = s.SupplierID;

#2. Usage Record with Lab and Chemical Info
SELECT ur.UsageDate, ur.QuantityUsed, c.ChemicalName, l.LabName
FROM UsageRecord ur
JOIN Chemical c ON ur.ChemicalID = c.ChemicalID
JOIN Lab l ON ur.LabID = l.LabID;

#3. Disposal Records with Chemical Info
SELECT dr.DisposalDate, dr.QuantityDisposed, dr.Method, c.ChemicalName
FROM DisposalRecord dr
JOIN Chemical c ON dr.ChemicalID = c.ChemicalID;


#4. Incident Reports with Chemical and Lab
SELECT ir.IncidentDate, ir.Description, ir.SeverityLevel, c.ChemicalName, l.LabName
FROM IncidentReport ir
JOIN Chemical c ON ir.ChemicalID = c.ChemicalID
JOIN Lab l ON ir.LabID = l.LabID;

#5. Inventory by Lab with Chemical Details
SELECT l.LabName, c.ChemicalName, i.Quantity, i.Unit, i.StorageLocation
FROM Inventory i
JOIN Chemical c ON i.ChemicalID = c.ChemicalID
JOIN Lab l ON i.LabID = l.LabID;

#6. Suppliers Providing Chemicals
SELECT DISTINCT s.SupplierName, c.ChemicalName
FROM Inventory i
JOIN Supplier s ON i.SupplierID = s.SupplierID
JOIN Chemical c ON i.ChemicalID = c.ChemicalID;

# 7. Labs with Highest Chemical Usage
SELECT l.LabName, SUM(ur.QuantityUsed) AS TotalUsed
FROM UsageRecord ur
JOIN Lab l ON ur.LabID = l.LabID
GROUP BY ur.LabID
ORDER BY TotalUsed DESC;

#8. Chemicals Involved in Incidents
SELECT c.ChemicalName, COUNT(ir.IncidentID) AS IncidentCount
FROM IncidentReport ir
JOIN Chemical c ON ir.ChemicalID = c.ChemicalID
GROUP BY c.ChemicalName
ORDER BY IncidentCount DESC
LIMIT 1000;

# 9. Total Quantity Used per Chemical
SELECT c.ChemicalName, SUM(ur.QuantityUsed) AS TotalUsed
FROM UsageRecord ur
JOIN Chemical c ON ur.ChemicalID = c.ChemicalID
GROUP BY c.ChemicalName;

 #10. Total Quantity Disposed per Method
 SELECT dr.Method, SUM(dr.QuantityDisposed) AS TotalDisposed
FROM DisposalRecord dr
GROUP BY dr.Method
ORDER BY TotalDisposed DESC;



