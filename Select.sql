--Switches to database
USE nprsamples
GO

--selects customers based on city
SELECT *FROM Customers
WHERE customerCity = 'Denver'

