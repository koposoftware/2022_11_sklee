package kr.ac.kopo.financial.vo;

public class FirmValueVO {

	private float wacc;
	private float firmValLow;
	private float firmValHigh;

	public float getWacc() {
		return wacc;
	}

	public void setWacc(float wacc) {
		this.wacc = wacc;
	}

	public float getFirmValLow() {
		return firmValLow;
	}

	public void setFirmValLow(float firmValLow) {
		this.firmValLow = firmValLow;
	}

	public float getFirmValHigh() {
		return firmValHigh;
	}

	public void setFirmValHigh(float firmValHigh) {
		this.firmValHigh = firmValHigh;
	}

	@Override
	public String toString() {
		return "FirmValueVO [wacc=" + wacc + ", firmValLow=" + firmValLow + ", firmValHigh=" + firmValHigh + "]";
	}

}
