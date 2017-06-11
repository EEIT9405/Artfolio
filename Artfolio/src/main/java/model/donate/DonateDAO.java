package model.donate;

import java.util.List;

public interface DonateDAO {
	boolean insert(DonateBean bean);
	List<DonateBean> select(Integer mid);
	List<DonateBean> selectDonated(Integer targetid);
}
