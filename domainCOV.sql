
-- Les domaines associés aux tables
-- domaine associé à la colonne etatSante de la table Patient
CREATE DOMAIN dom_etatSante AS TEXT
	CONSTRAINT dom_etatSante
	CHECK(
		VALUE = 'aucun symptôme'
		OR VALUE = 'fièvre'
		OR VALUE = 'fièvre et problèmes respiratoires'
		OR VALUE = 'décédé'
		OR VALUE = 'inconscient'
);

-- domaine associé à la colonne etatSurveillance de la table Patient
CREATE DOMAIN dom_etatSurveillance AS TEXT
	CONSTRAINT dom_etatSurveillance
	CHECK(
		VALUE = 'guéri'
		OR VALUE = 'quarantaine'
		OR VALUE = 'hospitalisé'
		OR VALUE = 'mort'
);

-- domaine associé à la colonne genre de la table Patient 
CREATE DOMAIN dom_genre AS CHAR
	CONSTRAINT dom_genre
	CHECK(
		VALUE = 'H' 		-- H pour le genre Homme
		OR VALUE = 'F'		-- F pour le genre Femme
		OR VALUE = 'A'		-- A pour le genre Autre
);

-- domaine associé à la colonne historiqueEtat de la table historiqueEtatP 
CREATE DOMAIN dom_historiqueEtat AS text
	CONSTRAINT dom_historiqueEtat
	CHECK(
		VALUE = 'aucun symptôme'
		OR VALUE = 'fièvre'
		OR VALUE = 'inconscient'
		OR VALUE = 'décédé'
		OR VALUE = 'fièvre et problèmes respiratoires'
		
	
);

-- Domaine pour les attributs qui ont le même type et les mêmes contraintes

CREATE DOMAIN dom_entier_positif AS INTEGER
	CONSTRAINT dom_entier_positif
	 CHECK (VALUE >= 0);
