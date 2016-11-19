package pms.entity;

import static org.junit.Assert.*;


import org.junit.Test;

import pms.util.DateUtil;

public class UtilTest {

	@Test
	public void test_get_brith() {
		System.out.println(DateUtil.get_birth(21));
	}

}
