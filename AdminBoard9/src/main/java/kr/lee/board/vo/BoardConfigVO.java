package kr.lee.board.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@XmlRootElement
@Data
public class BoardConfigVO {
	private int idx;
	private String tableName;
	private String boardName;
	private int readLevel;
	private int writeLevel;
	private int commentLevel;
	private int fileLevel;
	
}
