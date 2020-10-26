docker run -d -p 3005:3000 \
  -e "MB_DB_TYPE=postgres" \
  -e "MB_DB_DBNAME=datawarehouse_videoteca" \
  -e "MB_DB_PORT=5433" \
  -e "MB_DB_USER=postgres" \
  -e "MB_DB_PASS=postgres" \
  -e "MB_DB_HOST=localhost" \
  -v ~/metabase-data:/metabase-data \
  --name metabase metabase/metabase
