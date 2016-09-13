/**
 * Created by Dennis on 13.09.2016.
 */
$('#logout-btn').click(function(event){
    event.preventDefault();
    $.post('/logout',
        function(jsonData){
            console.log(jsonData);

            if(jsonData.success == true) {
                location.reload(true);
            }

        }, "json");
});