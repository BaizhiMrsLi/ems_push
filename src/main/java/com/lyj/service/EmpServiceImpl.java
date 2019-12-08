package com.lyj.service;

import com.lyj.dao.EmpDao;
import com.lyj.entity.Emp;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpDao empDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> findAll(Integer start, Integer size) {
        return empDao.selectByRowBounds(new Emp(), new RowBounds(start, size));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findAllCount() {
        return empDao.selectCount(new Emp());
    }

    @Override
    public void save(Emp emp) {
        empDao.insert(emp);
    }
}
