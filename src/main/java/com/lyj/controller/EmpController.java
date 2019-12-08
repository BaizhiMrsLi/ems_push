package com.lyj.controller;

import com.lyj.entity.Emp;
import com.lyj.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("emp")
public class EmpController {
    @Autowired
    private EmpService empService;

    @RequestMapping("findAll")
    public Map<String, Object> findAll(String searchField, String searchString, String searchOper, Integer page, Integer rows, Boolean _search) {
        //不做搜索处理
        Map<String, Object> map = new HashMap<>();

        List<Emp> emps = new ArrayList<>();
        Integer total = null;
        Integer records = null;

        if (_search) {
            //暂时不用
        } else {
            emps = empService.findAll((page - 1) * rows, rows);
            records = empService.findAllCount();
        }

        if (records % rows == 0) {
            total = records / rows;
        } else {
            total = records / rows + 1;
        }

        map.put("rows", emps);
        map.put("page", page);
        map.put("total", total);
        map.put("records", records);
        return map;
    }


    @RequestMapping("opt")
    public void edit(Emp emp, String oper) {
        if ("add".equals(oper)) {
            try {
                empService.save(emp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if ("edit".equals(oper)) {
            try {
                empService.update(emp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
