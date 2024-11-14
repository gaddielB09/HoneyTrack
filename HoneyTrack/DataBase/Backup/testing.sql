USE HoneyTrack;

DELIMITER $$

CREATE TRIGGER actualizarPorcentajeLote
AFTER UPDATE ON VERIFICACION
FOR EACH ROW
BEGIN
    DECLARE lot INT;
    DECLARE totalVerificaciones INT;
    DECLARE cantTerminadas INT;
    DECLARE porcen float;

    SET lot = (SELECT lote FROM LOTE_VERIFICACION WHERE verificacion = NEW.num);

    SET totalVerificaciones = (SELECT COUNT(*) FROM LOTE_VERIFICACION WHERE lote = lot);

    SET cantTerminadas = (SELECT COUNT(*) FROM VERIFICACION WHERE edoVerificacion = "TERMI" AND num IN (SELECT verificacion FROM LOTE_VERIFICACION WHERE lote = lot));

    SET porcen = (cantTerminadas/totalVerificaciones)*100;

    UPDATE LOTE SET porcentaje = porcen WHERE num = lot; 
END $$

DROP TRIGGER actualizarPorcentajeLote