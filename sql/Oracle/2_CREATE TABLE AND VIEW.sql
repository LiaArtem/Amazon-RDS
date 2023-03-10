
  CREATE SEQUENCE  "TEST_USER"."KURS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

  CREATE TABLE "TEST_USER"."KURS"
   ("ID" NUMBER(10,0),
	"KURS_DATE" DATE NOT NULL ENABLE,
	"CURRENCY_CODE" VARCHAR2(3 BYTE) NOT NULL ENABLE,
	"RATE" NUMBER(38,6),
	 CONSTRAINT "PK_KURS" PRIMARY KEY ("ID")
   );

  COMMENT ON COLUMN "TEST_USER"."KURS"."ID" IS 'ID';
  COMMENT ON COLUMN "TEST_USER"."KURS"."KURS_DATE" IS 'Дата курса';
  COMMENT ON COLUMN "TEST_USER"."KURS"."CURRENCY_CODE" IS 'Код валюты';
  COMMENT ON COLUMN "TEST_USER"."KURS"."RATE" IS 'Курс';
  COMMENT ON TABLE "TEST_USER"."KURS"  IS 'Курсы валют';

  CREATE UNIQUE INDEX "TEST_USER"."UK_KURS" ON "TEST_USER"."KURS" ("KURS_DATE", "CURRENCY_CODE");


CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "TEST_USER"."VIEW_KURS_REPORT" ("KURS_DATE", "CURRENCY_CODE", "RATE", "AVG_RATE")
AS
  with curs_avg_year(part_date_year, currency_code, avg_rate)
  as (
     select to_char(k.kurs_date, 'YYYY') as part_date_year,
            k.currency_code,
            avg(k.rate) as avg_rate
       from kurs k
      group by to_char(k.kurs_date, 'YYYY'), k.currency_code
    ),
curs_avg(part_day_month, currency_code, avg_rate)
as (
     select f.part_day_month,
            f.currency_code,
            avg(f.avg_rate) as avg_rate
       from ( select to_char(k.kurs_date, 'MM-DD') as part_day_month,
                k.currency_code,
                k.rate / y.avg_rate * 100 as avg_rate
               from kurs k,
                    curs_avg_year y
               where y.part_date_year = to_char(k.kurs_date, 'YYYY') and
                     y.currency_code = k.currency_code
            ) f
      group by f.part_day_month, f.currency_code
    )
 select k.kurs_date,
        k.currency_code,
        k.rate,
        a.avg_rate
   from kurs k,
        curs_avg a
   where a.part_day_month = to_char(k.kurs_date, 'MM-DD') and
         a.currency_code = k.currency_code and
         to_char(k.kurs_date, 'YYYY') in ( select to_char(max(kk.kurs_date), 'YYYY') from kurs kk)
  order by k.kurs_date;

