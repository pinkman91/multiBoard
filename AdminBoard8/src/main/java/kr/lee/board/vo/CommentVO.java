package kr.lee.board.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@XmlRootElement
@Data
public class CommentVO {
	private int 	idx;
	private int 	ref;
	private String 	name;
	private String 	password;
	private String 	content;
	private Date 	regDate;
	private String 	ip;
	private String  tb;
	private String  tableName;
	private String boardName;

	public void setTb(String tb) {
		this.tb = tb;
		tableName = this.tb;
	}
}
