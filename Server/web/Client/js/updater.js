/**
 * Created by jonas on 19.09.2016.
 */
$('#update-btn').click(function(event){
    event.preventDefault();
    $.post('/update',
        'pageName=' + pageName + '&content=' + getContentAsJsonString(),
        function(jsonData){
            console.log(jsonData);

            if(jsonData.success == true) {
                location.reload(true);
            }

        }, "json");
});