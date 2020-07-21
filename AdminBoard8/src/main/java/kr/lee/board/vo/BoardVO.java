package kr.lee.board.vo;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
import lombok.Data;
import lombok.ToString;

@XmlRootElement
@Data
@ToString
public class BoardVO {
	private int idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private Date regDate;
	private String ip;
	private int hit;
	private String tb;
	private String bn;
	private String tableName;
	private String boardName;

	
	public void setTb(String tb) {
		this.tb = tb;
		tableName = this.tb;
	}
	public void setBn(String bn) {
		this.bn = bn;
		boardName = this.bn;
	}
	// 필드에는 없지만 댓글들을 담기 위해 두개 변수 추가
	private int commentCount; // 리스트에서 댓글의 개수 저장
	private List<CommentVO> commentList; // 내용보기에서 댓글들 저장
}
