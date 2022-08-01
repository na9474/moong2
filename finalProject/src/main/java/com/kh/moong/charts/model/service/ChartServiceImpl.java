package com.kh.moong.charts.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.charts.model.dao.ChartDao;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	private ChartDao chartDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//총 회원수
	@Override
	public int allMemCount() {
	    return chartDao.allMemCount(sqlSession);
	}
	
	//총 선생수
	@Override
	public int allTeaCount() {
	    return chartDao.allTeaCount(sqlSession);
	}
	
	//총 학생수
	@Override
	public int allStuCount() {
	    return chartDao.allStuCount(sqlSession);
	}
	
	//선생 성별1
	public List<String> teaGenderLabel(){
		List<String> teaGenderLabel = new ArrayList<>();
	       for(int i= 0;i<chartDao.teaGender(sqlSession).size();i++) {
	    	   teaGenderLabel.add(chartDao.teaGender(sqlSession).get(i).getLabel());
	      };
	      return teaGenderLabel;
	}
	
	//선생 성별2
    public List<Integer> teaGenderCounts(){
        List<Integer> teaGenderCounts = new ArrayList<>();
        for(int i= 0;i<chartDao.teaGender(sqlSession).size();i++) {
        	teaGenderCounts.add(chartDao.teaGender(sqlSession).get(i).getCounts());
	    };
	    return teaGenderCounts;
    }
    
	//학생 성별1
	public List<String> stuGenderLabel(){
		List<String> stuGenderLabel = new ArrayList<>();
	       for(int i= 0;i<chartDao.stuGender(sqlSession).size();i++) {
	    	   stuGenderLabel.add(chartDao.stuGender(sqlSession).get(i).getLabel());
	      };
	      return stuGenderLabel;
	}
	
	//학생 성별2
    public List<Integer> stuGenderCounts(){
        List<Integer> stuGenderCounts = new ArrayList<>();
        for(int i= 0;i<chartDao.stuGender(sqlSession).size();i++) {
        	stuGenderCounts.add(chartDao.stuGender(sqlSession).get(i).getCounts());
	    };
	    return stuGenderCounts;
    }
    
	//월별 가입자 수1
    public List<String> monthMemLabel(){
        List<String> monthMemLabel = new ArrayList<>();
        for(int i= 0;i<chartDao.monthMem(sqlSession).size();i++) {
        	monthMemLabel.add(chartDao.monthMem(sqlSession).get(i).getLabel());
        };
        return monthMemLabel;
    }
    
    //월별 가입자 수2
    public List<Integer> monthMemCounts(){
       List<Integer> monthMemCounts = new ArrayList<>();
       for(int i= 0;i<chartDao.monthMem(sqlSession).size();i++) {
          int member = chartDao.monthMem(sqlSession).get(i).getCounts();
          monthMemCounts.add(member);
       };
       return monthMemCounts;
    }
     
 	//매칭수
 	@Override
 	public int matchCount() {
 	    return chartDao.matchCount(sqlSession);
 	}
 	
 	//매칭완료수
 	@Override
 	public int matchComCount() {
 	    return chartDao.matchComCount(sqlSession);
 	}
 	
	//월별 매칭 수1
    public List<String> monthMatchLabel(){
        List<String> monthMatchLabel = new ArrayList<>();
        for(int i= 0;i<chartDao.monthMatch(sqlSession).size();i++) {
        	monthMatchLabel.add(chartDao.monthMatch(sqlSession).get(i).getLabel());
        };
        return monthMatchLabel;
    }
    
    //월별 매칭 수2
    public List<Integer> monthMatchCounts(){
       List<Integer> monthMatchCounts = new ArrayList<>();
       for(int i= 0;i<chartDao.monthMatch(sqlSession).size();i++) {
          int member = chartDao.monthMatch(sqlSession).get(i).getCounts();
          monthMatchCounts.add(member);
       };
       return monthMatchCounts;
    }
    
	//국어등급1
    public List<String> koGradeLabel(){
        List<String> koGradeLabel = new ArrayList<>();
        for(int i= 0;i<chartDao.koGrade(sqlSession).size();i++) {
        	koGradeLabel.add(chartDao.koGrade(sqlSession).get(i).getLabel());
        };
        return koGradeLabel;
    }
    
    //국어등급2
    public List<Integer> koGradeCounts(){
       List<Integer> koGradeCounts = new ArrayList<>();
       for(int i= 0;i<chartDao.koGrade(sqlSession).size();i++) {
          int member = chartDao.koGrade(sqlSession).get(i).getCounts();
          koGradeCounts.add(member);
       };
       return koGradeCounts;
    }

	//영어등급1
    public List<String> engGradeLabel(){
        List<String> engGradeLabel = new ArrayList<>();
        for(int i= 0;i<chartDao.engGrade(sqlSession).size();i++) {
        	engGradeLabel.add(chartDao.engGrade(sqlSession).get(i).getLabel());
        };
        return engGradeLabel;
    }
    
    //영어등급2
    public List<Integer> engGradeCounts(){
       List<Integer> engGradeCounts = new ArrayList<>();
       for(int i= 0;i<chartDao.engGrade(sqlSession).size();i++) {
          int member = chartDao.engGrade(sqlSession).get(i).getCounts();
          engGradeCounts.add(member);
       };
       return engGradeCounts;
    }
    
	//수학등급1
    public List<String> mathGradeLabel(){
        List<String> mathGradeLabel = new ArrayList<>();
        for(int i= 0;i<chartDao.mathGrade(sqlSession).size();i++) {
        	mathGradeLabel.add(chartDao.mathGrade(sqlSession).get(i).getLabel());
        };
        return mathGradeLabel;
    }
    
    //수학등급2
    public List<Integer> mathGradeCounts(){
       List<Integer> mathGradeCounts = new ArrayList<>();
       for(int i= 0;i<chartDao.mathGrade(sqlSession).size();i++) {
          int member = chartDao.mathGrade(sqlSession).get(i).getCounts();
          mathGradeCounts.add(member);
       };
       return mathGradeCounts;
    }
    
	//과목별 선생수1
    public List<String> subjectTeacherLabel(){
        List<String> subjectTeacherLabel = new ArrayList<>();
        for(int i= 0;i<chartDao.subjectTeacher(sqlSession).size();i++) {
        	subjectTeacherLabel.add(chartDao.subjectTeacher(sqlSession).get(i).getLabel());
        };
        return subjectTeacherLabel;
    }
    
    //과목별 선생수2
    public List<Integer> subjectTeacherCounts(){
       List<Integer> subjectTeacherCounts = new ArrayList<>();
       for(int i= 0;i<chartDao.subjectTeacher(sqlSession).size();i++) {
          int member = chartDao.subjectTeacher(sqlSession).get(i).getCounts();
          subjectTeacherCounts.add(member);
       };
       return subjectTeacherCounts;
    }
    
	//선생 과외스타일1
    public List<String> styleTeacherLabel(){
        List<String> styleTeacherLabel = new ArrayList<>();
        for(int i= 0;i<chartDao.styleTeacher(sqlSession).size();i++) {
        	styleTeacherLabel.add(chartDao.styleTeacher(sqlSession).get(i).getLabel());
        };
        return styleTeacherLabel;
    }
    
    //선생 과외스타일2
    public List<Integer> styleTeacherCounts(){
       List<Integer> styleTeacherCounts = new ArrayList<>();
       for(int i= 0;i<chartDao.styleTeacher(sqlSession).size();i++) {
          int member = chartDao.styleTeacher(sqlSession).get(i).getCounts();
          styleTeacherCounts.add(member);
       };
       return styleTeacherCounts;
    }

    

}
