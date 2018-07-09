package service;

import java.util.ArrayList;

public class TeacherScoreDao {
	private class TeacherAndScore {
		private Teacher teacher;
		private TeacherAndScore teacherScore;
		
	}
	
	public ArrayList<TeacherAndScore> selectTeacherAndScore() {
	public ArrayList<TeacherScore> list = new ArrayList<TeacherAndScore>();
	String sql = "select \r\n" + 
			"ts.teacher_score_no\r\n" + 
			", ts.teacher_no\r\n" + 
			", t.teacher_name\r\n" + 
			", t.teacher_age\r\n" + 
			", ts.score \r\n" + 
			"from teacher_score ts inner join teacher t on ts.teacher_no =t.teacher_no;";
	
	while(rs.next()) {
		Teacher teacher = new Teacher();
		TeacherScore teacherScore = new TeacherScore();
		TeacherAndScore teacherAndScore = new TeacherAndScore();
		teacherAndScore.setTeacher(teacher);
		teacherAndScore.setTeacherScore(teacherScore);
		list.add(teacherAndScore);
	}
	return list;
}
	}



