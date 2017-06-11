package test;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class Test {

	public static void main(String[] args) {
		
		List<Integer> list = new ArrayList<>();
		list.add(2);
		list.add(1);
		list.add(1);
		
		Set<Integer> set = new LinkedHashSet<>(list);
		
		System.out.println("list=" + list);
		System.out.println("set=" + set);
	}

}
