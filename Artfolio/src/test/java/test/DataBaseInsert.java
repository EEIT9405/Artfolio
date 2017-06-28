package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class DataBaseInsert {

	public static void main(String[] args) {

		Connection conn = null;
		try {
			//String url = "jdbc:sqlserver://192.168.204.128:1433;databaseName=Artfolio";
			//conn = DriverManager.getConnection(url, "sa", "sa123456");
			String url = "jdbc:sqlserver://localhost:1433;databaseName=Artfolio";
			conn = DriverManager.getConnection(url, "sa", "xk4nk4y hk4cjo4");
			
			// member
			String insertMember = "insert into tb_member(pwd,name,email,gender) values(?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(insertMember);
			for (int i = 0; i < 1000; i++) {
				pstmt.setString(1, "1");
				pstmt.setString(2, "x");
				pstmt.setString(3, i + "@gmail.com");
				pstmt.setBoolean(4, true);
				pstmt.addBatch();
			}
			int[] member = pstmt.executeBatch();
			System.out.println("member=" + member.length);

			// like
			String insertLike = "insert into tb_like(mid,wid) values(?,?)";
			pstmt = conn.prepareStatement(insertLike);
			java.util.Random r=new java.util.Random();
			for (int i = 1; i < 36; i++) {
				double c=Math.min(1005, r.nextGaussian()*170+500);
				for (int j = 6; j <=1005; j++) {
					
					if (Math.random()<c/1005)
						continue;

					pstmt.setInt(1, j);
					pstmt.setInt(2, i);
					pstmt.addBatch();
				}
			}
			int[] like = pstmt.executeBatch();
			System.out.println("like=" + like.length);
			
			// track
			String insertTrack = "insert into tb_track(mid,b_id) values(?,?)";
			pstmt = conn.prepareStatement(insertTrack);
			for (int i = 1; i < 10; i++) {
				double c=Math.min(1005, r.nextGaussian()*170+500);
				for (int j = 6; j <=1005; j++) {
					
					if (Math.random()<c/1005)
						continue;

					pstmt.setInt(1, j); 
					pstmt.setInt(2, i);
					pstmt.addBatch();
				}
			}
			int[] track = pstmt.executeBatch();
			System.out.println("track=" + track.length);

			// put like into work
			String countLike = "select count(*) from tb_like where wid=?";
			String updateWorkLike = "update tb_work set wlike=? where wid=?";
			int likeRC = 0;

			for (int i = 1; i < 36; i++) {
				pstmt = conn.prepareStatement(countLike);
				pstmt.setInt(1, i);
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					pstmt = conn.prepareStatement(updateWorkLike);
					pstmt.setInt(1, rs.getInt(1));
					pstmt.setInt(2, i);
					if(pstmt.executeUpdate() == 1)
						likeRC++;
				}
			}
			System.out.println("likeResult=" + likeRC);

			// follow
			String insertFollow = "insert into tb_follow(mid,followid) values(?,?)";
			pstmt = conn.prepareStatement(insertFollow);
			for (int i = 1; i <= 5; i++) {
				double c=Math.min(1005, r.nextGaussian()*170+500);
				for (int j = 6; j <= 1005; j++) {

					if (Math.random()<c/670)
						continue;

					pstmt.setInt(1, j);
					pstmt.setInt(2, i);
					pstmt.addBatch();
				}
			}
			int[] follow = pstmt.executeBatch();
			System.out.println("follow="+follow.length);

			// browsed
			String insertBrowsed = "insert into tb_browsed(mid, wid) values(?,?)";
			pstmt = conn.prepareStatement(insertBrowsed);
			for (int i = 1; i < 36; i++) {
				double c=Math.min(1005, r.nextGaussian()*170+500);
				for (int j = 6; j <=1005; j++) {
					
					if (Math.random()<c/1005)
						continue;

					pstmt.setInt(1, j);
					pstmt.setInt(2, i);
					pstmt.addBatch();
				}
			}
			int[] browsed = pstmt.executeBatch();
			System.out.println("browsed=" + browsed.length);

			// favorite
			String insertFavorite = "insert into tb_favorite(mid,tag,fcount) values(?,?,?)";
			String s = "香菸,水彩,女,鄉村,藍天,大樹,美式,漫畫,照片,抽象,拼湊,眼睛,色彩,動物,船,交通工具,水,寶可夢,光點,太陽,山,夢幻,長髮,荒野,石頭,塗鴉,意境,油畫,勇士,可愛,毛茸茸,蜿蜒,房屋,日本,文化,神奇寶貝,汽車,排列,玩具,萌,photo,破舊,寶石,花";
			String[] array = s.split(",");
			List<String> tags = Arrays.asList(array);
			pstmt = conn.prepareStatement(insertFavorite);
			for (String tag : tags) {
				for (int i = 6; i <= 1005; i++) {
					pstmt.setInt(1, i);
					pstmt.setString(2, tag);
					pstmt.setInt(3, (int) (Math.random() * 200) + 1);
					pstmt.addBatch();
				}
			}
			int[] favorite = pstmt.executeBatch();
			System.out.println("favorite=" + favorite.length);
			
			//wmsg
			String insertWmsg = "insert into tb_wmsg(mid,wid,wmsgcontent) values(?,?,?)";
			String selectMidByWid = "select mid from tb_work where wid=?";
			int wmsgRC = 0;
			for(int i = 1; i <= 5; i++){
				for(int j = 1; j <=35 ; j++){
					pstmt = conn.prepareStatement(selectMidByWid);
					pstmt.setInt(1, j);
					ResultSet rs = pstmt.executeQuery();
					if(rs.next()){
						pstmt = conn.prepareStatement(insertWmsg);
						if(rs.getInt(1) != i){
							pstmt.setInt(1, i);
							pstmt.setInt(2, j);
							switch(i){
							case 1:pstmt.setString(3, "我很喜歡你的作品!");break;
							case 2:pstmt.setString(3, "意境很不錯。");break;
							case 3:pstmt.setString(3, "我的作品更棒!");break;
							case 4:pstmt.setString(3, "繼續加油喔~");break;
							case 5:pstmt.setString(3, "我覺得畫面飽和度不足。");break;
							}
							if(pstmt.executeUpdate() > 0)
								wmsgRC++;
						}
					}
				}
			}
			System.out.println("wmsgResult="+wmsgRC);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
}
