DROP TABLE IF EXISTS public.heal_hospital;
DROP TRIGGER IF EXISTS heal_hospital_mtime ON public.heal_hospital;
DROP SEQUENCE IF EXISTS public.heal_hospital_ogc_fid_seq;

    -- create sequnce
    CREATE SEQUENCE IF NOT EXISTS public.heal_hospital_ogc_fid_seq
        INCREMENT 1
        START 1
        MINVALUE 1
        MAXVALUE 9223372036854775807
        CACHE 1;

    -- grant sequnce
    ALTER SEQUENCE public.heal_hospital_ogc_fid_seq OWNER TO dashboard_owner;
    GRANT ALL ON SEQUENCE public.heal_hospital_ogc_fid_seq TO admin WITH GRANT OPTION;
    GRANT ALL ON SEQUENCE public.heal_hospital_ogc_fid_seq TO dashboard_owner WITH GRANT OPTION;
    GRANT SELECT ON SEQUENCE public.heal_hospital_ogc_fid_seq TO dashboard_reader;
    GRANT ALL ON SEQUENCE public.heal_hospital_ogc_fid_seq TO dashboard_writer;

    -- create table
    CREATE TABLE IF NOT EXISTS public.heal_hospital
    (
                data_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
        name character varying(50) COLLATE pg_catalog."default",
        addr text COLLATE pg_catalog."default",
        lng double precision,
        lat double precision,
        wkb_geometry geometry(Point,4326),
        _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
        _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
            ,
        ogc_fid integer NOT NULL DEFAULT nextval('['heal_hospital', 'heal_hospital_history']_ogc_fid_seq'::regclass),

        CONSTRAINT ['heal_hospital', 'heal_hospital_history']_pkey PRIMARY KEY (ogc_fid)

    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    -- grant table
    ALTER TABLE IF EXISTS public.heal_hospital OWNER to dashboard_owner;
    GRANT ALL ON TABLE public.heal_hospital TO dashboard_owner WITH GRANT OPTION;
    GRANT SELECT ON TABLE public.heal_hospital TO dashboard_reader;
    GRANT ALL ON TABLE public.heal_hospital TO dashboard_writer;

    -- create mtime trigger
    CREATE TRIGGER heal_hospital_mtime
        BEFORE INSERT OR UPDATE
        ON public.heal_hospital
        FOR EACH ROW
        EXECUTE PROCEDURE public.trigger_set_timestamp();

DROP TABLE IF EXISTS public.heal_hospital_history;
DROP TRIGGER IF EXISTS heal_hospital_history_mtime ON public.heal_hospital_history;
DROP SEQUENCE IF EXISTS public.heal_hospital_history_ogc_fid_seq;

    -- create sequnce
    CREATE SEQUENCE IF NOT EXISTS public.heal_hospital_history_ogc_fid_seq
        INCREMENT 1
        START 1
        MINVALUE 1
        MAXVALUE 9223372036854775807
        CACHE 1;

    -- grant sequnce
    ALTER SEQUENCE public.heal_hospital_history_ogc_fid_seq OWNER TO dashboard_owner;
    GRANT ALL ON SEQUENCE public.heal_hospital_history_ogc_fid_seq TO admin WITH GRANT OPTION;
    GRANT ALL ON SEQUENCE public.heal_hospital_history_ogc_fid_seq TO dashboard_owner WITH GRANT OPTION;
    GRANT SELECT ON SEQUENCE public.heal_hospital_history_ogc_fid_seq TO dashboard_reader;
    GRANT ALL ON SEQUENCE public.heal_hospital_history_ogc_fid_seq TO dashboard_writer;

    -- create table
    CREATE TABLE IF NOT EXISTS public.heal_hospital_history
    (
                data_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
        name character varying(50) COLLATE pg_catalog."default",
        addr text COLLATE pg_catalog."default",
        lng double precision,
        lat double precision,
        wkb_geometry geometry(Point,4326),
        _ctime timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
        _mtime timestamp with time zone DEFAULT CURRENT_TIMESTAMP
            ,
        ogc_fid integer NOT NULL DEFAULT nextval('['heal_hospital', 'heal_hospital_history']_ogc_fid_seq'::regclass),

        CONSTRAINT ['heal_hospital', 'heal_hospital_history']_pkey PRIMARY KEY (ogc_fid)

    )
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

    -- grant table
    ALTER TABLE IF EXISTS public.heal_hospital_history OWNER to dashboard_owner;
    GRANT ALL ON TABLE public.heal_hospital_history TO dashboard_owner WITH GRANT OPTION;
    GRANT SELECT ON TABLE public.heal_hospital_history TO dashboard_reader;
    GRANT ALL ON TABLE public.heal_hospital_history TO dashboard_writer;

    -- create mtime trigger
    CREATE TRIGGER heal_hospital_history_mtime
        BEFORE INSERT OR UPDATE
        ON public.heal_hospital_history
        FOR EACH ROW
        EXECUTE PROCEDURE public.trigger_set_timestamp();