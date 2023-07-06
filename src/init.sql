--Convenzioni type account: AM = amministratore, SI = simpatizzante, AD = aderente
CONNECT 'jdbc:derby://localhost:1527/Tum4World;create=true';
CREATE TABLE ACCOUNT (Username VARCHAR(50), DataDiNascita DATE, Nome VARCHAR(50), Cognome VARCHAR(50), Email VARCHAR(50), Cellulare VARCHAR(50), Password VARCHAR(50), Type CHAR(2), PRIMARY KEY(Username));
CREATE TABLE DONAZIONE (Importo INT, DataDonazione TIMESTAMP, Account VARCHAR(50), PRIMARY KEY(DataDonazione, Account));
CREATE TABLE VISITE (Pagina VARCHAR(50), NumVisite INT, PRIMARY KEY (Pagina));
CREATE TABLE ATTIVITA (Attivita VARCHAR(50), Account VARCHAR(50), PRIMARY KEY(Attivita, Account), FOREIGN KEY(Account) REFERENCES ACCOUNT(Username) ON DELETE CASCADE);
