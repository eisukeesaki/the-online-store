-- EXTENSIONS
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- FUNCTIONS
CREATE OR REPLACE FUNCTION update_modified_column() 
    RETURNS TRIGGER AS $$
    BEGIN
        NEW.modified = now();
        RETURN NEW; 
    END;
    $$ language 'plpgsql';

-- USERS
CREATE TABLE users (
    id UUID
        PRIMARY KEY
        DEFAULT gen_random_uuid(),
	first_name
        VARCHAR(50)
        NOT NULL,
	last_name
        VARCHAR(50)
        NOT NULL,
	ship_addr_st
        VARCHAR(50),
	ship_addr_line2
        VARCHAR(50),
    ship_addr_city
        VARCHAR(255),
    ship_addr_region
        VARCHAR(50),
    postal_code
        VARCHAR(20),
    ship_addr_country
        VARCHAR(100),
	credit_card_type
        VARCHAR(50), -- TODO: add constaint: ?store encrypted value; only allow an instance from pre-defined list of credit card types
	credit_card_number -- TODO: store encrypted value
        VARCHAR(20) 
        UNIQUE,
	phone
        VARCHAR(50),
    email
        VARCHAR(50)
        NOT NULL
        UNIQUE,
    created
        TIMESTAMP
        NOT NULL
        DEFAULT (CURRENT_TIMESTAMP), 
    modified
        TIMESTAMP
);
CREATE TRIGGER update_users_modtime
    BEFORE UPDATE
    ON users
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

-- SEED USERS
INSERT INTO users
    (id, first_name, last_name, ship_addr_st, ship_addr_line2, ship_addr_city, ship_addr_region, postal_code, ship_addr_country, credit_card_type, credit_card_number, phone, email)
    VALUES
        ('21277e8a-beb3-491b-8ed3-3f1fd185f42f', 'Ame', 'Leglise', '02 Ronald Regan Trail', 'PO Box 86803', 'New Orleans', 'Louisiana', '70174', 'United States', 'jcb', '3535441719769691', '+1-504-516-4786', 'aleglise0@printfriendly.com'),
        ('d7a7ab3d-0f69-407d-a4ab-cd3f7f9631b3', 'Thornton', 'Rape', '9 Sunfield Court', 'Suite 24', 'Pittsburgh', 'Pennsylvania', '15261', 'United States', 'jcb', '3555649050095790', '+1-412-979-4429', 'trape1@vistaprint.com'),
        ('98c03434-9abc-464d-b393-2363aa428f6c', 'Dina', 'Lambersen', '809 Magdeline Drive', 'Room 1471', 'Kansas City', 'Missouri', '64190', 'United States', 'maestro', '6762456503513185', '+1-816-547-6747', 'dlambersen2@tripod.com'),
        ('c792469d-ca73-46f7-b99b-4a353fd54153', 'Toby', 'Gatfield', '630 Old Gate Junction', '13th Floor', 'Rockville', 'Maryland', '20851', 'United States', 'americanexpress', '374288801872242', '+1-301-452-3453', 'tgatfield3@pagesperso-orange.fr'),
        ('e63a60ff-ad84-4cfc-a6f0-d54e86a6ccbb', 'Drusilla', 'Royal', '36996 Swallow Place', 'PO Box 61590', 'San Antonio', 'Texas', '78235', 'United States', 'jcb', '3578023036884920', '+1-210-663-6075', 'droyal4@yahoo.com'),
        ('422b2ec1-dcba-46fd-b659-cf57ba6512d6', 'Hasheem', 'Jelk', '4704 Loeprich Parkway', 'Apt 980', 'Corona', 'California', '92883', 'United States', 'jcb', '3567962129353280', '+1-626-594-8555', 'hjelk5@homestead.com'),
        ('5ce8440a-20de-45b6-8a66-1d6d11ec17c4', 'Melosa', 'Foggo', '7536 Mifflin Parkway', 'PO Box 54730', 'Dallas', 'Texas', '75277', 'United States', 'jcb', '3564673061349946', '+1-214-342-4924', 'mfoggo6@digg.com'),
        ('ffc64d9c-c73a-47c3-b0c7-f4e572f78c03', 'Siana', 'Guillain', '8297 Coleman Crossing', 'Apt 894', 'Winston Salem', 'North Carolina', '27110', 'United States', 'mastercard', '5108751528324294', '+1-336-134-1728', 'sguillain7@example.com'),
        ('53391bc4-e5db-4ea3-b0b6-f9524093b99f', 'Korella', 'Boom', '1 Hudson Parkway', 'PO Box 53269', 'Mesquite', 'Texas', '75185', 'United States', 'jcb', '3542751034192580', '+1-972-936-3096', 'kboom8@cbslocal.com'),
        ('6573d717-7812-4abc-b500-b26a2440c0ca', 'Wilhelm', 'Knutsen', '27139 Merrick Park', 'Room 1948', 'Tucson', 'Arizona', '85743', 'United States', 'jcb', '3585581092705215', '+1-520-880-1818', 'wknutsen9@intel.com'),
        ('ad890d62-54f7-4094-afc0-b50856070ffb', 'Phaidra', 'Betun', '32136 Spenser Terrace', '14th Floor', 'Tulsa', 'Oklahoma', '74108', 'United States', 'jcb', '3540392862854900', '+1-918-711-1489', 'pbetuna@stanford.edu'),
        ('56602e34-a582-4157-b3e5-f76473aa7366', 'Kevon', 'Small', '94 Monument Point', '14th Floor', 'Davenport', 'Iowa', '52809', 'United States', 'solo', '6767546644959350426', '+1-563-176-1763', 'ksmallb@ft.com'),
        ('5f33d8a3-68ee-4f91-a5c4-771c4d12dbc0', 'Will', 'Fathers', '0 Spenser Center', '20th Floor', 'Tampa', 'Florida', '33647', 'United States', 'jcb', '3569799803511959', '+1-813-983-5353', 'wfathersc@arizona.edu'),
        ('42c99774-65cb-427e-b6c4-dc8536d0ef97', 'Tess', 'Reah', '288 Schlimgen Drive', 'PO Box 74010', 'Flushing', 'New York', '11355', 'United States', 'maestro', '67627502733077561', '+1-917-500-3327', 'treahd@geocities.jp'),
        ('b9063e12-58aa-4729-a4a9-f4ad0ff5fe46', 'Corrine', 'Petre', '085 Badeau Circle', 'Apt 216', 'Detroit', 'Michigan', '48206', 'United States', 'maestro', '0604578375190449', '+1-586-239-7628', 'cpetree@freewebs.com'),
        ('63469e38-5043-4aae-9080-6cd4876fbd73', 'Guillema', 'Zealey', '27 Crownhardt Pass', 'Apt 667', 'Hartford', 'Connecticut', '06140', 'United States', 'jcb', '3539276870782711', '+1-860-800-3491', 'gzealeyf@theatlantic.com'),
        ('52ba5193-eba2-4757-85bc-59885244d6b5', 'Aundrea', 'Kolczynski', '42 Spaight Park', 'Suite 99', 'Springfield', 'Massachusetts', '01114', 'United States', 'jcb', '3583587334495798', '+1-413-636-1537', 'akolczynskig@clickbank.net'),
        ('b6b6c2bf-28a2-4bb8-9e69-fe39802ecbd4', 'Kerri', 'Thurgood', '35820 Manitowish Hill', 'Apt 1627', 'Shreveport', 'Louisiana', '71137', 'United States', 'maestro', '0604735281798976', '+1-318-323-6311', 'kthurgoodh@yellowbook.com'),
        ('ed4aa8a2-83cd-4cb4-8d2c-3272e13a3450', 'Boyd', 'Costin', '55 Pennsylvania Circle', 'Room 206', 'Las Vegas', 'Nevada', '89135', 'United States', 'jcb', '3529246387747525', '+1-702-325-3432', 'bcostini@salon.com'),
        ('2d6cf52a-3c9b-4e89-8565-b4bd3b28c7aa', 'Salem', 'Lynnitt', '78819 Scofield Trail', 'PO Box 77331', 'Knoxville', 'Tennessee', '37919', 'United States', 'jcb', '3586980629411082', '+1-865-666-7748', 'slynnittj@nba.com'),
        ('98cbdb09-22c5-4c9a-b3bc-d931cedb04f9', 'Worthy', 'Ravelus', '2 Basil Junction', 'Apt 935', 'Naples', 'Florida', '34108', 'United States', 'jcb', '3540057113669056', '+1-239-272-8586', 'wravelusk@illinois.edu'),
        ('95e2a766-2527-474e-9730-f1b0603101f9', 'Chaddie', 'Andrysek', '893 1st Terrace', '18th Floor', 'Charlotte', 'North Carolina', '28263', 'United States', 'jcb', '3577868533626559', '+1-704-361-3736', 'candrysekl@macromedia.com'),
        ('c7cdf4bd-c7c6-47e6-86d1-1f766511f57c', 'Filippa', 'Leggott', '17 Trailsway Trail', '11th Floor', 'Washington', 'District of Columbia', '20436', 'United States', 'instapayment', '6388272662430531', '+1-202-684-8329', 'fleggottm@xing.com'),
        ('218703e0-e024-43f1-bcdc-c7adceb07dc2', 'Brandea', 'Kirby', '39 Rowland Point', 'Room 1895', 'Topeka', 'Kansas', '66617', 'United States', 'switch', '633110937178490171', '+1-785-689-2249', 'bkirbyn@utexas.edu'),
        ('6b798e72-fb4f-43ce-be73-6a2fc0e5266b', 'Shaina', 'Tremellier', '03751 Delaware Street', 'Apt 530', 'Louisville', 'Kentucky', '40293', 'United States', 'jcb', '3580838586037538', null, 'stremelliero@rediff.com'),
        ('cd2d2678-c128-4ec9-869a-fd72a0d74244', 'Gearard', 'Louedey', '49951 Oriole Point', '10th Floor', 'El Paso', 'Texas', '88553', 'United States', 'china-unionpay', '561048481804774609', '+1-915-727-9317', 'glouedeyp@dedecms.com'),
        ('13527760-7b9f-4882-a392-6337c14b0d38', 'Corabella', 'Yoakley', '307 Lakeland Court', 'PO Box 11496', 'Columbia', 'South Carolina', '29240', 'United States', 'diners-club-enroute', '201412189033388', '+1-803-241-1195', 'cyoakleyq@bloglines.com'),
        ('27dcd481-18db-4064-91f8-30de91e8296c', 'Toddy', 'Postians', '16134 Boyd Center', '3rd Floor', 'San Francisco', 'California', '94132', 'United States', 'maestro', '501833333398580824', '+1-415-538-9277', 'tpostiansr@vinaora.com'),
        ('e24c0054-465d-48df-8d70-a0db6deb51bc', 'Sheree', 'Du Plantier', '34 Victoria Terrace', 'PO Box 21922', 'Dallas', 'Texas', '75387', 'United States', 'mastercard', '5048375995228565', '+1-214-964-8203', 'sduplantiers@drupal.org'),
        ('49955766-16bc-4313-986b-d207ced62b7c', 'Zea', 'Nilges', '10184 Vahlen Lane', 'Suite 99', 'Tyler', 'Texas', '75710', 'United States', 'bankcard', '5602252822817142', '+1-903-405-0752', 'znilgest@newsvine.com'),
        ('3825d74f-c5b6-4bea-9034-7477d120b82b', 'Candice', 'Masarrat', '3 Boyd Point', 'Suite 79', 'Arlington', 'Virginia', '22205', 'United States', 'bankcard', '5602256686192690', '+1-571-318-4357', 'cmasarratu@berkeley.edu'),
        ('d7a7c3e2-64d3-4982-805c-8755befe6446', 'Rosette', 'Hilley', '07905 Gerald Road', '17th Floor', 'Abilene', 'Texas', '79605', 'United States', 'bankcard', '5610112473866998', '+1-325-153-6527', 'rhilleyv@instagram.com'),
        ('36923aad-ebca-40e9-914e-65173e993543', 'Mady', 'Beseke', '7146 Prairie Rose Avenue', 'Apt 1572', 'El Paso', 'Texas', '79945', 'United States', 'visa', '4041377590872', '+1-915-395-7569', 'mbesekew@woothemes.com'),
        ('55163732-49c2-4b81-86b9-f3c09ba39870', 'Ulrick', 'Hews', '178 Columbus Terrace', 'Apt 965', 'Shreveport', 'Louisiana', '71166', 'United States', 'solo', '6334200103456996641', '+1-318-119-6341', 'uhewsx@google.com.br'),
        ('657fd573-b422-4e2f-b200-4023fcec8f25', 'Brandon', 'Higbin', '56836 Welch Trail', '1st Floor', 'Cincinnati', 'Ohio', '45243', 'United States', 'jcb', '3561663272243007', '+1-513-389-6531', 'bhigbiny@admin.ch'),
        ('e1a26d2b-8f19-4566-bc5c-2c7b252c68cd', 'Clarance', 'Royse', '30261 Sunfield Avenue', 'Room 914', 'Chicago', 'Illinois', '60681', 'United States', 'diners-club-enroute', '201444590087067', '+1-312-238-8760', 'croysez@tiny.cc'),
        ('f5e8f2eb-3976-4154-9d52-e60e4fbc010e', 'Dell', 'Lamberti', '76 North Court', 'PO Box 10164', 'El Paso', 'Texas', '79928', 'United States', 'diners-club-enroute', '201913759726715', '+1-915-426-8903', 'dlamberti10@theguardian.com'),
        ('f73f0433-20e4-4ee2-bb96-17f1ce12b7a7', 'Augustus', 'Coughlan', '85 Bluejay Alley', 'PO Box 34629', 'Marietta', 'Georgia', '30066', 'United States', 'jcb', '3536052427874738', '+1-678-799-9871', 'acoughlan11@google.com'),
        ('82d1fcab-f773-4a02-8dd0-2da581578a28', 'Muire', 'Rigmond', '000 Gina Way', 'Room 1411', 'Rochester', 'New York', '14652', 'United States', 'jcb', '3584361241265887', '+1-585-511-2156', 'mrigmond12@java.com'),
        ('a944203f-8801-4e9a-a8e1-09a58a2eda17', 'Stewart', 'Menichini', '14 Rutledge Alley', 'PO Box 36526', 'Fresno', 'California', '93721', 'United States', 'americanexpress', '372301815396520', null, 'smenichini13@miibeian.gov.cn'),
        ('cf532ecc-80bd-4416-a707-ba7f6e578cf4', 'Huberto', 'Robilart', '06 Everett Place', '18th Floor', 'Washington', 'District of Columbia', '20337', 'United States', 'mastercard', '5300683241714756', '+1-202-613-4675', 'hrobilart14@webs.com'),
        ('a3d3ff96-0dc5-4851-9c0b-9c44ffd1ef95', 'Forbes', 'Tibbles', '7190 Meadow Vale Plaza', 'Room 790', 'Midland', 'Michigan', '48670', 'United States', 'mastercard', '5545051542124528', '+1-989-617-0177', 'ftibbles15@google.ru'),
        ('faf385b0-da00-45a4-bf69-6bc7c0ed7c1c', 'Dewain', 'Pinhorn', '5 Rutledge Avenue', 'PO Box 26395', 'Sacramento', 'California', '95823', 'United States', 'jcb', '3530416802879479', '+1-510-616-2450', 'dpinhorn16@harvard.edu'),
        ('4ddbc939-1e36-4205-b131-09536fbb6417', 'Cassie', 'Simonou', '5529 Blue Bill Park Place', '20th Floor', 'Washington', 'District of Columbia', '20557', 'United States', 'jcb', '3557726296283915', '+1-202-521-5240', 'csimonou17@usa.gov'),
        ('34068f65-32bf-4fb8-ac65-a1f62a0efaf1', 'Micky', 'Dane', '05 Anzinger Avenue', 'Suite 43', 'San Bernardino', 'California', '92424', 'United States', 'diners-club-us-ca', '5459808076971119', '+1-909-931-4093', 'mdane18@auda.org.au'),
        ('05a69c00-878d-4e24-b99a-b3d8842b2788', 'Julius', 'Guidoni', '8902 Bunting Park', '19th Floor', 'Migrate', 'Kentucky', '41905', 'United States', 'jcb', '3529072880490987', '+1-502-821-6884', 'jguidoni19@seesaa.net'),
        ('3b666e99-7e1c-45f5-9ed3-62558713c67b', 'Georgiana', 'Kropp', '2 Buhler Avenue', 'Suite 44', 'Falls Church', 'Virginia', '22047', 'United States', 'jcb', '3556507591280348', '+1-571-342-4246', 'gkropp1a@google.it'),
        ('3fbb9959-4e77-42a7-8663-4d62224e4c3c', 'Tabbitha', 'Queste', '9974 Rockefeller Park', '5th Floor', 'Richmond', 'California', '94807', 'United States', 'visa', '4041371141771301', '+1-510-666-2927', 'tqueste1b@lulu.com'),
        ('bf343e73-4a46-4062-8e47-d87c5482836d', 'Ansell', 'Edgehill', '81932 Grim Circle', 'Room 1216', 'Mansfield', 'Ohio', '44905', 'United States', 'jcb', '3539875221469348', '+1-419-142-8884', 'aedgehill1c@tripadvisor.com'),
        ('11194935-9e54-4a6c-8a44-4888b15af858', 'Justus', 'Lacy', '2443 Farwell Parkway', '13th Floor', 'Denver', 'Colorado', '80209', 'United States', 'jcb', '3575399128210353', '+1-720-587-6278', 'jlacy1d@pinterest.com');
