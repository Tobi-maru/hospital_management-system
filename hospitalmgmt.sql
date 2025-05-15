Create database  if not exists hospitalMgmt;

Use hospitalMgmt;
-- hospital_schema.sql

-- Table: Manufacturers
CREATE TABLE manufacturers (
    manufacturer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Table: Staff
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    role VARCHAR(50),
    salary INT
);

-- Table: Patients
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    age INT,
    condition_description TEXT,
    date_admitted DATE
);

-- Table: Inventory
CREATE TABLE inventory (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    quantity INT,
    price_per_unit FLOAT,
    date_added DATE,
    expiration_date DATE,
    manufacturer_id INT,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

-- Table: Equipment
CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(100),
    quantity INT,
    price_per_unit FLOAT,
    date_added DATE,
    service_date DATE,
    manufacturer_id INT,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

-- Table: Appointments
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    staff_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- Table: Billing
CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount_due FLOAT,
    payment_status VARCHAR(20),
    date_issued DATE,
    due_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Table: Patient Records
CREATE TABLE patient_records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    treatment TEXT,
    visit_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES staff(staff_id)
);

-- Table: Financial Records
CREATE TABLE financial_records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    amount_paid FLOAT,
    payment_method VARCHAR(30),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Table: Rooms
CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_number INT,
    room_type VARCHAR(50),
    capacity INT,
    status VARCHAR(20)
);

-- Table: Room Assignments
CREATE TABLE room_assignments (
    assignment_id INT PRIMARY KEY,
    room_id INT,
    patient_id INT,
    staff_id INT,
    date_assigned DATE,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

-- Table: Prescriptions
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    medication_name VARCHAR(100),
    dosage VARCHAR(50),
    date_prescribed DATE,
    refill_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Table: Pharmacy
CREATE TABLE pharmacy (
    pharmacy_id INT PRIMARY KEY,
    prescription_id INT,
    staff_id INT,
    FOREIGN KEY (prescription_id) REFERENCES prescriptions(prescription_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
