$(document).ready(function() {
    job_parameter_init_hide();
    job_parameter_switch();
  });
  
  $('#job_parameter_type').change(function() {
    change_job_parameter_type();
  });
  
  var change_job_parameter_type = function() {
    job_parameter_init_hide();
  
    $('#job_parameter_default_value').attr("value", "");
    $('#job_parameter_default_values').attr("required", false);
  
    $('#job_parameter_lookup_sort_id').attr("required", false);
  
    $('#job_parameter_lookup_model').attr("required", false);
    $('#job_parameter_lookup_model_key').attr("required", false);
    $('#job_parameter_lookup_model_value').attr("required", false);
  
    $('#job_parameter_hardcode').attr("required", false);
  
    job_parameter_switch();
  };
  
  
  function job_parameter_init_hide(){
    $('#job_parameter_default_values').hide();
    $('#job_parameter_lookup_sort_ids').hide();
    $('#job_parameter_lookup_relations').hide();
    $('#job_parameter_hardcodes').hide();
    $('#job_parameter_lookup_models').hide();
  }
  
  function job_parameter_switch(){
    var job_parameter_type = $('#job_parameter_type :selected').text();
    switch (job_parameter_type) {
      case 'Integer':
        $('#job_parameter_default_values').show();
        $('#job_parameter_default_values').attr("required", true);
        $('#job_parameter_default_value').attr("type", "number");
        break;
      case 'String':
        $('#job_parameter_default_values').show();
        $('#job_parameter_default_values').attr("required", true);
        $('#job_parameter_default_value').removeAttr("type");
        break;
      case 'Date':
        $('#job_parameter_default_values').show();
        $('#job_parameter_default_value').attr("type", "date");
        $('#job_parameter_default_values').attr("required", true);
        break;
      case 'Datetime':
        $('#job_parameter_default_values').show();
        $('#job_parameter_default_value').attr("type", "datetime-local");
        $('#job_parameter_default_values').attr("required", true);
        break;
      case 'Lookup':
        $('#job_parameter_default_values').hide();
        $('#job_parameter_lookup_sort_ids').show();
        $('#job_parameter_lookup_relations').show();
        $('#job_parameter_lookup_sort_id').attr("required", true);
        break;
      case 'Model':
        $('#job_parameter_default_values').hide();
        $('#job_parameter_lookup_models').show();
        $('#job_parameter_lookup_relations').show();
        $('#job_parameter_lookup_model').attr("required", true);
        $('#job_parameter_lookup_model_key').attr("required", true);
        $('#job_parameter_lookup_model_value').attr("required", true);
        break;
      case 'Hardcode':
        $('#job_parameter_default_values').show();
        $('#job_parameter_hardcodes').show();
        $('#job_parameter_hardcode').attr("required", true);
        break;
      }
  }
  
  
  // filter show 小於 seq 之相關參數
  var update_seq = function() {
    var job_parameter_seq = $('#job_parameter_seq').val();
    var job_parameter_lookup_relation = $('#job_parameter_lookup_relation');
    for (var i = 1; i < job_parameter_lookup_relation.children().length; i++) {
      var job_parameter_lookup_relation_item = $('#job_parameter_lookup_relation option:eq(' + i + ')');
      if (job_parameter_lookup_relation_item.val() < job_parameter_seq) {
        job_parameter_lookup_relation_item.show();
      } else {
        job_parameter_lookup_relation_item.hide();
      }
    }
  };
  $('#job_parameter_lookup_relation').ready(function() {
    update_seq();
  });
  
  $('#job_parameter_seq').change(function() {
    update_seq();
  });
  