package kr.lee.board.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;
import lombok.ToString;

@XmlRootElement
@Data
@ToString
public class UserVO {
	private String userid;
	private String pwd;
	private String name;
	private String email;
}


