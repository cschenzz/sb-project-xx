function requestBackendData(url, parameters) {
    var result = {};
    $.ajax({
        async: false,
        url: url,
        timeout: 60000,
        type: 'POST',
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(parameters),
        success: function (data) {
            result = data;
        },
        error: function (e) {
            console.log(e);
            return;
        }
    });
    return result;
}

function requestPost(url, parameter) {
    var result = {};
    $.ajax({
        async: false,
        url: url,
        type: 'POST',
        dataType: 'json',
        cache: false,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        data: parameter,
        success: function (data) {
            result = data;
        },
        error: function (e) {
            console.log(e);
            return;
        }
    });
    return result;
}