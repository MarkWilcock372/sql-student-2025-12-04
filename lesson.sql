-- List patients in kingston

/*
Instructions:
1. Uncomment one filter at a time to see how it affects the results.
2. Experiment with combining multiple filters to refine your search.
3. Observe how the use of AND and OR changes the output.
*/

SELECT 
    PatientId, 
    AdmittedDate, 
    DischargeDate,
    DATEDIFF(DAY, AdmittedDate, DischargeDate) AS LengthOfStay,
    DATEADD(WEEK, -2, AdmittedDate) as ReminderDate, -- 2 weeks before admitteddate
    DATEADD(MONTH, 3, DischargeDate) AS AppointmentDate,
    Hospital,
    Ward,
    Tariff
FROM PatientStay
WHERE Hospital IN ( 'Kingston', 'PRUH' )
ORDER BY Hospital ASC, Ward ASC, Tariff DESC

-- AND Ward LIKE '%Surgery%'
-- AND AdmittedDate BETWEEN '2024-02-27' AND '2024-03-02'
-- AND Tariff < 6
-- OR Hospital = 'PRUH'
-- AND Ward = 'Dermatology'

-- summarise data

SELECT
    Hospital
    ,Ward
    ,COUNT(*) AS NumberOfPatients    
    ,SUM(Tariff) AS TotalTariff
FROM
    PatientStay
GROUP BY Hospital, Ward

select * from PatientStay
select * from DimHospital

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    , ps.Hospital
    ,h.Hospital    
    ,h.HospitalType
    ,h.HospitalSize
FROM
    PatientStay  ps LEFT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital


SELECT * FROM DimHospitalBad