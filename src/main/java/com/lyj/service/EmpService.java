package com.lyj.service;

import com.lyj.entity.Emp;

import java.util.List;

public interface EmpService {
    List<Emp> findAll(Integer start, Integer size);

    Integer findAllCount();

    void save(Emp emp);

    void update(Emp emp);
}
