ALTER TABLE c_profile ADD COLUMN info text NOT NULL after caption;
ALTER TABLE c_profile MODIFY form_type enum('text','textlong','textarea','select','checkbox','radio') NOT NULL default 'text';
