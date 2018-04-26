function buy() {
    var str="<div id=\"popBuy\" style=\"background-color: rgba(0,0,0,0.2);position:fixed;z-index:999999;width:100%;height:100%;\">\n" +
        "<div style=\"background-color: white;text-align: center;height:400px;width:380px;\">\n" +
        "<h3 style=\"color: black;\">请扫码进行支付</h3>\n" +
        "<div style=\"height:400px;width:380px;\">\n" +
        "<img style=\"height:100%;width: 100%;\" src=\"../../reference/images/baozhen1.png\">\n" +
        "</div>\n" +
        "</div>\n" +
        "</div>";
    $("#body").append(str);

}