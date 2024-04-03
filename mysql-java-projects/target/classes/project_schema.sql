DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE	
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)	
);


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Painting Bedroom', 5.0, 7.0, 3, 'Two different shades of gray.');

INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'Dark Gray Paint', 2);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'Light Gray Paint', 4);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'Paint Tray', 2);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'Paint Brush', 4);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'Roller', 6);
INSERT INTO material (project_id, material_name, num_required) VALUES (1, 'Plastic cover', 2);


INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Move furniture out of the room or to the center of the room to work around.', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Clean the walls', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Tape around doors and windows', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Paint one wall dark gray.  Two coats.', 4);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Paint three walls light gray.  Two coats', 5);

INSERT INTO category (category_id, category_name) VALUES (1, 'Indoors');

INSERT INTO project_category (project_id, category_id) VALUES (1, 1);



INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang Door', 5.0, 2.0, 2, 'Hang an inside door.');

INSERT INTO material (project_id, material_name, num_required) VALUES (2, 'Wooden Door', 1);
INSERT INTO material (project_id, material_name, num_required) VALUES (2, 'Hinges', 2);
INSERT INTO material (project_id, material_name, num_required) VALUES (2, 'Screws', 8);



INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Measure opening for door.', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Sand door', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Attach hinges to door', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Hold door in place', 4);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Attach door to frame.', 5);

INSERT INTO category (category_id, category_name) VALUES (2, 'Indoors');

INSERT INTO project_category (project_id, category_id) VALUES (2, 2);
