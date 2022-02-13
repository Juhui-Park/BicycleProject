package com.two.bicyclePrj;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class bicycleDAO {
	String url = "jdbc:oracle:thin:@localhost:1521/xe";
	String id = "hr";
	String pw = "hr";

	// main화면 출발지, 목적지 목록
	public ArrayList<bicycleVo> getStartList() {
		Connection con = null;
		ArrayList<bicycleVo> startList = new ArrayList<bicycleVo>();
		try {
			con = DriverManager.getConnection(url, id, pw);
			String sql = "select RENTAL_OFFICE_NAME from bicycle group by RENTAL_OFFICE_NAME";// 검색문
			PreparedStatement stmt = con.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String rentalOfficeName = rs.getString("RENTAL_OFFICE_NAME");

				bicycleVo bicycle = new bicycleVo();

				bicycle.setRentalOfficeName(rentalOfficeName);

				// 리턴리스트에 값을 추가
				startList.add(bicycle);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return startList;
	}

	// 예상시간
	public String getAvgTime(String rentalOffice, String returnOffice) {
		Connection con = null;
		String time = null;
		try {
			con = DriverManager.getConnection(url, id, pw);
			String sql = "select round(avg(riding_time), 0) as time from bicycle "
					+ "where rental_office_name = ? and return_office_name = ?";// 검색문
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, rentalOffice);
			stmt.setString(2, returnOffice);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				time = rs.getString(1);
				return time;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return time;

	}

	// 수리
	public ArrayList<bicycleVo> getRepair(int meter) {
		Connection con = null;
		ArrayList<bicycleVo> repairLst = new ArrayList<bicycleVo>();
		try {
			con = DriverManager.getConnection(url, id, pw);
			String sql = "select a.bicycle_id, a.sum1, b.return_office_name "
					+ "from (select sum(riding_distance)as sum1 , bicycle_id "
						+ "from bicycle group by bicycle_id) a "
						+ "join (SELECT row_number() OVER(PARTITION BY bicycle_id order by return_datetime desc) as rnum, bicycle_id, return_office_name FROM bicycle) b "
					+ "on b.rnum=1 and a.bicycle_id=b.bicycle_id "
					+ "where a.sum1 > ?";// 검색문
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, meter);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String bicycleId = rs.getString("bicycle_id");
				String return_office_name = rs.getString("return_office_name");
				bicycleVo repair = new bicycleVo();
				repair.setBicycleId(bicycleId);
				repair.setReturnOfficeName(return_office_name);
				
				repairLst.add(repair);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return repairLst;

	}

	// 탑10
	public ArrayList<String> getRankOffice() {
		Connection con = null;
		ArrayList<String> lstRank = new ArrayList<String>();
		try {
			con = DriverManager.getConnection(url, id, pw);
			String sql = "SELECT rental_office_name, rnum FROM (SELECT rental_office_name, row_number() OVER(ORDER by count(*) desc) as rnum " 
			+ "FROM bicycle group by rental_office_name order by 2) where rnum between 1 and 10";// 검색문
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				lstRank.add(rs.getString("rental_office_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return lstRank;

	}

	// 추천
	public ArrayList<bicycleVo> getRecommendOffice(String startOffice, int preTime) {
		Connection con = null;
		ArrayList<bicycleVo> lstRecommend = new ArrayList<bicycleVo>();
		try {
			con = DriverManager.getConnection(url, id, pw);
			String sql = "SELECT return_office_name, round(avg(riding_time),0) as riding_time " + "from bicycle "
					+ "WHERE rental_office_name = ? AND ?-5<riding_time and riding_time< ?+5 "
					+ "group by return_office_name " + "order by 2";// 검색문
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, startOffice);
			stmt.setInt(2, preTime);
			stmt.setInt(3, preTime);
			System.out.println(startOffice);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String returnOfficeName = rs.getString("return_office_name");
				int ridingTime = rs.getInt("riding_time");
				bicycleVo recommend = new bicycleVo();
				recommend.setRidingTime(ridingTime);
				recommend.setReturnOfficeName(returnOfficeName);
				lstRecommend.add(recommend);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return lstRecommend;

	}
	
	// 오늘내일하는 정류소
	public ArrayList<String> getCloseOffice() {
		Connection con = null;
		ArrayList<String> lstRank = new ArrayList<String>();
		try {
			con = DriverManager.getConnection(url, id, pw);
			String sql = "select rental_office_name, count1 "
					+ "from (SELECT rental_office_name, row_number() OVER(ORDER BY count(rental_office_name)) as rnum, count(rental_office_no) as count1 "
					+ "    from bicycle " + "    group by rental_office_name " + "    order by 2) "
					+ "where 279<rnum and count1 < 100";// 검색문
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				lstRank.add(rs.getString("rental_office_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}
		}
		return lstRank;

	}

}