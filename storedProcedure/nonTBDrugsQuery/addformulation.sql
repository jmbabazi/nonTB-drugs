DELIMITER //
CREATE PROCEDURE add_formulation ( name_of_concept VARCHAR(255),
                                   concept_short_name VARCHAR(255)                                
                                   )
BEGIN
  DECLARE data_type_id INT;
  DECLARE class_id INT;
  DECLARE new_concept_id INT;
  DECLARE concept_name_short_id INT;
  DECLARE concept_name_full_id INT;

   SELECT COUNT(DISTINCT concept_id) INTO @concept_count 
     FROM   concept_name 
     WHERE  name = name_of_concept AND 
      concept_name_type='FULLY_SPECIFIED';
   
     IF @concept_count > 0 THEN
       SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Concept Already Exists';
   ELSE
     
     SELECT UUID() INTO @uuid; 
       INSERT INTO concept (datatype_id, class_id, is_set, creator, date_created, changed_by, date_changed, uuid)
     VALUES ( 4, 11, FALSE, 1, NOW(), 1, NOW(), @uuid);
     SELECT MAX(concept_id) INTO new_concept_id FROM concept;

     SELECT UUID() INTO @uuid;
     INSERT INTO concept_name (concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, uuid)
     VALUES (new_concept_id, concept_short_name, 'en', 0, 1, NOW(), 'SHORT', @uuid);
     SELECT MAX(concept_name_id) INTO concept_name_short_id FROM concept_name;

     SELECT UUID() INTO @uuid;
     INSERT INTO concept_name (concept_id, name, locale, locale_preferred, creator, date_created, concept_name_type, uuid)
     VALUES (new_concept_id, name_of_concept, 'en', 1, 1, NOW(), 'FULLY_SPECIFIED', @uuid);
     SELECT MAX(concept_name_id) INTO concept_name_full_id FROM concept_name;

     SELECT UUID() INTO @uuid;
     INSERT INTO concept_set (concept_id, concept_set, sort_weight, creator, date_created, uuid) 
    VALUES ( new_concept_id,57,NULL,1,NOW(),@uuid);
     
   END IF;
END;
