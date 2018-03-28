var show_item = function(){
    var worker_type = $("#worker_type option:selected").attr("value");
    if (worker_type == "Worker") {
      $("#job_class_div").show();
      $("#report_code_div").hide();
    } else {
      $("#job_class_div").hide();
      $("#report_code_div").show();
    }
  };
  
  $(document).ready(function(){
    show_item();
  });
  
  $("#worker_type").change(function(){
    show_item();
  });
  