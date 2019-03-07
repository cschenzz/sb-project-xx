function __add(id) {
    var url = $.common.isEmpty(id) ? $.table._option.createUrl : $.table._option.createUrl.replace("{id}", id);
    openLayer("添加" + $.table._option.modalName, url);
}

function __edit(id) {
    var url = "/404.html";
    if ($.common.isNotEmpty(id)) {
        url = $.table._option.updateUrl.replace("{id}", id);
    } else {
        var id = $.common.isEmpty($.table._option.uniqueId) ? $.table.selectFirstColumns() : $.table.selectColumns($.table._option.uniqueId);
        if (id.length == 0) {
            $.modal.alertWarning("请至少选择一条记录");
            return;
        }
        url = $.table._option.updateUrl.replace("{id}", id);
    }

    openLayer("修改" + $.table._option.modalName, url);
}

/*预览*/
function __detail(id) {
    var url = $.table._option.updateUrl.replace("/edit", "/detail").replace("{id}", id);
    window.open(url);
}

function openLayer(title, url, width, height) {
    //如果是移动端，就使用自适应大小弹窗
    if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) {
        width = 'auto';
        height = 'auto';
    }
    if ($.common.isEmpty(title)) {
        title = false;
    }
    if ($.common.isEmpty(url)) {
        url = "/404.html";
    }
    if ($.common.isEmpty(width)) {
        width = 800;
    }
    if ($.common.isEmpty(height)) {
        height = ($(window).height() - 50);
    }
    layer.open({
        type: 2,
        area: [width + 'px', height + 'px'],
        fix: false,
        //不固定
        maxmin: true,
        shade: 0.3,
        title: title,
        content: url,
        // 弹层外区域关闭
        shadeClose: true
    });
}

function __search(formId) {
    var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
    var params = $("#bootstrap-table").bootstrapTable('getOptions');
    params.queryParams = function (params) {
        var search = {};
        $.each($("#" + currentId).serializeArray(), function (i, field) {
            search[field.name] = field.value;
        });
        search.pageSize = params.limit;
        search.pageNum = params.offset / params.limit + 1;
        search.searchValue = params.search;
        search.orderByColumn = params.sort;
        search.isAsc = params.order;
        return search;
    }
    $("#bootstrap-table").bootstrapTable('refresh', params);
}
