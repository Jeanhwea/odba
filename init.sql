HOST echo "SET LINESIZE $(stty -a | head -n 1 | cut -d';' -f3 | cut -d' ' -f3)" > .tmp.sql;
@.tmp.sql;
HOST rm .tmp.sql;
