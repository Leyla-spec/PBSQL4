CREATE DATABASE Turboaz
USE Turboaz
CREATE TABLE Brand (
    Id INT PRIMARY KEY,
    BrandName VARCHAR(255)
)

CREATE TABLE Model (
    Id INT PRIMARY KEY,
    ModelName VARCHAR(255),
    BrandId INT,
    FOREIGN KEY (BrandId) REFERENCES Brand(Id)
)

CREATE TABLE VehicleType (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Generation (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE EngineType (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Transmission (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE GearBox (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Modification (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE CountOfSeat (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Color (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE ForWhichMarket (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE StatusOfCar (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE City (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Announcement (
    Id INT PRIMARY KEY,
    ModelId INT,
    ReleaseDate DATE,
    VehicleTypeId INT,
    GenerationId INT,
    EngineTypeId INT,
    TransmissionId INT,
    GearBoxId INT,
    ModificationId INT,
    CountOfSeatId INT,
    ColorId INT,
    ForWhichMarketId INT,
    Distance DECIMAL,
    StatusOfCarId INT,
    VinCode VARCHAR(255),
    Description VARCHAR(255),
    CityId INT,
    Price DECIMAL,
    ContactInfo VARCHAR(255),
    FOREIGN KEY (ModelId) REFERENCES Model(Id),
    FOREIGN KEY (VehicleTypeId) REFERENCES VehicleType(Id),
    FOREIGN KEY (GenerationId) REFERENCES Generation(Id),
    FOREIGN KEY (EngineTypeId) REFERENCES EngineType(Id),
    FOREIGN KEY (TransmissionId) REFERENCES Transmission(Id),
    FOREIGN KEY (GearBoxId) REFERENCES GearBox(Id),
    FOREIGN KEY (ModificationId) REFERENCES Modification(Id),
    FOREIGN KEY (CountOfSeatId) REFERENCES CountOfSeat(Id),
    FOREIGN KEY (ColorId) REFERENCES Color(Id),
    FOREIGN KEY (ForWhichMarketId) REFERENCES ForWhichMarket(Id),
    FOREIGN KEY (StatusOfCarId) REFERENCES StatusOfCar(Id),
    FOREIGN KEY (CityId) REFERENCES City(Id)
)

CREATE TABLE EquipmentOfCar (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE AnnouncementEquipmentOfCar (
    Id INT PRIMARY KEY,
    AnnouncementId INT,
    EquipmentOfCarId INT,
    FOREIGN KEY (AnnouncementId) REFERENCES Announcement(Id),
    FOREIGN KEY (EquipmentOfCarId) REFERENCES EquipmentOfCar(Id)
)

CREATE TABLE Photos (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    AnnouncementId INT,
    FOREIGN KEY (AnnouncementId) REFERENCES Announcement(Id)
)
