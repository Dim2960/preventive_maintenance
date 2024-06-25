/* 2024-06-23 11:10:49 [43 ms] */ 
CREATE OR REPLACE FUNCTION aeronefs_cdc_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO aeronefs_cdc (operation, ref_aero, type_model, debut_service, last_maint, en_maintenance, end_maint)
        VALUES ('I', NEW.ref_aero, NEW.type_model, NEW.debut_service, NEW.last_maint, NEW.en_maintenance, NEW.end_maint);
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO aeronefs_cdc (operation, ref_aero, type_model, debut_service, last_maint, en_maintenance, end_maint)
        VALUES ('U', NEW.ref_aero, NEW.type_model, NEW.debut_service, NEW.last_maint, NEW.en_maintenance, NEW.end_maint);
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO aeronefs_cdc (operation, ref_aero, type_model, debut_service, last_maint, en_maintenance, end_maint)
        VALUES ('D', OLD.ref_aero, OLD.type_model, OLD.debut_service, OLD.last_maint, OLD.en_maintenance, OLD.end_maint);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
/* 2024-06-23 11:10:52 [19 ms] */ 
CREATE TRIGGER aeronefs_cdc_changes
AFTER INSERT OR UPDATE OR DELETE ON aeronefs
FOR EACH ROW
EXECUTE FUNCTION aeronefs_cdc_trigger();


/* 2024-06-23 11:17:05 [9 ms] */ 
CREATE OR REPLACE FUNCTION composants_cdc_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO composants_cdc (operation, ref_compo, categorie, aero, desc_compo, lifespan, taux_usure_actuel, cout)
        VALUES ('I', NEW.ref_compo, NEW.categorie, NEW.aero, NEW.desc_compo, NEW.lifespan, NEW.taux_usure_actuel, NEW.cout);
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO composants_cdc (operation, ref_compo,categorie, aero, desc_compo, lifespan, taux_usure_actuel, cout)
        VALUES ('U', NEW.ref_compo, NEW.categorie, NEW.aero, NEW.desc_compo, NEW.lifespan, NEW.taux_usure_actuel, NEW.cout);
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO composants_cdc (operation, ref_compo,categorie, aero, desc_compo, lifespan, taux_usure_actuel, cout)
        VALUES ('D', OLD.ref_compo, OLD.categorie, OLD.aero, OLD.desc_compo, OLD.lifespan, OLD.taux_usure_actuel, OLD.cout);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER composants_cdc_changes
AFTER INSERT OR UPDATE OR DELETE ON composants
FOR EACH ROW
EXECUTE FUNCTION composants_cdc_trigger();




/* 2024-06-23 11:21:20 [15 ms] */ 
CREATE OR REPLACE FUNCTION degradations_cdc_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO degradations_cdc (operation, clef, ref_deg, linked_aero, compo_concerned, usure_nouvelle, measure_day, need_replacement)
        VALUES ('I', NEW.clef, NEW.ref_deg, NEW.linked_aero, NEW.compo_concerned, NEW.usure_nouvelle, NEW.measure_day, NEW.need_replacement);
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO degradations_cdc (operation, clef, ref_deg, linked_aero, compo_concerned, usure_nouvelle, measure_day, need_replacement)
        VALUES ('U', NEW.clef, NEW.ref_deg, NEW.linked_aero, NEW.compo_concerned, NEW.usure_nouvelle, NEW.measure_day, NEW.need_replacement);
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO degradations_cdc (operation, clef, ref_deg, linked_aero, compo_concerned, usure_nouvelle, measure_day, need_replacement)
        VALUES ('D', OLD.clef, OLD.ref_deg, OLD.linked_aero, OLD.compo_concerned, OLD.usure_nouvelle, OLD.measure_day, OLD.need_replacement);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
/* 2024-06-23 11:21:21 [12 ms] */ 
CREATE TRIGGER degradations_cdc_changes
AFTER INSERT OR UPDATE OR DELETE ON degradations
FOR EACH ROW
EXECUTE FUNCTION degradations_cdc_trigger();


/* 2024-06-23 11:27:03 [15 ms] */ 
CREATE OR REPLACE FUNCTION logs_vols_cdc_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO logs_vols_cdc (operation, ref_vol, aero_linked, jour_vol, time_en_air, sensor_data, etat_voyant, temp, temp_unit, pressure, pressure_unit, vibrations, vibrations_unit)
        VALUES ('I', NEW.ref_vol, NEW.aero_linked, NEW.jour_vol, NEW.time_en_air, NEW.sensor_data, NEW.etat_voyant, NEW.temp, NEW.temp_unit, NEW.pressure, NEW.pressure_unit, NEW.vibrations, NEW.vibrations_unit);
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO logs_vols_cdc (operation, ref_vol, aero_linked, jour_vol, time_en_air, sensor_data, etat_voyant, temp, temp_unit, pressure, pressure_unit, vibrations, vibrations_unit)
        VALUES ('U', NEW.ref_vol, NEW.aero_linked, NEW.jour_vol, NEW.time_en_air, NEW.sensor_data, NEW.etat_voyant, NEW.temp, NEW.temp_unit, NEW.pressure, NEW.pressure_unit, NEW.vibrations, NEW.vibrations_unit);
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO logs_vols_cdc (operation, ref_vol, aero_linked, jour_vol, time_en_air, sensor_data, etat_voyant, temp, temp_unit, pressure, pressure_unit, vibrations, vibrations_unit)
        VALUES ('D', OLD.ref_vol, OLD.aero_linked, OLD.jour_vol, OLD.time_en_air, OLD.sensor_data, OLD.etat_voyant, OLD.temp, OLD.temp_unit, OLD.pressure, OLD.pressure_unit, OLD.vibrations, OLD.vibrations_unit);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
/* 2024-06-23 11:27:05 [8 ms] */ 
CREATE TRIGGER logs_vols_cdc_changes
AFTER INSERT OR UPDATE OR DELETE ON logs_vols
FOR EACH ROW
EXECUTE FUNCTION logs_vols_cdc_trigger();
