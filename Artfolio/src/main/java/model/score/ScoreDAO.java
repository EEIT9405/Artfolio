package model.score;

import java.util.List;

public interface ScoreDAO {
	boolean insert(ScoreBean bean);
	ScoreBean select(Integer wid,Integer scoreversion);
	Integer select(Integer wid);
}
