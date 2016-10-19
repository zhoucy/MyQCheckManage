package com.gangdian.qc.service.impl;

import java.io.File;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCProgressManHourDao;
import com.gangdian.qc.model.QCProgress;
import com.gangdian.qc.model.QCProgressManHour;
import com.gangdian.qc.service.QCProgressManHourService;
import com.springmvc.common.DBHelper;
@Service
public class QCProgressManHourServiceI implements QCProgressManHourService{

	@Autowired
	private QCProgressManHourDao progressManHourDao;
	public boolean deleteByPrimaryKey(Integer id) {
		int result= progressManHourDao.deleteByPrimaryKey(id);
		if(result>=1) return true;
		else return false;
		
	}

	public boolean insert(QCProgressManHour record) {
		int result=progressManHourDao.insert(record);
		if(result>=1) return true;
		else return false;
	}

	public boolean insertSelective(QCProgressManHour record) {
		int result=progressManHourDao.insertSelective(record);
		if(result>=1) return true;
		else return false;
	}

	public QCProgressManHour selectByPrimaryKey(Integer id) {
		return progressManHourDao.selectByPrimaryKey(id);
	}

	public boolean updateByPrimaryKeySelective(QCProgressManHour record) {
		int result=progressManHourDao.updateByPrimaryKeySelective(record);
		if(result>=1) return true;
		else return false;
	}

	public boolean updateByPrimaryKey(QCProgressManHour record) {
		int result=progressManHourDao.updateByPrimaryKey(record);
		if(result>=1) return true;
		else return false;
	}

	public int getProHourPageSize(QCProgressManHour record) {
		return progressManHourDao.getProHourPageSize(record);
	}

	public List<QCProgressManHour> getProHourPageList(QCProgressManHour record,
			Integer rows, Integer page, String sort, String order) {
		return progressManHourDao.getProHourPageList(record, rows, page, sort, order);
	}

	public QCProgressManHour selectByOther(QCProgressManHour record) {
		return progressManHourDao.selectByOther(record);
	}
	
	 public static List<QCProgressManHour> getAllByDb(){
	        List<QCProgressManHour> list=new ArrayList<QCProgressManHour>();
	        try {
	            DBHelper db=new DBHelper();
	            String sql="select * from qc_progress_man_hour";
	            ResultSet rs= db.Search(sql, null);
	            while (rs.next()) {
	                int id=rs.getInt("id");
	                String model=rs.getString("model");
	                int progressid=rs.getInt("progressid");
	                int manMinute=rs.getInt("manMinute");
	                BigDecimal manHour=rs.getBigDecimal("manHour");
	                BigDecimal balance=rs.getBigDecimal("balance");
	               
	                
	                
	                //System.out.println(id+" "+name+" "+sex+ " "+num);
	                list.add(new QCProgressManHour(id, model, progressid, manMinute, manHour, balance, null));
	            }
	            
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return list;
	    }
	    
	    /**
	     * 查询指定目录中电子表格中所有的数据
	     * @param file 文件完整路径
	     * @return
	     */
	    public static List<QCProgressManHour> getAllByExcel(String file){
	        List<QCProgressManHour> list=new ArrayList<QCProgressManHour>();
	        try {
	            Workbook rwb=Workbook.getWorkbook(new File(file));
	            Sheet rs=rwb.getSheet("Test Shee 1");//或者rwb.getSheet(0)
	            int clos=rs.getColumns();//得到所有的列
	            int rows=rs.getRows();//得到所有的行
	            
	            System.out.println(clos+" rows:"+rows);
	            for (int i = 1; i < rows; i++) {
	                for (int j = 0; j < clos; j++) {
	                    //第一个是列数，第二个是行数
	                   //默认最左边编号也算一列 所以这里得j++
	                    String manMinute=rs.getCell(j++, i).getContents();
	                    String manHour=rs.getCell(j++, i).getContents();
	                    String balance=rs.getCell(j++, i).getContents();
	                    String model=rs.getCell(j++, i).getContents();
		                String  progressid=rs.getCell(j++, i).getContents();
		              
	                    System.out.println(" manMinute:"+manMinute+" manHour:"+manHour+" balance:"+balance+"model"+model+"progressid:"+progressid);
	                    list.add(new QCProgressManHour(null, model, Integer.valueOf(progressid), Integer.valueOf(manMinute), new BigDecimal(manHour), new BigDecimal(balance), null));
	                }
	            }
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 
	        return list;
	        
	    }
	    
	    /**
	     * 通过Id判断是否存在
	     * @param id
	     * @return
	     */
	    public static boolean isExist(int model){
	        try {
	            DBHelper db=new DBHelper();
	            ResultSet rs=db.Search("select * from qc_progress_man_hour where model=?", new String[]{model+""});
	            if (rs.next()) {
	                return true;
	            }
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return false;
	    }
	    
	    public static void main(String[] args) {
	        /*List<StuEntity> all=getAllByDb();
	        for (StuEntity stuEntity : all) {
	            System.out.println(stuEntity.toString());
	        }*/
	        
	        System.out.println(isExist(1));
	    }

}
