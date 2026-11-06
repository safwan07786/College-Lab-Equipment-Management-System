CREATE DATABASE IF NOT EXISTS lab_equipment_db;
USE lab_equipment_db;

-- Table 1: equipment (as specified in your project sheet)
CREATE TABLE IF NOT EXISTS equipment (
  equipment_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  quantity INT NOT NULL DEFAULT 0,
  available_quantity INT NOT NULL DEFAULT 0,
  status VARCHAR(20) NOT NULL DEFAULT 'Available'
);

-- Table 2: users (as specified in your project sheet)
CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(30) NOT NULL
);

-- Table 3: issue_records (as specified in your project sheet)
-- issue_date and return_date are nullable to support pending requests.
CREATE TABLE IF NOT EXISTS issue_records (
  issue_id INT AUTO_INCREMENT PRIMARY KEY,
  equipment_id INT NOT NULL,
  user_id INT NOT NULL,
  issue_date DATE NULL,
  return_date DATE NULL,
  quantity INT NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'Pending',
  FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO equipment(name,category,quantity,available_quantity,status)
SELECT 'Digital Multimeter','Electronics',15,15,'Available'
WHERE NOT EXISTS (SELECT 1 FROM equipment WHERE name='Digital Multimeter');
INSERT INTO equipment(name,category,quantity,available_quantity,status)
SELECT 'Arduino Uno','Microcontroller',20,20,'Available'
WHERE NOT EXISTS (SELECT 1 FROM equipment WHERE name='Arduino Uno');
INSERT INTO equipment(name,category,quantity,available_quantity,status)
SELECT 'Soldering Iron','Electronics',10,10,'Available'
WHERE NOT EXISTS (SELECT 1 FROM equipment WHERE name='Soldering Iron');