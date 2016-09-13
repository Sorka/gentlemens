/**
 * Created by Dennis on 13.09.2016.
 */
$('#form').submit(function(event){
    event.preventDefault();
    $('.animation-overlay').css('display', 'block');
    $('#errorText').html("");
    $.post($(this).attr("action"),
        $(this).serialize(),
        function(jsonData){
            console.log(jsonData);

            if(jsonData.success == true) {
                location.reload(true);
            } else {
                $('#errorText').html("Login nicht möglich. Benutzername oder Passwort ist falsch.");
            }

            $('.animation-overlay').css('display', 'none');

        }, "json");
});
