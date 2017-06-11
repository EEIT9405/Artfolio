package model.record;

import java.util.List;

public interface RecordDAO {
	boolean insert(RecordBean bean);
	boolean update(RecordBean bean);
	RecordBean select(RecordBean bean);
	boolean delete(RecordBean bean);
	List<RecordBean> calStat(Integer wid,Integer recordversion);
}
