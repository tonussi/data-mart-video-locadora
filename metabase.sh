docker run -d -p 3005:3000 \
  -e "MB_DB_FILE=/metabase-data/metabase.db" \
  -v ~/metabase-data:/metabase-data \
  --name metabase metabase/metabase
