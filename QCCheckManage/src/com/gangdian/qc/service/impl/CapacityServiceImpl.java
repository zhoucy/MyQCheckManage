package com.gangdian.qc.service.impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.CapacityDao;
import com.gangdian.qc.dao.QCProductTypeDao;
import com.gangdian.qc.model.QCProductType;
import com.gangdian.qc.service.CapacityService;
import com.springmvc.util.MyDateUtil;

@Service
public class CapacityServiceImpl implements CapacityService{

	@Autowired
	private CapacityDao capacityDao;
	@Autowired
	private QCProductTypeDao qcptDao;
	
		
	
	//˫����ʾ��Ʒ��Ϣ
	public Map<String, Object> getDefective(String date,String hour,String pono,String groupname,String belongname) {
		if(date==null||date.trim().equals("")){date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());}
		List<Map<String, Object>> maplist=capacityDao.getDefective(date, hour, pono, groupname, belongname);
		Map<String, Object> result=new HashMap<String, Object>();
		if(maplist!=null&&maplist.size()>0){
			for (Map<String, Object> map : maplist) {
			    //ת��ʱ������ΪString
				map.put("badtime", map.get("badtime").toString());
			}
		}
		result.put("rows", maplist);
		return result;
	}
	
	//˫����ʾ������Ϣ
	public Map<String, Object> getDept(String deptname) {
		if(deptname==null||"".equals(deptname.trim())){deptname="��������";}
		List<Map<String, Object>> maplist=capacityDao.getDept(deptname);
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("total", maplist!=null?maplist.size():0);
		result.put("rows", maplist);
		return result;
	}
	
	//˫����ʾ������Ϣ
	public Map<String, Object> getPonoInfo(String deptname, String date,
			String pono) {
		if(date==null||date.trim().equals("")){date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());}
		List<Map<String, Object>> maplist=capacityDao.getPonoInfo(deptname, date, pono);
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("total", maplist!=null?maplist.size():0);
		result.put("rows", maplist);
		return result;
	}


		
	

	//highcharts�����뻵Ʒ��
	public Map<String, Object> getHighCharts(String date,String timetype
			,String producttype,Integer groupid,Integer belong) throws ParseException {
		Date day=new Date();
		if(date!=null&&!date.trim().equals("")){
			day=MyDateUtil.ZeroFormat(date);
		}
		String startday="";
		String endday="";
		String titletext="";
		if(timetype.equals("week")){		
			startday=MyDateUtil.DateFormat(MyDateUtil.getWeekStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getWeekEnd(day));
			String weekinfo=MyDateUtil.getWeekNum(day)+"/"+MyDateUtil.getWeekSum();
			titletext=new SimpleDateFormat("yyyy").format(day)+"��"+weekinfo+"�ܲ���&Ʒ��ͼ";
		}else if(timetype.equals("month")){
			startday=MyDateUtil.DateFormat(MyDateUtil.getMonthStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getMonthEnd(day));
			titletext=new SimpleDateFormat("yyyy-MM").format(day)+"�²���&Ʒ��ͼ";
		}else if(timetype.equals("quarter")){
			startday=MyDateUtil.DateFormat(MyDateUtil.getQuarterStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getQuarterEnd(day));
			titletext=new SimpleDateFormat("yyyy").format(day)+"���"+MyDateUtil.getSeason(day)+"���Ȳ�Ʒ���ͷ���ͼ";
		}else if(timetype.equals("year")){
			startday=MyDateUtil.DateFormat(MyDateUtil.getYearStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getYearEnd(day));
			titletext=new SimpleDateFormat("yyyy").format(day)+"�����&Ʒ��ͼ";
		}else{
			startday=MyDateUtil.DateFormat(MyDateUtil.getWeekStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getWeekEnd(day));
			titletext="����";
		}
		//������Ŀǰδʹ��
		String subtitletext="������......";
		//x����xAxis.categories
		List<String> xAxis=new ArrayList<String>();
		//y����yAxis.title.text,(���Ŀǰû���õ�)
		String yAxis[]={"����"};
		//labels(���Ͻǵı���)
		String leader="________";
		String manager="________";
		String tempgroup="��������";
		String tempptype="ȫ��";
        //��Ʒ��������
		if(producttype!=null&&!producttype.trim().equals("")){
      		QCProductType temp=new QCProductType();
      		temp.setProductNo(producttype);
      		List<QCProductType> qcptlist=qcptDao.getQCPTPageSize(temp);
      		if(qcptlist!=null&&qcptlist.size()>0){
      			tempptype=qcptlist.get(0).getProductName();
      		}
      	}
      	//������������������
		if(groupid!=null){
			List<Map<String, Object>> deptlist=capacityDao.getDeptById(groupid);
			if(deptlist!=null&&deptlist.size()>0){
				leader=deptlist.get(0).get("a_leader").toString();
				manager=deptlist.get(0).get("b_leader").toString();
				tempgroup=deptlist.get(0).get("a_name").toString();
			}
		}	
		String labels="��ʼ:"+startday+"<br>����:"+endday+"<br>����:"+tempgroup+"<br>��Ʒ����:"+tempptype+
				"<br>����:"+leader+"<br>����:"+manager+"<br>";
		//����series
		Map<String, Object> series=new HashMap<String, Object>();	
		//��ͼ������
		List<Map<String, Object>> pie=new ArrayList<Map<String,Object>>();
		//��������
		List<Map<String, Object>> alldata= capacityDao.getBadrateHighCharts(startday,endday, producttype, groupid,belong,timetype);
		List<Integer> goodlist=new ArrayList<Integer>();
		List<Integer> badlist=new ArrayList<Integer>();
		List<BigDecimal> ratelist=new ArrayList<BigDecimal>();
		List<Double> securelist=new ArrayList<Double>();
		List<Double> warninglist=new ArrayList<Double>();
		int goodtotal=0;
		int badtotal=0;
		Double securenum=1.00;
		Double warningnum=2.00;
		for (int i = 0; i < alldata.size(); i++) {
			goodlist.add((Integer)alldata.get(i).get("goodnum"));		
			badlist.add((Integer)alldata.get(i).get("badnum"));		
			ratelist.add((BigDecimal)alldata.get(i).get("rate"));
			
			goodtotal=(Integer)alldata.get(i).get("goodnum")+goodtotal;
			badtotal=(Integer)alldata.get(i).get("badnum")+badtotal;
			
			securelist.add(securenum);
			warninglist.add(warningnum);
			//x��̶�	
			String tmpdate=alldata.get(i).get("tmpdate").toString();
			int beginIndex=tmpdate.indexOf("-")+1;
			if(timetype.equals("week")){					
				Date tmpdate2=MyDateUtil.ZeroFormat(tmpdate);
				String week=new SimpleDateFormat("EEEE").format(tmpdate2);			
				xAxis.add(week+"("+tmpdate.substring(beginIndex).replace("-", "/")+")"+" ");
			}else if(timetype.equals("month")){
				xAxis.add(tmpdate.substring(beginIndex).replace("-", "/"));
			}else if(timetype.equals("quarter")){
				xAxis.add(tmpdate+"��");
			}else if(timetype.equals("year")){
				xAxis.add(tmpdate+"��");
			}else{
				xAxis.add(tmpdate.substring(beginIndex).replace("-", "/"));
			}			
		}
				
		//�������ݵķ�װ
		series.put("good", goodlist);
		series.put("bad", badlist);
		series.put("rate", ratelist);
		series.put("secure", securelist);
		series.put("warning", warninglist);
		//�����Ǳ�״ͼ�ķ�װ
		Map<String, Object> goodpie=new HashMap<String, Object>();	
		Map<String, Object> badpie=new HashMap<String, Object>();
		goodpie.put("name", "��Ʒ");
		goodpie.put("y", goodtotal);
		goodpie.put("color", "#64E572");
		badpie.put("name", "��Ʒ");
		badpie.put("y", badtotal);
		badpie.put("color", "#3D3D3D");
		pie.add(goodpie);
		pie.add(badpie);
		if(goodtotal==0&&badtotal==0){
			pie=null;
		}
		series.put("pie", pie);
		//�������һ����װ
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("title", titletext);
		map.put("subtitle", subtitletext);
		map.put("xAxis", xAxis);
		map.put("yAxis", yAxis);
		map.put("labels", labels);
		map.put("series", series);
		return map;
	}

	
	//��Ʒ����ͳ��ͼhighcharts
	public Map<String, Object> getProductTypeHighCharts(String date,
			String timetype, String producttype, Integer groupid,Integer belong)throws ParseException {
		Date day=new Date();
		if(date!=null&&!date.trim().equals("")){
			day=MyDateUtil.ZeroFormat(date);
		}
		String startday="";
		String endday="";
		String titletext="";
		if(timetype.equals("week")){		
			startday=MyDateUtil.DateFormat(MyDateUtil.getWeekStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getWeekEnd(day));
			String weekinfo=MyDateUtil.getWeekNum(day)+"/"+MyDateUtil.getWeekSum();
			titletext=new SimpleDateFormat("yyyy").format(day)+"��"+weekinfo+"�ܲ�Ʒ���ͷ���ͼ";
		}else if(timetype.equals("month")){
			startday=MyDateUtil.DateFormat(MyDateUtil.getMonthStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getMonthEnd(day));
			titletext=new SimpleDateFormat("yyyy-MM").format(day)+"�²�Ʒ���ͷ���ͼ";
		}else if(timetype.equals("quarter")){
			startday=MyDateUtil.DateFormat(MyDateUtil.getQuarterStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getQuarterEnd(day));
			titletext=new SimpleDateFormat("yyyy").format(day)+"���"+MyDateUtil.getSeason(day)+"���Ȳ�Ʒ���ͷ���ͼ";
		}else if(timetype.equals("year")){
			startday=MyDateUtil.DateFormat(MyDateUtil.getYearStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getYearEnd(day));
			titletext=new SimpleDateFormat("yyyy").format(day)+"���Ʒ���ͷ���ͼ";
		}else{
			startday=MyDateUtil.DateFormat(MyDateUtil.getWeekStart(day));
			endday=MyDateUtil.DateFormat(MyDateUtil.getWeekEnd(day));
			titletext="����";
		}
		//������Ŀǰδʹ��
		String subtitletext="������......";
		//x����xAxis.categories
		List<String> xAxis=new ArrayList<String>();
		//y����yAxis.title.text,(���Ŀǰû���õ�)
		String yAxis[]={"����"};
		//labels(���Ͻǵı���)
		String leader="________";
		String manager="________";
		String tempgroup="��������";
		String tempptype="ȫ��";
        //��Ʒ��������
		if(producttype!=null&&!producttype.trim().equals("")){
      		QCProductType temp=new QCProductType();
      		temp.setProductNo(producttype);
      		List<QCProductType> qcptlist=qcptDao.getQCPTPageSize(temp);
      		if(qcptlist!=null&&qcptlist.size()>0){
      			tempptype=qcptlist.get(0).getProductName();
      		}
      	}
      	//������������������
		if(groupid!=null){
			List<Map<String, Object>> deptlist=capacityDao.getDeptById(groupid);
			if(deptlist!=null&&deptlist.size()>0){
				leader=deptlist.get(0).get("a_leader").toString();
				manager=deptlist.get(0).get("b_leader").toString();
				tempgroup=deptlist.get(0).get("a_name").toString();
			}
		}		
		String labels="��ʼ:"+startday+"<br>����:"+endday+"<br>����:"+tempgroup+"<br>��Ʒ����:"+tempptype+
				"<br>����:"+leader+"<br>����:"+manager+"<br>";
		//����series
		Map<String, Object> series=new HashMap<String, Object>();	
		//��ͼ������
		List<Map<String, Object>> pie=new ArrayList<Map<String,Object>>();
		//��������
		List<Map<String, Object>> alldata= capacityDao.getProductTypeHighCharts(startday, endday, producttype, groupid,belong,timetype);
		List<Integer> slist=new ArrayList<Integer>();
		List<Integer> clist=new ArrayList<Integer>();
		List<Integer> dlist=new ArrayList<Integer>();
		List<Integer> otherlist=new ArrayList<Integer>();
		List<Integer> totallist=new ArrayList<Integer>();
		int stotal=0;
		int ctotal=0;
		int dtotal=0;
		int othertotal=0;
		for (int i = 0; i < alldata.size(); i++) {
			int total=Integer.parseInt(alldata.get(i).get("S").toString())+Integer.parseInt(alldata.get(i).get("C").toString())+
					  Integer.parseInt(alldata.get(i).get("D").toString())+Integer.parseInt(alldata.get(i).get("other").toString());
			slist.add(Integer.parseInt(alldata.get(i).get("S").toString()));
			clist.add(Integer.parseInt(alldata.get(i).get("C").toString()));
			dlist.add(Integer.parseInt(alldata.get(i).get("D").toString()));
			otherlist.add(Integer.parseInt(alldata.get(i).get("other").toString()));
			totallist.add(total);
			stotal=Integer.parseInt(alldata.get(i).get("S").toString())+stotal;
			ctotal=Integer.parseInt(alldata.get(i).get("C").toString())+ctotal;
			dtotal=Integer.parseInt(alldata.get(i).get("D").toString())+dtotal;
			othertotal=Integer.parseInt(alldata.get(i).get("other").toString())+othertotal;
			//x��̶�
			String tmpdate=alldata.get(i).get("tmpdate").toString();
			int beginIndex=tmpdate.indexOf("-")+1;
			if(timetype.equals("week")){					
				Date tmpdate2=MyDateUtil.ZeroFormat(tmpdate);
				String week=new SimpleDateFormat("EEEE").format(tmpdate2);			
				xAxis.add(week+"("+tmpdate.substring(beginIndex).replace("-", "/")+")"+" ");
			}else if(timetype.equals("month")){
				xAxis.add(tmpdate.substring(beginIndex).replace("-", "/"));
			}else if(timetype.equals("quarter")){
				xAxis.add(tmpdate+"��");
			}else if(timetype.equals("year")){
				xAxis.add(tmpdate+"��");
			}else{
				xAxis.add(tmpdate.substring(beginIndex).replace("-", "/"));
			}			
	  }		
		//�������ݵķ�װ
				series.put("s", slist);
				series.put("c", clist);
				series.put("d", dlist);
				series.put("other", otherlist);
				series.put("total", totallist);
				//�����Ǳ�״ͼ�ķ�װ
				Map<String, Object> sy=new HashMap<String, Object>();	
				Map<String, Object> cy=new HashMap<String, Object>();
				Map<String, Object> dy=new HashMap<String, Object>();
				Map<String, Object> othery=new HashMap<String, Object>();
				sy.put("name", "ֱ����");
				sy.put("y", stotal);
				cy.put("name", "����");
				cy.put("y", ctotal);
				dy.put("name", "������");
				dy.put("y", dtotal);
				othery.put("name", "����");
				othery.put("y", othertotal);
				pie.add(sy);
				pie.add(cy);
				pie.add(dy);
				pie.add(othery);
				if(stotal==0&&ctotal==0&&dtotal==0&&othertotal==0){
					pie=null;
				}
				series.put("pie", pie);
				//�������һ����װ
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("title", titletext);
				map.put("subtitle", subtitletext);
				map.put("xAxis", xAxis);
				map.put("yAxis", yAxis);
				map.put("labels", labels);
				map.put("series", series);
				return map;
	}
	
	//ûСʱ����ͳ��ͼhighcharts
	public Map<String, Object> getProductPerHourHighCharts(String date,Integer groupid,Integer n) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date day=new Date();
		if(date!=null&&!date.trim().equals("")){
			day=MyDateUtil.ZeroFormat(date);
		}
		if(n==null||n<0){n=1;}
		String startday=sdf.format(new Date(day.getTime()-86400000*n));
		String endday=sdf.format(new Date(day.getTime()+86400000));
		List<Map<String, Object>> lm=capacityDao.getProductPerHourHighCharts(startday, endday, groupid);
		Map<String, Object> hc=new HashMap<String, Object>();
		if(lm!=null&&lm.size()>0){			
			//x��
			//y��
			List<String> xAxis=new ArrayList<String>();
			List<Map<String, Object>> series=new ArrayList<Map<String, Object>>();
			boolean flag=true;
			for (Map<String, Object> map : lm) {
				//Set<Entry<String, Object>> entries=map.entrySet();
				//��keys����
				List<Map.Entry<String, Object>> entries=new ArrayList<Map.Entry<String, Object>>(map.entrySet());
				Collections.sort(entries, new Comparator<Map.Entry<String, Object>>() {   
				    public int compare(Map.Entry<String, Object> o1, Map.Entry<String, Object> o2) {      
				        return (o1.getKey()).toString().compareTo(o2.getKey());
				    }
				}); 
				Map<String, Object> temp=new HashMap<String, Object>();
				Map<String, Object> dataLabels=new HashMap<String, Object>();
				dataLabels.put("enabled", true);
				temp.put("dataLabels", dataLabels);
				if(flag){temp.put("color", "red");}
				List<Object> data=new ArrayList<Object>();
				for (Entry<String, Object> entry : entries) {										
					if(!entry.getKey().equals("Date")&&!entry.getKey().equals("total")){
				    	if(flag){
							xAxis.add(entry.getKey());
						}
						data.add(entry.getValue());
					}
				}				
				temp.put("data", data);
				temp.put("name", map.get("Date")+"(�ϼ�:"+map.get("total")+")");
				series.add(temp);
				flag=false;
			}
			hc.put("xAxis", xAxis);
			hc.put("series", series);
		}
		return hc;	
	}

	
	//������ϸ��Ϣ(��Сʱ)
	public Map<String, Object> getCapaCityDetailByHour(String proDate,
			String groupname, String belongname, String pono, String showdate,
			String showgroup, String showbelong, String showpono) {
		if(proDate==null||proDate.trim().equals("")){proDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());}
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("rows", capacityDao.getCapaCityDetailByHour(proDate, groupname, belongname, pono,
				showdate, showgroup, showbelong, showpono));
		//on���ǲ���ʾ
		result.put("footer", capacityDao.getCapaCityDetailByHour(proDate, groupname, belongname, pono,
				"on", "on", "on", "on"));
		return result;
	}

	//������ϸ��Ϣ(������Сʱ)
	public Map<String, Object> getCapaCityDetailByWorkHour(String proDate,
			String groupname, String belongname, String pono, String showdate,
			String showgroup, String showbelong, String showpono) {
		if(proDate==null||proDate.trim().equals("")){proDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());}
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("rows", capacityDao.getCapaCityDetailByWorkHour(proDate, groupname, belongname, pono, 
				showdate, showgroup, showbelong, showpono));
		result.put("footer", capacityDao.getCapaCityDetailByWorkHour(proDate, groupname, belongname, pono, 
				"on", "on", "on", "on"));
		return result;
	}

	//��ҳ��ȡ����Ķ�����Ϣ
	public List<Map<String, Object>> getTodayOrderOfIndex(String productDate) {
		return capacityDao.getTodayOrderOfIndex(productDate);
	}

	//ĳ�պͽ���ıȽ���ͼ
	public Map<String, Object> getTodayCapacityOfIndex(String compareDay) {
		Date today=new Date();
		String startday=new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTime()-86400000*7));
		String endday=new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTime()+86400000));
		List<Map<String, Object>> data=capacityDao.getTodayCapacityOfIndex(startday, endday);
		Map<String, Object> result=new HashMap<String, Object>();
		//x������
		List<Integer> xAxis=new ArrayList<Integer>();
		//����
		List<Map<String, Object>> series=new ArrayList<Map<String,Object>>();
		Map<String, Object> series1=new HashMap<String, Object>();
		Map<String, Object> series2=new HashMap<String, Object>();
		List<Integer> data1=new ArrayList<Integer>();
		List<Integer> data2=new ArrayList<Integer>();
		for (int i = 1; i <= 11; i++) {
			String temp="h"+i;
			xAxis.add(i);
			if(data!=null&&data.size()>=1){
				data1.add(Integer.parseInt(data.get(0).get(temp).toString()));
			}
			if(data!=null&&data.size()>=2){
				data2.add(Integer.parseInt(data.get(1).get(temp).toString()));
			}		
		}
		
		Map<String, Object> dataLabels=new HashMap<String, Object>();
		boolean enabled=true;
		dataLabels.put("enabled", enabled);
		
		if(data!=null&&data.size()>=1){
			series1.put("dataLabels", dataLabels);
			series1.put("name",data.get(0).get("Date").toString()+"(����:"+data.get(0).get("total").toString()+")");
			series1.put("data",data1);
			series1.put("color","red");
		}
        if(data!=null&&data.size()>=2){
        	series2.put("dataLabels", dataLabels);
    		series2.put("name",data.get(1).get("Date").toString()+"(����:"+data.get(1).get("total").toString()+")");
    		series2.put("data",data2);
    		//series2.put("color","blue");
		}
				
		series.add(series2);
		series.add(series1);
		result.put("xAxis", xAxis);
		result.put("series", series);
		return result;
	}

	//��ҳ����ͼ
	public List<Map<String, Object>> getTodayTypeOfIndex() {
		return capacityDao.getTodayTypeOfIndex();
	}

	//��ȡ�����Ĺ�������,������,��Ʒ����,��Ʒmodel,��ѡ�񶩵���ʱͬʱΪ��Ʒ���ͺ�model��ֵ
	public List<Map<String, Object>> getPonoAndUnion() {
		return capacityDao.getPonoAndUnion();
	}



			
}
