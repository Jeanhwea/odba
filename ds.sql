set linesize 255;
set pagesize 50000;
set feedback off;
set tab off;

ttitle left 'List of User Sequences' skip 1 line;
column seqname  format a32         heading 'Sequence';
column seqstep  format 999999      heading 'Step';
column seqlast  format 99999999999 heading 'Last Number';
column seqcache format 999999      heading 'Cache Size';

select
  t1.sequence_name as seqname,
  t1.increment_by as seqstep,
  t1.last_number as seqlast,
  t1.cache_size as seqcache
  from user_sequences t1
 order by seqname;
