function searchClick() {
    var searchText = $("#txtSearch").val();
    
//    var queryString = "SearchText=" + searchText + "&Category=" + category;
//    $.post("Index", queryString, callBackSearch, "_default");
}
function callBackSearch(responseText, status) {

    $('#SearchResult').html(responseText);
}