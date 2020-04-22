--Création de la table Deaprtement
-- On ne crée pas de séquence pour la table département car le numéro  d'un département est unique
CREATE TABLE Departement(
       	idDep INTEGER NOT NULL,
        nbHabitant INTEGER NOT NULL,
        seuilPersContamine REAL NOT NULL,
        nomDep VARCHAR(50),
        CONSTRAINT departement_pk PRIMARY KEY (idDep),
		CONSTRAINT nbHabitant CHECK(nbHabitant > 0),
		CONSTRAINT seuilPersContamine_positif 
		CHECK (seuilPersContamine > 0 AND seuilPersContamine <= 100)
);

/* SEQUENCE permet de définir un générateur de séequence de nombre.
 Il permet la création et l’initialisation d’une nouvelle table à une seule l
 igne nomée id_adresse de la table adresse. Et le générateur appartient à l’utilisateur qui eécute la commande 
En gros elle permet la géneration d’identifiant unique en auto incrémentation 
De manière général, un SERIAL implique la création d'une séquence 
portant le nom de la table (ma_table) concaténée du nom du champ (idauto) et du suffixe _seq
Ce qui donnera : ma_table_idauto_seq

Une séquence est implicitement créée lorsque l'on déclare la création d'une table avec une colonne de type SERIAL.

La colonne se transformera en type INTEGER mais aura une valeur par défaut à nextval('ma_sequence');
CREATE TABLE ma_table (idauto SERIAL, nom VARCHAR(100));

*/

/* OWNED BY permet d’associer la séquence à une colonne de la table spécifique.
De cette façon la séquence sera automatiquement supprimée si la colonne (ou la table entière) est supprimée. 
La table indiquée doit avoir le même propriétaire et être dans le même schéma que la séquence. 
OWNED BY NONE, valeur par défaut, indique qu'il n'y a pas d'association. */


--Création de la table Patient
-- Ici on ne crée pas de séquence car le numéro de sécurité social on ne l'incrémente pas, cependant il est unique 
CREATE TABLE Patient(
                numss BIGINT NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                nom VARCHAR(50) NOT NULL,
                etatSante dom_etatSante NOT NULL,
                etatSurveillance dom_etatSurveillance NOT NULL,
                dateNaissance DATE NOT NULL,
                genre dom_genre NOT NULL,
                numTelephone NUMERIC,
		adressep VARCHAR(1000),
                email VARCHAR(250), --on considère qu'un mineur pourra utiliser l'adresse de ses parents et un patient il peut ne pas avoir de mail

                CONSTRAINT patient_pk PRIMARY KEY (numss),
				CONSTRAINT dateNaissance_anterieur CHECK (dateNaissance < CURRENT_TIMESTAMP) 
);

--Création de la séquence pour la table historiqueEtatP
CREATE SEQUENCE historiqueetatp_idhistorique_seq;

--Création de la table historiqueEtatP
CREATE TABLE historiqueEtatP (
                idHistorique INTEGER NOT NULL DEFAULT nextval('historiqueetatp_idhistorique_seq'),
                historiqueEtat dom_historiqueEtat NOT NULL ,
                dateHistorique TIMESTAMP,
                numss BIGINT NOT NULL,
                CONSTRAINT historiqueetatp_pk PRIMARY KEY (idHistorique),
				CONSTRAINT dateHistorique_post CHECK (dateHistorique <= CURRENT_TIMESTAMP )
);

-- OWNED BY permet d’associer la séquence à une colonne de la table  historiqueEtatP
ALTER SEQUENCE historiqueetatp_idhistorique_seq OWNED BY historiqueEtatP.idHistorique;

--Création de la séquence pour la table surveillance 
CREATE SEQUENCE surveillance_idsurveillance_seq;

--Création de la table surveillance
CREATE TABLE surveillance (
                idSurveillance INTEGER NOT NULL DEFAULT nextval('surveillance_idsurveillance_seq'),
                dateDebSurv TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                dateFinSurv TIMESTAMP DEFAULT NULL,
                numss BIGINT NOT NULL,
                CONSTRAINT surveillance_pk PRIMARY KEY (idSurveillance),
				CONSTRAINT survDebSurv_post CHECK (dateDebSurv <= CURRENT_TIMESTAMP),
				CONSTRAINT dateFinSurv_nNull_post 
					CHECK (dateFinSurv <= CURRENT_TIMESTAMP)
);


ALTER SEQUENCE surveillance_idsurveillance_seq OWNED BY surveillance.idSurveillance;

--Création de la séquence pour la table Hopital
CREATE SEQUENCE hopital_idhp_seq;

--Création de la table Hopital
CREATE TABLE Hopital(
                idHp INTEGER NOT NULL DEFAULT nextval('hopital_idhp_seq'),
                capaciteMax INTEGER NOT NULL,
                nom VARCHAR(50) NOT NULL,
                tauxMax REAL NOT NULL,
                placeOccupe INTEGER NOT NULL,
                placeLibre INTEGER NOT NULL,
				adresseh VARCHAR(1000),
				iddep INTEGER NOT NULL,
                CONSTRAINT hopital_pk PRIMARY KEY (idHp),
		CONSTRAINT tauxMax_positif CHECK (tauxMax >= 0 AND tauxMax <= 100),
		CONSTRAINT capaciteMax_positive CHECK (capaciteMax > 0),
		CONSTRAINT placeLibre_positive CHECK (placeLibre >= 0),
		CONSTRAINT placeOccupe_positive CHECK (placeOccupe >= 0),
		CONSTRAINT capaciteMax_grande CHECK (placeLibre + placeOccupe = capaciteMax)
);

-- 
ALTER SEQUENCE hopital_idhp_seq OWNED BY Hopital.idHp;

--Création de la séquence pour la table hospitalisation
CREATE SEQUENCE hospitalisation_idhospitalisation_seq;

--Création de la table hospitalisation
CREATE TABLE hospitalisation(
                idHospitalisation INTEGER NOT NULL DEFAULT nextval('hospitalisation_idhospitalisation_seq'),
                idHp INTEGER NOT NULL,
                numss BIGINT NOT NULL,
                dateDebut TIMESTAMP NOT NULL,
                dateFin TIMESTAMP ,
               	CONSTRAINT hospitalisation_pk PRIMARY KEY (idHospitalisation),
		CONSTRAINT dateDebut_post CHECK (dateDebut <= CURRENT_TIMESTAMP ),-- date de début est antérieure à la date d'aujourd'hui
		CONSTRAINT dateFin_nNull_post CHECK (dateFin <= CURRENT_TIMESTAMP ) --date de fin est soit NULL soit antérieure à la date d'aujourd'hui
);


ALTER SEQUENCE hospitalisation_idhospitalisation_seq OWNED BY hospitalisation.idHospitalisation;



CREATE TABLE utilisateur (
  	iduser SERIAL,
  	nom VARCHAR(50) NOT NULL,
  	prenom VARCHAR(50) NOT NULL,
  	mail VARCHAR(250) NOT NULL,
  	metier INTEGER NOT NULL, 
  	motdp VARCHAR(512) NOT NULL,
	idhp INTEGER ,
  	CONSTRAINT iduser_pk PRIMARY KEY (iduser)
);




-- les contraintes des clès étrangères 

ALTER TABLE surveillance 
ADD CONSTRAINT patient_surveillance_f FOREIGN KEY (numss) REFERENCES Patient (numss)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hospitalisation 
ADD CONSTRAINT patient_hospitalisation_fk FOREIGN KEY (numss) REFERENCES Patient (numss)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE historiqueEtatP 
ADD CONSTRAINT patient_historiqueetatp_fk FOREIGN KEY (numss) REFERENCES Patient (numss)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE hospitalisation 
ADD CONSTRAINT hopital_hospitalisation_fk FOREIGN KEY (idHp) REFERENCES Hopital (idHp)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



ALTER TABLE Hopital
ADD CONSTRAINT departement_hopital_fk FOREIGN KEY (idDep) REFERENCES departement (idDep)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE utilisateur
ADD CONSTRAINT hopital_utilisateur_fk FOREIGN KEY (idHp) REFERENCES hopital (idHp)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

	
-- modifier les tables pour qu'elles prennent en compte les contraintes associées aux domaines définis
ALTER TABLE Patient
ALTER COLUMN etatSante TYPE dom_etatSante,
ALTER COLUMN etatSurveillance TYPE dom_etatSurveillance,
ALTER COLUMN genre TYPE dom_genre;

ALTER TABLE historiqueEtatP
ALTER COLUMN historiqueEtat TYPE dom_historiqueEtat;











