package kr.ac.bu.domain;
 
public class Petsitter {

	private int psId;
	private String psIntro;
	private String psAddress;
	private int psSPrice;
	private int psMPrice;
	private int psLPrice;
	private boolean psOption1;
	private boolean psOption2;
	private boolean psOption3;
	private boolean psOption4;
	private boolean psOption5;
	private boolean psOption6;
	private boolean psOption7;
	private boolean psOption8;
	private boolean psOption9;
	private boolean psOption10;
	private boolean psOption11;
	private boolean psOption12;
	private boolean psOption13;
	private int psflag;
	private String uId;
	private String uName;
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	private int sittinCount;

	@Override
	public String toString() {
		return "Petsitter [psId=" + psId + ", psIntro=" + psIntro + ", psAddress=" + psAddress + ", psSPrice="
				+ psSPrice + ", psMPrice=" + psMPrice + ", psLPrice=" + psLPrice + ", psOption1=" + psOption1
				+ ", psOption2=" + psOption2 + ", psOption3=" + psOption3 + ", psOption4=" + psOption4 + ", psOption5="
				+ psOption5 + ", psOption6=" + psOption6 + ", psOption7=" + psOption7 + ", psOption8=" + psOption8
				+ ", psOption9=" + psOption9 + ", psOption10=" + psOption10 + ", psOption11=" + psOption11
				+ ", psOption12=" + psOption12 + ", psOption13=" + psOption13 + ",psflag=" + psflag + ", uId=" + uId
				+ ", sittinCount=" + sittinCount + "]";
	}

	public boolean isPsOption11() {
		return psOption11;
	}

	public void setPsOption11(boolean psOption11) {
		this.psOption11 = psOption11;
	}

	public boolean isPsOption12() {
		return psOption12;
	}

	public void setPsOption12(boolean psOption12) {
		this.psOption12 = psOption12;
	}

	public boolean isPsOption13() {
		return psOption13;
	}

	public void setPsOption13(boolean psOption13) {
		this.psOption13 = psOption13;
	}

	public int getSittinCount() {
		return sittinCount;
	}

	public void setSittinCount(int sittinCount) {
		this.sittinCount = sittinCount;
	}

	public int getPsId() {
		return psId;
	}

	public void setPsId(int psId) {
		this.psId = psId;
	}

	public String getPsIntro() {
		return psIntro;
	}

	public void setPsIntro(String psIntro) {
		this.psIntro = psIntro;
	}

	public String getPsAddress() {
		return psAddress;
	}

	public void setPsAddress(String psAddress) {
		this.psAddress = psAddress;
	}

	public int getPsSPrice() {
		return psSPrice;
	}

	public void setPsSPrice(int psSPrice) {
		this.psSPrice = psSPrice;
	}

	public int getPsMPrice() {
		return psMPrice;
	}

	public void setPsMPrice(int psMPrice) {
		this.psMPrice = psMPrice;
	}

	public int getPsLPrice() {
		return psLPrice;
	}

	public void setPsLPrice(int psLPrice) {
		this.psLPrice = psLPrice;
	}

	public boolean isPsOption1() {
		return psOption1;
	}

	public void setPsOption1(boolean psOption1) {
		this.psOption1 = psOption1;
	}

	public boolean isPsOption2() {
		return psOption2;
	}

	public void setPsOption2(boolean psOption2) {
		this.psOption2 = psOption2;
	}

	public boolean isPsOption3() {
		return psOption3;
	}

	public void setPsOption3(boolean psOption3) {
		this.psOption3 = psOption3;
	}

	public boolean isPsOption4() {
		return psOption4;
	}

	public void setPsOption4(boolean psOption4) {
		this.psOption4 = psOption4;
	}

	public boolean isPsOption5() {
		return psOption5;
	}

	public void setPsOption5(boolean psOption5) {
		this.psOption5 = psOption5;
	}

	public boolean isPsOption6() {
		return psOption6;
	}

	public void setPsOption6(boolean psOption6) {
		this.psOption6 = psOption6;
	}

	public boolean isPsOption7() {
		return psOption7;
	}

	public void setPsOption7(boolean psOption7) {
		this.psOption7 = psOption7;
	}

	public boolean isPsOption8() {
		return psOption8;
	}

	public void setPsOption8(boolean psOption8) {
		this.psOption8 = psOption8;
	}

	public boolean isPsOption9() {
		return psOption9;
	}

	public void setPsOption9(boolean psOption9) {
		this.psOption9 = psOption9;
	}

	public boolean isPsOption10() {
		return psOption10;
	}

	public void setPsOption10(boolean psOption10) {
		this.psOption10 = psOption10;
	}

	public int getPsflag() {
		return psflag;
	}

	public void setPsflag(int psflag) {
		this.psflag = psflag;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

}