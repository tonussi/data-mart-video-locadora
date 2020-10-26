docker run -d -p --network host \
  -e "MB_DB_FILE=/metabase-data/metabase.db" \
  -v ~/metabase-data:/metabase-data \
  --name metabase metabase/metabase
