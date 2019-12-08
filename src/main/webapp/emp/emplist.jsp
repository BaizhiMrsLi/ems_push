<%@ page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <!--引入bootstrap css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/bootstrap.min.css">
    <!--引入jqgrid的bootstrap css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
    <!--引入jquery核心js-->
    <script src="${pageContext.request.contextPath}/boot/js/jquery-2.2.1.min.js"></script>
    <!--引入jqgrid核心js-->
    <script src="${pageContext.request.contextPath}/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
    <!--引入jqgrid国际化js-->
    <script src="${pageContext.request.contextPath}/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <!--引入bootstrap组件js-->
    <script src="${pageContext.request.contextPath}/boot/js/bootstrap.min.js"></script>
    <!--引入ajaxfileupload.js-->
    <script src="${pageContext.request.contextPath}/boot/js/ajaxfileupload.js"></script>

    <script>
        $(function () {
            // 1.表格初始化
            $('#emplist').jqGrid({
                //必须先设置风格之后，才能显示出分页的小标签
                styleUI: "Bootstrap",//设置为bootstrap风格的表格
                url: "${pageContext.request.contextPath}/emp/findAll",
                mtype: "post",
                datatype: "json",
                colNames: ["编号", "员工名", "工资", "年龄", "生日"],
                colModel: [
                    {name: "id", search: false},
                    {name: "name", editable: true},
                    {name: "salary", editable: true,},
                    {name: "age", editable: true,},
                    {name: "bir", editable: true,}
                ],
                pager: "#pager",//设置分页工具栏html
                // 注意: 1.一旦设置分页工具栏之后在根据指定url查询时自动向后台传递page(当前页) 和 rows(每页显示记录数)两个参数
                rowNum: 2,//这个代表每页显示记录数
                rowList: [2, 4, 6, 8],//生成可以指定显示每页展示多少条下拉列表
                viewrecords: true,//显示总记录数
                editurl: "${pageContext.request.contextPath}/emp/opt",//开启编辑时执行编辑操作的url路径  添加  修改  删除
                autowidth: true,//自适应外部容器
                height: 400,
                caption: "员工列表"
            }).navGrid(
                "#pager",//参数1: 当前分页工具栏
                {},//开启编辑操作，就是增删改查的小工具，是否开启哪一个(默认值为true)
                {closeAfterEdit: true, editCaption: "编辑信息", reloadAfterSubmit: true},//修改
                {closeAfterAdd: true, addCaption: "添加", reloadAfterSubmit: true},//添加
                {closeAfterDel: true, delCaption: "删除一条信息", reloadAfterSubmit: true},//对删除时的配置对象
                {
                    sopt: ['eq', 'ne', 'cn']
                },//对搜索时的配置对象
                {}//pView
            );//开启增删改工具按钮  注意:1.这里存在一个bug surl未实现
        });
    </script>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:;">员工列表</a>
        </div>

    </div><!-- /.container-fluid -->
</nav>

<!--    创建表格-->
<table id="emplist"></table>
<!--创建工具-->
<div id="pager"></div>

</body>
</html>
