/**
 * Created by jonas on 19.09.2016.
 */

var successMsg = 'Die Änderungen wurden erfolgreich gespeichert!';
var failMsg = 'Es ist ein Fehler aufgetreten. Die Änderungen wurden nicht gespeichert!';

$('.update-btn').click(function(event){
    saveContent(event);
});

function saveContent(event) {
    event.preventDefault();
    $.post('/update',
        'pageName=' + pageName + '&content=' + getContentAsJsonString(),
        function(jsonData) {
            console.log(jsonData);

            showAlert(jsonData.success);

        }, "json");
    console.log("content data send with post");
}

function showAlert(success) {

    var alert = document.createElement('div');
    alert.className = 'alert alert-dismissable centered ';
    alert.className += success == true ? 'alert-success' : 'alert-danger';

    var btn = document.createElement('button');
    btn.classList='close';
    btn.setAttribute('data-dismiss', 'alert');
    btn.setAttribute('aria-label', 'Close');

    var x = document.createElement('span');
    x.setAttribute('aria-hidden', 'true');
    x.innerHTML = '&times';

    btn.appendChild(x);
    alert.appendChild(btn);

    var glyphSpan = document.createElement('span');
    glyphSpan.className = 'glyphicon pull-left ';
    glyphSpan.className += success == true ? 'glyphicon-ok-sign' : 'glyphicon-remove-sign';

    alert.appendChild(glyphSpan);
    alert.innerHTML += '  ' + (success == true ? successMsg : failMsg);

    document.body.appendChild(alert);
}