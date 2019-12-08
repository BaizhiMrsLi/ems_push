package com.lyj.dao;

import com.lyj.entity.Emp;
import tk.mybatis.mapper.additional.idlist.DeleteByIdListMapper;
import tk.mybatis.mapper.common.Mapper;

public interface EmpDao extends Mapper<Emp>, DeleteByIdListMapper<Emp, String> {
}
