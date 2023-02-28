package common;

/**
 * ������ �̵��� ó���ϱ� ���� Ŭ����
 */
public class ActionForward {
	
	private boolean isRedirect = false;
	private String nextPath = null; 
	
	/**
	 * Redirect ��뿩��, false�̸� Forward ���
	 * @return isRedirect
	 */
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getNextPath() {
		return nextPath;
	}
	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}
}
