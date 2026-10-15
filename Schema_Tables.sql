CREATE TABLE Driver (
    driver_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    driver_type VARCHAR(30),
    approved BOOLEAN,
    active BOOLEAN
);

CREATE TABLE Driver_License (
    license_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    license_number VARCHAR(20),
    state VARCHAR(20),
    expiration_date DATE,
    license_file VARCHAR(255),
    verified_date DATE,
    verified_by VARCHAR(50),
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);

CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY,
    asset_number VARCHAR(20),
    vehicle_type VARCHAR(30),
    make VARCHAR(30),
    model VARCHAR(30),
    year INT,
    vin VARCHAR(30),
    license_plate VARCHAR(20),
    current_mileage INT,
    location VARCHAR(50),
    status VARCHAR(20),
    active BOOLEAN,
    notes TEXT
);

CREATE TABLE Trip (
    trip_id INT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    driver_id INT NOT NULL,
    start_datetime DATETIME,
    end_datetime DATETIME,
    starting_mileage INT,
    ending_mileage INT,
    destination VARCHAR(100),
    purpose VARCHAR(100),
    project_program VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);

CREATE TABLE Fuel_Record (
    fuel_id INT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    trip_id INT NOT NULL,
    fuel_date DATE,
    mileage INT,
    gallons DECIMAL(6,2),
    total_cost DECIMAL(8,2),
    vendor VARCHAR(50),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id),
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id)
);

CREATE TABLE Maintenance_Record (
    maintenance_id INT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    service_date DATE,
    mileage_at_service INT,
    service_type VARCHAR(50),
    cost DECIMAL(8,2),
    vendor VARCHAR(50),
    description TEXT,
    next_service_date DATE,
    next_service_mileage INT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicle(vehicle_id)
);
