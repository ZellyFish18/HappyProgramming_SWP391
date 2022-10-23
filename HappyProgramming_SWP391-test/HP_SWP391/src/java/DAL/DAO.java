/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.*;
import Model.*;
import java.sql.*;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 *
 * @author DELL
 */
public class DAO {

    private ArrayList<MentorProfile> mpList;
    private ArrayList<MentorSkill> msList;
    private ArrayList<Rating> ratingList;
    private ArrayList<Request> requestList;
    private ArrayList<RequestSkill> rsList;
    private ArrayList<SkillCategory> scList;
    private ArrayList<Transaction> tList;
    private ArrayList<User> uList;

    private String status;
    private Connection con;

    public DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public ArrayList<MentorProfile> getMentorProfile() {
        mpList = new ArrayList<>();
        String sql = "select *from MentorProfile";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mpList.add(new MentorProfile(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            status = "Error at read Mentor Profile" + e.getMessage();
        }
        return mpList;
    }

    public ArrayList<MentorSkill> getMentorSkill() {
        msList = new ArrayList<>();
        String sql = "select *from MentorSkill";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                msList.add(new MentorSkill(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
            status = "Error at read Mentor Skill" + e.getMessage();
        }
        return msList;
    }

    public ArrayList<Rating> getRating() {
        ratingList = new ArrayList<>();
        String sql = "select *from Rating";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ratingList.add(new Rating(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Rating" + e.getMessage();
        }
        return ratingList;
    }

    public ArrayList<Request> getRequest() {
        requestList = new ArrayList<>();
        String sql = "select *from Request";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                requestList.add(new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getDate(4), rs.getInt(5), rs.getString(6),
                        rs.getString(7), rs.getString(8)));
            }
        } catch (Exception e) {
            status = "Error at read Request" + e.getMessage();
        }
        return requestList;
    }

    public ArrayList<RequestSkill> getRequestSkill() {
        rsList = new ArrayList<>();
        String sql = "select *from RequestSkill";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                rsList.add(new RequestSkill(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            status = "Error at read Request Skill" + e.getMessage();
        }
        return rsList;
    }

    public ArrayList<SkillCategory> getSkillCategory() {
        scList = new ArrayList<>();
        String sql = "select *from SkillCategory";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                scList.add(new SkillCategory(rs.getInt(1), rs.getString(2), rs.getBoolean(3)));
            }
        } catch (Exception e) {
            status = "Error at read Skill Category" + e.getMessage();
        }
        return scList;
    }

    public ArrayList<Transaction> getTransaction() {
        tList = new ArrayList<>();
        String sql = "select *from Transaction";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tList.add(new Transaction(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getDate(4), rs.getFloat(5), rs.getString(6)));
            }
        } catch (Exception e) {
            status = "Error at read Transaction" + e.getMessage();
        }
        return tList;
    }

    public ArrayList<User> getUser() {
        uList = new ArrayList<>();
        String sql = "select *from [User]";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                uList.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getBoolean(5), rs.getString(6), rs.getString(7),
                        rs.getDate(8), rs.getString(9), rs.getBoolean(10), rs.getInt(11)));
            }
        } catch (Exception e) {
            status = "Error at read Users" + e.getMessage();
        }
        return uList;
    }

    public User login(String user, String pass) {
        String sql = "select * from [User] where username = ? and password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getInt(11));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void CreateUser(int userID, String username, String password, String fullname,
            boolean gender, String phone, String email, Date dob, String address, boolean status, int role) {
        String sql = "insert into [User] values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, fullname);
            ps.setBoolean(5, gender);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setDate(8, dob);
            ps.setString(9, address);
            ps.setBoolean(10, status);
            ps.setInt(11, role);
            ps.execute();
        } catch (Exception e) {
            e.getMessage();
        }
    }

    public void VerifyUser(String username) {
        String sql = "update [User] set status = 1 where username = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.execute();
        } catch (Exception e) {
            status = "Error at VerifyUser " + e.getMessage();
        }
    }

    public ArrayList<Request> getRequestByID() {
        requestList = new ArrayList<>();
        String sql = "select a.requestID, a.status, a.title, b.username from Request a join [dbo].[User] b on menteeID=ID";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                requestList.add(new Request(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
            status = "Error at read Request" + e.getMessage();
        }
        return requestList;
    }

    public void approveRequest(String requestID) {
        String sql = "update Request set status='1' where requestID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, requestID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void denyRequest(String requestID) {
        String sql = "update Request set status='2' where requestID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, requestID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertSkillCategory(int skillID, String skillName, boolean status) {
        String sql = "insert  into SkillCategory\n"
                + "values(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, skillID);
            ps.setString(2, skillName);
            ps.setBoolean(3, status);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteSkill(int SkillID) {
        String sql = "Delete from SkillCategory where skillID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, SkillID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateSkill(int skillID, String skillName, boolean status) {
        String sql = "Update SkillCategory\n"
                + "Set skillName = ?, status = ?\n"
                + "where skillID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, skillName);
            ps.setBoolean(2, status);
            ps.setInt(3, skillID);
            ps.executeUpdate();
        } catch (Exception ex) {
        }
    }

    public SkillCategory getSkillBySkillID(int skillID) {
        String sql = "select * from SkillCategory where skillID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, skillID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SkillCategory skill = new SkillCategory(rs.getInt(1),
                        rs.getString(2), rs.getBoolean(3)
                );
                return skill;
            }
        } catch (Exception ex) {
        }
        return null;
    }

    public void deleteUser(int userID) {
        String sql = "Delete from [User] where ID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean updatePassword(String newpass, String email) {
        String sql = "update [User] set password = ? where email = ? ";
        boolean updated = false;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newpass.trim());
            ps.setString(2, email.trim());
            updated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return updated;
    }

    public User checkEmailExist(String email) {
        String sql = "select * from [User] where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getInt(11));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public User getUserByID(int id) {
        String sql = "select * from [User] where ID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getBoolean(10),
                        rs.getInt(11)
                );
                return user;
            }
        } catch (Exception ex) {
        }
        return null;
    }

    public void updateUser(int userID, String username, String password, String fullname, boolean gender, String phone, String email, Date dob, String address, boolean status, int role) {
        String sql = "Update [User]\n"
                + "Set username = ?, password = ?,fullname =? ,gender=?,phone=?,email=?,dob=?,address=?,status=?,role=?\n"
                + "where ID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setBoolean(4,gender);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setDate(7,dob);
            ps.setString(8, address);
            ps.setBoolean(9,status);
            ps.setInt(10,role);
            ps.setInt(11,userID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception ex) {
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        String date_raw = "2002-08-09";
//        Date date = Date.valueOf(date_raw);
//        dao.updateUser(4, "vietbh", "123"  , "Bui Hoang Viet", true, "0399688241", "vietbhhe163168@fpt.edu.vn",date, "Luc ngan-Bac giang", true, 3);
        for (User sc : dao.getUser()) {
            System.out.println(sc.toString());
        }
    }

}