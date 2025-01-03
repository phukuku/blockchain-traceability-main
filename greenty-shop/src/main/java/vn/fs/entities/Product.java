package vn.fs.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "products")
public class Product implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long productId;
	private String productName;
	private int quantity;
	private double price;
	private int discount;
	private String productImage;
	private String description;
	@Temporal(TemporalType.DATE)
	private Date enteredDate;
	private Long status;
	public boolean favorite;
	private String txnHash;
	@Temporal(TemporalType.DATE)
	private Date mfgDate;
	@Temporal(TemporalType.DATE)
	private Date expDate;
	private String producer;

	@ManyToOne
	@JoinColumn(name = "categoryId")
	private Category category;

}
