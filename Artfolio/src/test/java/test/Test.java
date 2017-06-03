package test;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import model.bounty.BountyBean;

public class Test {

	public static void main(String[] args) {
		
		List<BountyBean> list = new ArrayList<>();
		BountyBean bean = new BountyBean();
		bean.setMid(1);
		bean.setB_id(1);
		BountyBean bean2 = new BountyBean();
		bean2.setMid(2);
		bean2.setB_id(2);
		list.add(bean);
		list.add(bean2);
		
		System.out.println(new Gson().toJson(list));
	}

}
