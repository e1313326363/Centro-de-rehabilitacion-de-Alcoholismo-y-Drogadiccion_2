/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     16/11/2021 1:29:48                           */
/*==============================================================*/


/*==============================================================*/
/* Table: INGRESO                                               */
/*==============================================================*/
create table INGRESO (
   ID_INGRESO           INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   FECHA_INGRESO        DATE                 not null,
   FECHA_SALIDA         DATE                 not null,
   FECHA_CEREMONIADESALIDA DATE                 not null,
   CANTIDAD_INGRESOS    INT4                 not null,
   CANTIDADSALIDAS_CORRECTAS INT4                 not null,
   CANTIDADSALIDAS_INCORRECTAS INT4                 not null,
   INCIDENTE_VIOLENTO   INT4                 not null,
   constraint PK_INGRESO primary key (ID_INGRESO)
);

/*==============================================================*/
/* Index: INGRESO_PK                                            */
/*==============================================================*/
create unique index INGRESO_PK on INGRESO (
ID_INGRESO
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on INGRESO (
ID_PACIENTE
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   ID_PACIENTE          INT4                 not null,
   ID_PROFESIONAL       INT4                 not null,
   NOMBRE_PACIENTE      VARCHAR(30)          not null,
   APELLIDO_PACIENTE    VARCHAR(30)          not null,
   CI_PACIENTE          VARCHAR(30)          not null,
   SEXO_PACIENTE        VARCHAR(20)          not null,
   RAZA_PACIENTE        VARCHAR(20)          not null,
   FECHA_NACIMIENTO     DATE                 not null,
   constraint PK_PACIENTE primary key (ID_PACIENTE)
);

/*==============================================================*/
/* Index: PACIENTE_PK                                           */
/*==============================================================*/
create unique index PACIENTE_PK on PACIENTE (
ID_PACIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on PACIENTE (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_PLAN              INT4                 not null,
   ID_INGRESO           INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   FECHA_PAGO           DATE                 not null,
   METODO_PAGO          VARCHAR(50)          not null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
ID_PAGO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on PAGO (
ID_PLAN
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on PAGO (
ID_INGRESO
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on PAGO (
ID_SERVICIO
);

/*==============================================================*/
/* Table: PATOLOGIA                                             */
/*==============================================================*/
create table PATOLOGIA (
   ID_PATOLOGIA         INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   TIPO_PATOLOGIA       VARCHAR(30)          not null,
   FECHA_ESTIMADAPATOLOGIA DATE                 not null,
   OBSERVACIONES_PATOLOGIA VARCHAR(50)          not null,
   CANTIDAD_PATOLOGIA   INT4                 not null,
   constraint PK_PATOLOGIA primary key (ID_PATOLOGIA)
);

/*==============================================================*/
/* Index: PATOLOGIA_PK                                          */
/*==============================================================*/
create unique index PATOLOGIA_PK on PATOLOGIA (
ID_PATOLOGIA
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on PATOLOGIA (
ID_PACIENTE
);

/*==============================================================*/
/* Table: PLAN                                                  */
/*==============================================================*/
create table PLAN (
   ID_PLAN              INT4                 not null,
   TIPO_PLAN            VARCHAR(30)          not null,
   PRECIO_PLAN          MONEY                not null,
   DURACION_PLAN        VARCHAR(30)          not null,
   constraint PK_PLAN primary key (ID_PLAN)
);

/*==============================================================*/
/* Index: PLAN_PK                                               */
/*==============================================================*/
create unique index PLAN_PK on PLAN (
ID_PLAN
);

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL (
   ID_PROFESIONAL       INT4                 not null,
   NOMBRE_PROFESIONAL   VARCHAR(30)          not null,
   APELLIDO_PROFESIONAL VARCHAR(30)          not null,
   CI_PROFESIONAL       VARCHAR(30)          not null,
   TIPO_PROFESIONAL     VARCHAR(30)          not null,
   ESPECIALIDAD_PROFESIONAL VARCHAR(30)          not null,
   constraint PK_PROFESIONAL primary key (ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: PROFESIONAL_PK                                        */
/*==============================================================*/
create unique index PROFESIONAL_PK on PROFESIONAL (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: RELATIONSHIP_10                                       */
/*==============================================================*/
create table RELATIONSHIP_10 (
   ID_SERVICIO          INT4                 not null,
   ID_PROFESIONAL       INT4                 not null,
   constraint PK_RELATIONSHIP_10 primary key (ID_SERVICIO, ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_PK                                    */
/*==============================================================*/
create unique index RELATIONSHIP_10_PK on RELATIONSHIP_10 (
ID_SERVICIO,
ID_PROFESIONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on RELATIONSHIP_10 (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on RELATIONSHIP_10 (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: RELATIONSHIP_7                                        */
/*==============================================================*/
create table RELATIONSHIP_7 (
   ID_TRATAMIENTO       INT4                 not null,
   ID_PROFESIONAL       INT4                 not null,
   constraint PK_RELATIONSHIP_7 primary key (ID_TRATAMIENTO, ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_7_PK on RELATIONSHIP_7 (
ID_TRATAMIENTO,
ID_PROFESIONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on RELATIONSHIP_7 (
ID_TRATAMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on RELATIONSHIP_7 (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   TIPO_SERVICIO        VARCHAR(30)          not null,
   CANTIDAD_SERVICIO    INT4                 not null,
   OBSERVACIONES_SERVICIO VARCHAR(50)          not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on SERVICIO (
ID_PACIENTE
);

/*==============================================================*/
/* Table: TRATAMIENTO                                           */
/*==============================================================*/
create table TRATAMIENTO (
   ID_TRATAMIENTO       INT4                 not null,
   ID_PACIENTE          INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   TIPO_TRATAMIENTO     VARCHAR(30)          not null,
   FECHA_TRATAMIENTO    DATE                 not null,
   NOMBRE_TRATAMIENTO   VARCHAR(30)          not null,
   CANTIDAD_TRATAMIENTOS INT4                 not null,
   constraint PK_TRATAMIENTO primary key (ID_TRATAMIENTO)
);

/*==============================================================*/
/* Index: TRATAMIENTO_PK                                        */
/*==============================================================*/
create unique index TRATAMIENTO_PK on TRATAMIENTO (
ID_TRATAMIENTO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on TRATAMIENTO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on TRATAMIENTO (
ID_PACIENTE
);

alter table INGRESO
   add constraint FK_INGRESO_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table PACIENTE
   add constraint FK_PACIENTE_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_INGRESO foreign key (ID_INGRESO)
      references INGRESO (ID_INGRESO)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_PLAN foreign key (ID_PLAN)
      references PLAN (ID_PLAN)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table PATOLOGIA
   add constraint FK_PATOLOGI_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_TRATAMIE foreign key (ID_TRATAMIENTO)
      references TRATAMIENTO (ID_TRATAMIENTO)
      on delete restrict on update restrict;

alter table RELATIONSHIP_7
   add constraint FK_RELATION_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table TRATAMIENTO
   add constraint FK_TRATAMIE_RELATIONS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table TRATAMIENTO
   add constraint FK_TRATAMIE_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;




--Tabla Profesional
insert into profesional (id_profesional,nombre_profesional,apellido_profesional,ci_profesional,tipo_profesional,especialidad_profesional)
values(1,'Arturo','Zambrano','1303988313','Interno','psiquiatria clinica');
insert into profesional (id_profesional,nombre_profesional,apellido_profesional,ci_profesional,tipo_profesional,especialidad_profesional)
values(2,'Josue','Moreira','1305506469','Interno','psiquiatria clinica');
insert into profesional (id_profesional,nombre_profesional,apellido_profesional,ci_profesional,tipo_profesional,especialidad_profesional)
values(3,'Juan','Cornejo','1315546895','Interno','psiquiatria clinica');
insert into profesional (id_profesional,nombre_profesional,apellido_profesional,ci_profesional,tipo_profesional,especialidad_profesional)
values(4,'Manuel','Muñoz','1305547895','Externo','psiquiatria clinica');
insert into profesional (id_profesional,nombre_profesional,apellido_profesional,ci_profesional,tipo_profesional,especialidad_profesional)
values(5,'Miguel','Muñoz','1305548756','Externo','psiquiatria clinica');
--Tabla Paciente
insert into paciente (id_paciente,id_profesional, nombre_paciente, apellido_paciente, ci_paciente, sexo_paciente, raza_paciente, fecha_nacimiento)
values (1,1,'Ian','Velez','1313326363','Maculino','Mestizo','2002-05-26');
insert into paciente(id_paciente,id_profesional, nombre_paciente, apellido_paciente, ci_paciente, sexo_paciente, raza_paciente, fecha_nacimiento)
values (2,2,'Winter','Meza','1325564549','Masculino','Mestizo','2000-08-12');
insert into paciente (id_paciente,id_profesional, nombre_paciente, apellido_paciente, ci_paciente, sexo_paciente, raza_paciente, fecha_nacimiento)
values (3,3,'Enrique','Moreira','1305546584','Masculino','Mestizo','1998-11-17');
insert into paciente (id_paciente,id_profesional, nombre_paciente, apellido_paciente, ci_paciente, sexo_paciente, raza_paciente, fecha_nacimiento)
values (4,4,'Mariana','Solorzano','1303988313','Femenino','Mestizo','1999-10-26');
insert into paciente (id_paciente,id_profesional, nombre_paciente, apellido_paciente, ci_paciente, sexo_paciente, raza_paciente, fecha_nacimiento)
values (5,5,'Yanina','Arteaga','1305489795','Femenino','Mestizo','1999-05-15');
--Tabla Ingreso
insert into ingreso (id_ingreso,id_paciente,fecha_ingreso,fecha_salida,fecha_ceremoniadesalida,cantidad_ingresos,cantidadsalidas_correctas,cantidadsalidas_incorrectas,incidente_violento)
values (1,1,'2020-10-05','2021-01-01','2021-01-15',1,1,0,0);
insert into ingreso (id_ingreso,id_paciente,fecha_ingreso,fecha_salida,fecha_ceremoniadesalida,cantidad_ingresos,cantidadsalidas_correctas,cantidadsalidas_incorrectas,incidente_violento)
values (2,2,'2020-05-10','2021-05-04','2021-05-15',2,1,1,1);
insert into ingreso (id_ingreso,id_paciente,fecha_ingreso,fecha_salida,fecha_ceremoniadesalida,cantidad_ingresos,cantidadsalidas_correctas,cantidadsalidas_incorrectas,incidente_violento)
values (3,3,'2020-11-19','2021-10-09','2021-10-15',2,1,1,0);
insert into ingreso (id_ingreso,id_paciente,fecha_ingreso,fecha_salida,fecha_ceremoniadesalida,cantidad_ingresos,cantidadsalidas_correctas,cantidadsalidas_incorrectas,incidente_violento)
values (4,4,'2020-11-19','2021-10-09','2021-10-15',1,1,0,1);
insert into ingreso (id_ingreso,id_paciente,fecha_ingreso,fecha_salida,fecha_ceremoniadesalida,cantidad_ingresos,cantidadsalidas_correctas,cantidadsalidas_incorrectas,incidente_violento)
values (5,5,'2020-10-05','2021-01-01','2021-01-15',2,1,1,0);
--Tabla Servicio
insert into servicio (id_servicio,id_paciente,tipo_servicio,cantidad_servicio,observaciones_servicio) 
values (1,1,'Interno',5,'Desintoxicacion');
insert into servicio (id_servicio,id_paciente,tipo_servicio,cantidad_servicio,observaciones_servicio) 
values (2,2,'Interno',2,'Ayuda Emocional');
insert into servicio (id_servicio,id_paciente,tipo_servicio,cantidad_servicio,observaciones_servicio) 
values (3,3,'Interno',3,'Desintoxicacion');
insert into servicio (id_servicio,id_paciente,tipo_servicio,cantidad_servicio,observaciones_servicio) 
values (4,4,'Externo',1,'Llamada');
insert into servicio (id_servicio,id_paciente,tipo_servicio,cantidad_servicio,observaciones_servicio) 
values (5,5,'Externo',3,'Llamada');
--Tabla Plan
insert into plan (id_plan,tipo_plan,precio_plan,duracion_plan)
values (1,'Drogadicción',200,'6 meses');
insert into plan (id_plan,tipo_plan,precio_plan,duracion_plan)
values (2,'Drogadicción',400,'1 año');
insert into plan (id_plan,tipo_plan,precio_plan,duracion_plan)
values (3,'Drogadicción',400,'1 año');
insert into plan (id_plan,tipo_plan,precio_plan,duracion_plan)
values (4,'Alcoholismo',400,'1 año');
insert into plan (id_plan,tipo_plan,precio_plan,duracion_plan)
values (5,'Alcoholismo',400,'1 año');
--Tabla Pago
insert into pago (id_pago,id_plan,id_ingreso,id_servicio,fecha_pago,metodo_pago)
values (1,1,1,1,'2020-10-05','Efectivo');
insert into pago (id_pago,id_plan,id_ingreso,id_servicio,fecha_pago,metodo_pago)
values (2,2,2,2,'2020-05-10','Efectivo');
insert into pago (id_pago,id_plan,id_ingreso,id_servicio,fecha_pago,metodo_pago)
values (3,3,3,3,'2020-11-19','Efectivo');
insert into pago (id_pago,id_plan,id_ingreso,id_servicio,fecha_pago,metodo_pago)
values (4,4,4,4,'2020-11-19','Efectivo');
insert into pago (id_pago,id_plan,id_ingreso,id_servicio,fecha_pago,metodo_pago)
values (5,5,5,5,'2020-10-05','Efectivo');
--Tabla Patologia
insert into patologia (id_patologia,id_paciente,tipo_patologia,fecha_estimadapatologia,observaciones_patologia,cantidad_patologia)
values (1,1,'Enfermedades cardíacas','2010-05-10','Problemas en valvula pulmonar',1);
insert into patologia (id_patologia,id_paciente,tipo_patologia,fecha_estimadapatologia,observaciones_patologia,cantidad_patologia)
values (2,2,'transmisión sexual','2018-10-10','VIH',1);
insert into patologia (id_patologia,id_paciente,tipo_patologia,fecha_estimadapatologia,observaciones_patologia,cantidad_patologia)
values (3,3,'Enfermedades cardíacas','2012-07-11','Problemas en valvula tricúspide',1);
insert into patologia (id_patologia,id_paciente,tipo_patologia,fecha_estimadapatologia,observaciones_patologia,cantidad_patologia)
values (4,4,'Enfermedades cardíacas','2015-08-25','Problemas en valvula tricúspide',1);
insert into patologia (id_patologia,id_paciente,tipo_patologia,fecha_estimadapatologia,observaciones_patologia,cantidad_patologia)
values (5,5,'transmisión sexual','2019-01-01','Sida',1);
--Tabla Tratamiento
insert into tratamiento (id_tratamiento,id_paciente,id_servicio,tipo_tratamiento,fecha_tratamiento,nombre_tratamiento,cantidad_tratamientos)
values (1,1,1,'Drogadicción','2020-10-05','Desintoxicación',1);
insert into tratamiento (id_tratamiento,id_paciente,id_servicio,tipo_tratamiento,fecha_tratamiento,nombre_tratamiento,cantidad_tratamientos)
values (2,2,2,'Drogadicción','2020-05-10','Terapia de Apoyo',2);
insert into tratamiento (id_tratamiento,id_paciente,id_servicio,tipo_tratamiento,fecha_tratamiento,nombre_tratamiento,cantidad_tratamientos)
values (3,3,3,'Drogadicción','2020-11-19','Terapia de Apoyo',2);
insert into tratamiento (id_tratamiento,id_paciente,id_servicio,tipo_tratamiento,fecha_tratamiento,nombre_tratamiento,cantidad_tratamientos)
values (4,4,4,'Alcoholismo','2020-11-19','Terapia Espiritual',1);
insert into tratamiento (id_tratamiento,id_paciente,id_servicio,tipo_tratamiento,fecha_tratamiento,nombre_tratamiento,cantidad_tratamientos)
values (5,5,5,'Alcoholismo','2020-10-05','Terapia Espiritual',2);
--Tabla Relacion 10
insert into relationship_10 (id_profesional,id_servicio)
values (1,1);
insert into relationship_10 (id_profesional,id_servicio)
values (2,2);
insert into relationship_10 (id_profesional,id_servicio)
values (3,3);
insert into relationship_10 (id_profesional,id_servicio)
values (4,4);
insert into relationship_10 (id_profesional,id_servicio)
values (5,5);
--Relacion 7
insert into relationship_7 (id_profesional,id_tratamiento)
values (1,1);
insert into relationship_7 (id_profesional,id_tratamiento)
values (2,2);
insert into relationship_7 (id_profesional,id_tratamiento)
values (3,3);
insert into relationship_7 (id_profesional,id_tratamiento)
values (4,4);
insert into relationship_7 (id_profesional,id_tratamiento)
values (5,5);


--Consultas
--Consultar histórico de ingresos que ha tenido cada paciente
select nombre_paciente as Nombre,
apellido_paciente as Apellido,
cantidad_ingresos as CantidadIngreso,
cantidad_servicio as CantidadServicios
from servicio
inner join paciente on servicio.id_paciente=paciente.id_paciente
inner join ingreso on paciente.id_paciente = ingreso.id_paciente

--Consultar el histórico de atenciones por personal que existe en la institución.
select nombre_profesional as NombreDoctor,
cantidad_tratamientos as CantidadTratamientos,
nombre_paciente as NombrePaciente
from tratamiento
inner join paciente on tratamiento.id_paciente=paciente.id_paciente
inner join profesional on paciente.id_profesional=profesional.id_profesional
--Por año el número de ingresos y salidas correctas y escapes que se dan.
select
extract(year from fecha_ingreso) as año,
sum (cantidad_ingresos) as total_ingresos,
sum (cantidadsalidas_correctas) as total_salidas_correctas,
sum (cantidadsalidas_incorrectas) as total_salidas_incorrectas
from ingreso
join paciente on ingreso.id_paciente=paciente.id_paciente
where extract(year from fecha_ingreso) >= '2020' and extract(year from fecha_ingreso) <= '2021'
group by extract(year from fecha_ingreso);

--Cuarta Consulta
select
cast(patologia.tipo_patologia as varchar(50)) as patologia,
count(patologia.tipo_patologia) as cantidad
from paciente
inner join patologia on paciente.id_paciente = patologia.id_paciente
group by patologia;