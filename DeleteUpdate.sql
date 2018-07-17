-- Switches Database
USE nprsamples
GO

--Updates customer city in customer table based on customer id
UPDATE Customers
SET customerCity = 'Aurora'
WHERE customer_id = '001'

--deletes a customer based on customer id 
DELETE FROM Customers
WHERE customer_id = '003'