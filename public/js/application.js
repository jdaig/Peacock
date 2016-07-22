$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 
  $("#add_employee_btn").click(function( event ){
      event.preventDefault();
      job = $("#job").val();
      employee = $("#employee").val();
      $.post("/add_employee",{
      pk_employee: employee,
      job: job
      });
      console.log("Add");
      location.reload()
    });

  $("#add_ocupation_btn").click(function(event){
    event.preventDefault();
    $("#add_ocupation_btn").toggle("slow");
    $("#add_reputation").show("slow");
  });

  $("#add_reputation_btn").click(function( event ){
      event.preventDefault();
      ocupation = $("#reputation_k").val();
      descrip = $("#reputation_desc").val();
      $.post("/add_reputation",{
      reputation_kind: ocupation,
      description: descrip
      });
      // $("#add_reputation").fadeOut("slow");
      // $("#add_ocupation_btn").show("slow");
      location.reload();
  });

  $("#evaluate_btn").click(function(event){
    event.preventDefault();
    $("#evaluation").toggle("slow");
    $("#finish").show("slow");
    puntuality = $("#puntuality").val();
    performance = $("#performance").val();
    per_img = $("#per_img").val();

    puntuality_com = $("#puntuality_com").val();
    performance_com = $("#performance_com").val();
    per_img_com = $("#per_img_com").val();
    console.log(puntuality);
    console.log(performance);
    console.log(per_img);
    console.log(puntuality_com);
    console.log(performance_com);
    console.log(per_img_com);
  });
});
