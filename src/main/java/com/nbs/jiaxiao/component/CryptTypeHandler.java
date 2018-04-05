package com.nbs.jiaxiao.component;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.nbs.jiaxiao.common.DESUtils;

public class CryptTypeHandler extends BaseTypeHandler<String>{
	
	private static final String key = "wSzxa8Ke8jE=";

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, DESUtils.encrypt(parameter, key));
		
	}

	@Override
	public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
		String str = rs.getString(columnName);
		return str != null && str.length() > 0 ? DESUtils.decrypt(str, key) : str;
	}

	@Override
	public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		String str = rs.getString(columnIndex);
		return str != null && str.length() > 0 ? DESUtils.decrypt(str, key) : str;
	}

	@Override
	public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String str = cs.getString(columnIndex);
		return str != null && str.length() > 0 ? DESUtils.decrypt(str, key) : str;
	}

}
