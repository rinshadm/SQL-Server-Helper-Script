ALTER INDEX idx_NonClusteredIndexName ON schemaname.tableName REBUILD PARTITION = 1	-- partition ID
WITH (ONLINE = ON (
    WAIT_AT_LOW_PRIORITY ( MAX_DURATION = 1 MINUTES, ABORT_AFTER_WAIT = SELF )) )