package model.expoint;

import java.util.List;

public interface ExpointDAO {
	boolean insert(ExpointBean bean);
	List<ExpointBean> select(Integer mid);
}
