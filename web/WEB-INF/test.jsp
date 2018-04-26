<%--
  Created by IntelliJ IDEA.
  User: beibei
  Date: 2017/11/16
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>
<div id="app">
    <el-button @click="visible = true">按钮</el-button>
    <el-dialog :visible.sync="visible" title="Hello world">
        <p>欢迎使用 Element</p>
    </el-dialog>
</div>
</body>
<!-- 先引入 Vue -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script src="https://cdn.bootcss.com/vue-resource/1.3.4/vue-resource.min.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return { visible: false }
        },
        mounted: function () {
            this.$http.get("http://localhost:8080/getInfo/goodsList").then(function (res) {
                console.log("-----");
                console.log(res.body.data.goods_id);
            });
        },
    })
</script>
</html>