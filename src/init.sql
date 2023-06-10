java -jar ./lib/derbyrun.jar server start
--Convenzioni type account: AM = amministratore, SI = simpatizzante, AD = aderente
CONNECT 'jdbc:derby://localhost:1527/Tum4World;create=true';
CREATE TABLE ACCOUNT (Username VARCHAR(50), DataDiNascita DATE, Nome VARCHAR(50), Cognome VARCHAR(50), Email VARCHAR(50), Cellulare VARCHAR(50), Password VARCHAR(50), Type CHAR(2), PRIMARY KEY(Username));
CREATE TABLE DONAZIONE (Importo INT, DataDonazione TIMESTAMP, Account VARCHAR(50), PRIMARY KEY(DataDonazione, Account), FOREIGN KEY(Account) REFERENCES ACCOUNT(Username));
INSERT INTO ACCOUNT VALUES ('admin', '1990-12-12', 'Admin', 'Admin', 'admin@Tum4World.org', '3342852963', '05Adm1n!', 'AM');
CREATE TABLE VISITE (Pagina VARCHAR(50), NumVisite INT, PRIMARY KEY (Pagina));
INSERT INTO VISITE VALUES ('Homepage', 0);
INSERT INTO VISITE VALUES ('Attivita', 0);
INSERT INTO VISITE VALUES ('Chi Siamo', 0);
INSERT INTO VISITE VALUES ('Contatti', 0);
INSERT INTO VISITE VALUES ('Fornitura Cure', 0);
INSERT INTO VISITE VALUES ('Programmi Educazione', 0);
INSERT INTO VISITE VALUES ('Progetti di Sviluppo', 0);
INSERT INTO VISITE VALUES ('Login', 0);
INSERT INTO VISITE VALUES ('SigIn', 0);
INSERT INTO VISITE VALUES ('Registrazione Confermata', 0);
INSERT INTO VISITE VALUES ('Invio Confermato', 0);
INSERT INTO VISITE VALUES ('Simpatizzante', 0);
INSERT INTO VISITE VALUES ('Aderente', 0);
CREATE TABLE ATTIVITA (Attivita VARCHAR(50), Account VARCHAR(50), PRIMARY KEY(Attivita, Account), FOREIGN KEY(Account) REFERENCES ACCOUNT(Username));