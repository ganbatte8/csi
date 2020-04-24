-- cette fonction permet d'ajouter un patient dans la base à condition qu'il n'existe pas dans la base 
CREATE OR REPLACE FUNCTION ajouter_patient (
p_numss BIGINT,
p_prenom VARCHAR,
p_nom VARCHAR,
p_dateNaissance Date,
p_genre CHAR,
p_numTelephone NUMERIC,
p_adressep VARCHAR,
p_email VARCHAR,
iddep INTEGER
)
	RETURNS void 
	LANGUAGE 'plpgsql'
	AS $body$
BEGIN
	-- on verifie des contraintes relatives a la table patient avant d'inserer :
IF	p_genre IN ('H','F','A') AND p_dateNaissance < CURRENT_TIMESTAMP 
	AND (SELECT COUNT(*) FROM patient WHERE numss = p_numss) = 0
THEN
	-- on insere deux lignes : une dans la table patient, une dans la table surveillance.
	INSERT INTO patient
	VALUES(p_numss, p_prenom, p_nom, 'aucun symptôme', 'quarantaine', p_dateNaissance, p_genre, p_numTelephone, p_adressep, p_email, p_iddep);
	INSERT INTO surveillance(datedebsurv,numss)
	VALUES (CURRENT_TIMESTAMP,p_numss);
END IF;
END;
$body$



-----------------------------------------------------------------------------------------

--On modifie les informations relatives à un patient sauf son numéro de sécurité social 

CREATE OR REPLACE FUNCTION modifier_patient(
	p_numss BIGINT,
	p_prenom VARCHAR,
	p_nom VARCHAR,
	p_etatSante VARCHAR,
	p_etatSurveillance VARCHAR,
	p_dateNaissance Date,
	p_genre CHAR,
	p_numTelephone NUMERIC,
	p_adressep VARCHAR,
	p_email VARCHAR)
	RETURNS void 
	LANGUAGE 'plpgsql'
	AS $body$
begin
	UPDATE patient 
	SET prenom = p_prenom,
		nom = p_nom ,
		etatSante = p_etatSante,
		etatSurveillance = p_etatSurveillance,
		dateNaissance = p_dateNaissance,
		genre = p_genre,
		numTelephone = p_numTelephone,
		adressep = p_adressep,
		email = p_email
	WHERE numss = p_numss;	
	IF (SELECT COUNT(*) FROM patient WHERE patient.numss = p_numss) = 0
	THEN
    	RAISE EXCEPTION 'pas de patient dans la base';
	END IF;
end;
$body$

------------------------------------------------------------------------------------------------------------------
--on crée une surveillance pour un patient donné à l'insertion dans la base 
CREATE OR REPLACE FUNCTION insertsurveillance_patient (numss BIGINT) 
	RETURNS void 
	LANGUAGE 'plpgsql'
	AS $body$
BEGIN
INSERT INTO surveillance(datedebsurv,numss)
VALUES (CURRENT_TIMESTAMP,numss);
END;

$body$

---------------------------------------------------------------------
--on modifie la date de fin de surveillance 
CREATE OR REPLACE FUNCTION modifier_date_fin_surveillance (p_idSurveillance INTEGER) 
	RETURNS void 
	LANGUAGE 'plpgsql'
	AS $body$
BEGIN
	UPDATE surveillance 
	SET dateFinSurv = CURRENT_TIMESTAMP
	WHERE idSurveillance = p_idSurveillance;
	IF (SELECT COUNT(*) FROM surveillance WHERE surveillance.idsurveillance = p_idsurveillance) = 0
		THEN
    	RAISE EXCEPTION 'pas de surveillance dans la base';
	END IF;
END;
$body$

--------------------------------------------------------------------------------------------
-- On insère une hospitalisation et on met à jour les places de l'hopital concerné.
CREATE OR REPLACE FUNCTION inserer_patient_hopital (p_idHp INTEGER, p_numss BIGINT) 
	RETURNS void
	LANGUAGE 'plpgsql'
	AS $body$
BEGIN
	IF (SELECT capaciteMax FROM hopital WHERE idhp = p_idhp) > (SELECT placeOccupe FROM hopital WHERE idhp = p_idhp);
	THEN
		INSERT INTO hospitalisation(idhp,numss,datedebut)
		VALUES(p_idHp, p_numss,CURRENT_TIMESTAMP);
		UPDATE Hopital 
		SET placeOccupe = placeOccupe + 1,
			placelibre= placelibre - 1
		WHERE Hopital.idHp = p_idHp;
		UPDATE patient SET etatsurveillance = 'hospitalisé' WHERE numss = p_numss;
	ELSE
		RAISE NOTICE 'On n'' a pas pu hospitaliser le patient : l''hopital est plein';
	END IF;
END;
$body$

------------------------------------------------------------------------------
--On date une fin d'hospitalisation d'un patient 
CREATE OR REPLACE FUNCTION dater_fin_hospitalisation(p_numss BIGINT)
    RETURNS void
    LANGUAGE 'plpgsql'
    AS $body$
BEGIN
    -- on date la fin de la derniere surveillance du patient dont la cle est p_numss :
    UPDATE hospitalisation
    SET datefin = CURRENT_TIMESTAMP
    WHERE hospitalisation.idHp = (SELECT idHp FROM hospitalisation WHERE numss = p_numss ORDER BY datedebut DESC LIMIT 1);
    -- comme on retire un patient d'un hopital, on doit mettre a jour les places libres et les places occupees :
    UPDATE hopital
        SET placelibre = placelibre+1,
            placeoccupe = placeoccupe-1
        WHERE (hopital.idhp = (SELECT idHp FROM hospitalisation WHERE numss = p_numss ORDER BY datedebut DESC LIMIT 1));
		IF (SELECT COUNT(*) FROM patient WHERE patient.numss = p_numss) = 0
		THEN
    		RAISE EXCEPTION 'Il n''y a de patient dans la base';
		END IF;
END;
$body$

------------------------------------------------------------------
--on modifie la capacité totale de l'hôpital
CREATE OR REPLACE FUNCTION modifier_capacite_hopital (p_idHp INTEGER, p_newcapacite INTEGER)
	RETURNS void
    LANGUAGE 'plpgsql'
    AS $body$
BEGIN
		UPDATE Hopital 
		SET capaciteMax = p_newcapacite,
			placeLibre = p_newcapacite - placeOccupe
		WHERE Hopital.idHp = p_idHp;
END;
$body$
-----------------------------------------------------------
--modification le seuil de contamination par département
CREATE OR REPLACE FUNCTION modif_seuil_contamine (p_idDepartement INTEGER, nouveau_seuil INTEGER)
	RETURNS void
	LANGUAGE 'plpgsql'
	AS $body$
BEGIN
	UPDATE departement 
	SET seuilPersContamine = nouveau_seuil 
	WHERE idDep = p_idDepartement;
END;
$body$


------------------------------------------------------
-- on a cherche a implementer un trigger pour les alertes d'un hopital.
-- ce trigger se declencherait lorsque le nombre de places occupees d'un hopital se voit modifie.
-- probleme : un trigger s'exécute sur toutes les lignes de la table hopital. 
-- On obtiendrait donc une alerte pour tous les hopitaux en même temps.
-- Pas d'alternatives à FOR EACH ROW pour un trigger.
-- on fait les alertes côté application ?

CREATE OR REPLACE FUNCTION trigger_tauxmax()
	RETURNS TRIGGER AS $after_trigger_tauxmax$
DECLARE
nb1 INTEGER;
nb2 INTEGER; 
nb3 DECIMAL;
taux DECIMAL;
tot INTEGER;
BEGIN
	taux = NEW.tauxMax;
	nb1 = NEW.placeoccupe;
	nb2 = NEW.capacitemax;
	nb3 = (nb1::DECIMAL / nb2);
	tot = nb3 * 100;
	RAISE NOTICE 'place occupe : % ', nb1;
	RAISE NOTICE	'capacite max : % ', nb2;
	RAISE NOTICE	'taux max : % ', taux;
	RAISE NOTICE	'total nb3 = nb1/nb2 = %', nb3;
	RAISE NOTICE	'taux actuel nb3*100 = % ',tot;
	RAISE NOTICE 	'le taux est % ', taux;
	IF(tot >= taux)
	THEN
		RAISE NOTICE 'Alerte : le taux maximal de l''hopital est atteint une alerte doit être lancé';
	END IF;
	RETURN NEW;
END;
$after_trigger_tauxmax$
LANGUAGE plpgsql;

CREATE TRIGGER after_trigger_tauxmax AFTER INSERT OR UPDATE
ON Hopital EXECUTE PROCEDURE trigger_tauxmax();
---------------------------------------------------

--etatSurveillance: un patient ne peut pas passer de “mort” à “guéri” (dynamique forte)
--etatSurveillance: un patient ne peut pas passer de “guéri” à “mort” (Uniquement dans le cadre du Coronavirus) (dynamique forte)
--Comme c'est une contrainte dynamqiue ('forte') alors on utilise un trigger
--pareil pour les statiques fortes

CREATE OR REPLACE FUNCTION etat_surv_pas_modifier()
	RETURNS TRIGGER AS $before_etat_surv_pas_modifier$
DECLARE
BEGIN
	IF OLD.etatSurveillance = 'mort' AND NEW.etatSurveillance <> 'mort'
	THEN 	
		RAISE EXCEPTION 'etatSurveilance: On ne peut pas faire revenir un patient d''entre les morts :) ';
	END IF;
	
	--on considère qu'un patient ne meurt pas du covid, cela évite de prendre en compte les patients qui meurent d'autre chose que le virus
	IF OLD.etatSurveillance = 'guéri' AND NEW.etatSurveillance = 'mort'
	THEN
		RAISE EXCEPTION 'etatSurveillance: un patient guéri ne meurt pas du covid'; 
	END IF;
	RETURN NEW;
END;
$before_etat_surv_pas_modifier$
LANGUAGE plpgsql;

CREATE TRIGGER before_etat_surv_pas_modifier BEFORE UPDATE
ON patient
FOR EACH ROW EXECUTE PROCEDURE etat_surv_pas_modifier() ;
-------------------------------------------
--Cette fonction permet d'empêcher de modifier les lignes de la table historiqueEtatP 
CREATE OR REPLACE FUNCTION historique_etat_ne_pas_modifier()
	RETURNS TRIGGER AS $before_historique_etat_ne_pas_modifier$
    
DECLARE
res VARCHAR;
BEGIN
	IF OLD.historiqueEtat <> NEW.historiqueEtat
		OR OLD.dateHistorique <> NEW.dateHistorique
		OR OLD.numss <> NEW.numss
	THEN 	
		RAISE EXCEPTION 'historiqueEtat: les lignes de la table ne peuvent pas être changées ';
	END IF;
	RETURN NULL;
END;
$before_historique_etat_ne_pas_modifier$
LANGUAGE plpgsql;

CREATE TRIGGER before_historique_etat_ne_pas_modifier BEFORE UPDATE
ON historiqueEtatP
FOR EACH ROW EXECUTE PROCEDURE historique_etat_ne_pas_modifier();

-------------------------------------------------
--La fonction permet d'empêcher l'insertion d'un historique d'état d'un patient déjà décédé.
CREATE OR REPLACE FUNCTION empecher_inserer_historique_etat()
	RETURNS TRIGGER AS $before_empecher_inserer_historique_etat$
    
DECLARE
res INTEGER;
BEGIN
	res = (SELECT COUNT(historiqueEtat) from historiqueetatp
	WHERE numss = NEW.numss 
	AND historiqueetat = 'décédé');
	/*
	RAISE NOTICE 'num nouv %' ,NEW.numss;
	RAISE NOTICE 'val res %' , res;
	*/
	IF (res > 0)
	THEN
		RAISE EXCEPTION 'historiqueetat: le patient est deja décédé ';
	END IF;
	RETURN NEW;
END;
$before_empecher_inserer_historique_etat$
LANGUAGE plpgsql;

CREATE TRIGGER before_empecher_inserer_historique_etat BEFORE INSERT
ON historiqueEtatP
FOR EACH ROW EXECUTE PROCEDURE empecher_inserer_historique_etat();


----------------------------------
-- On veut creer un trigger pour la table patient qui verifie que pour chaque ligne, 
---les valeurs de etatSurveillance et etatSante sont coherentes.

/*
si etatSante = aucunsymptome, alors etatSurveillance est soit gueri ou quarantaine.
si etatSante = fievre, alors etatSurveillance est soit gueri (on peut avoir de la fievre et avoir gueri du coronavirus ?), soit quarantaine, soit hospitalise. (donc tout sauf mort)
si etatSante = fievre et problemes respiratoires, alors etatSurveillance est forcement hospitalise.
si etatSante = inconscient, alors etatSurveillance est forcement hospitalise.
enfin, si etatSante = decede alors etatSurveillance = mort.
*/

CREATE OR REPLACE FUNCTION forcer_coherence_surv_sante()
	RETURNS TRIGGER AS $before_forcer_coherence_surv_sante$
DECLARE
BEGIN
	IF (NEW.etatSante = 'aucun symptôme' AND NEW.etatSurveillance <> 'guéri' AND NEW.etatSurveillance <> 'quarantaine') THEN
		RAISE EXCEPTION 'Operation % dans la table patient annulee : incoherence entre % et %', TG_OP, NEW.etatSante, NEW.etatSurveillance;
	ELSIF (NEW.etatSante = 'fièvre' AND NEW.etatSurveillance = 'mort') THEN
		RAISE EXCEPTION 'Operation % dans la table patient annulee : incoherence entre % et %', TG_OP, NEW.etatSante, NEW.etatSurveillance;
	ELSIF (NEW.etatSante = 'fièvre et problèmes respiratoires' AND NEW.etatSurveillance <> 'hospitalisé') THEN
		RAISE EXCEPTION 'Operation % dans la table patient annulee : incoherence entre % et %', TG_OP, NEW.etatSante, NEW.etatSurveillance;
	ELSIF (NEW.etatSante = 'inconscient' AND NEW.etatSurveillance <> 'hospitalisé') THEN
		RAISE EXCEPTION 'Operation % dans la table patient annulee : incoherence entre % et %', TG_OP, NEW.etatSante, NEW.etatSurveillance;
	ELSIF (NEW.etatSante = 'décédé' AND NEW.etatSurveillance <> 'mort') THEN
		RAISE EXCEPTION 'Operation % dans la table patient annulee : incoherence entre % et %', TG_OP, NEW.etatSante, NEW.etatSurveillance;
	END IF;
	RETURN NEW;
END;
$before_forcer_coherence_surv_sante$
LANGUAGE plpgsql;

CREATE TRIGGER before_forcer_coherence_surv_sante BEFORE INSERT OR UPDATE
ON patient
FOR EACH ROW EXECUTE PROCEDURE forcer_coherence_surv_sante();


/*
modele trigger (doc postgreSQL)

CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS trigger AS
$BODY$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$BODY$

CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();

*/



