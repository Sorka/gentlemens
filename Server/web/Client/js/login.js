/**
 * Created by Dennis on 13.09.2016.
 */

var postRequest;

/**
 * send post request and process answer if form gets submitted
 * show loading animation while request is processed
 */
$('#form').submit(function(event){
    event.preventDefault();
    $('.animation-overlay').show();
    $('#errorText').html("");

    postRequest = $.post($(this).attr("action"),

                    $(this).serialize(),

                    function(jsonData){
                        console.log(jsonData);

                        if(jsonData.success == true) {
                            location.reload(true);
                        } else {
                            $('#errorText').html("Login nicht möglich. Benutzername oder Passwort ist falsch.");
                        }

                        $('.animation-overlay').hide();
                        postRequest = undefined;

                    }, "json");
});


/**
 * hide animation and cancel post request if login modal is closed manually
 */
$('#login-modal').click(function () {

    // hide animation
    $('.animation-overlay').hide();

    // cancel post request if still in progress
    if(postRequest && postRequest.readyState != 4) {
        postRequest.abort();
    }
});
