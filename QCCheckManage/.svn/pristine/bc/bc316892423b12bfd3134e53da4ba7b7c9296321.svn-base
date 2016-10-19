package com.springmvc.framework;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

@SuppressWarnings("unchecked")
public class BaseDao{
	public JdbcTemplate jdbcTemplate;
	private TransactionTemplate transactionTemplate;
	private Logger log = Logger.getLogger(this.getClass().getName());

	//获取记录，sql执行后有多少返回多少
	public List<String[]> getRows(String sql) {
		log.info(sql);
		List<String[]> strs = (List<String[]>) this.jdbcTemplate.query(sql,
				new ResultSetExtractor() {
					public Object extractData(ResultSet rs)throws SQLException, DataAccessException{
						ResultSetMetaData rsd = rs.getMetaData();
						int num = rsd.getColumnCount();
						List list = new ArrayList();
						while (rs.next()) {
							String[] strs = new String[num];
							for (int i = 0; i < num; i++) {
								strs[i] = rs.getString(i + 1);
							}
							list.add(strs);
						}
						return list;
					}

				});
		return strs;
	}

	

	//获取记录，sql执行后有多少返回多少
	public List<String[]> getRows(String sql, Object[] params) {
		log.info(sql+" params:"+Arrays.toString(params));
		List<String[]> strs = (List<String[]>) this.jdbcTemplate.query(sql,
				params, new ResultSetExtractor() {
					public Object extractData(ResultSet rs)
							throws SQLException, DataAccessException {
						ResultSetMetaData rsd = rs.getMetaData();
						int num = rsd.getColumnCount();
						List list = new ArrayList();
						while (rs.next()) {
							String[] strs = new String[num];
							for (int i = 0; i < num; i++) {
								strs[i] = rs.getString(i + 1);
							}
							list.add(strs);
						}
						return list;
					}

				});
		return strs;
	}

	//获取单行记录
	public synchronized String[] getRow(String sql) {
		List<String[]> list = this.getRows(sql);
		if (list.size() == 0)
			return null;
		else
			return list.get(0);
	}

	//获取单行记录
	public synchronized String[] getRow(String sql, Object[] params) {
		List<String[]> list = this.getRows(sql, params);
		if (list.size() == 0)
			return null;
		else
			return list.get(0);
	}

	//执行单条sql insert、update、delete
	public int execute(String sql) {
		log.info(sql);
		System.out.println(sql);
		int r = this.jdbcTemplate.update(sql);
		return r;
	}

	//prepared式执行单条sql
	public int execute(String sql, Object[] params) {
		log.info(sql+" params:"+Arrays.toString(params));
		int r = this.jdbcTemplate.update(sql, params);
		return r;
	}

	//批量执行sql
	public void executeBatch(List<String> sql) {
		log.info(sql);
		String[] ss = new String[sql.size()];
		for(int is=0 ; is<sql.size() ; is++){
			ss[is] = sql.get(is);
		}
		final String[] sqls = ss;
		this.transactionTemplate.execute(new TransactionCallbackWithoutResult(){
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				try{
					jdbcTemplate.batchUpdate(sqls);
				}catch(Exception e){
					status.setRollbackOnly();
				}
			}
		});
	}
	
	//prepared式批量执行insert,update,delete
	public synchronized void executeBatch(String sql, final List<Object[]> params) {
		log.info(sql);
		this.jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {

			public int getBatchSize() {
				return params.size();
			}

			public void setValues(PreparedStatement ps, int i)
					throws SQLException {
				Object[] o = params.get(i);
				for (int y = 0; y < o.length; y++) {
					ps.setObject(y + 1, o[y]);
				}
				log.info("params:"+Arrays.toString(o));
			}

		});
	}
	
	//调用存储过程
	public synchronized void call(String prc) throws SQLException {
		log.info("call:"+prc);
		this.getJdbcTemplate().execute("{CALL "+prc+"}", new CallableStatementCallback(){
			public Object doInCallableStatement(CallableStatement cs)
					throws SQLException, DataAccessException {
				cs.execute();
				return null;
			}
		});
		log.info("end call:"+prc);
	}
	
	/**
	 * 
	 * @param queryString  输入的sql语句
	 * @param startIndex   第几条记录开始
	 * @param pageSize     每页显示多少记录
	 * @param sortSql      未排序预留的,其实可以不要
	 * @return String      返回按照要求分页的语句
	 */
	//zhangzx 2016-6-2   分页的sql代码,
		public String  getSqlServerPageSql(String  queryString, Integer startIndex, Integer pageSize,String sortSql){			
			String  result="";		
			if(null!=startIndex&&null!=pageSize){
				
				result="select  top  "+pageSize+" * from ( "+ queryString+") as  wh where id  not in ( select top "+(startIndex)+" id  from ( "+ queryString+" )as wh1) ";
			}else if (null != startIndex && null == pageSize)
			{
				result = "select  top  "+pageSize+" * from ( "+ queryString+") as  wh";
			} else
			{
				result = queryString;
			}
			return result+sortSql;//sortSql是未了避免不能排序的问题			
		}
	
	

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public TransactionTemplate getTransactionTemplate() {
		return transactionTemplate;
	}

	public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
		this.transactionTemplate = transactionTemplate;
	}
}
