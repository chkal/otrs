-- ----------------------------------------------------------
--  driver: ingres, generated: 2012-10-23 10:26:24
-- ----------------------------------------------------------
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN group_read RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN group_write RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN other_read RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN other_write RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN ticket_answered RESTRICT;\g
-- ----------------------------------------------------------
--  alter table ticket
-- ----------------------------------------------------------
ALTER TABLE ticket DROP COLUMN group_id RESTRICT;\g
CREATE SEQUENCE pm_process_313;\g
CREATE TABLE pm_process (
    id INTEGER NOT NULL DEFAULT pm_process_313.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    state_entity_id VARCHAR(50) NOT NULL,
    layout LONG BYTE NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_process TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_process ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE pm_activity_961;\g
CREATE TABLE pm_activity (
    id INTEGER NOT NULL DEFAULT pm_activity_961.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_activity TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_activity ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE pm_activity_dialog_837;\g
CREATE TABLE pm_activity_dialog (
    id INTEGER NOT NULL DEFAULT pm_activity_dialog_837.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_activity_dialog TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_activity_dialog ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE pm_transition_961;\g
CREATE TABLE pm_transition (
    id INTEGER NOT NULL DEFAULT pm_transition_961.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_transition TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_transition ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE SEQUENCE pm_transition_action_927;\g
CREATE TABLE pm_transition_action (
    id INTEGER NOT NULL DEFAULT pm_transition_action_927.NEXTVAL,
    entity_id VARCHAR(50) NOT NULL,
    name VARCHAR(200) NOT NULL,
    config LONG BYTE NOT NULL,
    create_time TIMESTAMP NOT NULL,
    create_by INTEGER NOT NULL,
    change_time TIMESTAMP NOT NULL,
    change_by INTEGER NOT NULL,
    UNIQUE (entity_id)
);\g
MODIFY pm_transition_action TO btree unique ON id WITH unique_scope = statement;\g
ALTER TABLE pm_transition_action ADD PRIMARY KEY ( id ) WITH index = base table structure;\g
CREATE TABLE pm_entity (
    entity_type VARCHAR(50) NOT NULL,
    entity_counter INTEGER NOT NULL
);\g
MODIFY pm_entity TO btree;\g
CREATE TABLE pm_entity_sync (
    entity_type VARCHAR(30) NOT NULL,
    entity_id VARCHAR(50) NOT NULL,
    sync_state VARCHAR(30) NOT NULL,
    create_time TIMESTAMP NOT NULL,
    change_time TIMESTAMP NOT NULL,
    UNIQUE (entity_type, entity_id)
);\g
MODIFY pm_entity_sync TO btree;\g
-- ----------------------------------------------------------
--  alter table dynamic_field
-- ----------------------------------------------------------
ALTER TABLE dynamic_field ADD COLUMN internal_field SMALLINT NOT NULL WITH DEFAULT;\g
-- ----------------------------------------------------------
--  insert into table dynamic_field
-- ----------------------------------------------------------
INSERT INTO dynamic_field (internal_field, name, label, field_order, field_type, object_type, config, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    (1, 'ProcessManagementProcessID', 'ProcessManagementProcessID', 1, 'Text', 'Ticket', '---
-- ----------------------------------------------------------
--  insert into table dynamic_field
-- ----------------------------------------------------------
INSERT INTO dynamic_field (internal_field, name, label, field_order, field_type, object_type, config, valid_id, create_by, create_time, change_by, change_time)
    VALUES
    (1, 'ProcessManagementActivityID', 'ProcessManagementActivityID', 1, 'Text', 'Ticket', '---
DROP TABLE sessions;\g
CREATE TABLE sessions (
    id VARCHAR(100) NOT NULL,
    data_key VARCHAR(100) NOT NULL,
    data_value VARCHAR(10000),
    serialized SMALLINT NOT NULL,
    UNIQUE (id, data_key)
);\g
MODIFY sessions TO btree;\g
CREATE INDEX sessions_id ON sessions (id);\g
ALTER TABLE pm_process ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_process ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE pm_activity ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_activity ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE pm_activity_dialog ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_activity_dialog ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE pm_transition ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_transition ADD FOREIGN KEY (change_by) REFERENCES users(id);\g
ALTER TABLE pm_transition_action ADD FOREIGN KEY (create_by) REFERENCES users(id);\g
ALTER TABLE pm_transition_action ADD FOREIGN KEY (change_by) REFERENCES users(id);\g