package com.gloryDuck.marketTree.model.dao;

import java.sql.Types;
import org.hibernate.dialect.SQLServerDialect;
import org.hibernate.type.StandardBasicTypes;
 
public class SqlServerDBDialect extends SQLServerDialect {
 
public SqlServerDBDialect() {  super();
        registerHibernateType(Types.NCHAR, StandardBasicTypes.CHARACTER.getName()); 
        registerHibernateType(Types.NCHAR, 1, StandardBasicTypes.CHARACTER.getName());
        registerHibernateType(Types.NCHAR, 255, StandardBasicTypes.STRING.getName());
        registerHibernateType(Types.NVARCHAR, StandardBasicTypes.STRING.getName());
        registerHibernateType(Types.LONGNVARCHAR, StandardBasicTypes.TEXT.getName());
        registerHibernateType(Types.NCLOB, StandardBasicTypes.CLOB.getName());
 
} }