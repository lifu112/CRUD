<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <script src="/CRUD/static/js/jquery-1.12.4.min.js"></script>
    <link href="/CRUD/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="/CRUD/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--员工添加的模态框--%>
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="张三">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="zhangsan@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--员工修改的模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_update_input" placeholder="张三">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="zhangsan@qq.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"/></th>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>邮箱</th>
                        <th>部门</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalPage,currentPage;
    $(function () {
        //跳转首页
        to_page(1);
    })
    //跳转分页
    function to_page(pn) {
        $.ajax({
            url:"/CRUD/emps?",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                //解析员工信息
                build_emps_table(result);
                //解析分页信息
                build_page_info(result)
                //解析分页条
                build_page_nav(result)
            }
        })
    }
    //解析显示员工信息
    function build_emps_table(result) {
        //清空之前追加的信息
        $("#emps_table tbody").empty();
        var emps = result.page.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>")).addClass("glyphicon glyphicon-pencil").append("编辑");
            //给编辑按钮添加一个自定义的属性，用来定位员工的id
            editBtn.attr("edit_id",item.empId);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>")).addClass("glyphicon glyphicon-trash").append("删除");
            //给删除按钮添加一个自定义的属性，用来定位员工的id
            deleteBtn.attr("delete_id",item.empId);
            var btn = $("<td></td>").append(editBtn).append("   ").append(deleteBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btn)
                .appendTo("#emps_table tbody");
        })
    }
    //解析分页信息
    function build_page_info(result){
        //清空之前追加的信息
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+result.page.pageInfo.pageNum+"页，总共"
            +result.page.pageInfo.pages+"页,总共"
            +result.page.pageInfo.total+"条记录");
        totalPage = result.page.pageInfo.pages;
        currentPage = result.page.pageInfo.pageNum;
    }
    //解析分页条
    function build_page_nav(result) {
        //清空之前追加的信息
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination")
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
        if(result.page.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //添加单机事件
            firstPageLi.click(function () {
                to_page(1);
            })
            prePageLi.click(function () {
                to_page(result.page.pageInfo.pageNum-1);
            })
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.page.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.page.pageInfo.pageNum == item){
                numLi.addClass("active")
            }
            //添加单机事件
            numLi.click(function () {
                to_page(item);
            })
            ul.append(numLi);
        })
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if(result.page.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            //添加单机事件
            lastPageLi.click(function () {
                to_page(result.page.pageInfo.pages);
            })
            nextPageLi.click(function () {
                to_page(result.page.pageInfo.pageNum+1);
            })
        }

        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }
    //给新增按钮绑定单机事件
    $("#emp_add_modal_btn").click(function () {
        //清除表单数据
        $("#empAddModal form")[0].reset();
        //发送Ajax请求，查出部门信息
        getDepts("#dept_add_select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        })
    });
    //查出所有部门信息
    function getDepts(ele) {
        $.ajax({
            url:"/CRUD/depts",
            type:"GET",
            success:function (result) {
                //清空之前追加的信息
                $(ele).empty();
                $.each(result.page.depts,function (index,item) {
                    var optionEle = $("<option></option>").append(item.deptName).attr("value",item.deptId);
                    optionEle.appendTo(ele);
                });
            }
        })
    }
    //表单校验
    function validate_add_form(){
        //1、拿到要校验的数据，使用正则表达式
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }else{
            show_validate_msg("#empName_add_input", "success", "");
        };

        //2、校验邮箱信息
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            //应该清空这个元素之前的样式
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }
    //显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
        $(ele).parent().removeClass("has-success has-error")
        $(ele).next("span").text("");
        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if(("error" == status)){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //保存按钮绑定单击事件
    $("#emp_save_btn").click(function () {
        //表单数据的校验
        if(!validate_add_form()){
            return false;
        }
        // 提交模态框里的表单
        $.ajax({
            url:"/CRUD/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if(result.code ==100){
                    alert(result.msg);
                    // 关闭框,回到最后一页
                    $("#empAddModal").modal("hide");
                    to_page(totalPage+1);
                }else {
                    //显示失败信息
                    if(undefined != result.page.errorFields.email){
                        show_validate_msg("#email_add_input", "error", result.page.errorFields.email);
                    }
                    if(undefined != result.page.errorFields.empName){
                        show_validate_msg("#empName_add_input", "error", result.page.errorFields.empName);
                    }
                }

            }
        })
    });
    //查询员工信息
    function getEmp(id){
        $.ajax({
            url:"/CRUD/emp/"+id,
            type:"GET",
            success:function (result) {
                var empEle = result.page.emp;
                $("#empName_update_input").val(empEle.empName);
                $("#email_update_input").val(empEle.email);
                $("#empUpdateModal input[name=gender]").val([empEle.gender]);
                $("#empUpdateModal select").val([empEle.did]);
            }
        })
    }
    //修改按钮绑定单机事件
    $(document).on("click",".edit_btn",function(){
        //1、查出部门信息，并显示部门列表
        getDepts("#dept_update_select");
        //2、查出员工信息，显示员工信息
        getEmp($(this).attr("edit_id"));
        //3、把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit_id",$(this).attr("edit_id"));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });
    //点击更新，修改员工信息
    $("#emp_update_btn").click(function () {
        //1、拿到要校验的数据，使用正则表达式
        var empName = $("#empName_update_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            show_validate_msg("#empName_update_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }else{
            show_validate_msg("#empName_update_input", "success", "");
        };
        //校验邮箱信息
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_update_input", "success", "");
        }
        //发送Ajax请求更新员工信息
        $.ajax({
            url:"/CRUD/emp/"+$(this).attr("edit_id"),
            type:"POST",
            data:$("#empUpdateModal form").serialize()+"&_method=PUT",
            success:function(result){
                alert(result.msg);
                //1、关闭对话框
                $("#empUpdateModal").modal("hide");
                //2.返回当前页面
                to_page(currentPage);
            }
        })
    });
    //删除按钮绑定单机事件
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("delete_id");
        if(confirm("确认删除【"+empName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"/CRUD/emp/"+empId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    });
    //全选全部选
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked",flag);
    });
    //全部删除的单机事件
    $("#emp_delete_all_btn").click(function () {
        var empNames ="";
        var del_idstr = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        //去除empNames多余的,
        empNames = empNames.substring(0, empNames.length-1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            //发送ajax请求删除
            $.ajax({
                url:"/CRUD/emp/"+del_idstr,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到当前页面
                    to_page(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>