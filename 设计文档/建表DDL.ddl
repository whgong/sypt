alter table DIM.T_DIM_SYPT_ZBB
   drop foreign key FK_ZBB2ZBBS;

alter table SYPT.T_FT_SYPT_FXZS
   drop foreign key F_SYPT_FXZS2PFPC;

alter table SYPT.T_FT_SYPT_FXZS
   drop foreign key F_SYPT_FXZS2ZBB;

alter table SYPT.T_FT_SYPT_ZHZLQK
   drop foreign key F_SYPT_ZHZL2ZBB;

alter table SYPT.T_FT_SYPT_ZHZLQK
   drop foreign key F_SYPT_ZHZLQK2PFPC;

alter table SYPT.T_FT_SYPT_ZTFGQK
   drop foreign key F_SYPT_ZTFG2PFPC;

alter table SYPT.T_FT_SYPT_ZTFGQK
   drop foreign key F_SYPT_ZTFG2ZBB;

alter table SYPT.T_SYPT_PFDMXB
   drop foreign key F_SYPT_PFDMX2PFPC;

alter table SYPT.T_SYPT_PFHX
   drop foreign key F_SYPT_PFHX2PFPC;

alter table SYPT.T_SYPT_PFHX
   drop foreign key F_SYPT_PFHX2ZBB;

alter table SYPT.T_SYPT_PFJG
   drop foreign key F_SYPT_PFJG2PFPC;

alter table SYPT.T_SYPT_PFJG
   drop foreign key F_SYPT_PFJG2ZBB;

alter table SYPT.T_SYPT_PFPC
   drop foreign key F_SYPT_PFPC2PFPH;

alter table SYPT.T_SYPT_YJBJB
   drop foreign key F_SYPT_YJBJ2PFPH;

alter table SYPT.T_SYPT_YJBJB
   drop foreign key F_SYPT_YJBJ2ZBB;

alter table SYPT.T_SYPT_YQZTQK
   drop foreign key F_SYPT_YQZTQK2PFPC;

alter table SYPT.T_SYPT_YQZTQK
   drop foreign key F_SYPT_YQZTQK2ZBB;

drop table DIM.T_DIM_SYPT_PFPH;

drop table DIM.T_DIM_SYPT_ZBB;

drop table SYPT.T_FT_SYPT_FXZS;

drop table SYPT.T_FT_SYPT_ZHZLQK;

drop table SYPT.T_FT_SYPT_ZTFGQK;

drop table SYPT.T_SYPT_PFDMXB;

drop table SYPT.T_SYPT_PFHX;

drop table SYPT.T_SYPT_PFJG;

drop table SYPT.T_SYPT_PFPC;

drop table SYPT.T_SYPT_YJBJB;

drop table SYPT.T_SYPT_YQZTQK;

--drop tablespace TS_IDX_16K;

--drop tablespace TS_REG_16K;

--create tablespace TS_IDX_16K;

--create tablespace TS_REG_16K;


--==============================================================
-- User: DIM
--==============================================================
--==============================================================
-- User: SYPT
--==============================================================
--==============================================================
-- User: YYZY
--==============================================================
--==============================================================
-- Table: T_DIM_SYPT_PFPH
--==============================================================
create table DIM.T_DIM_SYPT_PFPH
(
   PFPHDM               INTEGER                not null,
   PFPHMC               VARCHAR(50),
   PPDM                 INTEGER                not null,
   constraint P_SYPT_PFPH primary key (PFPHDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table DIM.T_DIM_SYPT_PFPH is
'三预平台 配方牌号';

comment on column DIM.T_DIM_SYPT_PFPH.PFPHDM is
'配方牌号编号';

comment on column DIM.T_DIM_SYPT_PFPH.PFPHMC is
'配方牌号名称';

comment on column DIM.T_DIM_SYPT_PFPH.PPDM is
'品牌代码';

--==============================================================
-- Table: T_DIM_SYPT_ZBB
--==============================================================
create table DIM.T_DIM_SYPT_ZBB
(
   ZBDM                 INTEGER                not null,
   SJZBDM               INTEGER                not null,
   ZBMC                 VARCHAR(100),
   ZBFL                 CHARACTER(1)           not null,
   ZYBJ                 CHARACTER(1)           not null
      constraint C_ZYBJ check (ZYBJ in ('0','1')),
   constraint P_SYPT_ZBB primary key (ZBDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table DIM.T_DIM_SYPT_ZBB is
'三预平台指标表';

comment on column DIM.T_DIM_SYPT_ZBB.ZBDM is
'指标编号';

comment on column DIM.T_DIM_SYPT_ZBB.SJZBDM is
'上级指标编号';

comment on column DIM.T_DIM_SYPT_ZBB.ZBMC is
'指标名称';

comment on column DIM.T_DIM_SYPT_ZBB.ZBFL is
'指标分类';

comment on column DIM.T_DIM_SYPT_ZBB.ZYBJ is
'在用标记';

--==============================================================
-- Table: T_FT_SYPT_FXZS
--==============================================================
create table SYPT.T_FT_SYPT_FXZS
(
   PFPCBH               BIGINT                 not null,
   ZBDM                 INTEGER                not null,
   VALUE                DOUBLE,
   constraint P_SYPT_FXZS primary key (PFPCBH, ZBDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_FT_SYPT_FXZS is
'三预平台 风险指数';

comment on column SYPT.T_FT_SYPT_FXZS.PFPCBH is
'配方批次编号';

comment on column SYPT.T_FT_SYPT_FXZS.ZBDM is
'指标编号';

comment on column SYPT.T_FT_SYPT_FXZS.VALUE is
'风险指数';

--==============================================================
-- Table: T_FT_SYPT_ZHZLQK
--==============================================================
create table SYPT.T_FT_SYPT_ZHZLQK
(
   PFPCBH               BIGINT                 not null,
   ZBDM                 INTEGER                not null,
   VAL1                 DOUBLE,
   VAL2                 DOUBLE,
   VAL3                 DOUBLE,
   VAL4                 DOUBLE,
   constraint P_SYPT_ZHZLQK primary key (PFPCBH, ZBDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_FT_SYPT_ZHZLQK is
'综合质量情况';

comment on column SYPT.T_FT_SYPT_ZHZLQK.PFPCBH is
'配方批次号';

comment on column SYPT.T_FT_SYPT_ZHZLQK.ZBDM is
'指标编号';

comment on column SYPT.T_FT_SYPT_ZHZLQK.VAL1 is
'指标值1';

comment on column SYPT.T_FT_SYPT_ZHZLQK.VAL2 is
'指标值2';

comment on column SYPT.T_FT_SYPT_ZHZLQK.VAL3 is
'指标值3';

--==============================================================
-- Table: T_FT_SYPT_ZTFGQK
--==============================================================
create table SYPT.T_FT_SYPT_ZTFGQK
(
   PFPCBH               BIGINT                 not null,
   ZBDM                 INTEGER                not null,
   VAL1                 DOUBLE,
   VAL2                 DOUBLE,
   VAL3                 DOUBLE,
   constraint P_SYPT_ZTFGQK primary key (PFPCBH, ZBDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_FT_SYPT_ZTFGQK is
'三预平台 整体风格情况';

comment on column SYPT.T_FT_SYPT_ZTFGQK.PFPCBH is
'配方批次号';

comment on column SYPT.T_FT_SYPT_ZTFGQK.ZBDM is
'指标编号';

comment on column SYPT.T_FT_SYPT_ZTFGQK.VAL1 is
'指标值1';

comment on column SYPT.T_FT_SYPT_ZTFGQK.VAL2 is
'指标值2';

comment on column SYPT.T_FT_SYPT_ZTFGQK.VAL3 is
'指标值3';

--==============================================================
-- Table: T_SYPT_PFDMXB
--==============================================================
create table SYPT.T_SYPT_PFDMXB
(
   PFPCBH               BIGINT                 not null,
   YYDM                 VARCHAR(20)            not null,
   YYPC                 CHARACTER(1)           not null,
   DPXS                 INTEGER                not null,
   JSDM                 INTEGER                not null,
   constraint P_SYPT_PFDZB primary key (PFPCBH, YYDM, YYPC, JSDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_SYPT_PFDMXB is
'三预平台 配方单明细表';

comment on column SYPT.T_SYPT_PFDMXB.PFPCBH is
'配方批次编号';

comment on column SYPT.T_SYPT_PFDMXB.YYDM is
'烟叶代码';

comment on column SYPT.T_SYPT_PFDMXB.YYPC is
'烟叶批次';

comment on column SYPT.T_SYPT_PFDMXB.DPXS is
'单批箱数';

comment on column SYPT.T_SYPT_PFDMXB.JSDM is
'角色代码';

--==============================================================
-- Table: T_SYPT_PFHX
--==============================================================
create table SYPT.T_SYPT_PFHX
(
   PFPCBH               BIGINT                 not null,
   ZBDM                 INTEGER                not null,
   MAX_VAL              DOUBLE,
   MIN_VAL              DOUBLE,
   SD_VAL               DOUBLE,
   CV_VAL               DOUBLE,
   AVG_VAL              DOUBLE,
   MID_VAL              DOUBLE,
   constraint P_SYPT_PFHX primary key (PFPCBH, ZBDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_SYPT_PFHX is
'三预平台 配方化学';

comment on column SYPT.T_SYPT_PFHX.PFPCBH is
'配方批次号';

comment on column SYPT.T_SYPT_PFHX.ZBDM is
'指标编号';

comment on column SYPT.T_SYPT_PFHX.MAX_VAL is
'最大值';

comment on column SYPT.T_SYPT_PFHX.MIN_VAL is
'最小值';

comment on column SYPT.T_SYPT_PFHX.SD_VAL is
'SD值';

comment on column SYPT.T_SYPT_PFHX.CV_VAL is
'CV值';

comment on column SYPT.T_SYPT_PFHX.AVG_VAL is
'平均值';

comment on column SYPT.T_SYPT_PFHX.MID_VAL is
'中位数';

--==============================================================
-- Table: T_SYPT_PFJG
--==============================================================
create table SYPT.T_SYPT_PFJG
(
   PFPCBH               BIGINT                 not null,
   ZBDM                 INTEGER                not null,
   VALUE                DOUBLE,
   constraint P_SYPT_PFJG primary key (PFPCBH, ZBDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_SYPT_PFJG is
'三预平台 配方结构';

comment on column SYPT.T_SYPT_PFJG.PFPCBH is
'配方批次号';

comment on column SYPT.T_SYPT_PFJG.ZBDM is
'指标编号';

comment on column SYPT.T_SYPT_PFJG.VALUE is
'指标值';

--==============================================================
-- Table: T_SYPT_PFPC
--==============================================================
create table SYPT.T_SYPT_PFPC
(
   PFPCBH               BIGINT                 not null,
   PFLX                 CHARACTER(10)          not null,
   PFPHDM               INTEGER                not null,
   PFNF                 SMALLINT               not null,
   PFYF                 SMALLINT               not null,
   XH                   SMALLINT               not null,
   KSPC                 INTEGER,
   JSPC                 INTEGER,
   PCSL                 DECIMAL(18,6),
   KSRQ                 DATE                   not null,
   JSRQ                 DATE                   not null,
   constraint P_SYPT_PFPC primary key (PFPCBH)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_SYPT_PFPC is
'三预平台 配方批次表';

comment on column SYPT.T_SYPT_PFPC.PFPCBH is
'配方批次编号';

comment on column SYPT.T_SYPT_PFPC.PFLX is
'配方类型';

comment on column SYPT.T_SYPT_PFPC.PFPHDM is
'配方牌号编号';

comment on column SYPT.T_SYPT_PFPC.PFNF is
'配方年份';

comment on column SYPT.T_SYPT_PFPC.XH is
'序号';

comment on column SYPT.T_SYPT_PFPC.KSPC is
'开始批次';

comment on column SYPT.T_SYPT_PFPC.JSPC is
'结束批次';

comment on column SYPT.T_SYPT_PFPC.PCSL is
'制丝批次数量';

comment on column SYPT.T_SYPT_PFPC.KSRQ is
'生效日期';

comment on column SYPT.T_SYPT_PFPC.JSRQ is
'结束日期';

--==============================================================
-- Table: T_SYPT_YJBJB
--==============================================================
create table SYPT.T_SYPT_YJBJB
(
   PFPHDM               INTEGER                not null,
   ZBDM                 INTEGER                not null,
   MID_VAL              DOUBLE,
   UP_VAL1              DOUBLE,
   LOW_VAL1             DOUBLE,
   UP_VAL2              DOUBLE,
   LOW_VAL2             DOUBLE,
   KSRQ                 DATE                   not null,
   JSRQ                 DATE                   not null,
   constraint P_SYPT_YJBJB primary key (PFPHDM, ZBDM, KSRQ, JSRQ)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_SYPT_YJBJB is
'三预平台 预警边界表';

comment on column SYPT.T_SYPT_YJBJB.PFPHDM is
'配方牌号编号';

comment on column SYPT.T_SYPT_YJBJB.ZBDM is
'指标编号';

comment on column SYPT.T_SYPT_YJBJB.MID_VAL is
'中心值';

comment on column SYPT.T_SYPT_YJBJB.UP_VAL1 is
'正常上限';

comment on column SYPT.T_SYPT_YJBJB.LOW_VAL1 is
'正常下限';

comment on column SYPT.T_SYPT_YJBJB.UP_VAL2 is
'风险上限';

comment on column SYPT.T_SYPT_YJBJB.LOW_VAL2 is
'风险下限';

comment on column SYPT.T_SYPT_YJBJB.KSRQ is
'生效日期';

comment on column SYPT.T_SYPT_YJBJB.JSRQ is
'结束日期';

--==============================================================
-- Table: T_SYPT_YQZTQK
--==============================================================
create table SYPT.T_SYPT_YQZTQK
(
   PFPCBH               BIGINT                 not null,
   ZBDM                 INTEGER                not null,
   VALUE                DOUBLE,
   constraint P_SYPT_YQZTQK primary key (PFPCBH, ZBDM)
)
in TS_REG_16K  index in TS_IDX_16K;

comment on table SYPT.T_SYPT_YQZTQK is
'三预平台 烟气总体情况';

comment on column SYPT.T_SYPT_YQZTQK.PFPCBH is
'配方批次号';

comment on column SYPT.T_SYPT_YQZTQK.ZBDM is
'指标编号';

comment on column SYPT.T_SYPT_YQZTQK.VALUE is
'指标值';

alter table DIM.T_DIM_SYPT_ZBB
   add constraint FK_ZBB2ZBBS foreign key (SJZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

alter table SYPT.T_FT_SYPT_FXZS
   add constraint F_SYPT_FXZS2PFPC foreign key (PFPCBH)
      references SYPT.T_SYPT_PFPC (PFPCBH)
      on delete restrict on update restrict;

alter table SYPT.T_FT_SYPT_FXZS
   add constraint F_SYPT_FXZS2ZBB foreign key (ZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

alter table SYPT.T_FT_SYPT_ZHZLQK
   add constraint F_SYPT_ZHZL2ZBB foreign key (ZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

alter table SYPT.T_FT_SYPT_ZHZLQK
   add constraint F_SYPT_ZHZLQK2PFPC foreign key (PFPCBH)
      references SYPT.T_SYPT_PFPC (PFPCBH)
      on delete restrict on update restrict;

alter table SYPT.T_FT_SYPT_ZTFGQK
   add constraint F_SYPT_ZTFG2PFPC foreign key (PFPCBH)
      references SYPT.T_SYPT_PFPC (PFPCBH)
      on delete restrict on update restrict;

alter table SYPT.T_FT_SYPT_ZTFGQK
   add constraint F_SYPT_ZTFG2ZBB foreign key (ZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_PFDMXB
   add constraint F_SYPT_PFDMX2PFPC foreign key (PFPCBH)
      references SYPT.T_SYPT_PFPC (PFPCBH)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_PFHX
   add constraint F_SYPT_PFHX2PFPC foreign key (PFPCBH)
      references SYPT.T_SYPT_PFPC (PFPCBH)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_PFHX
   add constraint F_SYPT_PFHX2ZBB foreign key (ZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_PFJG
   add constraint F_SYPT_PFJG2PFPC foreign key (PFPCBH)
      references SYPT.T_SYPT_PFPC (PFPCBH)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_PFJG
   add constraint F_SYPT_PFJG2ZBB foreign key (ZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_PFPC
   add constraint F_SYPT_PFPC2PFPH foreign key (PFPHDM)
      references DIM.T_DIM_SYPT_PFPH (PFPHDM)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_YJBJB
   add constraint F_SYPT_YJBJ2PFPH foreign key (PFPHDM)
      references DIM.T_DIM_SYPT_PFPH (PFPHDM)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_YJBJB
   add constraint F_SYPT_YJBJ2ZBB foreign key (ZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_YQZTQK
   add constraint F_SYPT_YQZTQK2PFPC foreign key (PFPCBH)
      references SYPT.T_SYPT_PFPC (PFPCBH)
      on delete restrict on update restrict;

alter table SYPT.T_SYPT_YQZTQK
   add constraint F_SYPT_YQZTQK2ZBB foreign key (ZBDM)
      references DIM.T_DIM_SYPT_ZBB (ZBDM)
      on delete restrict on update restrict;

--runstats
RUNSTATS ON TABLE "DIM"."T_DIM_SYPT_PFPH"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "DIM"."T_DIM_SYPT_ZBB"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_FT_SYPT_FXZS"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_FT_SYPT_ZHZLQK"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_FT_SYPT_ZTFGQK"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_SYPT_PFDMXB"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_SYPT_PFHX"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_SYPT_PFPC"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_SYPT_YJBJB"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE "SYPT"."T_SYPT_YQZTQK"
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;

RUNSTATS ON TABLE SYPT.T_SYPT_PFJG 
  ON ALL COLUMNS   AND
  DETAILED INDEXES ALL
  ALLOW READ ACCESS
  SET PROFILE NONE;
;
