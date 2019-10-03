$(function() {
  var availableNames = [];
  var names = [];
  $.ajax({
    url: '/patients',
    contentType: "application/json",
    async: false
  })
  .done(function(data) {
    availableNames = data.map(function (element){
      var first_name = element.first_name == null ? '' : element.first_name;
      var middle_name = element.middle_name == null ? '' : element.middle_name;
      var last_name = element.last_name == null ? '' : element.last_name;
      name = first_name + ' ' + middle_name + '' + last_name;
      names.push({name: name, id: element.id});
      return name;
    });
  });

  $("#patientName").autocomplete({
    source: availableNames,
    select: function(event, ui) {
      var item = names.find(function(element) {
        if(element.name === ui.item.value){
          return element;
        }
      });
      var redirectWindow = window.open('/patients/' + item.id, '_blank');
      redirectWindow.location;
    }
  });
});